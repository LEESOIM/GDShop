package com.shop.goodee.member;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.shop.goodee.item.ItemVO;
import com.shop.goodee.mission.MissionVO;
import com.shop.goodee.util.FileManager;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Service
@Slf4j
public class MemberService {
   
   @Autowired
   private MemberMapper memberMapper;
   
   @Autowired
   private FileManager fileManager;
   
   @Value("${app.profile}")
   private String path;
   
   @Value("${social.kakao.admin}")
   private String adminKey;
   
   @Autowired
   @Qualifier("en")
   private PasswordEncoder passwordEncoder;
   
   
   public int setDelete(MemberVO memberVO)throws Exception{
      //1. WebClient 생성
      WebClient webClient = WebClient.builder()
                              .baseUrl("https://kapi.kakao.com/")
                              .build();
      
      //2. parameter
      MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
      map.add("target_id_type", "user_id");
      map.add("target_id", memberVO.getId());
      
      Mono<String> res = webClient.post()
             .uri("v1/user/unlink")
             .body(BodyInserters.fromFormData(map))
             .header("Authorization", "KakaoAK "+adminKey)
             .header("Content-Type","application/x-www-form-urlencoded")
             .retrieve()
             .bodyToMono(String.class);
      
      log.info("WebClientResult = > {}",res.block());
      
      return 1;
      
   }
   
   public int setDelete2(MemberVO memberVO)throws Exception{
      int result=0;
      RestTemplate restTemplate=null;
      HttpHeaders headers=null;
      MultiValueMap<String, String> params =null;
      HttpEntity<MultiValueMap<String, String>> req=null;
      ResponseEntity<String> res=null;
      //////=============================== 로그아웃
      restTemplate= new RestTemplate();
      
      //--Header
      headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);//application/x-www-form-urlencoded
      headers.add("Authorization", "KakaoAK "+adminKey);
      
      //--parameter
      params = new LinkedMultiValueMap<>();
      params.add("target_id_type", "user_id");
      params.add("target_id", memberVO.getId());
      
      //-- 요청 객체
      req = new HttpEntity<>(params, headers);
      
      //-- 전송 후 결과 처리
      res = restTemplate.postForEntity("https://kapi.kakao.com/v1/user/logout", req, String.class);
      
      log.info("logOut => {} ", res.getBody());
      
   //////=============================== 연결 해제
      restTemplate = new RestTemplate();
      
