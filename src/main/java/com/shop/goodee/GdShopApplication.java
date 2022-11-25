package com.shop.goodee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class GdShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(GdShopApplication.class, args);
	}

}
