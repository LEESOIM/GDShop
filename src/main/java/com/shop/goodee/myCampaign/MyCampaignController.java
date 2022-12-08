package com.shop.goodee.myCampaign;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("myCampaign")
public class MyCampaignController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private MyCampaignService myCampaignService;
	
	@GetMapping("apply")
	public ModelAndView getMyCampaignApply(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		MyCampaignVO myCampaignVO = new MyCampaignVO();
		myCampaignVO.setId(memberVO.getId());
		myCampaignVO.setMyCam(0);
		
		List<MyCampaignVO> list = myCampaignService.getMyCampaign(myCampaignVO);
		mv.addObject("list",list);
		mv.setViewName("/myCampaign/apply");
		return mv;
	}
	@GetMapping("choice")
	public ModelAndView getMyCampaignChoice(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		MyCampaignVO myCampaignVO = new MyCampaignVO();
		myCampaignVO.setId(memberVO.getId());
		myCampaignVO.setMyCam(1);
		
		List<MyCampaignVO> list = myCampaignService.getMyCampaign(myCampaignVO);
		mv.addObject("list",list);
		mv.setViewName("/myCampaign/choice");
		return mv;
	}
	@GetMapping("complete")
	public ModelAndView getMyCampaignComplete(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		MyCampaignVO myCampaignVO = new MyCampaignVO();
		myCampaignVO.setId(memberVO.getId());
		myCampaignVO.setMyCam(2);
		
		List<MyCampaignVO> list = myCampaignService.getMyCampaign(myCampaignVO);
		mv.addObject("list",list);
		mv.setViewName("/myCampaign/complete");
		return mv;
	}
	@GetMapping("cancel")
	public ModelAndView getMyCampaignCancel(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		MyCampaignVO myCampaignVO = new MyCampaignVO();
		myCampaignVO.setId(memberVO.getId());
		myCampaignVO.setMyCam(3);
		
		List<MyCampaignVO> list = myCampaignService.getMyCampaign(myCampaignVO);
		mv.addObject("list",list);
		mv.setViewName("/myCampaign/cancel");
		return mv;
	}
	

}
