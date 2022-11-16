package com.shop.goodee.craw;

import lombok.Data;

@Data
public class ReviewVO {
	private String title;//상품이름
	private String id;//유저명
	private String date;//날짜
	private String titleDetail;//세부상품이름
	private String review;//리뷰
}
