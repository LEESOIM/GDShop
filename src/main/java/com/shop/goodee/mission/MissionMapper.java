package com.shop.goodee.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.purchase.PurchaseVO;
import com.shop.goodee.review.ReviewVO;
import com.shop.goodee.seller.SellerVO;

@Mapper
public interface MissionMapper {

	public int setApply(MissionVO missionVO) throws Exception;
	
	public int setApply_baro(MissionVO missionVO) throws Exception;
	
	public MissionVO getApply(MissionVO missionVO) throws Exception;
	
	public Long getApplyCheck(MissionVO missionVO) throws Exception;
	
	public int setCancel(MissionVO missionVO) throws Exception;
	
	public int setNicN(ReviewVO reviewVO) throws Exception;
	
	public int setNicC(ReviewVO reviewVO) throws Exception;
	
	public int setMiStatus1(PurchaseVO purchaseVO) throws Exception;
	
	public int setMiStatus2(ReviewVO reviewVO) throws Exception;
	
	public int getApplyRate(MissionVO missionVO) throws Exception;
	
	public List<MissionVO> getStatus0Ing() throws Exception;
	
	public int set2hour(MissionVO missionVO) throws Exception;
	
	public List<MissionVO> getStatus1Ing() throws Exception;
	
	public int set14day(MissionVO missionVO) throws Exception;
	
	public int setAutoCancel(MissionVO missionVO) throws Exception;
	
	public List<MissionVO> getWaiting(MissionVO missionVO) throws Exception;
	
	public int setWin(MissionVO missionVO) throws Exception;
	
	public int setReceivePoint(ItemVO itemVO) throws Exception;
	
	public int setEnd(ItemVO itemVO) throws Exception;
	
	public int setFail(MissionVO missionVO) throws Exception;
}
