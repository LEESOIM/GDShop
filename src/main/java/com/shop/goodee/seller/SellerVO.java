package com.shop.goodee.seller;

import com.shop.goodee.member.MemberVO;

import lombok.Data;

@Data
public class SellerVO extends MemberVO{

	private String id;
	private String company;
	private boolean status;
	
}
