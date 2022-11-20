package com.shop.goodee.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/seller/*")
public class SellerController {

	
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("seller")
	public void getSeller() throws Exception{
		sellerService.test();
	}
	
}
