package com.shop.goodee.mission;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mission/*")
@Slf4j
public class MissionController {

	@Autowired
	private MissionService missionService;
	
	@Autowired
	private ItemService itemService;
	
	//지원하기
	@PostMapping("apply")
	@ResponseBody
	public int setApply(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		
		//상품테이블에 있는 값을 미션테이블로 담기
		itemVO = itemService.getDetail(itemVO);
		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());
		
		//지원하기
		int result = missionService.setApply(missionVO);
		return result;
	}
	
	
	//지원내역
	@PostMapping("applyList")
	@ResponseBody
	public Long getApply(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		
		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());
		
		missionVO = missionService.getApply(missionVO);
		Long result = missionVO.getMyCam();
		log.info("===========지원내역 : {}", missionVO);
		return result;
	}
	
	
	//중복지원확인
	@PostMapping("applyCheck")
	@ResponseBody
	public Long getApplyCheck(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		
		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());
		
		Long result = missionService.getApplyCheck(missionVO);
		return result;
	}
	
}
