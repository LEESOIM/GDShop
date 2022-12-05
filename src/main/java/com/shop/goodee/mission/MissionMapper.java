package com.shop.goodee.mission;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MissionMapper {

	public int setAdd(MissionVO missionVO) throws Exception;
}
