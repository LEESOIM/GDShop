package com.shop.goodee.mission;

import java.util.Date;

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
	private Date time;
	private Long applyCount;
	
	//내 포인트 - 출금가능일
	private Date finish_3;
	public MissionVO() {} 
	
}
