package com.shop.goodee.sse;

import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface EmitterRepository {
	SseEmitter save(String emitterId, SseEmitter sseEmitter);	// Emitter 저장
	void saveEventCache(String emitterId, Object event);		// 이벤트 저장
	Map<String, SseEmitter> findAllEmitterStartWithByMemberId(String memberId);	// 해당 회원과 관련된 모든 Emitter를 찾는다
    Map<String, Object> findAllEventCacheStartWithByMemberId(String memberId);	// 해당 회원과 관련된 모든 이벤트를 찾는다
    void deleteById(String id);		// Emitter를 지운다
    void deleteAllEmitterStartWithId(String memberId);	// 해당 회원과 관련된 모든 Emitter를 지운다.
    void deleteAllEventCacheStartWithId(String memberId);	// 해당 회원과 과녈ㄴ된 모든 이벤트를 지운다.
}
