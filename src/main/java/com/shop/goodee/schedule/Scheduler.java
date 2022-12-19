package com.shop.goodee.schedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.shop.goodee.item.ItemMapper;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberMapper;
import com.shop.goodee.member.MemberVO;

import com.shop.goodee.member.PointVO;

import com.shop.goodee.mission.MissionMapper;
import com.shop.goodee.mission.MissionVO;
import com.shop.goodee.pay.PayVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Scheduler { // 초(0-59) 분(0-59) 시(0-23) 일(1-31) 월(1-12) 요일(0-7)
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private MissionMapper missionMapper;
	

	// 30일 이후, 탈퇴회원 삭제
	@Scheduled(cron = "0 0 0 * * *")
	public void cron() throws Exception {


		MemberVO memberVO = new MemberVO();
		List<MemberVO> ar = new ArrayList<>();
		// 탈퇴 회원 조회
		ar = memberMapper.getWithdrawal();
		// 해당 회원 정보 담아서 업데이트

		for (int i = 0; i < ar.size(); i++) {
//			log.info("탈퇴일자 :{}", ar.get(i).getRegDate());
//			log.info("삭제일자(탈퇴일자+3개월) :{}", ar.get(i).getByeDate());
			int result = memberMapper.setRegdateAdd(ar.get(i));
			if (ar.get(i).getRegDate().equals(ar.get(i).getByeDate())) {
				memberMapper.setUserDelete(ar.get(i));
			}
		}
	}


	// 결제 회원 30일 이후 해지(판매자)
	@Scheduled(cron = "0 0 0 * * *")
	public void setMemberShipPaySeller() throws Exception {

		PayVO payVO = new PayVO();
		List<PayVO> ar = new ArrayList<>();
		ar = memberMapper.getPay(payVO);

		memberMapper.setPayAdd();
		for (int i = 0; i < ar.size(); i++) {
			if (ar.get(i).getPayDate2().equals(ar.get(i).getCancelDate())) {
				if(ar.get(i).getPayName().equals("ROLE_SELLER")) {
					log.info("===============삭제================");
					MemberVO memberVO = new MemberVO();
					memberVO.setId(ar.get(i).getId());
					int result = memberMapper.setMemberRoleDelete1(memberVO);					
				}
			}
		}
	}
	
	// 결제 회원 30일 이후 해지(판매자, VIP)
		@Scheduled(cron = "0 0 0 * * *")
		public void setMemberShipPayVIP() throws Exception {

			PayVO payVO = new PayVO();
			List<PayVO> ar = new ArrayList<>();
			ar = memberMapper.getPay(payVO);

			memberMapper.setPayAdd();
			for (int i = 0; i < ar.size(); i++) {
				if (ar.get(i).getPayDate2().equals(ar.get(i).getCancelDate())) {
					if(ar.get(i).getPayName().equals("ROLE_VIP")) {
						log.info("===============삭제================");
						MemberVO memberVO = new MemberVO();
						memberVO.setId(ar.get(i).getId());
						int result = memberMapper.setMemberRoleDelete2(memberVO);					
					}
				}
			}
		}

	
	//72시간마다 적립예정포인트를 -> 3일 후 적립되는 포인트로 업데이트
	@Scheduled(cron = "0 0 0 * * *")
	public void setPoint()throws Exception{
		PointVO pointVO = new PointVO();
		List<PointVO> ar = new ArrayList<>();
		ar = memberMapper.getPointScheduler(pointVO);
		
		memberMapper.setPointAdd();
		for(int i =0;i < ar.size(); i++) {
			if(ar.get(i).getFinish().equals(ar.get(i).getFinish_3())) {
				int result = memberMapper.setPoint_3();
			}
		}
	}
	


	// 2시간내 구매인증 안하면 자동취소
	@Scheduled(cron = "0 * * * * *")
	public void set2hCancel() throws Exception {
		// 구매인증미션 진행중인 회원
		List<MissionVO> ar = new ArrayList<>();
		ar = missionMapper.getStatus0Ing();
		
		for (int i = 0; i < ar.size(); i++) {
			int result = missionMapper.set2hour(ar.get(i));
			if (ar.get(i).getTime().equals(ar.get(i).getFinish())) {
				missionMapper.setCancel(ar.get(i));
			}
		}
	}

	// 14일이내 리뷰인증 안하면 자동취소
	@Scheduled(cron = "0 0 0 * * *")
	public void set14dCancel() throws Exception {
		// 리뷰인증미션 진행중인 회원
		List<MissionVO> ar = new ArrayList<>();
		ar = missionMapper.getStatus1Ing();
		
		
		for (int i = 0; i < ar.size(); i++) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			String time = simpleDateFormat.format(ar.get(i).getTime()); 
			String finish = simpleDateFormat.format(ar.get(i).getFinish());
			int result = missionMapper.set14day(ar.get(i));
			if (time.equals(finish)) {
				missionMapper.setCancel(ar.get(i));
			}
		}
	}
	
}