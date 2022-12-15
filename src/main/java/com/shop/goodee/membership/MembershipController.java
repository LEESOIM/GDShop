package com.shop.goodee.membership;

import java.io.Console;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.pay.PayService;
import com.shop.goodee.pay.PayVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/membership/*")
@Slf4j
public class MembershipController {
	
	@Autowired
	private PayService payService;
	
	
	@GetMapping("alreadyPayCheck")
	@ResponseBody
	public boolean alreadyPayCheck(PayVO payVO)throws Exception{
		payVO = payService.aleadyPayCheck(payVO);
		log.info("=============== payVO -> {}",payVO);
		if(payVO==null) {
			return true;
		}else {
			
			String nowfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date now = new Date(dateFormat.parse(nowfm).getTime());
			
			int compare = payVO.getCancelDate().compareTo(now);
			
			if(compare>0) {
				return false;
			}else {
				return true;
			}
		}
	}
	
	
	@PostMapping("successPay")
	@ResponseBody
	public int successPayVIP(PayVO payVO)throws Exception{
		log.info("==================================");
		log.info("payVO => {}",payVO);
		int result = 0;
		int setPayResult = payService.setPay(payVO);
		int setVipResult = payService.setVIP(payVO);
		if(setPayResult==1 && setVipResult==1) {
			result =1;
		}
		return result;
	}
	
	
	@GetMapping("membership")
	public void getMembership() {
		
	}
}
