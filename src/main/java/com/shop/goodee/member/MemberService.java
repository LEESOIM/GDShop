package com.shop.goodee.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	//로그인
	public MemberVO getLogin(MemberVO memberVO)throws Exception{
		return memberMapper.getLogin(memberVO);
	}
	
	//중복 아이디 조회
	public int getIdCheck(MemberVO memberVO)throws Exception{
		return memberMapper.getIdCheck(memberVO);
	}
	
	//회원가입(입력)
	public int setJoin(MemberVO memberVO, String yy, String mm, String dd, String e, String mailText, String mailOption)throws Exception {
		memberVO.setBirth(yy+'-'+mm+'-'+dd);
		memberVO.setEmail(e+"@"+mailOption);
		
		int result = memberMapper.setJoin(memberVO);
		int success= 0;
		//회원가입 성공 시, result = 1 (회원등급 추가하기)
		if(result == 1) {
			success = memberMapper.setMemberRole(memberVO);
		}else {
			log.info("가입 실패!");
		}
		
		return success;
	}
	
	//사용자 검증 메서드(id중복 체크, 이메일 입력 체크, 비번 일치 검증, 휴대번호 입력 검증)
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		//check=false : 검증 성공(에러X)		
		boolean check=false;
		
		//1.annotation검증
		check = bindingResult.hasErrors();
		
		//2.id 중복 체크!
		int result = memberMapper.getIdCheck(memberVO);
		if(result > 0) {
			check = true;
			bindingResult.rejectValue("id","member.id.equal");
		}
		
		//3.비번 일치 검증
		if(!memberVO.getPw().equals(memberVO.getPwCheck())) {
			check= true;
			bindingResult.rejectValue("pwCheck", "member.password.notEqual");
		}
		
		//4. 이메일 입력 검증
		if(memberVO.getMailOption().equals("선택")) {
			check=true;
			bindingResult.rejectValue("mailOption", "member.email.req");
		}
		
		//5. 휴대번호 입력 검증
		log.info("Phone : {}", memberVO.getPhone().length());
		if(memberVO.getPhone().length() > 11 || memberVO.getPhone().length() < 11) {
			check=true;
			bindingResult.rejectValue("phone", "member.phone.req");
		}
		
		return check;
	}
	

}
