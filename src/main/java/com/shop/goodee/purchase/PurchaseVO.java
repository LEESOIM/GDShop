package com.shop.goodee.purchase;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchaseVO {

	private Long missionNum;
	private String purNum; //주문번호
	private String purDate; //주문일
	private String price;	//가격
	
	private String nIcM; //구매-닉네임
	private String purNumM; //구매-주문번호
	private String priceM;	//구매-결제금액
}
