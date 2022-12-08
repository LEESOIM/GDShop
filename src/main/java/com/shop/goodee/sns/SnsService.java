package com.shop.goodee.sns;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Service
public class SnsService {
	
	@Value("${spring.sns.nurigo}")
	private String api;
	
	@Value("${spring.sns.nurigo.secret}")
	private String apiSecret;
	
	
	public void goMessage(MemberVO phone, String text) throws Exception{
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize(api, apiSecret, "https://api.solapi.com");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01026161467");
		
		
		
		
		message.setText(text);
		message.setTo(phone.getPhone());
		
			log.info("=========={}",phone.getPhone());
			try {
				// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
				messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
				// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
				System.out.println(exception.getFailedMessageList());
				System.out.println(exception.getMessage());
			} catch (Exception exception) {
				System.out.println(exception.getMessage());
			}
		

		
		
		
	}

}
