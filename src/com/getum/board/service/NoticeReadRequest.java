package com.getum.board.service;

import java.sql.Timestamp;

//==================================================================================================
// NoticeReadRequest : 공지사항 리스트 보기위한 내용을 담는 객체
//==================================================================================================
public class NoticeReadRequest {
	
	private int num;
	private long b1_idx;
	private String b1_subject;
	private String b1_content;
	private String b1_reg_date;
	private int b1_count;
	
	
	//constructor
	public NoticeReadRequest(){}

	//G&S
	public String getB1_subject() {
		return b1_subject;
	}


	public void setB1_subject(String b1_subject) {
		this.b1_subject = b1_subject;
	}


	public String getB1_content() {
		return b1_content;
	}


	public void setB1_content(String b1_content) {
		this.b1_content = b1_content;
	}

	public int getB1_count() {
		return b1_count;
	}


	public void setB1_count(int b1_count) {
		this.b1_count = b1_count;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getB1_reg_date() {
		return b1_reg_date;
	}

	public void setB1_reg_date(String b1_reg_date) {
		this.b1_reg_date = b1_reg_date;
	}

	public long getB1_idx() {
		return b1_idx;
	}

	public void setB1_idx(long b1_idx) {
		this.b1_idx = b1_idx;
	}

	
	
	
	
}//class

