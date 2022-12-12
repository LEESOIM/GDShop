package com.shop.goodee.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.seller.SellerVO;

@Service
public class PayService {

	@Autowired
	private PayMapper payMapper;
	
	public SellerVO sellerCheck(SellerVO sellerVO)throws Exception{
		return payMapper.sellerCheck(sellerVO);
	}
	
	public int setSeller(PayVO payVO)throws Exception{
		return payMapper.setSeller(payVO);
	}
	
	public int setVIP(PayVO payVO)throws Exception{
		return payMapper.setVIP(payVO);
	}
	
	public int setPay(PayVO payVO)throws Exception{
		int result = payMapper.setPay(payVO);
		
		return result;
	}
}
