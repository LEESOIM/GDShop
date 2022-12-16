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
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemVO;
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
	public ModelAndView getReview(HttpSession session, MemberVO memberVO, TestVO testVO, MissionVO missionVO) throws Exception {
		ReviewVO finalReviewVO = reviewService.getReview(testVO);

		log.info("=========Controller========");
		log.info("닉네임)" + finalReviewVO.getNickName());
		log.info("상품명)" + finalReviewVO.getTitle());
		log.info("날짜)" + finalReviewVO.getDate());
		log.info("세부상품명)" + finalReviewVO.getTitleDetail());
		log.info("리뷰)" + finalReviewVO.getReview());
		log.info("리뷰글자수)" + finalReviewVO.getReviewLength());

		ModelAndView mv = new ModelAndView();
		ReviewVO reviewVO = new ReviewVO();
		
		if(finalReviewVO.getReviewLength() >= 50) {
			//닉네임등록
			SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			Authentication authentication = context.getAuthentication();
			memberVO = (MemberVO) authentication.getPrincipal();
			reviewVO.setId(memberVO.getId());
			reviewVO.setNickName(testVO.getNickName());
			missionService.setNicC(reviewVO);	
			
			// status 1->2
//			int result = missionService.setMiStatus2(reviewVO); 
		}
			
			
			mv.setViewName("redirect:/item/detail?itemNum=" + missionVO.getItemNum());
			return mv;
			
	}

	@PostMapping("getReviewNaver")
	@ResponseBody
	public ReviewVO getReviewNaver(ReviewVO reviewVO) throws Exception {

		reviewVO = reviewService.getReviewNaver(reviewVO);
		log.info("===============Controller===============");
		log.info("리뷰내용) {}", reviewVO.getReview());
		log.info("리뷰글자수) {}", reviewVO.getReviewLength());

		return reviewVO;
	}

}
