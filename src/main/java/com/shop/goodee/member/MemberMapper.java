package com.shop.goodee.member;

import java.util.List;

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
	
	/* 내 설정 */
	public int getPwCheck(MemberVO memberVO)throws Exception;
	
	/* 메일주소 변경 */
	public int setChangeEmail(MemberVO memberVO)throws Exception;
	
	/* 폰번호 변경 */
	public int setChangePhone(MemberVO memberVO)throws Exception;
	
	/* 비밀번호 변경 */
	public int setChangePw(MemberVO memberVO)throws Exception;
	
	/* 회원 탈퇴 */
	public int setWithdrawal(MemberVO memberVO)throws Exception;
	
	/* 탈퇴일자 1씩 증가 */
	public int setRegdateAdd(MemberVO memberVO)throws Exception;
	
	/* 탈퇴 회원조회 */
	public List<MemberVO> getWithdrawal()throws Exception;
	
	/* 탈퇴 회원삭제 */
	public int setUserDelete(MemberVO memberVO)throws Exception;
}
