package com.shop.goodee.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	public String saveFile(MultipartFile multipartFile, String path)throws Exception{
		
		//1. 중복되지 않는 파일명
		String fileName = UUID.randomUUID().toString();
		
		//2. 확장자
		StringBuffer bf = new StringBuffer();
		bf.append(fileName);
		bf.append("_");
		
		//3. 파일명과 확장자 분리
		String ex = multipartFile.getOriginalFilename();
		ex = ex.substring(ex.lastIndexOf("."));
		
		bf.append(ex);
		
		fileName = bf.toString();
		
		//4. 파일을 저장
		File file = new File(path, bf.toString());
		
		multipartFile.transferTo(file);
		
		return fileName;
	}

}
