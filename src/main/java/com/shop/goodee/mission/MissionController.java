package com.shop.goodee.mission;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MemberMapper;
import com.shop.goodee.member.MemberVO;
import com.shop.goodee.sns.SnsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mission/*")
@Slf4j
public class MissionController {

	@Autowired
	private MissionService missionService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private SnsService snsService;
	
	@Autowired
	private MemberMapper memberMapper;

	//포인트 수령
	@PostMapping("point")
	@ResponseBody
	public int setReceivePoint(HttpSession session, ItemVO itemVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());
		log.info("포인트{}",itemVO);
		//포인트 수령
		int result = missionService.setReceivePoint(itemVO);
		if(result==1) {
			//status 1->2
			return missionService.setEnd(itemVO);
		}
		return 0;
	}
	
	
	// 추첨형미션 랜덤 추첨
	@PostMapping("win")
	@ResponseBody
	public int setWin(MissionVO missionVO, ItemVO itemVO) throws Exception {
		// 추첨대기중 회원리스트
		log.info("========1====={}",missionVO.getItemNum());
		log.info("========2====={}",itemVO.getItemNum());
		List<MissionVO> ar = new ArrayList<>();
		ar = missionService.getWaiting(missionVO);//지원인원 100
		itemVO = itemService.getDetail(itemVO);
		// 랜덤숫자 뽑기
		Random random = new Random();
		int [] numArray = new int[itemVO.getStock().intValue()]; //모집인원 10
		
		for(int i=0; i<itemVO.getStock(); i++) {
			numArray[i] = random.nextInt(ar.size())+1;
//			for(int j=0; j<i; j++) { //중복제거
//				if(numArray[i]==numArray[j]) {
//					i--;
//					break;
//				}
//				
//			}
			log.info("ar.get(i){}", ar.get(i).getId());
			MemberVO memberVO = new MemberVO();
			memberVO.setId(ar.get(i).getId());		
			log.info("==================id{}", memberVO.getId());
			
			String phone = memberMapper.getPhone(ar.get(i).getId());
			log.info("==================phone{}", phone);
			
			// 당첨된 회원 MYCAM 0->1 UPDATE
			int result = missionService.setWin(ar.get(numArray[i]));
			
			if(result>0) {
				//알람문자
				String id= missionVO.getId();
				String text = "[구디샵] "+"지원하신 추첨형 캠페인에 당첨되셨습니다! 2시간 내에 구매하기 미션을 완료해주세요";//o

				snsService.goMessage(phone,text);//x
			}
			}
			
		return 0;
	}

	

	// 모집률
	@PostMapping("rate")
	@ResponseBody
	public int getApplyRate(MissionVO missionVO) throws Exception {
		log.info("모집률{}", missionVO);
		return missionService.getApplyRate(missionVO);
	}

	// 지원하기
	@PostMapping("apply")
	@ResponseBody
	public int setApply(HttpSession session, MissionVO missionVO, ItemVO itemVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		missionVO.setId(memberVO.getId());

		// 상품테이블에 있는 값을 미션테이블로 담기
		// missionVO.setItemNum(itemVO.getItemNum());
		// missionVO.setApplyCount(itemVO.getCount());
		itemVO = itemService.getDetail(itemVO);

		// 지원하기
		if (itemVO.getType().equals("추첨형")) {
			return missionService.setApply(missionVO);
		} else {
			return missionService.setApply_baro(missionVO);
		}
	}

	// 지원내역
	@PostMapping("applyList")
	@ResponseBody
	public MissionVO getApply(HttpSession session, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setId(memberVO.getId());
		missionVO = missionService.getApply(missionVO);
		log.info("미션지원내역==={} ", missionVO);
		return missionVO;
	}

	// 중복지원확인
	@PostMapping("applyCheck")
	@ResponseBody
	public Long getApplyCheck(HttpSession session, ItemVO itemVO, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setItemNum(itemVO.getItemNum());
		missionVO.setId(memberVO.getId());

		Long result = missionService.getApplyCheck(missionVO);
		return result;
	}

	// 지원취소
	@PostMapping("cancel")
	@ResponseBody
	public String setCancel(HttpSession session, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setId(memberVO.getId());
		log.info("missionVO{}", missionVO);
		int result = missionService.setCancel(missionVO);
		return "/item/detail?itemNum=" + missionVO.getItemNum();
	}
	
	// 미션 선정 탈락
	@PostMapping("fail")
	@ResponseBody
	public int setFail(HttpSession session, MissionVO missionVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();

		missionVO.setId(memberVO.getId());

		int result = missionService.setFail(missionVO);
		return result;
	}

}
