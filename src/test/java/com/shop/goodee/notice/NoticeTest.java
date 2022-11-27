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
import com.shop.goodee.seller.SellerMapper;
import com.shop.goodee.seller.SellerVO;

@SpringBootTest
class NoticeTest {
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private SellerMapper sellerMapper;
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
//			noticeVO.setId("admin");
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
	
//	@Test
//	void setSeller()throws Exception{
//		SellerVO sellerVO = new SellerVO();
//		
//		for(int i=32; i<80; i++) {
//			sellerVO.setId("id"+i);
//			sellerVO.setRoleNum(4);
//			sellerVO.setCompany("test"+i);
//
//			sellerMapper.setSellerAdd(sellerVO);
//		}
//	}
}
