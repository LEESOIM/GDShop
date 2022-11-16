package com.shop.goodee.ocr;

import java.io.File;

import org.springframework.stereotype.Service;

import net.sourceforge.tess4j.Tesseract;

@Service
public class OcrService {

	public void getOcrText() throws Exception{
		Tesseract tesseract = new Tesseract();
		try {
			String lang = "kor+eng";
			tesseract.setDatapath("C:\\sts\\workspace\\GDShop\\src\\main\\resources\\Tess4J\\tessdata");
			tesseract.setLanguage(lang);
			
			System.out.println("====================================================");
			String text1 = tesseract.doOCR(new File("src/main/java/demo/sample1.png"));
			System.out.println(text1);
			System.out.println("====================================================");
			String text2 = tesseract.doOCR(new File("src/main/java/demo/sample2.png"));
			System.out.println(text2);
			System.out.println("====================================================");
			
			
		} catch (Exception e) {
		}
	}
}
