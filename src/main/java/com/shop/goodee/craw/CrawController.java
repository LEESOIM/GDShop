package com.shop.goodee.craw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/craw/*")
public class CrawController {

	@Autowired
	private CrawService crawService;
	
	@GetMapping("test")
	@ResponseBody
	public void test() throws Exception{
		CrawService bot1 = new CrawService();
		bot1.activateBot();
	}
	
	
}
