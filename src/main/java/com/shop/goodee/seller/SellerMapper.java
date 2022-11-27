package com.shop.goodee.seller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.util.Pager;

@Mapper
public interface SellerMapper {
	
	public Integer setSellerAdd(SellerVO sellerVO) throws Exception;
	public List<SellerVO> getSellerList(Pager pager) throws Exception;
	public Long getTotalCount()throws Exception;
	public List<SellerVO> getApproveSeller(Pager pager) throws Exception;
}
