package com.shop.goodee.item;

import java.sql.Date;

import lombok.Data;

@Data
public class ItemVO {
	private String itemNum;
	private String id;
	private String title;
	private String contents;
	private Long price;
	private Long stock;
	private Long count;
	private String url;
	private Date date;
	private Long hit;
	private boolean status;
}
