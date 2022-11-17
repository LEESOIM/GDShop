package com.shop.goodee.ocr;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchaseVO {

	private String name;
	private Date purDate;
	private String title;
	private Integer price;
	
}
