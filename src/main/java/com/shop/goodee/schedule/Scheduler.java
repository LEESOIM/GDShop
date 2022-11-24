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
	
	@Scheduled(cron = "0 0 0 * * *")
	public void cron() throws Exception{
		log.info("실행");
		
		MemberVO memberVO = new MemberVO();
		List<MemberVO> ar = new ArrayList<>();
		//탈퇴 회원 조회 
		ar = memberMapper.getWithdrawal();
		//해당 회원 정보 담아서 업데이트
		
		for(int i =0;i < ar.size(); i++) {
//			log.info("탈퇴일자 :{}", ar.get(i).getRegDate());
//			log.info("삭제일자(탈퇴일자+3개월) :{}", ar.get(i).getByeDate());
			int result = memberMapper.setRegdateAdd(ar.get(i));
			log.info("result date : {}", result);
			if(ar.get(i).getRegDate().equals(ar.get(i).getByeDate())) {
				memberMapper.setUserDelete(ar.get(i));
			}
		}		
	}

}
