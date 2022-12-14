package com.shop.goodee.member;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.mission.MissionVO;
import com.shop.goodee.pay.PayVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member/*")
@Slf4j
public class MemberController {
	
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private MemberSecurityService memberSecurityService;
   
   @Autowired
   private MailService mailService;
   
   @Autowired
   @Qualifier("en")
   private PasswordEncoder passwordEncoder;
   
   @GetMapping("logoutResult")
   public String socialLogout()throws Exception{
      
      return "redirect:../";
   }
   
   @GetMapping("ServiceLogin")
   public String googleLogout()throws Exception{
      
      return "redirect:../";
   }
   
   
   @GetMapping("delete")
   public ModelAndView setDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session, String pw)throws Exception{
      //1. Social, ?????? ??????
      ModelAndView mv = new ModelAndView();
      SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO memberVO  =(MemberVO)authentication.getPrincipal();
         
      int result= memberService.setDelete(memberVO);
      
      
      if(result>0) {
         session.invalidate();
         Cookie [] cookies = request.getCookies();
         for(Cookie cookie:cookies) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
         }
         
         mv.setViewName("redirect:/");
      }else {
         //?????? ?????? 
      }   
      
      return mv;
   }
   
   //????????? ??????
   @GetMapping("find_id")
   public void getFindId()throws Exception {
      
   }
   @PostMapping("find_id")
   @ResponseBody
   public String getFindId(MemberVO memberVO)throws Exception {
      String id = memberService.getFindId(memberVO);
      
      return id;
   }
   //?????? ??????
   @GetMapping("find_pw")
   public void getFindPw()throws Exception {
      
   }
   @PostMapping("find_pw")
   @ResponseBody
   public String getFindPw(MemberVO memberVO)throws Exception{
      String email = memberService.getFindPw(memberVO);
      if(email != null) {
         mailService.sendMail(memberVO);         
      }
      return email;
   }

   /* ???????????? */
   @GetMapping("agree")
   public void getAgree() {

   }
   // ????????? ?????? ??????
   @GetMapping("idCheck")
   public int getIdCheck(MemberVO memberVO)throws Exception{
      return memberService.getIdCheck(memberVO);
   }
   
   /* ???????????? */
   @GetMapping("join")
   public void getJoin(@ModelAttribute MemberVO memberVO) {
      
   }
   @PostMapping("join")
   public ModelAndView setJoin(@Valid MemberVO memberVO, BindingResult bindingResult, ModelAndView mv, String yy, String mm, String dd, String e, String mailOption)throws Exception {
      
      //????????? ?????? ?????????(id?????? ??????, ????????? ?????? ??????, ?????? ?????? ??????, ???????????? ?????? ??????)
      boolean check = memberService.getMemberError(memberVO, bindingResult);
//      check : true??? ?????? ?????? ??????!
      if(check) {
         mv.setViewName("member/join");
         List<FieldError> errors = bindingResult.getFieldErrors();
         
         for(FieldError fieldError:errors) {
            mv.addObject(fieldError.getField(), fieldError.getDefaultMessage());
         }
         return mv;
      }
      
      int result = memberService.setJoin(memberVO, yy, mm, dd, e, mailOption);
      
      //????????????(?????? ?????? ??????) ?????? ??? ???????????? ?????? ?????????, ?????? ??? ???????????? ?????????
      if(result == 1) {
         mv.setViewName("redirect:../member/join_end");
         return mv;
      }else {
         mv.setViewName("redirect:../member/join");
         return mv;
      }
      
   }
   
   
   /* ???????????? ?????? */
   @GetMapping("join_end")
   public void getJoinEnd() {
      
   }
   
   //?????????(??????)
