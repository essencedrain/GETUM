package com.getum.order.service;


//==================================================================================================
//OrderListRequest : 주문 내역 창을 보여주기 위한 객체
//==================================================================================================
public class OrderListRequest {

	//field
	private String name;
	private String imgName;
	private long price;
	private String status;
	
	//constructor
	public OrderListRequest(){}
	
	
	//G&S
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	

	
	
	
}//class
