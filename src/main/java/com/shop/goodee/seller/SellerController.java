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

import com.shop.goodee.member.MailService;
import com.shop.goodee.member.MemberMapper;
import com.shop.goodee.member.MemberService;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.sns.SnsService;
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
	@Autowired
	private SnsService snsService;
	@Autowired
	private MailService mailService;
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("seller")
	public void getSeller() throws Exception{
	}
	

	@PostMapping("seller")
	@ResponseBody
	public int setSeller(@RequestBody SellerVO sellerVO) throws Exception{
		log.info("ID){}",sellerVO.getId());
		log.info("이름){}",sellerVO.getName());
		log.info("이메일){}",sellerVO.getEmail());
		log.info("전화번호){}",sellerVO.getPhone());
		log.info("기업명){}",sellerVO.getCompany());
		log.info("1250");
		notificationService.notifyApplyEvent(sellerVO.getId());
		int result = sellerService.setSellerAdd(sellerVO);
		return result;
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
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(sellerVO.getId());
		memberVO = memberService.getMypage(memberVO);
		mailService.sendSellerMail(memberVO);
		
		String id= sellerVO.getId();
		String text = id + "님의 입점신청이 승인되었습니다!!";
		
		MemberVO phone = sellerService.getAcceptPhone(sellerVO);
		
		snsService.goMessage(phone,text);
		
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
	
	@GetMapping("account")
	public void getAccount()throws Exception{
		
	}
	
}
