package com.shop.goodee.board.notice;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO  {
	private Long noticeNum;
	private String id;
	private String title;
	private String contents;
	private Date regDate;
	private Long hit;
	private Long ref;
	private Long step;
	private Long depth;
}
