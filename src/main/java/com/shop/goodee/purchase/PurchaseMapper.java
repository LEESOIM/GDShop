package com.shop.goodee.purchase;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PurchaseMapper {
	
	public void setPurchaseFile(PurchaseVO purchaseVO) throws Exception;

	
}
