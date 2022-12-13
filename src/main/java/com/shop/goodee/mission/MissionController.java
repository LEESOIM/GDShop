package com.shop.goodee.mission;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberSecurityService;
import com.shop.goodee.member.MemberService;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.sse.SseController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mission/*")
@Slf4j
public class MissionController {

	@Autowired
	private MissionService missionService;

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private MemberService memberService;

	
	// 회원정보조회
	@PostMapping("member")
	@ResponseBody
	public MemberVO getMember(HttpSession session) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		log.info("회원아이디{}",memberVO.getId());
		String user = memberVO.getId();
		if(user != null) {
			long role = memberService.getVIP(memberVO);
			if(role>0) {
				memberVO.setRoleNum(role);
				return memberVO;
			}
			return memberVO;
		}
		return null;
	}
	
	
	// 지원하기
	@PostMapping("apply")
	@ResponseBody
	public int setApply(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		// 상품테이블에 있는 값을 미션테이블로 담기
		itemVO = itemService.getDetail(itemVO);
		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());

		// 지원하기
		if (itemVO.getType().equals("추첨형")) {
			return missionService.setApply(missionVO);
		} else {
			return missionService.setApply_baro(missionVO);
		}
	}

	// 지원내역
	@PostMapping("applyList")
	@ResponseBody
	public MissionVO getApply(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());
		missionVO = missionService.getApply(missionVO);
		log.info("미션지원내역==={} ", missionVO);
		return missionVO;
	}

	// 중복지원확인
	@PostMapping("applyCheck")
	@ResponseBody
	public Long getApplyCheck(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());

		Long result = missionService.getApplyCheck(missionVO);
		return result;
	}

	// 지원취소
	@PostMapping("cancel")
	@ResponseBody
	public String setCancel(HttpSession session, MissionVO missionVO, ItemVO itemVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setItemNum(itemVO.getItemNum());

		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());

		int result = missionService.setCancel(missionVO);
		return "/item/detail?itemNum=" + itemVO.getItemNum();
	}

}
