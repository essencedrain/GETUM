package com.getum.order.model;
//======================================================================================================
//주문상세 DTO
//======================================================================================================
public class OrderDetailDTO {

	//field
	private long od_no;
	private String od_name;
	private int od_quantity;
	private long od_price;
	private short od_status;
	private long order_id;
	private String p_uuid;
	
	//constructor
	public OrderDetailDTO(){}
	
	
	//G&S
	public long getOd_no() {
		return od_no;
	}

	public String getOd_name() {
		return od_name;
	}


	public void setOd_name(String od_name) {
		this.od_name = od_name;
	}


	public void setOd_no(long od_no) {
		this.od_no = od_no;
	}

	public int getOd_quantity() {
		return od_quantity;
	}

	public void setOd_quantity(int od_quantity) {
		this.od_quantity = od_quantity;
	}

	public long getOd_price() {
		return od_price;
	}

	public void setOd_price(long od_price) {
		this.od_price = od_price;
	}

	public short getOd_status() {
		return od_status;
	}

	public void setOd_status(short od_status) {
		this.od_status = od_status;
	}

	public long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}

	public String getP_uuid() {
		return p_uuid;
	}

	public void setP_uuid(String p_uuid) {
		this.p_uuid = p_uuid;
	}
	
	
}//class
