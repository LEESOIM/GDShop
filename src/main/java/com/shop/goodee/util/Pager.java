package com.shop.goodee.util;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class Pager {
	private Long page;
	private Long perPage;
	private Long totalPage;
	private Long startRow;
	private Long lastRow;
	private Long block;
	private Long perBlock;
	private Long startNum;
	private Long lastNum;
	private boolean pre;
	private boolean next;
	private String roleName;
	private String kind;
	private String search;
	private Long status;
	private String id;
	private Long myCam;
	private Long roleNum;
	
	public Pager() {
		this.page=1L;
		this.perPage=10L;
		this.perBlock=10L;
	}
	
	public void setRow() {
		this.startRow =  (this.getPage()-1)*this.getPerPage();
		this.lastRow = this.getPage()*this.getPerPage();
	}
	
	public void setNum(Long totalCount) {
		this.totalPage = totalCount%this.getPerPage()==0 ? totalCount/this.getPerPage() : totalCount/this.getPerPage()+1;
		Long totalBlock = totalPage%this.getPerBlock()==0 ? totalPage/this.getPerBlock() : totalPage/this.getPerBlock()+1;
		
		Long curBlock = this.getPage()%this.getPerBlock()==0 ? this.getPage()/this.getPerBlock() : this.getPage()/this.getPerBlock()+1; 
		
		this.startNum= (curBlock-1)*this.getPerBlock() + 1;
		this.lastNum= curBlock*this.getPerBlock();
		
		log.info("totalPage {}",totalPage);
		log.info("totalBlock {}",totalBlock);
		log.info("curBlock {}",curBlock);
		log.info("startNum {}",startNum);
		log.info("lastNum {}",lastNum);
		
		if(totalBlock==0) {
			this.lastNum=1L;
		}
		
		if(curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
		if(this.page>1) {
			pre=true;
		}else{
			pre=false;
		}
		
		if(curBlock<=totalBlock && page!=totalPage) {
			next=true;
		}else{
			next=false;
		}
		
	}
	
	
	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}
	
	public Long getPage() {
		if(this.page==null || this.page<=0) {
			this.page=1L;
		}
		return page;
	}
	
	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}
	
	public String getRoleName() {
		if(this.roleName==null) {
			this.roleName="";
		}
		return roleName;
	}
	
}
