package com.shop.goodee.schedule;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.shop.goodee.member.MemberMapper;
import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Scheduler {
	@Autowired
	private MemberMapper memberMapper;
	
	//30일 이후, 탈퇴회원 삭제
	@Scheduled(cron = "0 */720 * * * *")
	public void cron() throws Exception{
		
		MemberVO memberVO = new MemberVO();
		List<MemberVO> ar = new ArrayList<>();
		//탈퇴 회원 조회 
		ar = memberMapper.getWithdrawal();
		//해당 회원 정보 담아서 업데이트
		
		for(int i =0;i < ar.size(); i++) {
//			log.info("탈퇴일자 :{}", ar.get(i).getRegDate());
//			log.info("삭제일자(탈퇴일자+3개월) :{}", ar.get(i).getByeDate());
			int result = memberMapper.setRegdateAdd(ar.get(i));
			if(ar.get(i).getRegDate().equals(ar.get(i).getByeDate())) {
				memberMapper.setUserDelete(ar.get(i));
			}
		}		
	}
	
	//72시간마다 적립예정포인트를 -> 3일 후 적립되는 포인트로 업데이트
	@Scheduled(cron = "0 */72 * * * *")
	public void setPoint()throws Exception{
		int result = memberMapper.setPoint_3();
		log.info("result : {}", result);
	}
	
	//30일 이후, VIP등급 삭제
	//30일 이후, 판매자등급 삭제

}
