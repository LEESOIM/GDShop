package com.shop.goodee.review;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long missionNum;
	private String nickName;//쿠팡닉네임
	public String nickName_N;//네이버아이디
	private String title;//상품이름
	private String date;//날짜
	private String titleDetail;//세부상품이름
	private String review;//리뷰
	private Integer reviewLength;//리뷰글자수
	private String url;//구매 url
	private String id; //id
}
