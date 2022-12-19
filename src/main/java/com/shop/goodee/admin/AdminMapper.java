package com.shop.goodee.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.myCampaign.MyCampaignVO;
import com.shop.goodee.pay.PayVO;
import com.shop.goodee.util.Pager;

@Mapper
public interface AdminMapper {
	public List<PayVO> getTotal()throws Exception;
	public List<PayVO> getMonthRevenue(String year)throws Exception;
	public List<PayVO> getRevenue()throws Exception;
	public Long getCountMi2(Pager pager)throws Exception;
	public List<MyCampaignVO> getMission2(Pager pager)throws Exception;
	public Long getCountMi(Pager pager)throws Exception;
	public List<MyCampaignVO> getMission(Pager pager)throws Exception;
	public Long getCountPd(Pager pager)throws Exception;
	public List<ItemVO> getPdRequest(Pager pager)throws Exception;
	public int setAddRole(MemberVO memberVO) throws Exception;
	public int setDeleteRole(MemberVO memberVO)throws Exception;
	public List<MemberVO> getAdmin()throws Exception;
	public int setMember(MemberVO memberVO)throws Exception;
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public List<MemberVO> getMember(Pager pager)throws Exception;
}
