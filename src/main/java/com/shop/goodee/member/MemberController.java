package com.shop.goodee.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/*")
public class MemberController {

	@GetMapping("agree")
	public void getAgree() {
		
	}
}
