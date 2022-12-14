package com.shop.goodee.seller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.Pager;

@Mapper
public interface SellerMapper {
	
	public int setSellerAdd(SellerVO sellerVO) throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public List<SellerVO> getWaitList(Pager pager) throws Exception;
	public List<SellerVO> getAcceptList(Pager pager) throws Exception;
	public List<SellerVO> getPayList(Pager pager) throws Exception;
	public int setWait(SellerVO sellerVO) throws Exception;
	public int setWaitNo(SellerVO sellerVO) throws Exception;
	public int setAccept(SellerVO sellerVO) throws Exception;
	public int setAcceptNo(SellerVO sellerVO) throws Exception;
	public int setPayNo(SellerVO sellerVO) throws Exception;
	public List<MemberVO> getAdminPhone() throws Exception;
	public MemberVO getAcceptPhone(SellerVO sellerVO) throws Exception;

}
