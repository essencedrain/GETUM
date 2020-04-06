package com.getum.board.service;


//==================================================================================================
//FreeboardReadRequest : 자유게시판 리스트 보기위한 내용을 담는 객체
//==================================================================================================
public class FreeboardReadRequest {

	private long num; //게시판에 보여질 연번
	private long b2_idx;
	private String b2_subject;
	private String b2_content;
	private String b2_reg_date;
	private String b2_modify_date;
	private long b2_count;
	private int b2_delete_flag;
	private long b2_origin;
	private long b2_origin_step;
	private long b2_origin_depth;
	private String m_id;
	
	
	//constructor
	public FreeboardReadRequest(){}

	
	//G&S
	public long getNum() {
		return num;
	}


	public void setNum(long num) {
		this.num = num;
	}


	public long getB2_idx() {
		return b2_idx;
	}


	public void setB2_idx(long b2_idx) {
		this.b2_idx = b2_idx;
	}


	public String getB2_subject() {
		return b2_subject;
	}


	public void setB2_subject(String b2_subject) {
		this.b2_subject = b2_subject;
	}


	public String getB2_content() {
		return b2_content;
	}


	public void setB2_content(String b2_content) {
		this.b2_content = b2_content;
	}


	public String getB2_reg_date() {
		return b2_reg_date;
	}


	public void setB2_reg_date(String b2_reg_date) {
		this.b2_reg_date = b2_reg_date;
	}


	public String getB2_modify_date() {
		return b2_modify_date;
	}


	public void setB2_modify_date(String b2_modify_date) {
		this.b2_modify_date = b2_modify_date;
	}


	public long getB2_count() {
		return b2_count;
	}


	public void setB2_count(long b2_count) {
		this.b2_count = b2_count;
	}


	public long getB2_origin() {
		return b2_origin;
	}


	public void setB2_origin(long b2_origin) {
		this.b2_origin = b2_origin;
	}


	public long getB2_origin_step() {
		return b2_origin_step;
	}


	public void setB2_origin_step(long b2_origin_step) {
		this.b2_origin_step = b2_origin_step;
	}


	public long getB2_origin_depth() {
		return b2_origin_depth;
	}


	public void setB2_origin_depth(long b2_origin_depth) {
		this.b2_origin_depth = b2_origin_depth;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getB2_delete_flag() {
		return b2_delete_flag;
	}


	public void setB2_delete_flag(int b2_delete_flag) {
		this.b2_delete_flag = b2_delete_flag;
	}
	
	
	
	
	
}//class

