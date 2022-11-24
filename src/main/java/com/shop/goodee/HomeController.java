package com.shop.goodee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;

@Controller
public class HomeController {
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemVO> ar = itemService.getList();
		mv.addObject("list", ar);
		mv.setViewName("index");
		return mv;
	}
}
