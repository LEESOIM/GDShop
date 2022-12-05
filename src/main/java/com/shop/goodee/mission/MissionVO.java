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
}
