package com.shop.goodee.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberSocialService extends DefaultOAuth2UserService{
   
   @Autowired
   private MemberMapper memberMapper;

   @Override
   public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
      //로그인 후 그정보를 여기서 받아옴.
      log.info("===== Social Login 시도 =====");
      log.info("UserRequest {} ", userRequest);
      log.info("AccessToken {} ", userRequest.getAccessToken().getTokenValue());
      log.info("Reg => {}", userRequest.getClientRegistration());
      String social = userRequest.getClientRegistration().getRegistrationId();
//      log.info("Social : {} ", social);
//      
//      if(social.equals("kakao")) {
//         log.info("카카오 로그인");
//      }else if(social.equals("google")) {
//         log.info("구글 로그인");
//      }else if(social.equals("naver")) {
//         log.info("네이버 로그인");
//      }
      OAuth2User auth2User;
      
      auth2User = this.socialJoinCheck(userRequest);
      
      return auth2User;
      
   }
   
   private OAuth2User socialJoinCheck(OAuth2UserRequest userRequest){
      //회원가입 유무
      OAuth2User auth2User = super.loadUser(userRequest);
      log.info("==========   사용자 정보 =====================");
      
      Map<String, Object> map = auth2User.getAttributes();
      
      Iterator<String> keys = map.keySet().iterator();
      while(keys.hasNext()) {
         String key = keys.next();
         log.info("Key : {} ", key);
         
      }
      
      String social = userRequest.getClientRegistration().getRegistrationId();
      log.info("Social : {} ", social);
      
      MemberVO memberVO = new MemberVO();
      if(social.equals("kakao")) {
         log.info("카카오 로그인");
         Map<String, String> lm = auth2User.getAttribute("properties");
         Map<String, Object> ka = auth2User.getAttribute("kakao_account");
         
         
         memberVO.setId(auth2User.getName());//id
         int result;
         try {
            result = memberMapper.getIdCheck(memberVO);
            if(result == 0) {
               StringBuffer key = new StringBuffer();
               memberVO.setPw(auth2User.getName());
               memberVO.setName(lm.get("nickname"));
               memberVO.setEmail(ka.get("email").toString());
               memberVO.setBirth(ka.get("birthday").toString());
               memberVO.setPhone("010-");
               memberVO.setSocial("kakao");
               MemberFileVO memberFileVO = new MemberFileVO();
               memberFileVO.setFileName("user.webp");
               memberFileVO.setOriName("user.webp");
               memberFileVO.setId(memberVO.getId());
               
               memberMapper.setJoin(memberVO);
               memberMapper.setMemberRole(memberVO);
               memberMapper.setProfile(memberFileVO);
               
            }
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }

      }else if(social.equals("google")) {
         log.info("구글 로그인");
         
         memberVO.setId(auth2User.getName().substring(0, 9));//id
         int result;
         try {
            result = memberMapper.getIdCheck(memberVO);
            if(result == 0) {
               StringBuffer key = new StringBuffer();
               memberVO.setPw(auth2User.getName().substring(0, 9));
               memberVO.setName(auth2User.getAttributes().get("name").toString());
               memberVO.setEmail(auth2User.getAttributes().get("email").toString());
               memberVO.setBirth("--");
               memberVO.setPhone("010-");
               memberVO.setSocial("google");
               MemberFileVO memberFileVO = new MemberFileVO();
               memberFileVO.setFileName("user.webp");
               memberFileVO.setOriName("user.webp");
               memberFileVO.setId(memberVO.getId());
               
               memberMapper.setJoin(memberVO);
               memberMapper.setMemberRole(memberVO);
               memberMapper.setProfile(memberFileVO);
               
               
            }
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
         
         
         
      }else if(social.equals("naver")) {
         log.info("네이버 로그인");
         
         Map<String, String> na = auth2User.getAttribute("response");
         
         memberVO.setId(na.get("id").substring(0, 9));//id
         int result;
         try {
            result = memberMapper.getIdCheck(memberVO);
            if(result == 0) {
               StringBuffer key = new StringBuffer();
               memberVO.setPw(na.get("id").substring(0, 9));
               memberVO.setName(na.get("nickname"));
               memberVO.setEmail(na.get("email").toString());
               memberVO.setBirth(na.get("birthyear").toString()+"-"+na.get("birthday").toString());
               memberVO.setPhone(na.get("mobile").toString());
               memberVO.setSocial("naver");
               MemberFileVO memberFileVO = new MemberFileVO();
               memberFileVO.setFileName("user.webp");
               memberFileVO.setOriName("user.webp");
               memberFileVO.setId(memberVO.getId());
               
               memberMapper.setJoin(memberVO);
               memberMapper.setMemberRole(memberVO);
               memberMapper.setProfile(memberFileVO);
               
               
            }
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }

      
      memberVO.setSocial(userRequest.getClientRegistration().getRegistrationId());
      
      memberVO.setAttributes(auth2User.getAttributes());
      
      //accessToken
      memberVO.setToken(userRequest.getAccessToken().getTokenValue());
      List<RoleVO> list = new ArrayList<>();
      RoleVO roleVO = new RoleVO();
      roleVO.setRoleName("ROLE_MEMBER");
      list.add(roleVO);
      
      memberVO.setRoleVOs(list);
      
      return memberVO;
      
   }
   
}