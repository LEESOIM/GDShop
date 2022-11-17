package com.shop.goodee.member;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member/*")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	/* 약관동의 */
	@GetMapping("agree")
	public void getAgree() {

	}
	// 아이디 중복 확인
	@GetMapping("idCheck")
	public int getIdCheck(MemberVO memberVO)throws Exception{
		return memberService.getIdCheck(memberVO);
	}
	
	/* 회원가입 */
	@GetMapping("join")
	public void getJoin(@ModelAttribute MemberVO memberVO) {
		
	}
	@PostMapping("join")
	public ModelAndView setJoin(@Valid MemberVO memberVO, BindingResult bindingResult, ModelAndView mv, String yy, String mm, String dd, String e, String mailText, String mailOption)throws Exception {
		
		//사용자 검증 메서드(id중복 체크, 이메일 입력 체크, 비번 일치 검증, 휴대번호 입력 검증)
		boolean check = memberService.getMemberError(memberVO, bindingResult);
//		check : true일 경우 검증 실패!
		if(check) {
			mv.setViewName("member/join");
			List<FieldError> errors = bindingResult.getFieldErrors();
			
			for(FieldError fieldError:errors) {
				mv.addObject(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return mv;
		}
		
		int result = memberService.setJoin(memberVO, yy, mm, dd, e, mailText, mailOption);
		
		//회원가입(등급 생성 포함) 성공 시 회원가입 성공 페이지, 실패 시 회원가입 페이지
		if(result == 1) {
			mv.setViewName("redirect:../member/join_end");
			return mv;
		}else {
			mv.setViewName("redirect:../member/join");
			return mv;
		}
		
	}
	
	
	/* 회원가입 완료 */
	@GetMapping("join_end")
	public void getJoinEnd() {
		
	}
	
	/* 마이페이지 */
	@GetMapping("mypage")
	public void getMypage() {
		
	}
	
	/* 내포인트 */
	@GetMapping("point")
	public void getPoint() {

	}
	/* 내등급 */
	@GetMapping("grade")
	public void getGrade() {

	}
}
