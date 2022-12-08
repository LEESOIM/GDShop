package com.shop.goodee.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class MainController {
	
	List<RoomVO> roomList = new ArrayList<RoomVO>();
	static int roomNumber = 0;

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chat");
		return mv;
	}
	
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		return mv;
	}
	
	@RequestMapping("/createRoom")
	@ResponseBody
	public List<RoomVO> createRoom(RoomVO roomVO){
		roomVO.setRoomNumber(++roomNumber);
		roomVO.setRoomName("상담방"+roomNumber);
		roomList.add(roomVO);
		return roomList;
	}
	
	@RequestMapping("/getRoom")
	@ResponseBody
	public List<RoomVO> getRoom(){
		return roomList;
	}
	
	@RequestMapping("/moveChating")
	public ModelAndView chating(RoomVO roomVO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("room", roomVO);
		mv.setViewName("chat/chat");
		return mv;
	}
}
