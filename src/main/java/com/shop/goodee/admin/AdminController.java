package com.shop.goodee.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("detail")
	@ResponseBody
	public MemberVO getMemberDetail(MemberVO memberVO)throws Exception{
		memberVO = adminService.getMemberDetail(memberVO);
		return memberVO;
	}
	
	
	@PostMapping("member")
	@ResponseBody
	public ModelAndView getMember(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> list =  adminService.getMember(pager);
		log.info("==============================");
		log.info("pager =>{}",pager);
		log.info("rolename =>{}",pager.getRoleName());
		log.info("kind =>{}",pager.getKind());
		log.info("search =>{}",pager.getSearch());
		log.info("==============================");
//		Map<String, Object> map = new HashMap<String,Object>();
//		map.put("list",list);
//		map.put("pager",pager);
//		mv.addObject("map",map);
		//return map;
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.setViewName("admin/common");
		return mv;
	}
	
	@GetMapping("member")
	public ModelAndView getMember(Pager pager, ModelAndView mv)throws Exception {
		List<MemberVO> list =  adminService.getMember(pager);
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.setViewName("admin/member");
		return mv;
	}
	
	@GetMapping("index")
	public void getAdmin()throws Exception {
		
	}

}
