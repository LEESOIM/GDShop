package com.shop.goodee.purchase;


import lombok.Data;

@Data
public class PurchaseVO {

	private Long missionNum;
	private String purNum; //주문번호
	private String purDate; //주문일
	private String price;	//가격
	
	private String purNumM; //구매미션-주문번호
	private String priceM;	//구매미션-결제금액
}
