package com.shop.goodee.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.sse.NotificationService;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/seller/*")
public class SellerController {
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("seller")
	public void getSeller() throws Exception{
	}
	

	@PostMapping("seller")
	public String setSeller(@RequestBody SellerVO sellerVO) throws Exception{
		log.info("=================Controller================");
		log.info("=================SellerVO================");
		log.info("ID){}",sellerVO.getId());
		log.info("roleNum){}",sellerVO.getRoleNum());
		log.info("기업명){}",sellerVO.getCompany());
		log.info("=================MemberVO================");
		log.info("이름){}",sellerVO.getName());
		log.info("이메일){}",sellerVO.getEmail());
		log.info("전화번호){}",sellerVO.getPhone());
		log.info("=============== SELLER COntroler");
		notificationService.notifyApplyEvent(sellerVO.getId());
		sellerService.setSellerAdd(sellerVO);
		return "seller/sellerList";
	}
			
	@GetMapping("wait")
	public ModelAndView getWaitList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getWaitList(); 
		
		mv.addObject("vo", ar);
		mv.setViewName("/seller/wait");
		return mv;
	}
	
	@PostMapping("wait")
	@ResponseBody
	public int setWait(@RequestBody SellerVO sellerVO) throws Exception{
		
		int result = sellerService.setWait(sellerVO); 
		return result;
	}
	
	@PostMapping("waitNo")
	@ResponseBody
	public int setWaitNo(@RequestBody SellerVO sellerVO) throws Exception{
		log.info("====================================");
		log.info("==============================={}",sellerVO.getId());
		int result = sellerService.setWaitNo(sellerVO); 
		return result;
	}
	
	@GetMapping("accept")
	public ModelAndView getAcceptList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getAcceptList(); 
		
		mv.addObject("vo", ar);
		mv.setViewName("/seller/accept");
		return mv;
	}
	@PostMapping("accept")
	@ResponseBody
	public int setAccept(@RequestBody SellerVO sellerVO) throws Exception{
		
		int result = sellerService.setAccept(sellerVO); 
		return result;
	}
	@PostMapping("acceptNo")
	@ResponseBody
	public int setAcceptNo(SellerVO sellerVO) throws Exception{
		log.info("=================={}",sellerVO.getId());
		int result = sellerService.setAcceptNo(sellerVO); 
		return result;
	}
	
	@GetMapping("pay")
	public ModelAndView getPayList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<SellerVO> ar = sellerService.getPayList(); 
		
		mv.addObject("vo", ar);
		mv.setViewName("/seller/pay");
		return mv;
	}
	@PostMapping("payNo")
	@ResponseBody
	public int setPayNo(SellerVO sellerVO) throws Exception{
		log.info("=================={}",sellerVO.getId());
		int result = sellerService.setPayNo(sellerVO); 
		return result;
	}
	
}
