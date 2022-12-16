package com.shop.goodee.purchase;

import java.io.File;
import java.sql.Date;
import java.util.UUID;

import org.checkerframework.dataflow.qual.Pure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import net.sourceforge.tess4j.Tesseract;

@Slf4j
@Service
public class PurchaseService {
	
	@Value("${app.ocrPath}")
	private String ocrPath;  //  application-secret.properties에 추가 (\ -> \\)
							 //  ex) app.ocrPath=C:\\sts\\workspace\\GDShop\\src\\main\\resources\\Tess4J\\tessdata
							 //  ex) app.chromePath=C:\\sts\\workspace\\GDShop\\src\\main\\resources\\chromedriver.exe
	@Value("${app.purchase}")
	private String path;  //  D:/gdshop/purchase/
	
	
	public PurchaseVO getPurchase(MultipartFile f) throws Exception{

		///////////////////////////파일저장///////////////////////////
		if(!f.isEmpty()) {
			String oriName = f.getOriginalFilename(); // 원본파일명
			String uuid = UUID.randomUUID().toString(); // 랜덤값
			StringBuffer bf = new StringBuffer();
			bf.append(uuid);
			String ex = oriName.substring(oriName.lastIndexOf("."));
			bf.append(ex);
			String fileName = bf.toString(); //파일명
			File file = new File(path,fileName);
			if(!file.exists()) {
				file.mkdirs();
			}
			f.transferTo(file);
			///////////////////////////OCR적용///////////////////////////
			Tesseract tesseract = new Tesseract();
			String lang = "kor+eng";
			tesseract.setDatapath(ocrPath);
			tesseract.setLanguage(lang);
			
			boolean checkNum = true;
			boolean checkPrice = true;
			
			String date="";
			String purNum="";
			String price="";
			
			String reverse="";
			int won;
			//////////////
			try {
				String abc = path+fileName;
				String text = tesseract.doOCR(new File(abc)); // Ocr적용
				text = text.trim().replaceAll("[,.\\s\\[\\]\\(\\)\\|\\ㆍ\\-\\_]", ""); // 공백,특수문자 제거
				log.info("===========Service===========");
				log.info("OCR){}",text);
				
				text = text.substring(text.indexOf("주문상세")+4); //0~a 인덱스문자열 소거 
//				System.out.println("1) "+text);
				date = text.substring(0, text.indexOf("주문주문번호")); //주문일 추출
				text = text.substring(text.indexOf("주문주문번호")+6); //주문번호 이전 소거
//				System.out.println("2) "+text);
						
				while(checkNum) {
					String tmp = text.substring(0,1);
					if(tmp.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
						checkNum=false;
					}else {
						purNum+=tmp;
						text = text.substring(1);
					}
				}
//				System.out.println("3) "+text);
				won = text.lastIndexOf("원");
				text = text.substring(0,won);
//				System.out.println("4) "+text); // "원" 뒤에 자르기
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
				PurchaseVO purchaseVO = new PurchaseVO();
				try {
					purchaseVO.setPurNum(purNum);
					purchaseVO.setPurDate(date);
					purchaseVO.setPrice(price);
				} catch (Exception e) {
					log.info("ORC 인식 에러");
				}
				log.info("주문일){}",date);//주문일
				log.info("주문번호){}",purNum);//주문번호
				log.info("가격){}",price);//가격
				return purchaseVO;
			} catch (Exception e) {
				PurchaseVO purchaseVO = new PurchaseVO();
				return purchaseVO;
			}
		}else {
			PurchaseVO purchaseVO = new PurchaseVO();
			return purchaseVO;
		}
	}
}
