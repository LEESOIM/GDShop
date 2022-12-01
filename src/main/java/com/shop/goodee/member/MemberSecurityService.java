package com.shop.goodee.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import org.springframework.stereotype.Service;

@Service
public class MemberSecurityService implements UserDetailsService {

	 @Autowired
	   private MemberMapper memberMapper;
	   
	   @Override
	   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	      
	      MemberVO memberVO = memberMapper.getLogin(username);
	      
	      return memberVO;
	   }

}
