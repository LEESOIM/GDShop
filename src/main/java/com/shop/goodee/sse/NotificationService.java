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
	
	public void pdAddRequestEvent(String id)throws Exception{
		List<MemberVO> adminList = adminService.getAdmin();
		log.info("adminList => {}",adminList);
		for(MemberVO admin: adminList) {
			log.info("sseEmitters<> =>{}", sseEmitters);
			if(sseEmitters.containsKey(admin.getId())) {
				log.info("admin =>{}", admin);
				SseEmitter sseEmitter = sseEmitters.get(admin.getId());
				log.info("=========== Service===========");
				log.info("sseEmitters<> =>{}", sseEmitters);
				log.info("sseEmitter =>{}", sseEmitter);
				try {
					log.info("=========== pdAddRequest===========");
					sseEmitter.send(SseEmitter.event().name("pdAddRequest").data(id+"상품등록 요청이 들어왔습니다"));					
				} catch (Exception e) {
					sseEmitters.remove(admin.getId());
				}
			}
		}
	}
	
	
	public void notifyApplyEvent(String id)throws Exception {
		List<MemberVO> adminList = adminService.getAdmin();
		log.info("adminList => {}",adminList);
		for(MemberVO admin: adminList) {
			log.info("sseEmitters<> =>{}", sseEmitters);
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
