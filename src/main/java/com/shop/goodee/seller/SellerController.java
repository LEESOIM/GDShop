package com.shop.goodee.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/seller/*")
public class SellerController {

	
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("seller")
	public void getSeller() throws Exception{
	}
	
	@GetMapping("sellerList")
	public void getSellerList() throws Exception{
	}
	
	@PostMapping("seller")
	public void setSeller(SellerVO sellerVO) throws Exception{
		log.info("=================Controller================");
		log.info("sellerVO.getId:{}",sellerVO.getId());
		log.info("sellerVO.getCompany:{}",sellerVO.getCompany());
		log.info("sellerVO.getCard:{}",sellerVO.getCard());
		log.info("sellerVO.getCcardNum:{}",sellerVO.getCardNum());
		log.info("sellerVO.getCategory:{}",sellerVO.getCategory());
		sellerService.setSellerAdd(sellerVO);
	}
			
	
}
