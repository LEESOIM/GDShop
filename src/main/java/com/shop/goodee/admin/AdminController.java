package com.shop.goodee.admin;

import java.io.Console;
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

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.seller.SellerService;
import com.shop.goodee.seller.SellerVO;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;	
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("product_list")
	public void getProductList()throws Exception{
		
	}
	
	@GetMapping("deleteRequest")
	@ResponseBody
	public ModelAndView getDelRequest(Pager pager)throws Exception{
		// 삭제 요청
		ModelAndView mv = new ModelAndView();
		pager.setStatus(3L);
		List<ItemVO> list = adminService.getPdRequest(pager);
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","delete");
		mv.setViewName("admin/pd_request_common");
		return mv;
	}
	
	@GetMapping("updateRequest")
	@ResponseBody
	public ModelAndView getUpRequest(Pager pager)throws Exception{
		// 수정 요청
		ModelAndView mv = new ModelAndView();
		pager.setStatus(2L);
		List<ItemVO> list = adminService.getPdRequest(pager); 
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","update");
		mv.setViewName("admin/pd_request_common");
		return mv;
	}
	
	@GetMapping("addRequest")
	@ResponseBody
	public ModelAndView getAddRequest(Pager pager)throws Exception{
		// 등록 요청
		ModelAndView mv = new ModelAndView();
		pager.setStatus(0L);
		List<ItemVO> list = adminService.getPdRequest(pager); 
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","add");
		mv.setViewName("admin/pd_request_common");
		return mv;
	}
	
	
	
	@GetMapping("product_request")
	public void getProductRequest(Pager pager, ModelAndView mv)throws Exception{
//		// 등록 요청
//		pager.setStatus(0L);
//		List<ItemVO> addList = adminService.getPdRequest(pager); 
//		// 수정 요청
//		pager.setStatus(2L);
//		List<ItemVO> upList = adminService.getPdRequest(pager); 
//		// 삭제 요청
//		pager.setStatus(3L);
//		List<ItemVO> delList = adminService.getPdRequest(pager);
//		
//		mv.addObject("addList",addList);
//		mv.addObject("delList",delList);
//		mv.addObject("upList",upList);
//		mv.addObject("pager",pager);
//		
//		mv.setViewName("admin/product_request");
//		
//		return mv;
	}
	
	
	@PostMapping("addRole")
	@ResponseBody
	public int setAddeRole(MemberVO memberVO)throws Exception{
		
		int result = adminService.setAddRole(memberVO);
	
		return result;
	}
	
	@PostMapping("deleteRole")
	@ResponseBody
	public int setDeleteRole(MemberVO memberVO)throws Exception{
		
		int result = adminService.setDeleteRole(memberVO);
	
		return result;
	}
	
	
	@PostMapping("update")
	public String setUpdate(MemberVO memberVO)throws Exception{
		int result = adminService.setMember(memberVO);
		log.info("memberVO => {}",memberVO);
		return "redirect:/admin/member";
	}
	
	
	
	@GetMapping("seller")
	public ModelAndView getSellerList(Pager pager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getSellerList(pager); 
		
		mv.addObject("vo", ar);
		mv.addObject("pager",pager);
		mv.setViewName("/admin/seller");
		return mv;
	}
	
	
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
		log.info("list {}",list);
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
