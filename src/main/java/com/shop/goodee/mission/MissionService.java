package com.shop.goodee.mission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MissionService {
	
	@Autowired
	private MissionMapper missionMapper;
	
	public int setAdd(MissionVO missionVO) throws Exception{
		return missionMapper.setAdd(missionVO);
	}
}
