package com.shop.goodee.sell;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sell/*")
public class SellController {

//	@Autowired
//	private SellService sellService;
	
	@GetMapping("getSell")
	public void sellAdd(){
		
	}
	
}
