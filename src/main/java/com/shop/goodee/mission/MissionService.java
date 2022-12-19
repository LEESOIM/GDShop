package com.shop.goodee.mission;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeBodyPart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.purchase.PurchaseVO;
import com.shop.goodee.review.ReviewVO;
import com.shop.goodee.seller.SellerVO;

@Service
public class MissionService {
	
	@Autowired
	private MissionMapper missionMapper;
	
	//지원하기-추첨형
	public int setApply(MissionVO missionVO) throws Exception{
		return missionMapper.setApply(missionVO);
	}
	
	//지원하기-즉석추첨형
	public int setApply_baro(MissionVO missionVO) throws Exception {
		return missionMapper.setApply_baro(missionVO);
	}
	
	//지원내역
	public MissionVO getApply(MissionVO missionVO) throws Exception {
		return missionMapper.getApply(missionVO);
	}
	
	//중복지원확인
	public Long getApplyCheck(MissionVO missionVO) throws Exception {
		return missionMapper.getApplyCheck(missionVO);
	}
	
	//지원취소
	public int setCancel(MissionVO missionVO) throws Exception {
		return missionMapper.setCancel(missionVO);
	}
	
	//네이버 닉네임 등록
	public int setNicN(ReviewVO reviewVO) throws Exception {
		return missionMapper.setNicN(reviewVO);
	}
	
	//쿠팡 닉네임 등록
	public int setNicC(ReviewVO reviewVO) throws Exception {
		return missionMapper.setNicC(reviewVO);
	}
	
	//미션 상황 status 변경
	public int setMiStatus1(PurchaseVO purchaseVO) throws Exception{
		return missionMapper.setMiStatus1(purchaseVO);
	}
	
	public int setMiStatus2(ReviewVO reviewVO) throws Exception{
		return missionMapper.setMiStatus2(reviewVO);
	}
	
	//모집률
	public int getApplyRate(MissionVO missionVO) throws Exception {
		return missionMapper.getApplyRate(missionVO);
	}
	
	//미션 선정 대기 중인 회원
	public List<MissionVO> getWaiting(MissionVO missionVO) throws Exception {
		return missionMapper.getWaiting(missionVO);
	}
	
	//추첨형미션 당첨
	public int setWin(MissionVO missionVO) throws Exception {
		return missionMapper.setWin(missionVO);
	}
	
	//포인트 수령
	public int setReceivePoint(ItemVO itemVO) throws Exception {
		return missionMapper.setReceivePoint(itemVO);
	}
	
	//미션완료(MYCAM=3)
	public int setEnd(ItemVO itemVO) throws Exception {
		return missionMapper.setEnd(itemVO);
	}
	
	//미션 선정 탈락
	public int setFail(MissionVO missionVO) throws Exception {
		return missionMapper.setFail(missionVO);
	}

}
