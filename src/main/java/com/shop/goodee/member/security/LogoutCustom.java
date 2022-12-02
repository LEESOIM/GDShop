package com.shop.goodee.member.security;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LogoutCustom implements LogoutHandler {
   
   @Override
   public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {

      log.info("========== LogoutHandler ===========");
      MemberVO memberVO = new MemberVO();
      if(authentication.getPrincipal() != null) {
         memberVO =(MemberVO)authentication.getPrincipal();         
      }
      
      String social = memberVO.getSocial();
      if(social != null && social.equals("kakao")) {
         request.getSession().invalidate();
      }else if(social !=null && social.equals("google")) {
         request.getSession().invalidate();
         
      }else {
         request.getSession().invalidate();
      }
      request.getSession().invalidate();
      
   }

}