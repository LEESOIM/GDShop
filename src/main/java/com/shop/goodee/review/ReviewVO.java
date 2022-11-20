package com.shop.goodee.review;

import lombok.Data;

@Data
public class ReviewVO {
	
	private String nickName;//유저명
	private String title;//상품이름
	private String date;//날짜
	private String titleDetail;//세부상품이름
	private String review;//리뷰
	private Integer reviewLength;//리뷰글자수
	private String url;//구매 url
	private String id; //id
}
