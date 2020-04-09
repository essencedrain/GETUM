package com.getum.order.model;


//======================================================================================================
//배송지 DTO
//======================================================================================================
public class AddrDTO {
	
	//field
	private long a_no;
	private String a_name;
	private String a_hp;
	private String a_addr1;
	private String a_addr2;
	private String a_post;
	private String a_request;
	private boolean a_default_flag;
	private String m_id;
	private boolean a_onlyOne_flag;
	
	
	//constructor
	public AddrDTO(){}
	
	//G&S
	public long getA_no() {
		return a_no;
	}
	public void setA_no(long a_no) {
		this.a_no = a_no;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_hp() {
		return a_hp;
	}
	public void setA_hp(String a_hp) {
		this.a_hp = a_hp;
	}
	public String getA_addr1() {
		return a_addr1;
	}
	public void setA_addr1(String a_addr1) {
		this.a_addr1 = a_addr1;
	}
	public String getA_addr2() {
		return a_addr2;
	}
	public void setA_addr2(String a_addr2) {
		this.a_addr2 = a_addr2;
	}
	public String getA_post() {
		return a_post;
	}
	public void setA_post(String a_post) {
		this.a_post = a_post;
	}
	public String getA_request() {
		return a_request;
	}
	public void setA_request(String a_request) {
		this.a_request = a_request;
	}
	public boolean isA_default_flag() {
		return a_default_flag;
	}
	public void setA_default_flag(boolean a_default_flag) {
		this.a_default_flag = a_default_flag;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public boolean isA_onlyOne_flag() {
		return a_onlyOne_flag;
	}

	public void setA_onlyOne_flag(boolean a_onlyOne_flag) {
		this.a_onlyOne_flag = a_onlyOne_flag;
	}
	
	

}//class
