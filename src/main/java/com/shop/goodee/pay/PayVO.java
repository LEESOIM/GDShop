package com.shop.goodee.pay;

import java.sql.Date;

import lombok.Data;

@Data
public class PayVO {
	
	private String payNum;
	private String payMethod;
	private Long amount;
	private Date payDate;
	private Date cancelDate;
	private String orderNum;
	private String id;
	private String payName;
	private Date payDate2;
	private String m;
}
