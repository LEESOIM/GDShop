package com.shop.goodee.board.notice;

import java.io.Console;
import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.client.WebClientException;

import com.shop.goodee.util.FileManager;
import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private FileManager fileManager;
	@Value("${app.notice}") //	D:/gdshop/notice/
	private String path;
	
	public int setDelete(NoticeVO noticeVO)throws Exception{
		
		
		noticeVO = noticeMapper.getDetail(noticeVO);
		log.info("=================================");
		log.info("NOTICEVO => {}",noticeVO);
		log.info("=================================");
		// 기존 HDD 파일 지우기 안됨 나중에하기
		if(noticeVO.getFileName()!=null) {
			for(String filename: noticeVO.getFileName()) {
				boolean check = fileManager.deleteFile(path, filename);
				log.info("delete HDD =>{}",check);
			}
		}
		// 기존 DB 파일 지우기
		if(noticeVO.getFileNum()!=null) {
			for(Long filenum: noticeVO.getFileNum()) {
				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setFileNum(filenum);
				int r = noticeMapper.setDeleteFile(noticeFileVO);
				log.info("delete DB =>{}",r);
			}
		}
		
		// 글 삭제
		int result = noticeMapper.setDelete(noticeVO);
		return result;
	}

	public int setUpdate(NoticeVO noticeVO)throws Exception{
		// 글 수정
		int result = noticeMapper.setUpdate(noticeVO);
		// 기존 HDD 파일 지우기
		if(noticeVO.getFileName()!=null) {
			for(String filename: noticeVO.getFileName()) {
				boolean check = fileManager.deleteFile(path, filename);
				log.info("delete HDD =>{}",check);
			}
		}
		// 기존 DB 파일 지우기
		if(noticeVO.getFileNum()!=null) {
			for(Long filenum: noticeVO.getFileNum()) {
				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setFileNum(filenum);
				int r = noticeMapper.setDeleteFile(noticeFileVO);
				log.info("delete DB =>{}",r);
			}
		}
		// 새로 파일 추가
		File file = new File(path);
		
		if(!file.exists()) {
			boolean check = file.mkdirs();
		}
		
		for(MultipartFile f :noticeVO.getFiles()) {
			if(!f.isEmpty()) {
				log.info("file => {}",f.getOriginalFilename());
				// HDD에 저장
				String fileName = fileManager.saveFile(f, path);
				
				// DB에 저장
				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setNoticeNum(noticeVO.getNoticeNum());
				noticeFileVO.setFileName(fileName);
				noticeFileVO.setOriName(f.getOriginalFilename());
				noticeFileVO.setSize(f.getSize());
				noticeMapper.setFileAdd(noticeFileVO);
			}
		}
		return result;
	}
	
	public NoticeFileVO getFileDetail(NoticeFileVO noticeFileVO)throws Exception{
		return noticeMapper.getFileDetail(noticeFileVO);
	}
	
	public int setWrite(NoticeVO noticeVO)throws Exception{
		int result = noticeMapper.setWrite(noticeVO);
		
		File file = new File(path);
		
		if(!file.exists()) {
			boolean check = file.mkdirs();
		}
		
		for(MultipartFile f :noticeVO.getFiles()) {
			if(!f.isEmpty()) {
				log.info("file => {}",f.getOriginalFilename());
				// HDD에 저장
				String fileName = fileManager.saveFile(f, path);
				
				// DB에 저장
				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setNoticeNum(noticeVO.getNoticeNum());
				noticeFileVO.setFileName(fileName);
				noticeFileVO.setOriName(f.getOriginalFilename());
				noticeFileVO.setSize(f.getSize());
				noticeMapper.setFileAdd(noticeFileVO);
			}
		}
		return result;
	}
	
	public NoticeVO getDetail(NoticeVO noticeVO)throws Exception{
		return noticeMapper.getDetail(noticeVO);
	}
	
	public List<NoticeVO> getList(Pager pager)throws Exception{
		Long totalCount = noticeMapper.getTotalCount();
		pager.setRow();
		pager.setNum(totalCount);
		
		return noticeMapper.getList(pager);
	};
}
