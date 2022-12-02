package com.shop.goodee.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.shop.goodee.board.notice.NoticeMapper;
import com.shop.goodee.board.notice.NoticeVO;
import com.shop.goodee.item.ItemMapper;
import com.shop.goodee.item.ItemVO;
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
	@Autowired
	private ItemMapper itemMapper;
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
	
//	@Test
//	void setSeller()throws Exception{
//		SellerVO sellerVO = new SellerVO();
//		
//		for(int i=20; i<30; i++) {
//			sellerVO.setId("seller"+i);
//			sellerVO.setCompany("company"+i);
//			sellerVO.setStatus(true);
//			sellerMapper.setSellerAdd(sellerVO);
//		}
//	}
//	
//	
//	@Test
//	void setAdd()throws Exception{
//		ItemVO itemVO = new ItemVO();
//		
//		for(int i=20; i<30; i++) {
//			itemVO.setId("seller"+i);
//			itemVO.setItemName("item"+i);
//			itemVO.setPrice(2000L);
//			itemVO.setTitle("title"+i);
//			itemVO.setType("즉석추첨형");
//			itemVO.setPoint(90L);
//			itemVO.setDetail("detail"+i);
//			itemVO.setStock(110L);
//			itemVO.setCount(100L);
//			itemVO.setStatus(3L);
//			itemVO.setUrl("http://localhost:81/admin/product_request");
//			itemVO.setShop("네이버");
//			itemMapper.setAdd(itemVO);
//		}
//	}
}
