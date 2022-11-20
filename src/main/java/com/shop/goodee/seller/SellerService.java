package com.shop.goodee.seller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellerService {
	@Value("${app.chromePath}")
	private String chromePath;
	
	
	public void test() throws Exception{
		System.out.println("===================================hello===========================");
		log.info(") {}",chromePath);
	}
	
}
