package com.shop.goodee.item;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tab/*")
public class ListController {
	
	@GetMapping("tab1")
	public String getList1() {
		return "list/list1";
	}
	
	@GetMapping("tab2")
	public String getList2() {
		return "list/list2";
	}
	
	@GetMapping("tab3")
	public String getList3() {
		return "list/list3";
	}
}
