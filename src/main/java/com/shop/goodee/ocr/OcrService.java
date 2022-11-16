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
		
		boolean checkNum = true;
		boolean checkPrice = true;
		
		String date;
		String purNum="";
		String price="";
		
		String reverse="";
		int won;
		
		try {
			String text = tesseract.doOCR(new File(path1)); // Ocr적용
			text = text.trim().replaceAll("[,.\\s\\[\\]\\(\\)\\|\\ㆍ\\-\\_]", ""); // 공백,특수문자 제거
			System.out.println("0) "+text); 
			
			text = text.substring(text.indexOf("주문상세")+4); //0~a 인덱스문자열 소거 
			System.out.println("1) "+text);
			
			date = text.substring(0, text.indexOf("주문주문번호")); //주문일 추출
			
			text = text.substring(text.indexOf("주문주문번호")+6); //주문번호 이전 소거
			System.out.println("2) "+text);
					
			while(checkNum) {
				String tmp = text.substring(0,1);
				if(tmp.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
					checkNum=false;
				}else {
					purNum+=tmp;
					text = text.substring(1);
				}
			}
			System.out.println("3) "+text);
			
			won = text.lastIndexOf("원");
			text = text.substring(0,won);
			
			System.out.println("4) "+text); // "원" 뒤에 자르기
			
			while(checkPrice) {
				String tmp = String.valueOf(text.charAt(text.length()-1));
				if(tmp.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
					checkPrice=false;
				}else {
					reverse+=tmp;
					text = text.substring(0,text.length()-1);
				}
			}
			
			for(int i=reverse.length()-1;i>=0;i--) {
				price += reverse.charAt(i);
			}
			
			System.out.println("num) "+date); //주문일 
			System.out.println("purNum) "+purNum); //주문번호
			System.out.println("price) "+price); //가격
		} catch (Exception e) {
		}
	}
}
