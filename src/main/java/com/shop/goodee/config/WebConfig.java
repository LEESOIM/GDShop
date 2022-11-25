package com.shop.goodee.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //설정 파일을 상속해준다(Servlet-context.xml 같은 역할)
public class WebConfig implements WebMvcConfigurer {

	@Value("${app.upload.base}")
	private String filePath;
	
	@Value("${app.url.path}")
	private String urlPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		
		// /file/** 시작하는 URL요청을 Controller로 보내지 않고 /result/upload에서 반환
		registry.addResourceHandler(urlPath) 
				.addResourceLocations(filePath); 
	}
}
