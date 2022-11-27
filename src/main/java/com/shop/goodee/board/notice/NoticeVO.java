package com.shop.goodee.board.notice;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private MultipartFile[] files;
	private List<NoticeFileVO> fileVOs;
	private String[] fileName;
	private Long[] fileNum;
}
