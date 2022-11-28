package com.shop.goodee.sse;


import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.shop.goodee.admin.AdminService;
import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;
import static com.shop.goodee.sse.SseController.sseEmitters;
@Service
@Slf4j
public class NotificationService {
	@Autowired
	private  AdminService adminService;
	
//	private static final Long DEFAULT_TIMEOUT = 60L*1000*60;
//	public static Map<String, SseEmitter> sseEmitters = new ConcurrentHashMap<>();
//	
//	public SseEmitter subscribe(String id) {
//		
//		// 현재 클라이언트의 SseEmitter 생성
//		SseEmitter sseEmitter = new SseEmitter(DEFAULT_TIMEOUT);
//		
//		try {
//			// 연결
//			sseEmitter.send(SseEmitter.event().name("connect"));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		// 해당 유저의 Emitter 저장
//		sseEmitters.put(id, sseEmitter);
//		log.info("sseEmitters =>{}", sseEmitters);
//		sseEmitter.onCompletion(() -> sseEmitters.remove(id));
//		sseEmitter.onTimeout(()-> sseEmitters.remove(id));
//		sseEmitter.onError((e) -> sseEmitters.remove(id));
//		
//		return sseEmitter;
//	}
	
	public void notifyApplyEvent(String id)throws Exception {
		List<MemberVO> adminList = adminService.getAdmin();
		
		for(MemberVO admin: adminList) {
			if(sseEmitters.containsKey(admin.getId())) {
				log.info("admin =>{}", admin);
				SseEmitter sseEmitter = sseEmitters.get(admin.getId());
				log.info("=========== Service===========");
				log.info("sseEmitters<> =>{}", sseEmitters);
				log.info("sseEmitter =>{}", sseEmitter);
				try {
					log.info("=========== addApply===========");
					sseEmitter.send(SseEmitter.event().name("addApply").data(id+"의 입점신청이 들어왔습니다"));					
				} catch (Exception e) {
					sseEmitters.remove(admin.getId());
				}
			}
		}
	}
	
}
