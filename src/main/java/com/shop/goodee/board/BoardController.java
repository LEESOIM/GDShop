package com.shop.goodee.board;

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

import com.shop.goodee.board.notice.NoticeService;
import com.shop.goodee.board.notice.NoticeVO;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	
	@Autowired
	public NoticeService noticeService;
	
	@GetMapping("delete")
	public String setDelete(NoticeVO noticeVO)throws Exception{
		int result = noticeService.setDelete(noticeVO);
		
		return "redirect:./notice";
	}
	
	
	@PostMapping("update")
	public String setUpdate(NoticeVO noticeVO)throws Exception{
		log.info("Update noticeVO => {}",noticeVO);
		log.info("Update fileName => {}",noticeVO.getFileName());
		log.info("Update fileNum => {}",noticeVO.getFileNum());
		int resultDelete =noticeService.setUpdate(noticeVO);
		
		return "redirect:./notice";
	}
	
	
	@GetMapping("start")
	@ResponseBody
	public NoticeVO startUpdate(NoticeVO noticeVO)throws Exception{
		noticeVO = noticeService.getDetail(noticeVO);
		return noticeVO;
	}
	
	
	@GetMapping("update")
	public ModelAndView setUpdate(NoticeVO noticeVO, ModelAndView mv)throws Exception{
		
		noticeVO = noticeService.getDetail(noticeVO);
		mv.addObject("noticeVO",noticeVO);
		
		return mv;
	}
	
	@GetMapping("notice")
	public ModelAndView getBoard(Pager pager)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<NoticeVO> list = noticeService.getList(pager);

		mv.addObject("list",list);
		mv.addObject("pager",pager);
		mv.setViewName("/board/notice");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.getDetail(noticeVO);
		mv.addObject("noticeVO",noticeVO);
		
		return mv;
	}
	
	@GetMapping("write")
	public void setWrite()throws Exception{
	}
	@PostMapping("write")
	public String setWrite(NoticeVO noticeVO)throws Exception{
		log.info("noticeVO {}=>",noticeVO);
		int result = noticeService.setWrite(noticeVO);
		return "redirect:./notice";
	}
}
