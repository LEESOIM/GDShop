package com.shop.goodee.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.shop.goodee.board.notice.NoticeFileVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager extends AbstractView {
	@Value("${app.download.base}") //	D:/gdshop/
	private String base;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		NoticeFileVO noticeFileVO = (NoticeFileVO)model.get("fileVO");
		String path = (String)model.get("path");
		log.info("===========================");
		log.info("FileVO =>{}",noticeFileVO);
		log.info("===========================");
		
		File file = new File(base+path, noticeFileVO.getFileName());
		
		//한글 처리
		response.setCharacterEncoding("UTF-8");
		
		//총 파일의 크기
		response.setContentLengthLong(file.length());
		
		//다운로드시 파일의 이름을 인코딩
		String oriName = URLEncoder.encode(noticeFileVO.getOriName(),"UTF-8");
		
		//header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//HDD에서 파일을 읽고
		FileInputStream fi = new FileInputStream(file);
		//Client로 전송 준비
		OutputStream os = response.getOutputStream();
		
		//전송
		FileCopyUtils.copy(fi, os);
		
		//자원 해제
		os.close();
		fi.close();
	}
	
	
	public String saveFile(MultipartFile multipartFile, String path)throws Exception{
		// 1. 중복되지 않는 파일명 생성(UUID, Date)
		String fileName = UUID.randomUUID().toString();
		
		// 2. 확장자
		StringBuffer buffer = new StringBuffer();
		buffer.append(fileName);
		buffer.append("_");
		buffer.append(multipartFile.getOriginalFilename());
		
		// 3. 파일 저장
		File file = new File(path, buffer.toString());
		multipartFile.transferTo(file);
		
		return buffer.toString();
	}

	
	public boolean deleteFile(String path, String fileName) {
		String filename = fileName;
		File file = new File(path,filename);
		
		boolean fileDeleted = file.delete();
		return fileDeleted;
	}
}
