package com.getum.order.model;

import java.sql.Timestamp;

//======================================================================================================
//주문 DTO
//======================================================================================================
public class OrderDTO {

	
	//field
	private long o_no;
	private short o_status;
	private Timestamp o_order_date;
	private long o_total_price;
	private long o_use_point;
	private byte o_delivery_flag;
	private long o_payment;
	private short o_payment_method;
	private long o_add_point;
	private String o_name;
	private String o_hp;
	private String o_addr1;
	private String o_addr2;
	private String o_post;
	private String o_request;
	private String m_id;
	
	//consturctor
	public OrderDTO(){}
	
	//G&S
	public long getO_no() {
		return o_no;
	}

	public void setO_no(long o_no) {
		this.o_no = o_no;
	}

	public short getO_status() {
		return o_status;
	}

	public void setO_status(short o_status) {
		this.o_status = o_status;
	}

	public Timestamp getO_order_date() {
		return o_order_date;
	}

	public void setO_order_date(Timestamp o_order_date) {
		this.o_order_date = o_order_date;
	}
	public long getO_total_price() {
		return o_total_price;
	}

	public void setO_total_price(long o_total_price) {
		this.o_total_price = o_total_price;
	}

	public long getO_use_point() {
		return o_use_point;
	}

	public void setO_use_point(long o_use_point) {
		this.o_use_point = o_use_point;
	}

	public byte getO_delivery_flag() {
		return o_delivery_flag;
	}

	public void setO_delivery_flag(byte o_delivery_flag) {
		this.o_delivery_flag = o_delivery_flag;
	}

	public long getO_payment() {
		return o_payment;
	}

	public void setO_payment(long o_payment) {
		this.o_payment = o_payment;
	}

	public short getO_payment_method() {
		return o_payment_method;
	}

	public void setO_payment_method(short o_payment_method) {
		this.o_payment_method = o_payment_method;
	}

	public long getO_add_point() {
		return o_add_point;
	}

	public void setO_add_point(long o_add_point) {
		this.o_add_point = o_add_point;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_hp() {
		return o_hp;
	}

	public void setO_hp(String o_hp) {
		this.o_hp = o_hp;
	}

	public String getO_addr1() {
		return o_addr1;
	}

	public void setO_addr1(String o_addr1) {
		this.o_addr1 = o_addr1;
	}

	public String getO_addr2() {
		return o_addr2;
	}

	public void setO_addr2(String o_addr2) {
		this.o_addr2 = o_addr2;
	}

	public String getO_post() {
		return o_post;
	}

	public void setO_post(String o_post) {
		this.o_post = o_post;
	}

	public String getO_request() {
		return o_request;
	}

	public void setO_request(String o_request) {
		this.o_request = o_request;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}//class
