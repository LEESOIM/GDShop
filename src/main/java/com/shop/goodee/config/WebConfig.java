package com.shop.goodee.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;


@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer{
	
	@Value("${app.url.path}")
	private String urlPath; //	/file/**
	@Value("${app.upload.base}") // file:///gdshop/
	private String filePath;
		
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		log.info("============================");
		log.info("urlPath {}", urlPath);	// /file/**
		log.info("filePath {}", filePath);	// file:///result/upload/
		log.info("============================");
		
		registry.addResourceHandler(urlPath) // /file/** 요청받고자하는 url주소 매핑 설정
				.addResourceLocations(filePath); //	/file/**로 응답할 파일 디렉토리 설정(file:///gdshop/)
	}
}
