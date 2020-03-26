package com.getum.order.service;

import java.util.Hashtable;

import com.getum.cart.service.CartRequest;

//==================================================================================================
// OrderSuccessRequest : 주문 완료 창을 보여주기 위한 객체
//==================================================================================================
public class OrderSuccessRequest {

	//field
	private long r_no;
	private Hashtable<String, CartRequest> hcart;
	private String r_name;
	private String r_hp;
	private String r_addr1;
	private String r_addr2;
	private String r_post;
	private String r_request;
	private long r_total_price;
	private long r_use_point;
	private byte r_delivery_flag;
	private long r_payment;
	private short r_payment_method;
	private long r_add_point;
	
	//constructor
	public OrderSuccessRequest(){}
	
	//G&S
	public long getR_no() {
		return r_no;
	}

	public void setR_no(long r_no) {
		this.r_no = r_no;
	}

	public Hashtable<String, CartRequest> getHcart() {
		return hcart;
	}

	public void setHcart(Hashtable<String, CartRequest> hcart) {
		this.hcart = hcart;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_hp() {
		return r_hp;
	}

	public void setR_hp(String r_hp) {
		this.r_hp = r_hp;
	}

	public String getR_addr1() {
		return r_addr1;
	}

	public void setR_addr1(String r_addr1) {
		this.r_addr1 = r_addr1;
	}

	public String getR_addr2() {
		return r_addr2;
	}

	public void setR_addr2(String r_addr2) {
		this.r_addr2 = r_addr2;
	}

	public String getR_post() {
		return r_post;
	}

	public void setR_post(String r_post) {
		this.r_post = r_post;
	}

	public String getR_request() {
		return r_request;
	}

	public void setR_request(String r_request) {
		this.r_request = r_request;
	}

	public long getR_total_price() {
		return r_total_price;
	}

	public void setR_total_price(long r_total_price) {
		this.r_total_price = r_total_price;
	}

	public long getR_use_point() {
		return r_use_point;
	}

	public void setR_use_point(long r_use_point) {
		this.r_use_point = r_use_point;
	}

	public byte getR_delivery_flag() {
		return r_delivery_flag;
	}

	public void setR_delivery_flag(byte r_delivery_flag) {
		this.r_delivery_flag = r_delivery_flag;
	}

	public long getR_payment() {
		return r_payment;
	}

	public void setR_payment(long r_payment) {
		this.r_payment = r_payment;
	}

	public short getR_payment_method() {
		return r_payment_method;
	}

	public void setR_payment_method(short r_payment_method) {
		this.r_payment_method = r_payment_method;
	}

	public long getR_add_point() {
		return r_add_point;
	}

	public void setR_add_point(long r_add_point) {
		this.r_add_point = r_add_point;
	}
	
	
	
}//class
