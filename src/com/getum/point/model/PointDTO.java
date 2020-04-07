package com.getum.point.model;


//======================================================================================================
// 포인트 DTO
//======================================================================================================
public class PointDTO {

	//field
	private long po_no;
	private byte po_usesave_flag;
	private String po_point;
	private String po_detail;
	private String po_date;
	
	//constructor
	public PointDTO(){}
	
	
	//G&S
	public long getPo_no() {
		return po_no;
	}

	public void setPo_no(long po_no) {
		this.po_no = po_no;
	}

	public byte getPo_usesave_flag() {
		return po_usesave_flag;
	}

	public void setPo_usesave_flag(byte po_usesave_flag) {
		this.po_usesave_flag = po_usesave_flag;
	}

	public String getPo_point() {
		return po_point;
	}

	public void setPo_point(String po_point) {
		this.po_point = po_point;
	}

	public String getPo_detail() {
		return po_detail;
	}

	public void setPo_detail(String po_detail) {
		this.po_detail = po_detail;
	}

	public String getPo_date() {
		return po_date;
	}

	public void setPo_date(String po_date) {
		this.po_date = po_date;
	}
	
	
	
	
}//class
