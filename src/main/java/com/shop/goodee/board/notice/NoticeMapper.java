package com.shop.goodee.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.goodee.util.Pager;

@Mapper
public interface NoticeMapper {
	public int setDelete(NoticeVO noticeVO)throws Exception;
	public int setDeleteFile(NoticeFileVO noticeFileVO) throws Exception;
	public int setUpdate(NoticeVO noticeVO)throws Exception;
	public NoticeFileVO getFileDetail(NoticeFileVO noticeFileVO)throws Exception;
	public int setFileAdd(NoticeFileVO noticeFileVO)throws Exception;
	public int setWrite(NoticeVO noticeVO)throws Exception;
	public NoticeVO getDetail(NoticeVO noticeVO)throws Exception;
	public List<NoticeVO>  getList(Pager pager) throws Exception;
	public Long getTotalCount()throws Exception;
}
