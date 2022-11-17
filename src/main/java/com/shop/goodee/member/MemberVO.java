package com.shop.goodee.member;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class MemberVO {
	
	@NotBlank
	private String id;
	@NotBlank
	private String pw;
	@NotBlank
	private String name;
	private String email;
	private String birth;
	private String phone;
	private Long point;
	private Date regDate;
	private Boolean status;
	private String nickName;
	
	//추가 memberVO
	private String pwCheck;
	@NotBlank
	private String e;
	private String mailText;
	private String mailOption;
	@Range(min=1900, max=2022)
	private String yy;
	@Range(min=1, max=12)
	private String mm;
	@Range(min=1, max=31)
	private String dd;
	
	//등급 여러개 가능
	private List<RoleVO> roleVOs;
	//프로필 사진 한개
	
}