      //--Header
      headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);//application/x-www-form-urlencoded
      headers.add("Authorization", "KakaoAK "+adminKey);
      
      //--parameter
      params = new LinkedMultiValueMap<>();
      params.add("target_id_type", "user_id");
      params.add("target_id", memberVO.getId());
      
      //-- 요청 객체
      req = new HttpEntity<>(params, headers);
      
      //-- 전송 후 결과 처리
      res = restTemplate.postForEntity("https://kapi.kakao.com/v1/user/unlink", req, String.class);
      
      log.info("res => {} ", res.getBody());
      
      if(res.getBody()!= null) {
         result=1;
      }
      

      return result;
   }
   
   //아이디 찾기
   public String getFindId(MemberVO memberVO)throws Exception{
      String email = memberMapper.getFindId(memberVO);
      return email;
   }
   //비밀번호 찾기
   public String getFindPw(MemberVO memberVO)throws Exception{
      return memberMapper.getFindPw(memberVO);
   }
   
   //중복 아이디 조회
   public int getIdCheck(MemberVO memberVO)throws Exception{
      return memberMapper.getIdCheck(memberVO);
   }
   
   //회원가입(입력)
   public int setJoin(MemberVO memberVO, String yy, String mm, String dd, String e, String mailOption)throws Exception {
      if(dd.length() == 1) {
         dd = '0'+dd;
      }
      memberVO.setBirth(yy+'-'+mm+'-'+dd);
      memberVO.setEmail(e+"@"+mailOption);
      
      //회원가입 시 default 이미지 넣기
      MemberFileVO memberFileVO = new MemberFileVO();
      memberFileVO.setFileName("user.webp");
      memberFileVO.setOriName("user.webp");
      memberFileVO.setId(memberVO.getId());
      
      memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
      
      
      int result = memberMapper.setJoin(memberVO);
      int success= 0;
      //회원가입 성공 시, result = 1 (회원등급 추가하기)
      if(result == 1) {
         success = memberMapper.setMemberRole(memberVO);
         memberMapper.setProfile(memberFileVO);
      }else {
         log.info("가입 실패!");
      }
      
      return success;
   }
   
   //사용자 검증 메서드(id중복 체크, 이메일 입력 체크, 비번 일치 검증, 휴대번호 입력 검증)
   public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
      //check=false : 검증 성공(에러X)      
      boolean check=false;
      
      //1.annotation검증
      check = bindingResult.hasErrors();
      
      //2.id 중복 체크!
      int result = memberMapper.getIdCheck(memberVO);
      if(result > 0) {
         check = true;
         bindingResult.rejectValue("id","member.id.equal");
      }
      
      //3.비번 일치 검증
      if(!memberVO.getPw().equals(memberVO.getPwCheck())) {
         check= true;
         bindingResult.rejectValue("pwCheck", "member.password.notEqual");
      }
      
      //4. 이메일 입력 검증
      if(memberVO.getMailOption().equals("선택")) {
         check=true;
         bindingResult.rejectValue("mailOption", "member.email.req");
      }
      
      //5. 휴대번호 입력 검증
      log.info("Phone : {}", memberVO.getPhone().length());
      if(memberVO.getPhone().length() > 11 || memberVO.getPhone().length() < 11) {
         check=true;
         bindingResult.rejectValue("phone", "member.phone.req");
      }
      
      return check;
   }
   
   //로그인
