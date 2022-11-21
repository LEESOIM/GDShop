package com.shop.goodee.seller;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
	
	public Integer setSellerAdd(SellerVO sellerVO) throws Exception;

}
