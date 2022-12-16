package com.shop.goodee.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellerService {
	
	@Autowired
	private SellerMapper sellerMapper;
	
	public List<MemberVO> getAdminPhone() throws Exception{
		List<MemberVO> phoneList = sellerMapper.getAdminPhone();
		return phoneList;
	}
	
	public int setSellerAdd(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setSellerAdd(sellerVO);
		return result;
	}
	
	public List<SellerVO> getWaitList(Pager pager) throws Exception{
		pager.setStatus(0L);
		pager.setRoleNum(4L);
		Long totalCount = sellerMapper.getTotalCount(pager);
		pager.setRow();
		pager.setNum(totalCount);
		List<SellerVO> ar = sellerMapper.getWaitList(pager);
		log.info("==========ㅇ=================={}",ar);
		return ar;
	}
	
	public List<SellerVO> getAcceptList(Pager pager) throws Exception{
		pager.setStatus(1L);
		pager.setRoleNum(4L);
		Long totalCount = sellerMapper.getTotalCount(pager);
		pager.setRow();
		pager.setNum(totalCount);
		List<SellerVO> ar = sellerMapper.getAcceptList(pager);
		log.info("==========ㅇ=================={}",ar);
		return ar;
	}
	
	public List<SellerVO> getPayList(Pager pager) throws Exception{
		pager.setStatus(1L);
		pager.setRoleNum(2L);
		Long totalCount = sellerMapper.getTotalCount(pager);
		pager.setRow();
		pager.setNum(totalCount);
		List<SellerVO> ar = sellerMapper.getPayList(pager);
		return ar;
	}
	
	public int setWait(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setWait(sellerVO);
		return result;
	}
	public int setWaitNo(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setWaitNo(sellerVO);
		return result;
	}
	
	public int setAccept(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setAccept(sellerVO);
		return result;
	}
	public int setAcceptNo(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setAcceptNo(sellerVO);
		return result;
	}
	public int setPayNo(SellerVO sellerVO) throws Exception{
		int result = sellerMapper.setPayNo(sellerVO);
		return result;
	}
	public MemberVO getAcceptPhone(SellerVO sellerVO) throws Exception{
		MemberVO phone = sellerMapper.getAcceptPhone(sellerVO);
		
		return phone;
	}
}
