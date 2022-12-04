package com.shop.goodee.myCampaign;

import java.sql.Date;

import lombok.Data;

@Data
public class MissionVO {

	private Integer missionNum;
	private Integer itemNum;
	private String id;
	private Date applyDate;
	private Date finish;
	private Integer status;
	private Integer myCam;
	
}
