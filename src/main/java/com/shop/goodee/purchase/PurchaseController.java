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
	public void setPurchase(MultipartFile f) throws Exception{
		purchaseService.setPurchaseFileAdd(f);
	}
	
	@GetMapping("getPurchase")
	@ResponseBody
	public void getPurchase() throws Exception{
		purchaseService.getPurchase();
	}
}
