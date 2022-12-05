package com.shop.goodee.mission;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mission/*")
@Slf4j
public class MissionController {

	@Autowired
	private MissionService missionService;
	
	@PostMapping("add")
	public ModelAndView setAdd(HttpSession session, MissionVO missionVO) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		ItemVO itemVO = new ItemVO();
		missionVO.setId(memberVO.getId());
		missionVO.setItemNum(itemVO.getItemNum());
		
		ModelAndView mv = new ModelAndView();
		int result = missionService.setAdd(missionVO);
		log.info("아이디 {}", missionVO.getId());
		log.info("상품 {}", missionVO.getItemNum());
		mv.setViewName("redirect:detail?itemNum=" + itemVO.getItemNum());
		return mv;
	}
	
	
}
