package com.shop.goodee.member;

import java.util.List;

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
      //1. Social, 일반 구분
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
         //탙퇴 실패 
      }   
      
      return mv;
   }
   
   //아이디 찾기
   @GetMapping("find_id")
   public void getFindId()throws Exception {
      
   }
   @PostMapping("find_id")
   @ResponseBody
   public String getFindId(MemberVO memberVO)throws Exception {
      String id = memberService.getFindId(memberVO);
      
      return id;
   }
   //비번 찾기
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

   /* 약관동의 */
   @GetMapping("agree")
   public void getAgree() {

   }
   // 아이디 중복 확인
   @GetMapping("idCheck")
   public int getIdCheck(MemberVO memberVO)throws Exception{
      return memberService.getIdCheck(memberVO);
   }
   
   /* 회원가입 */
   @GetMapping("join")
   public void getJoin(@ModelAttribute MemberVO memberVO) {
      
   }
   @PostMapping("join")
   public ModelAndView setJoin(@Valid MemberVO memberVO, BindingResult bindingResult, ModelAndView mv, String yy, String mm, String dd, String e, String mailOption)throws Exception {
      
      //사용자 검증 메서드(id중복 체크, 이메일 입력 체크, 비번 일치 검증, 휴대번호 입력 검증)
      boolean check = memberService.getMemberError(memberVO, bindingResult);
//      check : true일 경우 검증 실패!
      if(check) {
         mv.setViewName("member/join");
         List<FieldError> errors = bindingResult.getFieldErrors();
         
         for(FieldError fieldError:errors) {
            mv.addObject(fieldError.getField(), fieldError.getDefaultMessage());
         }
         return mv;
      }
      
      int result = memberService.setJoin(memberVO, yy, mm, dd, e, mailOption);
      
      //회원가입(등급 생성 포함) 성공 시 회원가입 성공 페이지, 실패 시 회원가입 페이지
      if(result == 1) {
         mv.setViewName("redirect:../member/join_end");
         return mv;
      }else {
         mv.setViewName("redirect:../member/join");
         return mv;
      }
      
   }
   
   
   /* 회원가입 완료 */
   @GetMapping("join_end")
   public void getJoinEnd() {
      
   }
   
   //로그인(세션)
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
   
   
   
   //로그인(시큐리티)
   @PostMapping("login")
   @ResponseBody
   public String getLogin(MemberVO memberVO)throws Exception{
      memberSecurityService.loadUserByUsername(memberVO.getId());
      return "/";
   }
   
   /* 마이페이지 */
   @GetMapping("mypage")
   public ModelAndView getMypage(HttpSession session,MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
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
   
   /* 마이페이지 - 내 계정 닉네임 변경 */
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
   
   
   /* 마이페이지 - 프로필 수정 */
   @GetMapping("profile")
   public ModelAndView setProfile(HttpSession session,MemberVO memberVO, ModelAndView mv)throws Exception {
      
      //security에 담긴 id,pw정보를 memberVO에 담음.
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      if(memberVO == null) {
         mv.setViewName("redirect:/");
      }else {
         //id값으로 파일 조회 후 전송
         MemberFileVO memberFileVO = new MemberFileVO();
         memberFileVO.setId(memberVO.getId());
         memberFileVO = memberService.getProfile(memberFileVO);
         mv.addObject("memberFileVO", memberFileVO);
         
         //회원 정보 담아서 전송
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
   
   // 프로필사진 삭제버튼을 누르면 default이미지로 update함.
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
         return "업데이트 실패";
      }

   }
   
   /* 내포인트 */
   @GetMapping("point")
   public ModelAndView getPoint(HttpSession session, MemberVO memberVO, ModelAndView mv, String order)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO = memberService.getMypage(memberVO);
      memberVO.setOrder(order);
      //포인트 변화
      List<PointVO> ar = memberService.getPointList(memberVO);
      int count = memberService.getMissionNum(memberVO);
      mv.addObject("count", count);
      mv.addObject("pointList", ar);
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/point");
      return mv;
   }
   
   /* 적립예정 포인트 조회 */
   @PostMapping("getPoint")
   @ResponseBody
   public int getPoint(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      return memberService.getPoint(memberVO);
   }
   
   /* 3일 뒤 적립 된 회원 포인트 조회 */
   @PostMapping("getPoint_3")
   @ResponseBody
   public int getPoint_3(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      return memberService.getPoint_3(memberVO);
   }
   
   /* 출금신청 후 적립 포인트 변경 */
   @PostMapping("setResultPoint_3")
   @ResponseBody
   public int setResultPoint_3(HttpSession session, MemberVO memberVO, Long point)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      memberVO.setPoint_3(point);
      return memberService.setResultPoint_3(memberVO);
   }
   
   /* 출금신청 후 출금 예정 포인트 변경 */
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
   
   
   /* 내등급 */
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
   
   /* 내 설정 - 본인확인 */
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
   
   /* 내 설정 - 본인확인 */
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
   /* 내 설정 - 내 정보 변경*/
   @GetMapping("set_up")
   public ModelAndView getSetUp(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();   

      memberVO = memberService.getMypage(memberVO);
      memberVO.setPhone(memberVO.getPhone());
      
      mv.addObject("memberVO", memberVO);
      mv.setViewName("/member/set_up");
      
      return mv;
   }
   
   /* 내 설정 - 이메일 변경 */
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
   
   /* 내 설정 - 전화번호 변경 */
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
   
   /* 내 설정 - 비밀번호 변경*/
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
   
   
   /* 내 설정 - 회원 탈퇴*/
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
   
   /* 회원 탈퇴 */
   @PostMapping("withdrawal")
   @ResponseBody
   public int setWithdrawal(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      return memberService.setWithdrawal(memberVO);
   }
   
   /* 내 상품 */
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
   
   /* 내등급 - VIP회원 확인 */
   @PostMapping("VIP")
   @ResponseBody
   public int getVIP(HttpSession session, MemberVO memberVO)throws Exception{
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      memberVO = (MemberVO) authentication.getPrincipal();
      
      int result = memberService.getVIP(memberVO);
      return result;
   }
   
   /* 내등급 - VIP회원 페이지 출력 */
   @PostMapping("VIP_list")
   @ResponseBody
   public ModelAndView getVIPlist(MemberVO memberVO, ModelAndView mv)throws Exception{
      memberVO = memberService.getVIPlist(memberVO);
      mv.setViewName("/member/VIP");
      return mv;
   }
   
   /* 내등급 - VIP회원 페이지 출력 */
   @PostMapping("member_list")
   @ResponseBody
   public ModelAndView getVIPlist(MemberVO memberVO)throws Exception{
      ModelAndView mv = new ModelAndView();
      memberVO = memberService.getVIPlist(memberVO);
      mv.setViewName("/member/user_grade");
      return mv;
   }

}