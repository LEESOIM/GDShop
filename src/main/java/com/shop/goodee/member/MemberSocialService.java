package com.shop.goodee.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//로그인 후 그정보를 여기서 받아옴.
		String social = userRequest.getClientRegistration().getRegistrationId();
		
		if(social.equals("kakao")) {
			log.info("카카오 로그인");
		}
		OAuth2User auth2User = this.socialJoinCheck(userRequest);
		
		return auth2User;
	}
	
	private OAuth2User socialJoinCheck(OAuth2UserRequest userRequest) {
		//회원가입 유무
		OAuth2User auth2User = super.loadUser(userRequest);
		
		Map<String, Object> map = auth2User.getAttributes();
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
		}
		LinkedHashMap<String, Object> lm = auth2User.getAttribute("properties");
		Map<String, Object> ka = auth2User.getAttribute("kakao_account");
		MemberVO memberVO = new MemberVO();
		
		//pw가 없으므로 비워두거나 랜덤한 값으로 생성
		//memberVO.setPw(null)
		memberVO.setId(auth2User.getName());//id
		memberVO.setName(lm.get("profile_nickname").toString());
		memberVO.setEmail(ka.get("account_email").toString());
		memberVO.setEmail(ka.get("name").toString());
		memberVO.setEmail(ka.get("birthday").toString());
		memberVO.setEmail(ka.get("birthyear").toString());
		memberVO.setEmail(ka.get("phone_number").toString());
//		profile_nickname,profile_image,account_email,name,birthday,birthyear,phone_number
		memberVO.setSocial(userRequest.getClientRegistration().getRegistrationId());
		
		memberVO.setAttributes(auth2User.getAttributes());
		
		//Role 나중엔 디비에서 조회하여 넣어야한다. 임의로 일단 넣어주는 작업
		List<RoleVO> list = new ArrayList<>();
		RoleVO roleVO = new RoleVO();
		roleVO.setRoleName("ROLE_MEMBER");
		list.add(roleVO);
		
		memberVO.setRoleVOs(list);
		
		return memberVO;
		
	}
	
}