//   public MemberVO getLogin(MemberVO memberVO)throws Exception{
//      return memberMapper.getLogin(memberVO);
//   }
   
   // 마이페이지
   public MemberVO getMypage(MemberVO memberVO)throws Exception{
      return memberMapper.getMypage(memberVO);
   }
   
   //마이페이지 - 프로필 사진 추가
   public MemberFileVO setProfile(MemberVO memberVO, MultipartFile multipartFile)throws Exception{
      //회원 가입할 때 아이디정보 담아서 default이미지 저장하기
      //프로필 수정페이지에선 프로필페이지의 id을 조회해서 출력하기
      //저장할 경로 담은 file객체 생성
      File file = new File(path);
      log.info("file경로 확인 : {}",file);
      
      //파일이 없으면 생성
      if(!file.exists()) {
         file.mkdirs();
      }
      MemberFileVO memberFileVO = new MemberFileVO();
      String fileName = fileManager.saveFile(multipartFile, path);
      memberFileVO.setFileName(fileName);
      memberFileVO.setOriName(multipartFile.getOriginalFilename());
      memberFileVO.setId(memberVO.getId());
      
      //MemberFileVO에 같은 아이디의 파일이 있다면 삭제하고 없으면 생성
      //아이디 조회, null일경우 생성
      int success = 0;
      MemberFileVO profileID = memberMapper.getProfile(memberFileVO);
      if(profileID == null) {
         int result = memberMapper.setProfile(memberFileVO);
         success = 1;
      }else {
         memberMapper.setProfileUpdate(memberFileVO);
      }
      
      return memberFileVO;
   }
   
   public MemberFileVO getProfile(MemberFileVO memberFileVO)throws Exception{
      return memberMapper.getProfile(memberFileVO);
   }
   
   public int setProfileUpdate(MemberFileVO memberFileVO)throws Exception{
      return memberMapper.setProfileUpdate(memberFileVO);
   }
   
   /* 내 설정 */
   //비밀번호 일치 확인(본인확인)
   public int getPwCheck(MemberVO memberVO, MemberVO check)throws Exception{
      //mathces("평문 비번", "인코딩된 pw")
      log.info("pwCheck :{}",passwordEncoder.matches(memberVO.getPw(), check.getPw()));
      
      if(passwordEncoder.matches(memberVO.getPw(), check.getPw())) {
         memberVO.setPw(check.getPw());
      }else {
      }
      
      
      return memberMapper.getPwCheck(memberVO);
   }
   
   /* 메일주소 변경 */
   public int setChangeEmail(MemberVO memberVO, String e, String mailOption)throws Exception{
      memberVO.setEmail(e+"@"+mailOption);
      return memberMapper.setChangeEmail(memberVO);
   }
   
   /* 폰번호 변경 */
   public int setChangePhone(MemberVO memberVO)throws Exception{
      return memberMapper.setChangePhone(memberVO);
   }
   
   /* 비밀번호 변경 */
   public int setChangePw(MemberVO memberVO, MemberVO sessionVO)throws Exception{
      memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
      int result = memberMapper.setChangePw(memberVO);
      if(result == 1) {
         sessionVO.setPw(memberVO.getPw());
      }
      return result;
   }
   
   /* 회원 탈퇴 */
   public int setWithdrawal(MemberVO memberVO)throws Exception{
      return memberMapper.setWithdrawal(memberVO);
   }
   
   /* 회원 포인트 조회 */
   public int getPoint(MemberVO memberVO)throws Exception{
      return memberMapper.getPoint(memberVO);
   }
   
   /* 3일 뒤 적립 된 회원 포인트 조회 */
   public int getPoint_3(MemberVO memberVO)throws Exception{
      return memberMapper.getPoint_3(memberVO);
   }
   
   /* 출금신청 후 적립 포인트 변경 */
   public int setResultPoint_3(MemberVO memberVO)throws Exception{
      return memberMapper.setResultPoint_3(memberVO);
   }
   
   /* 출금신청 후 출금 예정 포인트 변경 */
   public int setResultPoint(MemberVO memberVO)throws Exception{
	   int result = memberMapper.setResultPoint(memberVO);
	   /* 출금 신청 후 포인트 리스트 변화 */
	   result = memberMapper.getResultPoint(memberVO);
	   return result;
   }
   
   /* 내등급 - VIP회원 확인 */
   public int getVIP(MemberVO memberVO)throws Exception{
      return memberMapper.getVIP(memberVO);
   }
   
   /* 내등급 - VIP회원 페이지 출력 */
   public MemberVO getVIPlist(MemberVO memberVO)throws Exception{
      return memberMapper.getVIPlist(memberVO);
   }
   
   /* 판매 상품 - 판매자 상품목록 리스트 */
   public List<ItemVO> getSellerProduct(MemberVO memberVO)throws Exception{
      return memberMapper.getSellerProduct(memberVO);
   }
   
   /* 마이페이지 - 쿠팡 닉네임 변경 */
   public int setNickName(MemberVO memberVO)throws Exception{
      return memberMapper.setNickName(memberVO);
   }
   
   /* 마이페이지 - 네이버 닉네임 변경 */
   public int setNickName_N(MemberVO memberVO)throws Exception{
      return memberMapper.setNickName_N(memberVO);
   }

   /* 내 프로필 - 미션 지원대기수 */
   public int getMissionCount0(MissionVO missionVO)throws Exception{
	   return memberMapper.getMissionCount0(missionVO);
   }
   /* 내 프로필 - 참여 미션수 */
   public int getMissionCount1(MissionVO missionVO)throws Exception{
	   return memberMapper.getMissionCount1(missionVO);
   }
   /* 내 프로필 - 미션 완료수 */
   public int getMissionCount2(MissionVO missionVO)throws Exception{
	   return memberMapper.getMissionCount2(missionVO);
   }
   
   /* 내 포인트 - 포인트 변화 */
   public List<PointVO> getPointList(MemberVO memberVO)throws Exception{
	   List<PointVO> ar = memberMapper.getPointList(memberVO);
	  
	   return ar;
   }
   
   /* 내 포인트 - 미션수 */
   public int getMissionNum(MemberVO memberVO)throws Exception{
	   return memberMapper.getMissionNum(memberVO);
   }
}