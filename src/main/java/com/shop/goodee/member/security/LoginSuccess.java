package com.shop.goodee.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccess implements AuthenticationSuccessHandler{
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
		//로그인 성공
				String checkBox = request.getParameter("rememberId");
				if(checkBox != null && checkBox.equals("true")) {
					Cookie cookie = new Cookie("userId", request.getParameter("id"));
					cookie.setHttpOnly(true);
					cookie.setMaxAge(60);
					cookie.setPath("/");
					
					response.addCookie(cookie);
					
				}else {
					Cookie [] cookies = request.getCookies();
					
					for(Cookie cookie:cookies) {
						if(cookie.getName().equals("userId")) {
							cookie.setMaxAge(0);
							cookie.setPath("/");//쿠키 삭제 시 쿠키를 만들때의 패스와 동일하여야한다.
							response.addCookie(cookie);
							break;
						}
					}
					
				}
				
				//ajax로 성공했을 때 1을 받음.
				response.getOutputStream().print(1);
			}
			
		}
