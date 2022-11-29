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

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item/*")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping("add")
	public void setAdd() {
		
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ItemVO itemVO, MultipartFile [] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = itemService.setAdd(itemVO);
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("detail")
	public void getDetail() {
		
	}
	
	@GetMapping("update")
	@ResponseBody
	public ModelAndView setUpdate(ItemVO itemVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		itemVO = itemService.getDetail(itemVO);
		mv.addObject("vo", itemVO);
		mv.setViewName("item/update");
		return mv;
	}
	
	@PostMapping("update")
	public void setUpdate(ItemVO itemVO, MultipartFile [] files) throws Exception {

	}
	
}
