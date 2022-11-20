package com.shop.goodee.purchase;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchaseVO {

	private String name;
	private Date purDate;
	private String title;
	private Integer price;
	
}
