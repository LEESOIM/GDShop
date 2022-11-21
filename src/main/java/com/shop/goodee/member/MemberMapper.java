package com.shop.goodee.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	/* 회원가입 */
	public int setJoin(MemberVO memberVO)throws Exception;
	
	public int setMemberRole(MemberVO memberVO)throws Exception;
	
	public int getIdCheck(MemberVO memberVO)throws Exception;
	
	/* 아이디/비번찾기 */
	public String getFindId(MemberVO memberVO)throws Exception;
	
	public String getFindPw(MemberVO memberVO)throws Exception;
	
	public int setNewPw(MemberVO memberVO)throws Exception;
	
	/* 로그인 */
	public MemberVO getLogin(MemberVO memberVO)throws Exception;
	
	/* 마이페이지 */
	public MemberVO getMypage(MemberVO memberVO)throws Exception;

	/* 프로필 사진 */
	public int setProfile(MemberFileVO memberFileVO)throws Exception;
	
	public MemberFileVO getProfile(MemberFileVO memberFileVO)throws Exception;
	
	public int setProfileUpdate(MemberFileVO memberFileVO)throws Exception;
}
