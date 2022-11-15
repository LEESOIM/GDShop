package com.shop.goodee.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/membership/*")
public class MembershipController {

	@GetMapping("membership")
	public void getMembership() {
		
	}
}
