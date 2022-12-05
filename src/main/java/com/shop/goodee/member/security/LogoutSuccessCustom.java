package com.shop.goodee.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LogoutSuccessCustom implements LogoutSuccessHandler{
   
   @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
   private String clientId;
   
   @Value("${spring.security.oauth2.client.registration.google.client-id}")
   private String googleId;
   
   @Value("${spring.security.oauth2.client.registration.naver.client-id}")
   private String naverId;
   
   @Value("${spring.security.oauth2.client.registration.naver.client-secret}")
   private String naverSecret;
   
   @Value("${spring.security.oauth2.client.provider.naver.token-uri}")
   private String naverToken;
   
   @Override
   public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
         throws IOException, ServletException {
      
      MemberVO memberVO =(MemberVO)authentication.getPrincipal(); //memberVO
      String social = memberVO.getSocial();
      if(social != null) {
         if(social.equals("kakao")) {
            
            StringBuffer sb = new StringBuffer();
            sb.append("https://kauth.kakao.com/oauth/logout?");
            sb.append("client_id=");
            sb.append(clientId);
            sb.append("&logout_redirect_uri=http://localhost:81/member/logoutResult");
            
            response.sendRedirect(sb.toString());

            
         }else if(social.equals("google")) {
//            StringBuffer sb = new StringBuffer();
//            sb.append("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:81");
//            response.sendRedirect(sb.toString());
            log.info("=== logout 성공시에만 실행 ===");
            response.sendRedirect("/");
            
         }else {
//            StringBuffer sb = new StringBuffer();
//            sb.append("https://nid.naver.com/oauth2.0/token?grant_type=delete");
//            sb.append("&client_id=");
//            sb.append(naverId);
//            sb.append("&client_secret=");
//            sb.append(naverSecret);
//            sb.append("&access_token=");
//            sb.append(memberVO.getToken());
//            sb.append("&service_provider=NAVER");
//            sb.append("&logout_redirect_uri=http://localhost:81/member/logoutResult");
//            response.sendRedirect(sb.toString());
            log.info("=== logout 성공시에만 실행 ===");
            response.sendRedirect("/");

            
         }
      }else {
         log.info("=== logout 성공시에만 실행 ===");
         response.sendRedirect("/");
      
      }
      
   }


}