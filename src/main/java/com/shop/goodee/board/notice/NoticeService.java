package com.shop.goodee.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goodee.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<NoticeVO> getList(Pager pager)throws Exception{
		
		Long totalCount = noticeMapper.getTotalCount();
		
		pager.setRow();
		pager.setNum(totalCount);
		
		return noticeMapper.getList(pager);
	};
}
