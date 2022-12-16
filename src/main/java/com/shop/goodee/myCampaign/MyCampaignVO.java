package com.shop.goodee.myCampaign;

import java.sql.Date;
import java.util.List;

import com.shop.goodee.item.ItemFileVO;
import com.shop.goodee.item.ItemVO;
import com.shop.goodee.seller.SellerVO;

import lombok.Data;

@Data
public class MyCampaignVO {

	private Integer missionNum;
	private Integer itemNum;
	private String id;
	private Date applyDate;
	private Date finish;
	private Integer status;
	private Integer myCam;
	
	private ItemVO itemVO;
	private SellerVO sellerVO;
	private List<ItemFileVO> itemFileVOs;
	
	//포인트 변화
	private Date finish_3;
}
