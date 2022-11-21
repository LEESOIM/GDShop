package com.shop.goodee.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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
	
}
