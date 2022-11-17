package com.shop.goodee.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.shop.goodee.board.notice.NoticeMapper;
import com.shop.goodee.board.notice.NoticeVO;

@SpringBootTest
class NoticeTest {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
//	@Test
//	void getList()throws Exception {
//		
//		List<NoticeVO> list = noticeMapper.getList();
//		
//		assertEquals(0, list.size());
//	}
	
	@Test
	void setWrite()throws Exception{
		NoticeVO noticeVO = new NoticeVO();
		for(int i=0; i<100; i++) {
			noticeVO.setId("manager");
			noticeVO.setTitle("Title test"+i);
			noticeVO.setContents("Contents test"+i);
			
			noticeMapper.setWrite(noticeVO);
		}
	}
}
