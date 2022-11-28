package com.shop.goodee.member;

import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	@Qualifier("en")
	private PasswordEncoder passwordEncoder;
	
	public void sendMail(MemberVO memberVO)throws Exception {
		//수신 대상을 담을 ArrayList
		ArrayList<String> toUserList = new ArrayList<>();
		
		String email = memberService.getFindPw(memberVO);
		//수신 대상 추가
		toUserList.add(email);
		
		//수신 대상 개수
		int toUserSize = toUserList.size();
		
		//단순 텍스트 구성 메일 메시지 생성 할때 사용
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		//수신자 설정
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));
		
		//메일 제목
		simpleMessage.setSubject("구디샵 임시 비밀번호 발급🗝️");
		
		Random random = new Random();
		int createNum = 0; //1자리 난수
		String ranNum = ""; //1자리 난수 형변환 변수
		int letter = 8; //난수 자릿수 : 8
		String resultNum = ""; //결과 난수
		
		for(int i = 0; i<letter; i++) {
			createNum = random.nextInt(9); //0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum = Integer.toString(createNum); //1자리 난수를 String으로 형변환
			resultNum += ranNum;
		}
		
		memberVO.setPw(resultNum);
		memberVO.setEmail(email);
		//발급 된 임시 pw로 업데이트
		memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
		memberMapper.setNewPw(memberVO);
		//메일 내용
		simpleMessage.setText("회원님의 임시 비밀번호는 : "+resultNum+"입니다. 발급된 비밀번호로 로그인하여 반드시 마이페이지에서 비밀번호 변경 후 이용바랍니다.");
		
		//메일 발송
		javaMailSender.send(simpleMessage);
	}
	
}
