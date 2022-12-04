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
@RequestMapping("my")
public class MyCampaignController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private MyCampaignService myCampaignService;
	
	@GetMapping("campaign")
	public ModelAndView getMyCampaign(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		MissionVO missionVO = new MissionVO();
		missionVO.setId(memberVO.getId());
		
		List<MissionVO> list = myCampaignService.getMyCampaignApply(missionVO);
		mv.addObject("list",list);
		mv.setViewName("/my/campaign");
		return mv;
	}
	@PostMapping("campaign")
	@ResponseBody
	public ModelAndView getMyCampaign(HttpSession session,MissionVO missionVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		
		missionVO.setId(memberVO.getId());
		log.info("===================================={}",missionVO.getMyCam());
		
		
//		log.info("{}",missionVO.getMyCam());
//		log.info("{}",missionVO.getId());
		
		
//		List<ItemVO> list = itemService.getList();
		List<MissionVO> list = myCampaignService.getMyCampaign(missionVO);

		mv.addObject("list", list);
		
//		mv.addObject("list",list);
		mv.setViewName("/my/campaign");
		return mv;
	}

}
