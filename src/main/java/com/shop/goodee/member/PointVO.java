package com.shop.goodee.member;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {

	private Long pointNum;
	private String id;
	private Long itemNum;
	private Date finish;
	private String title;
	private Long point;
	private Date finish_3;
	private Long status;
}
