package com.shop.goodee.item;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mainTab/*")
public class TabController {
	
	@GetMapping("tab1")
	public void getTap1() {
		
	}
	
	@GetMapping("tab2")
	public void getTap2() {
		
	}
	
	@GetMapping("tab3")
	public void getTap3() {
		
	}
}
