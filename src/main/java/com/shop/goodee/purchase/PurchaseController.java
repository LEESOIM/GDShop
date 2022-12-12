package com.shop.goodee.purchase;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.mission.MissionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private MissionService missionService;

	@GetMapping("purchase")
	public void purchase() throws Exception {

	}

	@PostMapping("setPurchase")
	@ResponseBody
	public PurchaseVO setPurchase(HttpSession session, MemberVO memberVO, MultipartFile f, PurchaseVO purchaseVO)
			throws Exception {

		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		memberVO = (MemberVO) authentication.getPrincipal();
		purchaseVO.setId(memberVO.getId());

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

		//닉네임 등록
		if (finalPurchaseVO.getPurNum().equals(purchaseVO.getPurNumM())) {
			if (purchaseVO.getNickname() == null) {
				int result = missionService.setNicN(purchaseVO);
			} else {
				int result = missionService.setNicC(purchaseVO);
			}
			return purchaseVO;
		} else {
			log.info("OCR 인식 실패");
			return null;
		}
	}
}
