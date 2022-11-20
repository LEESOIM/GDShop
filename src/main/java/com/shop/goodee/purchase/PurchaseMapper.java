package com.shop.goodee.purchase;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PurchaseMapper {
	
	public void setOcrFile(PurchaseVO ocrVO) throws Exception;

	
}
