package com.shop.goodee.follow;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.goodee.purchase.PurchaseVO;

import lombok.extern.slf4j.Slf4j;
import net.sourceforge.tess4j.Tesseract;

@Slf4j
@Service
public class FollowService {
	
	@Value("${app.ocrPath}")
	private String ocrPath;
	
	@Value("${app.follow}")
	private String path;  //  D:/gdshop/follow/
	
	public FollowVO getFollow(MultipartFile f) throws Exception{
		FollowVO followVO = new FollowVO();
		followVO.setFollowCheck(0);

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
			try {
				String abc = path+fileName;
				String text = tesseract.doOCR(new File(abc)); // Ocr적용
				text = text.trim().replaceAll("[,.\\s\\[\\]\\(\\)\\|\\ㆍ\\-\\_]", ""); // 공백,특수문자 제거
				log.info("===========Service===========");
				log.info("OCR){}",text);
				
				if(text.contains("팔로잉")||text.contains("칼로잉")||text.contains("랄로잉")) {
					log.info("팔로우 O");
					followVO.setFollowCheck(1);
					return followVO;
				}else {
					log.info("팔로우 X");
				}
			} catch (Exception e) {
				
			}
		}
		return followVO;
	};
}
