package com.shop.goodee.items;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/items/*")
public class ItemsController {

	@GetMapping("detail")
	public void getItems() {
		
	}
}
