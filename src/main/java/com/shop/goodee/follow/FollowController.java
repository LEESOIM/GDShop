package com.shop.goodee.follow;

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

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.mission.MissionService;
import com.shop.goodee.mission.MissionVO;
import com.shop.goodee.purchase.PurchaseController;
import com.shop.goodee.review.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/follow/*")
public class FollowController {

	@Autowired
	private FollowService followService;

	@Autowired
	private MissionService missionService;

	@GetMapping("follow")
	public void follow() throws Exception {

	}

	@PostMapping("getFollow")
	@ResponseBody
	public int getFollow(HttpSession session, MultipartFile f, FollowVO followVO, MissionVO missionVO) throws Exception{
		followVO = followService.getFollow(f);
		
		// ID
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setId(memberVO.getId());
		
		
		// 미션번호
		missionVO = missionService.getApply(missionVO);
		followVO.setMissionNum(missionVO.getMissionNum());
		log.info("missionVO{}" + missionVO);
		log.info("컨트롤러팔로우{}", followVO);
		
		if(followVO.getFollowCheck()==1) {
			ReviewVO reviewVO = new ReviewVO();
			reviewVO.setMissionNum(followVO.getMissionNum());
			int result = missionService.setMiStatus2(reviewVO);
			return result;
		}
		return 0;
	}
}
