package com.shop.goodee.item;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ItemVO {
	private Long itemNum; //상품번호
	private String id; //판매자
	private String itemName; //상품명
	private Long price; //상품가격
	private String title; //캠페인제목
	private String type; //캠페인유형
	private Long point; //보상포인트
	private String itemDetail; //제공내역
	private Long stock; //총 제공수량
	private Long count; //캠페인회차
	private String shop; //쇼핑몰
	private String url; //구매링크
	private Date date; //등록일
	private Long hit; //조회수
	private boolean status; //승인여부
	
	private String company; //판매자
	private MultipartFile [] files; //Service에서 업로드할때
	private List<ItemFileVO> itemFileVOs; //DB 조회해서 담을때
}
