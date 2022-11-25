package com.shop.goodee.seller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
	
	public Integer setSellerAdd(SellerVO sellerVO) throws Exception;
	public List<SellerVO> getSellerList() throws Exception;

}
