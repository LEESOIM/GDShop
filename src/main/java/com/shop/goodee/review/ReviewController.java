package com.shop.goodee.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.mission.MissionService;
import com.shop.goodee.mission.MissionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private MissionService missionService;

	@GetMapping("test")
	@ResponseBody
	public void test() throws Exception {
//		CrawService bot1 = new CrawService();
//		bot1.activateBot();
	}

	@GetMapping("review")
	public void craw() throws Exception {

	}

	@PostMapping("getReview")
	@ResponseBody
	public int getReview(HttpSession session, TestVO testVO, MissionVO missionVO) throws Exception {

		ReviewVO reviewVO = reviewService.getReview(testVO);
		log.info("=========Controller========");
		log.info("닉네임)" + reviewVO.getNickName());
		log.info("상품명)" + reviewVO.getTitle());
		log.info("날짜)" + reviewVO.getDate());
		log.info("세부상품명)" + reviewVO.getTitleDetail());
		log.info("리뷰)" + reviewVO.getReview());
		log.info("리뷰글자수)" + reviewVO.getReviewLength());

		// ID
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setId(memberVO.getId());
		reviewVO.setId(memberVO.getId());

		// 미션번호
		missionVO = missionService.getApply(missionVO);
		testVO.setMissionNum(missionVO.getMissionNum());
		reviewVO.setMissionNum(testVO.getMissionNum());
		
		log.info("reviewVO{}" + reviewVO);
		log.info("testVO{}" + testVO);

		if (reviewVO.getNickName().equals(testVO.getNickName())) {
			try {
				if (reviewVO.getReviewLength() >= 50) {
					// 쿠팡닉네임등록
					int result = missionService.setNicC(reviewVO);
					if(result==1) {
						// status 1->2
						result = missionService.setMiStatus2(reviewVO);
						return result;
					}
				} else {
					return 2;
				}
			} catch (Exception e) {
				return 2;
			}
		}
		return 0;
	}

	@PostMapping("getReviewNaver")
	@ResponseBody
	public int getReviewNaver(HttpSession session, TestVO testVO, MissionVO missionVO) throws Exception {

		ReviewVO reviewVO = new ReviewVO();
		reviewVO = reviewService.getReviewNaver(testVO);

		// ID
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setId(memberVO.getId());
		reviewVO.setId(memberVO.getId());

		// 미션번호
		missionVO = missionService.getApply(missionVO);
		reviewVO.setMissionNum(missionVO.getMissionNum());
		
		//닉네임
		reviewVO.setNickName_N(testVO.getNickName());
		
		log.info("===============Controller===============");
		log.info("리뷰내용) {}", reviewVO.getReview());
		log.info("리뷰글자수) {}", reviewVO.getReviewLength());
		log.info("reviewVO) {}", reviewVO);
		log.info("testVO) {}", testVO);

		try {
			if (reviewVO.getNickName() != "") {
				if (reviewVO.getReviewLength() >= 50) {
					// 네이버아이디등록
					int result = missionService.setNicN(reviewVO);
					if(result==1) {
						// status 1->2
						result = missionService.setMiStatus2(reviewVO);
						return result;
					}
				} else {
					return 2;
				}
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

}
