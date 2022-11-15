package com.shop.goodee.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/*")
public class MemberController {

	/* 약관동의 */
	@GetMapping("agree")
	public void getAgree() {
		
	}
	
	/* 회원가입 */
	@GetMapping("join")
	public void getJoin() {
		
	}
	
	/* 회원가입 완료 */
	@GetMapping("join_end")
	public void getJoinEnd() {
		
	}
	
	/* 마이페이지 */
	@GetMapping("mypage")
	public void getMypage() {
		
	}
}
