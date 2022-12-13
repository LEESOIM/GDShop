package com.shop.goodee.mission;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.purchase.PurchaseVO;

@Mapper
public interface MissionMapper {

	public int setApply(MissionVO missionVO) throws Exception;
	
	public int setApply_baro(MissionVO missionVO) throws Exception;
	
	public MissionVO getApply(MissionVO missionVO) throws Exception;
	
	public Long getApplyCheck(MissionVO missionVO) throws Exception;
	
	public int setCancel(MissionVO missionVO) throws Exception;
	
	public int setNicN(PurchaseVO purchaseVO) throws Exception;
	
	public int setNicC(PurchaseVO purchaseVO) throws Exception;
	
	public int setMiStatus1(PurchaseVO purchaseVO) throws Exception;
	
	public int setMiStatus2(PurchaseVO purchaseVO) throws Exception;
	
	public int getApplyRate(MissionVO missionVO) throws Exception;
	
	public List<MissionVO> getStatus0Ing() throws Exception;
	
	public int set2hour(MissionVO missionVO) throws Exception;
	
	public List<MissionVO> getStatus1Ing() throws Exception;
	
	public int set14day(MissionVO missionVO) throws Exception;
	
	public int setAutoCancel(MissionVO missionVO) throws Exception;
	
}
