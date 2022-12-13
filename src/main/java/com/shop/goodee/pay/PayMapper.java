package com.shop.goodee.pay;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.seller.SellerVO;

@Mapper
public interface PayMapper {
	public SellerVO sellerCheck(SellerVO sellerVO)throws Exception;
	public int setSeller(PayVO payVO)throws Exception;
	public int setVIP(PayVO payVO)throws Exception;
	public int setPay(PayVO payVO)throws Exception;
}
