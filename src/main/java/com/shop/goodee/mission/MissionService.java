package com.shop.goodee.mission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MissionService {
	
	@Autowired
	private MissionMapper missionMapper;
	
	//지원하기
	public int setApply(MissionVO missionVO) throws Exception{
		return missionMapper.setApply(missionVO);
	}
	
	//지원내역
	public MissionVO getApply(MissionVO missionVO) throws Exception {
		return missionMapper.getApply(missionVO);
	}
	
	//중복지원확인
	public Long getApplyCheck(MissionVO missionVO) throws Exception {
		return missionMapper.getApplyCheck(missionVO);
	}
}
