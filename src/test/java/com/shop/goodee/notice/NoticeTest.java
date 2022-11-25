package com.shop.goodee.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.shop.goodee.board.notice.NoticeMapper;
import com.shop.goodee.board.notice.NoticeVO;
import com.shop.goodee.member.MemberMapper;
import com.shop.goodee.member.MemberService;
import com.shop.goodee.member.MemberVO;

@SpringBootTest
class NoticeTest {
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private MemberMapper memberMapper;
//	@Test
//	void getList()throws Exception {
//		
//		List<NoticeVO> list = noticeMapper.getList();
//		
//		assertEquals(0, list.size());
//	}
	
//	@Test
//	void setWrite()throws Exception{
//		NoticeVO noticeVO = new NoticeVO();
//		for(int i=0; i<100; i++) {
//			noticeVO.setId("manager");
//			noticeVO.setTitle("Title test"+i);
//			noticeVO.setContents("Contents test"+i);
//			
//			noticeMapper.setWrite(noticeVO);
//		}
//	}
	
//	@Test
//	void setJoin()throws Exception{
//		MemberVO memberVO = new MemberVO();
//		
//		for(int i=32; i<100; i++) {
//			memberVO.setId("id"+i);
//			memberVO.setPw("111");
//			memberVO.setName("name"+i);
//			memberVO.setEmail("email@"+i);
//			memberVO.setBirth("20"+i+"-11-23");
//			memberVO.setPhone("010"+i+i+i+i);
//			memberMapper.setJoin(memberVO);
//			memberMapper.setMemberRole(memberVO);
//		}
//	}
}
