package com.shop.goodee.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.multipart.MultipartFile;

import com.shop.goodee.item.ItemFileVO;
import com.shop.goodee.item.ItemVO;

import lombok.Data;

@Data
public class MemberVO implements UserDetails{
	
	@NotBlank
	private String id;
	@Size(min =8,max = 20)
	private String pw;
	@NotBlank
	private String name;
	private String email;
	private String birth;
	private String phone;
	private Long point;
	private Long point_3;
	private Long point_result;
	private Date regDate;
	private boolean status;
	private String nickName;
	private Date byeDate;	
	//추가 memberVO
	private Integer sum;
	private Integer cnt;
	private Integer roleNum;
	private String pwCheck;
	private String newPwCheck;
	@NotBlank
	private String e;
	private String mailText;
	private String mailOption;
	@Range(min=1900, max=2022)
	private String yy;
	@Range(min=1, max=12)
	private String mm;
	@Range(min=1, max=31)
	private String dd;
	
	//등급 여러개 가능
	private List<RoleVO> roleVOs;
	//프로필 업로드
	private MultipartFile multipartFile;
	//프로필 사진 한개	
	private MemberFileVO memberFileVO;
	
	//OAuth2User, Token등 정보 저장
	private Map<String, Object> attributes;

	//kakao, naver, google
	private String social;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleVO roleVO : roleVOs) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));	
		}
		
		return authorities;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.getPw();
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.id;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
