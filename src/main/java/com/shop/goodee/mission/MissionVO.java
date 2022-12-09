package com.shop.goodee.mission;

import java.sql.Date;

import lombok.Data;

@Data
public class MissionVO {
	private Long missionNum;
	private Long itemNum;
	private String id;
	private Date applyDate;
	private Date finish;
	private Long status;
	private Long myCam;
	
	//내 포인트 - 출금가능일
	private Date finish_3;
	public MissionVO() {} 
	
	public MissionVO(Long status, Long myCam) {
		this.status=status;
		this.myCam=myCam;
	}
}
