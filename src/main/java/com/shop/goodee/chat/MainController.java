package com.shop.goodee.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class MainController {
	
	List<RoomVO> roomList = new ArrayList<RoomVO>();
	static int roomNumber = 0;

	@RequestMapping("/chatbot")
	public ModelAndView chat() {
		log.info("챗봇 진입-- ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatbot");
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
	public ModelAndView chating(RoomVO roomVO, HttpSession session, MemberVO memberVO) {
		ModelAndView mv = new ModelAndView();
		log.info("roomname => {}", roomVO);
		mv.addObject("room", roomVO);
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			Authentication authentication = context.getAuthentication();
			memberVO = (MemberVO) authentication.getPrincipal();
			mv.addObject("memberVO", memberVO);
		}
		mv.setViewName("chat/chat");
		return mv;
	}
}
