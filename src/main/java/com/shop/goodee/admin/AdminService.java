package com.shop.goodee.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.myCampaign.MyCampaignVO;
import com.shop.goodee.util.Pager;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public List<MyCampaignVO> getMission2(Pager pager)throws Exception{
		Long totalCount = adminMapper.getCountMi2(pager);
		pager.setRow();
		pager.setNum(totalCount);
		return adminMapper.getMission2(pager);
	}
	
	public List<MyCampaignVO> getMission(Pager pager)throws Exception{
		Long totalCount = adminMapper.getCountMi(pager);
		pager.setRow();
		pager.setNum(totalCount);
		return adminMapper.getMission(pager);
	}
	
	public List<ItemVO> getPdRequest(Pager pager)throws Exception{
		Long totalCount = adminMapper.getCountPd(pager);
		pager.setRow();
		pager.setNum(totalCount);
		
		return adminMapper.getPdRequest(pager);
	};
	
	public int setAddRole(MemberVO memberVO)throws Exception{
		return adminMapper.setAddRole(memberVO);
	}
	
	public int setDeleteRole(MemberVO memberVO)throws Exception{
		return adminMapper.setDeleteRole(memberVO);
	}
	
	public List<MemberVO> getAdmin()throws Exception{
		return adminMapper.getAdmin();
	}
	
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
