package com.shop.goodee.noticefile;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.board.notice.NoticeFileVO;
import com.shop.goodee.board.notice.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FIleManageController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/fileDown/{path}")
	public ModelAndView fileDown(@PathVariable("path") String path,NoticeFileVO noticeFileVO)throws Exception{
		log.info("=====================================");
		log.info("path => {}",path);
		
		noticeFileVO = noticeService.getFileDetail(noticeFileVO);
		log.info("noticeFIleVO =>{}",noticeFileVO);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fileVO",noticeFileVO);
		mv.addObject("path",path);
		mv.setViewName("fileManager"); // FileManager renderMergedOutputModel에서 받음
		
		return mv;
	}
}
