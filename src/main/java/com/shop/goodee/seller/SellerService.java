package com.shop.goodee.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellerService {
	
	@Autowired
	private SellerMapper sellerMapper;
	
	public Integer setSellerAdd(SellerVO sellerVO) throws Exception{
		
		int result = sellerMapper.setSellerAdd(sellerVO);
		return result;
	}
	
	public List<SellerVO> getSellerList(Pager pager) throws Exception{
		Long totalCount = sellerMapper.getTotalCount();
		pager.setRow();
		pager.setNum(totalCount);
		
		List<SellerVO> ar = sellerMapper.getSellerList(pager);
		log.info("==========ㅇ=================={}",ar);
		return ar;
	}
	
	public List<SellerVO> getApproveSeller(Pager pager)throws Exception{
		Long totalCount = sellerMapper.getTotalCount();
		pager.setRow();
		pager.setNum(totalCount);
		
		List<SellerVO> list = sellerMapper.getSellerList(pager);
		
		return list;
	}
	
}
