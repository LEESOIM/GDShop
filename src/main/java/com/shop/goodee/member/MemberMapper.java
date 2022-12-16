package com.shop.goodee.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.mission.MissionVO;
import com.shop.goodee.pay.PayVO;

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
   public MemberVO getLogin(String username)throws UsernameNotFoundException;
   
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
   
   /* 적립 예정 포인트 조회 */
   public int getPoint(MemberVO memberVO)throws Exception;
   
   /* 3일 뒤 포인트 적립 */
   public int setPoint_3()throws Exception;
   
   /* 3일 뒤 적립 된 회원 포인트 조회 */
   public int getPoint_3(MemberVO memberVO)throws Exception;
   
   /* 출금신청 후 적립 포인트 변경 */
   public int setResultPoint_3(MemberVO memberVO)throws Exception;
   
   /* 출금신청 후 출금 예정 포인트 변경 */
   public int setResultPoint(MemberVO memberVO)throws Exception;
   
   /* 출금 신청 후 포인트 리스트 변화 */
   public int getResultPoint(MemberVO memberVO)throws Exception;
   
   /* 내등급 - VIP회원 확인 */
   public int getVIP(MemberVO memberVO)throws Exception;
   
   /* 내등급 - VIP회원 페이지 출력 */
   public MemberVO getVIPlist(MemberVO memberVO)throws Exception;
   
   /* 판매 상품 - 판매자 상품목록 리스트 */
   public List<ItemVO> getSellerProduct(MemberVO memberVO)throws Exception;
   
   /* 마이페이지 - 쿠팡 닉네임 변경 */
   public int setNickName(MemberVO memberVO)throws Exception;
   
   /* 마이페이지 - 네이버 닉네임 변경 */
   public int setNickName_N(MemberVO memberVO)throws Exception;
   
   /* 내 프로필 - 미션 지원대기수 */
   public int getMissionCount0(MissionVO missionVO)throws Exception;
   /* 내 프로필 - 참여 미션수 */
   public int getMissionCount1(MissionVO missionVO)throws Exception;
   /* 내 프로필 - 미션 완료수 */
   public int getMissionCount2(MissionVO missionVO)throws Exception;
   
   /* 내 포인트 - 포인트 변화 */
   public List<MemberVO> getMissionPoint(MemberVO memberVO)throws Exception;
   
   /* 내 포인트 - 미션수 */
   public int getMissionNum(MemberVO memberVO)throws Exception;
   
   /* 내 포인트 - 포인트 리스트 확인 */
   public List<PointVO> getPointList(MemberVO memberVO)throws Exception;
   
   /* 내 포인트 - 포인트 리스트 */
   public List<PointVO> getPointScheduler(PointVO pointVO)throws Exception;
   
   /* 포인트 finish+1 */
   public int setPointAdd()throws Exception;
   
   /* 멤버십 결제일,해지일 */
   public PayVO getMembershipPay(PayVO payVO)throws Exception;
   
   /* pay 결제일,해지일 */
   public List<PayVO> getPay(PayVO payVO)throws Exception;
   
   /* pay 결제일+1 */
   public int setPayAdd()throws Exception;
   
   /* pay Delete */
   public int setPayDelete(PayVO payVO)throws Exception;
   
   public String getPhone(String id)throws Exception;
   
   public int setMemberRoleDelete1(MemberVO memberVO)throws Exception;
   public int setMemberRoleDelete2(MemberVO memberVO)throws Exception;
   
}