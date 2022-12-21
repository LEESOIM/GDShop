package com.shop.goodee.seller;

import java.util.List;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.member.RoleVO;

import lombok.Data;

@Data
public class SellerVO extends MemberVO{

	private String id;
	private String company;
	private boolean status;
	
	public boolean getStatus() {
		return this.status;
	}
	
	private List<RoleVO> roleVOs;
}
