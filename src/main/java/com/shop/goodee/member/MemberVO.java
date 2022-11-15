package com.shop.goodee.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date birth;
	private String phone;
	private Long point;
	private Date regDate;
	private Boolean status;
	private String nickName;
}
