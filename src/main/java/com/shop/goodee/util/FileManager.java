package com.shop.goodee.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
public class FileManager {

	//파일저장
	public String saveFile(MultipartFile multipartFile, String path) throws Exception {
		
		//1. 중복되지 않는 파일명 생성(UUID, Date)
		String fileName = UUID.randomUUID().toString();
		
		//2. 확장자
		StringBuffer bf = new StringBuffer();
		bf.append(fileName);
		bf.append("_");
		bf.append(multipartFile.getOriginalFilename());
		fileName = bf.toString();
		
		//3. HDD에 File 저장하기
		File file = new File(path, bf.toString()); //(폴더, 저장할파일명)
		multipartFile.transferTo(file);
		
		return fileName;
	}
}
