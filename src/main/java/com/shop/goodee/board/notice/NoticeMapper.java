package com.shop.goodee.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.util.Pager;

@Mapper
public interface NoticeMapper {
	public List<NoticeVO>  getList(Pager pager) throws Exception;
	public int setWrite(NoticeVO noticeVO)throws Exception;
	public Long getTotalCount()throws Exception;
}
