package com.shop.goodee.ocr;

import java.io.File;
import java.sql.Date;

import org.springframework.stereotype.Service;

import net.sourceforge.tess4j.Tesseract;

@Service
public class OcrService {

	String path1 = "src/main/java/demo/sample1.png";
	String path2 = "src/main/java/demo/sample2.png";
	public void getOcrCoopang() throws Exception{
		Tesseract tesseract = new Tesseract();
		String lang = "kor+eng";
		tesseract.setDatapath("C:\\sts\\workspace\\GDShop\\src\\main\\resources\\Tess4J\\tessdata");
		tesseract.setLanguage(lang);
		
		String tmp;
		boolean check = true;
		String f="";
		
		try {
			String text1 = tesseract.doOCR(new File(path2));
			text1 = text1.trim();
			text1 = text1.replaceAll("\\s","");
			System.out.println("0) 원본 :"+text1); //Ocr적용,공백제거
			
			int a = text1.indexOf("주문상세")+4;
			text1 = text1.substring(a); //0~a 인덱스문자열 소거 
			
			int b = text1.indexOf("주문주문번호");
			tmp = text1.substring(0, b);
			System.out.println("1) 주문일 :"+tmp); //주문일 
			
			int c = text1.indexOf("주문주문번호")+6;
			text1 = text1.substring(c); 
			System.out.println(text1); // 주문번호~전체
					
			while(check) {
				String d = text1.substring(0,1);
				text1 = text1.substring(1);
				if(d.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
					check=false;
				}else {
					f+=d;
				}
			}
			System.out.println("2) 주문번호 :"+f); //주문번호
			
			
			text1 = text1.replaceAll("[,.]", "");
			System.out.println(",.제거)"+text1);
			
			int g = text1.lastIndexOf("원");
			System.out.println(g); //g : "원" 인덱스
			
			int h = text1.lastIndexOf(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.", g);
			System.out.println("h):"+h);
			
		} catch (Exception e) {
		}
	}
}
