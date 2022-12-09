package com.shop.goodee.mission;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MissionMapper {

	public int setApply(MissionVO missionVO) throws Exception;
	
	public int setApply_baro(MissionVO missionVO) throws Exception;
	
	public MissionVO getApply(MissionVO missionVO) throws Exception;
	
	public Long getApplyCheck(MissionVO missionVO) throws Exception;
	
	public int setCancel(MissionVO missionVO) throws Exception;
	
}
