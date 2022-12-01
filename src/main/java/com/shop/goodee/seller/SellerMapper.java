package com.shop.goodee.seller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
	
	public Integer setSellerAdd(SellerVO sellerVO) throws Exception;
	public List<SellerVO> getWaitList() throws Exception;
	public List<SellerVO> getAcceptList() throws Exception;
	public List<SellerVO> getPayList() throws Exception;
	public int setWait(SellerVO sellerVO) throws Exception;
	public int setWaitNo(SellerVO sellerVO) throws Exception;
	public int setAccept(SellerVO sellerVO) throws Exception;
	public int setAcceptNo(SellerVO sellerVO) throws Exception;
	public int setPayNo(SellerVO sellerVO) throws Exception;

}
