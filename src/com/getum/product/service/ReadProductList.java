package com.getum.product.service;


//==================================================================================================
// ReadProductList : 상품목록에서 필요한 데이터만 담는 객체
//==================================================================================================
public class ReadProductList {
	
	//field 6개
	private String p_uuid;
	private String p_imgName;
	private String p_name;
	private String p_price;
	private String[] p_category;
	private String[] p_category_en;
	
	
	//g&s
	
	public String getP_uuid() {
		return p_uuid;
	}
	public void setP_uuid(String p_uuid) {
		this.p_uuid = p_uuid;
	}
	public String getP_imgName() {
		return p_imgName;
	}
	public void setP_imgName(String p_imgName) {
		this.p_imgName = p_imgName;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String[] getP_category() {
		return p_category;
	}
	public void setP_category(String[] p_category) {
		this.p_category = p_category;
	}
	public String[] getP_category_en() {
		return p_category_en;
	}
	public void setP_category_en(String[] p_category_en) {
		this.p_category_en = p_category_en;
	}
	
	
	
	
}//class
