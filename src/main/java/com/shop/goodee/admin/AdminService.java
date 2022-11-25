package com.shop.goodee.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.Pager;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public int setMember(MemberVO memberVO)throws Exception{
		return adminMapper.setMember(memberVO);
	}
	
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception{
		return adminMapper.getMemberDetail(memberVO);
	}
	
	public List<MemberVO> getMember(Pager pager)throws Exception{
		Long totalCount = adminMapper.getTotalCount(pager);
		pager.setRow();
		pager.setNum(totalCount);
		
		return adminMapper.getMember(pager);
	}
}
