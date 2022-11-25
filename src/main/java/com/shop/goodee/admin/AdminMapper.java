package com.shop.goodee.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.Pager;

@Mapper
public interface AdminMapper {
	
	public int setMember(MemberVO memberVO)throws Exception;
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public List<MemberVO> getMember(Pager pager)throws Exception;
}