//   @PostMapping("login")
//   @ResponseBody
//   public int getLogin(MemberVO memberVO,HttpSession session)throws Exception{
//      memberVO = memberService.getLogin(memberVO);
//      int result = 0;
//      if(memberVO != null) {
//         session.setAttribute("member", memberVO);
//         result = 1;
//      }
//      
//      return result;
//   }
   
   
   
   //?????????(????????????)
   @PostMapping("login")
   @ResponseBody
   public String getLogin(MemberVO memberVO)throws Exception{
      memberSecurityService.loadUserByUsername(memberVO.getId());
      return "/";
   }
   
   /* ??????????????? */
   @GetMapping("mypage")
   public ModelAndView getMypage(HttpSession session,MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
      memberVO.setPhone(memberVO.phone_format(memberVO.getPhone()));
      MissionVO missionVO = new MissionVO();
      missionVO.setId(memberVO.getId());
      int count0 = memberService.getMissionCount0(missionVO);
      int count1 = memberService.getMissionCount1(missionVO);
      int count2 = memberService.getMissionCount2(missionVO);
      
      mv.addObject("memberVO", memberVO);
      mv.addObject("count0", count0);
      mv.addObject("count1", count1);
      mv.addObject("count2", count2);
      mv.setViewName("/member/mypage");
      return mv;   
   }
   
   /* ??????????????? - ??? ?????? ????????? ?????? */
   @PostMapping("nickUpdate")
   @ResponseBody
   public int getMypage(HttpSession session,MemberVO memberVO)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      memberVO.setId(sessionMemberVO.getId());
      int result = 0;
      if(memberVO.getNickName()!= null) {
         result = memberService.setNickName(memberVO);
      }else {
         result = memberService.setNickName_N(memberVO);
      }
      return result;   
   }
   
   
   /* ??????????????? - ????????? ?????? */
   @GetMapping("profile")
   public ModelAndView setProfile(HttpSession session,MemberVO memberVO, ModelAndView mv)throws Exception {
      
      //security??? ?????? id,pw????????? memberVO??? ??????.
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      if(memberVO == null) {
         mv.setViewName("redirect:/");
      }else {
         //id????????? ?????? ?????? ??? ??????
         MemberFileVO memberFileVO = new MemberFileVO();
         memberFileVO.setId(memberVO.getId());
         memberFileVO = memberService.getProfile(memberFileVO);
         mv.addObject("memberFileVO", memberFileVO);
         
         //?????? ?????? ????????? ??????
         memberVO = memberService.getMypage(memberVO);
         mv.addObject("memberVO", memberVO);
         mv.setViewName("/member/profile");         
      }
      
      return mv;
   }
   
   @PostMapping("profile")
   public ModelAndView setProfile(HttpSession session, MemberVO memberVO, @RequestParam("file")MultipartFile multipartFile, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      MemberFileVO memberFileVO = memberService.setProfile(memberVO, multipartFile);
      
      mv.setViewName("redirect:/member/profile");
      mv.addObject("memberFileVO", memberFileVO);

      return mv;
   }
   
   // ??????????????? ??????????????? ????????? default???????????? update???.
   @PostMapping("profile_delete")
   @ResponseBody
   public String setProfileDelete(MemberVO memberVO, ModelAndView mv)throws Exception {
      MemberFileVO memberFileVO = new MemberFileVO();
      memberFileVO.setFileName("user.webp");
      memberFileVO.setOriName("user.webp");
      memberFileVO.setId(memberVO.getId());
      
      int result = memberService.setProfileUpdate(memberFileVO);
      if(result == 1) {
         return "user.webp";
      }else {
         return "???????????? ??????";
      }

   }
   
   /* ???????????? */
   @GetMapping("point")
   public ModelAndView getPoint(HttpSession session, MemberVO memberVO, ModelAndView mv, String order)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      memberVO.setId(sessionMemberVO.getId());
      memberVO = memberService.getMypage(memberVO);
      memberVO.setOrder(order);
      //????????? ??????
      List<PointVO> ar = memberService.getPointList(sessionMemberVO);
      int count = memberService.getMissionNum(memberVO);
      mv.addObject("count", count);
      mv.addObject("pointList", ar);
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/point");
      return mv;
   }
   
   /* ???????????? ????????? ?????? */
   @PostMapping("getPoint")
   @ResponseBody
   public int getPoint(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      return memberService.getPoint(memberVO);
   }
   
   /* 3??? ??? ?????? ??? ?????? ????????? ?????? */
   @PostMapping("getPoint_3")
   @ResponseBody
   public int getPoint_3(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      return memberService.getPoint_3(memberVO);
   }
   
   /* ???????????? ??? ?????? ????????? ?????? */
   @PostMapping("setResultPoint_3")
   @ResponseBody
   public int setResultPoint_3(HttpSession session, MemberVO memberVO, Long point)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO.setPoint_3(point);
      return memberService.setResultPoint_3(memberVO);
   }
   
   /* ???????????? ??? ?????? ?????? ????????? ?????? */
   @PostMapping("setResultPoint")
   @ResponseBody
   public Long setResultPoint(HttpSession session, MemberVO memberVO, Long point)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      memberVO.setId(sessionMemberVO.getId());
      memberVO = memberService.getMypage(memberVO);
      Long point_result = memberVO.getPoint_result();
      memberVO.setPoint_result(point);
      memberService.setResultPoint(memberVO);
      Long result= point_result+point;
      return result;
   }
   
   
   /* ????????? */
   @GetMapping("grade")
   public ModelAndView getGrade(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/grade");
      return mv;
   }
   
   /* ??? ?????? - ???????????? */
   @GetMapping("set")
   public ModelAndView getSet(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/set");
      return mv;
   }
   
   /* ??? ?????? - ???????????? */
   @PostMapping("pwCheck")
   @ResponseBody
   public int getPwCheck(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      String pw = memberVO.getPw();
      memberVO.setId(sessionMemberVO.getId());
      memberVO.setPw(memberVO.getPw());
      return memberService.getPwCheck(memberVO, sessionMemberVO);
   }
   /* ??? ?????? - ??? ?????? ??????*/
   @GetMapping("set_up")
   public ModelAndView getSetUp(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();   

      memberVO = memberService.getMypage(memberVO);
      memberVO.setPhone(memberVO.getPhone());
      memberVO.setPhone(memberVO.phone_format(memberVO.getPhone()));
      
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/set_up");
      
      return mv;
   }
   
   /* ??? ?????? - ????????? ?????? */
   @PostMapping("changeEmail")
   @ResponseBody
   public int setChangeEmail(MemberVO memberVO, HttpSession session, String e, String mailOption)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();

      memberVO.setId(sessionMemberVO.getId());
      memberVO.setEmail(memberVO.getEmail());
      
      int result = memberService.setChangeEmail(memberVO, e, mailOption);
      
      return result;
   }
   
   /* ??? ?????? - ???????????? ?????? */
   @PostMapping("changePhone")
   @ResponseBody
   public int setChangePhone(MemberVO memberVO, HttpSession session)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      
      memberVO.setId(sessionMemberVO.getId());
      int result = memberService.setChangePhone(memberVO);
      
      return result;
   }
   
   /* ??? ?????? - ???????????? ??????*/
   @GetMapping("set_pw")
   public ModelAndView getSetPw(MemberVO memberVO, HttpSession session, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
      
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/set_pw");
      
      return mv;
   }
   @PostMapping("changePw")
   @ResponseBody
   public int setChangePw(MemberVO memberVO, HttpSession session)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();
      
      memberVO.setId(sessionMemberVO.getId());
      
      int result = memberService.setChangePw(memberVO, sessionMemberVO);
      
      return result;
   }
   
   
   /* ??? ?????? - ?????? ??????*/
   @GetMapping("withdrawal")
   public ModelAndView getWithdrawal(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      memberVO = memberService.getMypage(memberVO);
      
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/withdrawal");

      return mv;
   }
   
   /* ?????? ?????? */
   @PostMapping("withdrawal")
   @ResponseBody
   public int setWithdrawal(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      return memberService.setWithdrawal(memberVO);
   }
   
   /* ??? ?????? */
   @GetMapping("product")
   public ModelAndView getProduct(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      List<ItemVO> ar = memberService.getSellerProduct(memberVO);
      memberVO = memberService.getMypage(memberVO);
      mv.addObject("ar", ar);
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/product");
      return mv;
   }
   
   /* ????????? - VIP?????? ?????? */
   @PostMapping("VIP")
   @ResponseBody
   public int getVIP(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      int result = memberService.getVIP(memberVO);
      return result;
   }
   
   /* ????????? - VIP?????? ????????? ?????? */
   @PostMapping("VIP_list")
   @ResponseBody
   public ModelAndView getVIPlist(MemberVO memberVO, ModelAndView mv)throws Exception{
      memberVO = memberService.getVIPlist(memberVO);
      mv.setViewName("/member/VIP");
      return mv;
   }
   
   /* ????????? - VIP?????? ????????? ?????? */
   @PostMapping("member_list")
   @ResponseBody
   public ModelAndView getVIPlist(MemberVO memberVO)throws Exception{
      ModelAndView mv = new ModelAndView();
      memberVO = memberService.getVIPlist(memberVO);
      mv.setViewName("/member/user_grade");
      return mv;
   }
   
   /* ????????? ?????????,????????? */
   @PostMapping("membershipPay")
   @ResponseBody
   public Map<String, Date> getMembershipPay(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception{
	   SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
       Authentication authentication = context.getAuthentication();
       memberVO = (MemberVO) authentication.getPrincipal();
       PayVO payVO = new PayVO();
       payVO.setId(memberVO.getId());
       payVO = memberService.getMembershipPay(payVO);
       Date date = payVO.getPayDate();
       Date endDate = payVO.getCancelDate();
       Map<String, Date> ar = new HashMap<>();
       ar.put("start", date);
       ar.put("end", endDate);
	   return ar;
   }

}