package com.shop.goodee.ocr;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ocr/*")
public class OcrController {

	@Autowired
	private OcrService ocrService;
	
	@GetMapping("test")
	@ResponseBody
	public void test() throws Exception{
		ocrService.getOcrCoopang();
	}
	
	@GetMapping("ocr")
	public void ocr() throws Exception{
	}
	
	@PostMapping("setPurchase")
	public void setPurchase(@RequestParam("f") MultipartFile file) throws Exception{
		log.info("=============================");
		log.info(file.getOriginalFilename());
		
//		ocrService.setPurchaseFileAdd(multipartFile);
	}
	
}
