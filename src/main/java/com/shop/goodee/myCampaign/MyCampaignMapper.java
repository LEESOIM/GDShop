package com.shop.goodee.myCampaign;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.item.ItemVO;

@Mapper
public interface MyCampaignMapper {
	public List<MissionVO> getMyCampaignApply(MissionVO missionVO) throws Exception;
	public List<MissionVO> getMyCampaign(MissionVO missionVO) throws Exception;

}
