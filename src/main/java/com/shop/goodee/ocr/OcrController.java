package com.shop.goodee.ocr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
