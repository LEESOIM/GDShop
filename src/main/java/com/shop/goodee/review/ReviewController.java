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
//솔직냥집사//	https://www.coupang.com/vp/products/6069827772?vendorItemId=82651418206&sourceType=HOME_TRENDING_ADS&searchId=feed-80ded603807b463cbbea976ec8a8c493-trending_ads-69184&clickEventId=e40dc083-2251-45ef-8e41-77b490b4ae32&isAddedCart=
//까꿍까꿍e//	https://www.coupang.com/vp/products/6195520414?vendorItemId=79530657314&sourceType=HOME_PERSONALIZED_ADS&searchId=feed-59b450cb58714c4183ed4ea35bbfd230-personalized_ads&clickEventId=5be15d2b-dc9a-4f54-9f3a-7b7e042bf624&isAddedCart=
//냉월//		https://www.coupang.com/vp/products/12293897?vendorItemId=3718447127&sourceType=MyCoupang_my_orders_list_product_title&isAddedCart=
		
		log.info("=========Controller========");
		log.info("닉네임)"+finalReviewVO.getNickName());
		log.info("상품명)"+finalReviewVO.getTitle());
		log.info("날짜)"+finalReviewVO.getDate());
		log.info("세부상품명)"+finalReviewVO.getTitleDetail());
		log.info("리뷰)"+finalReviewVO.getReview());
		log.info("리뷰글자수)"+finalReviewVO.getReviewLength());

		return finalReviewVO;
	}
	
	@PostMapping("getReviewNaver")
	@ResponseBody
	public ReviewVO getReviewNaver(ReviewVO reviewVO) throws Exception{
		
		reviewVO = reviewService.getReviewNaver(reviewVO);
		log.info("===============Controller===============");
		log.info("리뷰내용) {}",reviewVO.getReview());
		log.info("리뷰글자수) {}",reviewVO.getReviewLength());
		
		return reviewVO;
//junsolhee7//	https://smartstore.naver.com/onfitcompany/products/6995256658?NaPm=ct%3Dlauoe07v%7Cci%3Dcheckout%7Ctr%3Dmyv%7Ctrx%3D%7Chk%3De1b4df713e31651ce6097709a9f2943664548276
//junsolhee7//	https://smartstore.naver.com/donggangmc/products/7211535216?NaPm=ct%3Dlavsqta1%7Cci%3Dcheckout%7Ctr%3Dppc%7Ctrx%3D%7Chk%3D93a6598c34bdb010e4c3fa2fcb2a7150ab9b7060
//mystqwerasd//	https://shopping.naver.com/window-products/necessity/5670007615?NaPm=ct%3Dlavxb9d7%7Cci%3Dshoppingwindow%7Ctr%3Dnct%7Chk%3D274c80640562ebb58fa234171dc51d78437fe888%7Ctrx%3D&tr=nct		
	}
	
}
