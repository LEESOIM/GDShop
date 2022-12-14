package com.shop.goodee.mission;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberSecurityService;
import com.shop.goodee.member.MemberService;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.purchase.PurchaseService;
import com.shop.goodee.purchase.PurchaseVO;
import com.shop.goodee.sns.SnsService;
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
	private PurchaseService purchaseService;
	
	
	//OCR
	@PostMapping("ocr")
	public ModelAndView setPurchase(HttpSession session, ItemVO itemVO, MemberVO memberVO, MultipartFile f, PurchaseVO purchaseVO) throws Exception {
		//ID
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		memberVO = (MemberVO) authentication.getPrincipal();
		purchaseVO.setId(memberVO.getId());

		//구매사진
		PurchaseVO finalPurchaseVO = purchaseService.getPurchase(f);
		purchaseVO.setPurDate(finalPurchaseVO.getPurDate());
		purchaseVO.setPurNum(finalPurchaseVO.getPurNum());
		purchaseVO.setPrice(finalPurchaseVO.getPrice());

		log.info("=========Controller==========");
		log.info("주문일){}", finalPurchaseVO.getPurDate());
		log.info("주문번호){}", finalPurchaseVO.getPurNum());
		log.info("가격){}", finalPurchaseVO.getPrice());
		log.info("M주문번호){}", purchaseVO.getPurNumM());
		log.info("M가격){}", purchaseVO.getPriceM());
		log.info("=============================");

		ModelAndView mv = new ModelAndView();
		if (finalPurchaseVO.getPurNum().equals(purchaseVO.getPurNumM()) && finalPurchaseVO.getPrice().equals(purchaseVO.getPrice())) {
			if (purchaseVO.getNickname() == null) { //닉네임 등록
				missionService.setNicN(purchaseVO);
			} else {
				missionService.setNicC(purchaseVO);
			}
			int result = missionService.setMiStatus1(purchaseVO); //status 0->1
		}
		
		mv.setViewName("redirect:/item/detail?itemNum="+itemVO.getItemNum());
		return mv;
	}
	

	
	
	// 모집률
	@PostMapping("rate")
	@ResponseBody
	public int getApplyRate(MissionVO missionVO) throws Exception {
		return missionService.getApplyRate(missionVO);
	}
	

	// 지원하기
	@PostMapping("apply")
	@ResponseBody
	public int setApply(HttpSession session, MissionVO missionVO, ItemVO itemVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setId(memberVO.getId());

		// 상품테이블에 있는 값을 미션테이블로 담기
		// missionVO.setItemNum(itemVO.getItemNum());
		// missionVO.setApplyCount(itemVO.getCount());
		itemVO = itemService.getDetail(itemVO);

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
