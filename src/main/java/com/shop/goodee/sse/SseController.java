package com.shop.goodee.sse;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SseController {
	public static Map<String, SseEmitter> sseEmitters = new ConcurrentHashMap<>();
	private static final Long DEFAULT_TIMEOUT = 60L*1000*60;
	
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping(value = "/sub/{id}")
	public SseEmitter subscribe(@PathVariable String id) {
		// 현재 클라이언트의 SseEmitter 생성
		SseEmitter sseEmitter = new SseEmitter(DEFAULT_TIMEOUT);
		try {
			// 연결
			sseEmitter.send(SseEmitter.event().name("connect"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 해당 유저의 Emitter 저장
		sseEmitters.put(id, sseEmitter);
		log.info("=========== Sse Controller===========");
		log.info("sseEmitter =>{}", sseEmitter);
		log.info("sseEmitters<> =>{}", sseEmitters);
		sseEmitter.onCompletion(() -> sseEmitters.remove(id));
		sseEmitter.onTimeout(()-> sseEmitters.remove(id));
		sseEmitter.onError((e) -> sseEmitters.remove(id));
		
		return sseEmitter;
//		SseEmitter sseEmitter = notificationService.subscribe("admin");
//		log.info("===========SseConroller==========");
//		log.info("sseEmitter =>{}", sseEmitter);
//		log.info("id =>{}", id);
//		log.info("=================================");
//		return sseEmitter;
	}
}
