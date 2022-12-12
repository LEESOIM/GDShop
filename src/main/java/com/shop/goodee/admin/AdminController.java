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
import com.shop.goodee.myCampaign.MyCampaignVO;
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
	
	@GetMapping("getMission2")
	@ResponseBody
	public ModelAndView getMission2(Pager pager)throws Exception{
		log.info("====================================");
		log.info("pager =>{}",pager);
		ModelAndView mv = new ModelAndView();
		List<MyCampaignVO> list = adminService.getMission2(pager);
		mv.addObject("list",list);
		mv.setViewName("/admin/mission_common");
		mv.addObject("status","ongoing");
		return mv;
	}
	
	
	@GetMapping("getMission")
	@ResponseBody
	public ModelAndView getMission(Pager pager)throws Exception{
		log.info("====================================");
		log.info("pager =>{}",pager);
		ModelAndView mv = new ModelAndView();
		List<MyCampaignVO> list = adminService.getMission(pager);
		mv.addObject("list",list);
		mv.setViewName("/admin/mission_common");
		mv.addObject("status","ongoing");
		return mv;
	}
	
	
	
	
	@GetMapping("getPdList")
	@ResponseBody
	public ModelAndView getPdList(Pager pager)throws Exception{
		// 삭제 요청
		log.info("Delete Request => {}",pager);
		ModelAndView mv = new ModelAndView();
		pager.setStatus(1L);
		List<ItemVO> list = adminService.getPdRequest(pager);
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","product");
		mv.setViewName("/admin/product/pd_request_common");
		return mv;
	}
	
	@GetMapping("product_list")
	public ModelAndView getProductList()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/product/product_list");
		return mv;
	}
	
	@GetMapping("reject_request")
	@ResponseBody
	public ModelAndView getRejectRequest(Pager pager)throws Exception{
		// 삭제 요청
		log.info("Delete Request => {}",pager);
		ModelAndView mv = new ModelAndView();
		pager.setStatus(4L);
		List<ItemVO> list = adminService.getPdRequest(pager);
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","delete");
		mv.setViewName("/admin/product/pd_request_common");
		return mv;
	}
	
	@GetMapping("delete_request")
	@ResponseBody
	public ModelAndView getDelRequest(Pager pager)throws Exception{
		// 삭제 요청
		log.info("Delete Request => {}",pager);
		ModelAndView mv = new ModelAndView();
		pager.setStatus(3L);
		List<ItemVO> list = adminService.getPdRequest(pager);
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","delete");
		mv.setViewName("/admin/product/pd_request_common");
		return mv;
	}
	
	@GetMapping("update_request")
	@ResponseBody
	public ModelAndView getUpRequest(Pager pager)throws Exception{
		// 수정 요청
		log.info("Update Request => {}",pager);
		ModelAndView mv = new ModelAndView();
		pager.setStatus(2L);
		List<ItemVO> list = adminService.getPdRequest(pager); 
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","update");
		mv.setViewName("/admin/product/pd_request_common");
		return mv;
	}
	
	@GetMapping("add_request")
	@ResponseBody
	public ModelAndView getAddRequest(Pager pager)throws Exception{
		// 등록 요청
		log.info("Add Request => {}",pager);
		ModelAndView mv = new ModelAndView();
		pager.setStatus(0L);
		List<ItemVO> list = adminService.getPdRequest(pager); 
		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.addObject("request","add");
		mv.setViewName("/admin/product/pd_request_common");
		return mv;
	}
	
	
	
	@GetMapping("product_request")
	public ModelAndView getProductRequest(Pager pager, ModelAndView mv)throws Exception{
		mv.setViewName("admin/product/product_request");
		return mv;
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
	
	
	
	@GetMapping("seller/wait")
	public ModelAndView getSellerList(Pager pager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getWaitList(); 
		
		mv.addObject("vo", ar);
		mv.addObject("pager",pager);
		mv.setViewName("/seller/wait");
		return mv;
	}
	@GetMapping("seller/accept")
	public ModelAndView getSellerList2(Pager pager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getAcceptList(); 
		
		mv.addObject("vo", ar);
		mv.addObject("pager",pager);
		mv.setViewName("/seller/accept");
		return mv;
	}
	@GetMapping("seller/pay")
	public ModelAndView getSellerList3(Pager pager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getPayList(); 
		
		mv.addObject("vo", ar);
		mv.addObject("pager",pager);
		mv.setViewName("/seller/pay");
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
