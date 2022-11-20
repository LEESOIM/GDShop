package com.shop.goodee.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("test")
	@ResponseBody
	public void test() throws Exception{
//		CrawService bot1 = new CrawService();
//		bot1.activateBot();
	}
	
	@GetMapping("review")
	public void craw() throws Exception{
		
	}
	
	@PostMapping("getReview")
	@ResponseBody
	public ReviewVO getReview(TestVO testVO) throws Exception{		
		ReviewVO finalReviewVO = reviewService.getReview(testVO); 
//레깅스//		https://www.coupang.com/vp/products/6069827772?vendorItemId=82651418206&sourceType=HOME_TRENDING_ADS&searchId=feed-80ded603807b463cbbea976ec8a8c493-trending_ads-69184&clickEventId=e40dc083-2251-45ef-8e41-77b490b4ae32&isAddedCart=
//오리털바지//		https://www.coupang.com/vp/products/6195520414?vendorItemId=79530657314&sourceType=HOME_PERSONALIZED_ADS&searchId=feed-59b450cb58714c4183ed4ea35bbfd230-personalized_ads&clickEventId=5be15d2b-dc9a-4f54-9f3a-7b7e042bf624&isAddedCart=
//원모어이어폰//	https://www.coupang.com/vp/products/12293897?vendorItemId=3718447127&sourceType=MyCoupang_my_orders_list_product_title&isAddedCart=
		
		log.info("=========Controller========");
		log.info("닉네임)"+finalReviewVO.getNickName());
		log.info("상품명)"+finalReviewVO.getTitle());
		log.info("날짜)"+finalReviewVO.getDate());
		log.info("세부상품명)"+finalReviewVO.getTitleDetail());
		log.info("리뷰)"+finalReviewVO.getReview());
		log.info("리뷰글자수)"+finalReviewVO.getReviewLength());

		return finalReviewVO;
	}
	
	@PostMapping("instaCraw")
	@ResponseBody
	public void instaTest(InstaTestVO instaTestVO) throws Exception{
		ReviewService bot2 = new ReviewService();
		instaTestVO.setUrl("https://www.instagram.com/");
		bot2.activateBot(instaTestVO);
	}
	
}
