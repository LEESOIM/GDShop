package com.shop.goodee.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/tab/*")
public class ListController {
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping("tab1")
	public ModelAndView getList1() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list1 = itemService.getList1();
		mv.addObject("list1", list1);
		mv.setViewName("list/list1");
		return mv;
	}
	
	@GetMapping("tab2")
	public ModelAndView getList2() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list2 = itemService.getList2();
		mv.addObject("list2", list2);
		mv.setViewName("list/list2");
		return mv;
	}
	
	@GetMapping("tab3")
	public ModelAndView getList3() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list3 = itemService.getList3();
		mv.addObject("list3", list3);
		mv.setViewName("list/list3");
		return mv;
	}
	
	@GetMapping("tab4")
	public ModelAndView getList4() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> list4 = itemService.getList4();
		mv.addObject("list4", list4);
		mv.setViewName("list/list4");
		return mv;
	}
}
