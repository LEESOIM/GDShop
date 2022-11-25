package com.shop.goodee.purchase;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	
	@GetMapping("purchase")
	public void purchase() throws Exception{
	}
	
	
	@PostMapping("setPurchase")
	@ResponseBody
	public PurchaseVO setPurchase(MultipartFile f) throws Exception{
		PurchaseVO finalPurchaseVO = purchaseService.getPurchase(f);
		
		log.info("=========Controller==========");
		log.info("주문일){}",finalPurchaseVO.getPurDate());
		log.info("주문번호){}",finalPurchaseVO.getPurNum());
		log.info("가격){}",finalPurchaseVO.getPrice());
		log.info("=============================");
		return finalPurchaseVO;
	}

}
