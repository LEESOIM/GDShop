package com.shop.goodee.pay;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.member.MemberVO;

@Mapper
public interface PayMapper {

	public int setSeller(PayVO payVO)throws Exception;
	public int setVIP(PayVO payVO)throws Exception;
	public int setPay(PayVO payVO)throws Exception;
}
