package com.shop.goodee.item;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ItemMapper {

	public int setAdd(ItemVO itemVO) throws Exception;
	
	public int setAddFile(ItemFileVO itemFileVO) throws Exception;
	
	public List<ItemVO> getList() throws Exception;

}