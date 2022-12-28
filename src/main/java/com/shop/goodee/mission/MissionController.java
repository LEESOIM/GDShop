package com.shop.goodee.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.item.ItemService;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.member.MailService;
import com.shop.goodee.member.MemberService;
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
	private MemberService memberService;

	@Autowired
	private SnsService snsService;
	
	@Autowired
	private MailService mailService;


	// 포인트 수령
	@PostMapping("point")
	@ResponseBody
	public int setReceivePoint(HttpSession session, ItemVO itemVO) throws Exception {
		itemVO = itemService.getDetail(itemVO);

		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());

		log.info("itemVO{}", itemVO);

		// 포인트 수령
		int result = missionService.setPoint(itemVO);
		log.info("result1{}", result);

		if (result == 1) {
			result = missionService.setReceivePoint(itemVO);
			log.info("result2{}", result);

			if (result == 1) {
				// status 1->2
				return missionService.setEnd(itemVO);
			}
		}
		return 0;
	}

	// 추첨형미션 랜덤 추첨
	@PostMapping("win")
	@ResponseBody
	public int setWin(ItemVO itemVO) throws Exception {

		itemVO = itemService.getDetail(itemVO); // 상품상세정보

		List<MissionVO> list = missionService.getWaiting(itemVO);
		int count = list.size(); // 미션대기중인 회원수

		MissionVO[] success = new MissionVO[itemVO.getStatus().intValue()]; // 모집인원만큼 배열 생성

		if (count > 0) {
			for (int i = 0; i < itemVO.getStatus(); i++) { // 모집인원만큼 반복문을 돌려서
				int num = (int) (Math.random() * count); // 지원한 회원수 범위 중에 랜덤번호를 뽑아라
				success[i] = list.get(num);
				log.info("==============축당첨{}", success[i]);

				// 당첨된 회원 MYCAM 0->1 UPDATE
				int result = missionService.setWin(success[i]);

				if (result > 0) {
					// 이메일
//					MemberVO memberVO = new MemberVO();
//					memberVO.setId(success[i].getId());
//					memberVO = memberService.getMypage(memberVO);
//					mailService.sendMission(memberVO);
					
					// 알람문자
//					String name = memberVO.getName();
//					String phone = memberVO.getPhone();
//					String text = "[구디샵] " + name + "님, 지원하신 추첨형 캠페인에 당첨되셨습니다! 2시간 내에 구매하기 미션을 완료해주세요";
//					snsService.goMessage(phone, text);
//					return result;
				}
			}
		}
		return 0;
	}
	
	//미션 선정 대기 중인 회원수
	@PostMapping("waite")
	public ModelAndView getWaitingCount(ItemVO itemVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Integer> count = missionService.getWaitingCount(itemVO);
		log.info("00000000000{}",itemVO.getId());
		
		mv.addObject(count);
		mv.setViewName("/member/product");
		return mv;
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
		itemVO = itemService.getDetail(itemVO);

		SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MemberVO memberVO = (MemberVO) authentication.getPrincipal();
		itemVO.setId(memberVO.getId());
		missionVO.setId(memberVO.getId());

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
