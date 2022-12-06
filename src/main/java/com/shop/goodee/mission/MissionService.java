package com.shop.goodee.mission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
