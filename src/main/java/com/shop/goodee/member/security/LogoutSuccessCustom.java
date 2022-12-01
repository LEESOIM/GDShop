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
				
			}else {
				
			}
		}else {
			log.info("=== logout 성공시에만 실행 ===");
			response.sendRedirect("/");
		
		}
		
	}


}
