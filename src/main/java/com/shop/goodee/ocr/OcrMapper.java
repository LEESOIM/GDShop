package com.shop.goodee.ocr;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OcrMapper {
	
	public void setOcrFile(PurchaseVO ocrVO) throws Exception;

	
}
