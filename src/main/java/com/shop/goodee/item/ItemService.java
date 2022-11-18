package com.shop.goodee.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemService {
	
	@Autowired
	private ItemMapper itemMapper;
	
	public int setAdd(ItemVO itemVO) throws Exception {
		return itemMapper.setAdd(itemVO);
	}
	
	public ItemVO getList() throws Exception {
		return itemMapper.getList();
	}
}
