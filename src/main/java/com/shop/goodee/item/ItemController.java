package com.shop.goodee.item;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.sse.NotificationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item/*")
@Slf4j
public class ItemController {
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private ItemService itemService;

	// 상품등록
	@GetMapping("add")
	public void setAdd() {

	}

	@PostMapping("add")
	public ModelAndView setAdd(HttpSession session, ItemVO itemVO, MultipartFile[] files) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());

		ModelAndView mv = new ModelAndView();
		int result = itemService.setAdd(itemVO);
		log.info("==id=={}", itemVO.getId());
		notificationService.pdAddRequestEvent(itemVO.getId());
		mv.setViewName("redirect:../member/product");
		return mv;
	}

	//디테일
	@GetMapping("detail")
	public ModelAndView getDetail(ItemVO itemVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		itemVO = itemService.getDetail(itemVO);
		mv.addObject("vo", itemVO);
		mv.setViewName("/item/detail");
		return mv;
	}

	//상품수정요청
	@GetMapping("update")
	public ModelAndView setUpdate(ItemVO itemVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		itemVO = itemService.getDetail(itemVO);
		mv.addObject("vo", itemVO);
		mv.setViewName("item/update");
		return mv;
	}

	//상품수정
	@PostMapping("update")
	public String setUpdate(HttpSession session, ItemVO itemVO, MultipartFile[] files) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());
		
		int result = itemService.setUpdate(itemVO);
		return "redirect:/member/product";
	}
	
	//상품수정시 파일삭제
	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(ItemFileVO itemFileVO) throws Exception {
		return itemService.setFileDelete(itemFileVO);
	}
	

	//상품삭제요청
	@GetMapping("delete")
	@ResponseBody
	public int setStatusDel(HttpSession session, ItemVO itemVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());
		itemVO.getItemNum();
		log.info("==id=={}", itemVO.getId());
		log.info("==itemNum=={}", itemVO.getItemNum());
		return itemService.setStatusDel(itemVO);
	}
}
