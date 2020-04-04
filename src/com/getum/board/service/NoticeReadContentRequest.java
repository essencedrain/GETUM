package com.getum.board.service;

//==================================================================================================
//NoticeReadContentRequest : 공지사항 내용 보기위한 내용을 담는 객체
//==================================================================================================
public class NoticeReadContentRequest {

	private long b1_idx;
	private String b1_subject;
	private String b1_content;
	private String b1_reg_date;
	private String b1_modify_date;
	private long b1_count;
	private String before_subject;
	private long before_idx;
	private String after_subject;
	private long after_idx;
	
	
	//constructor
	public NoticeReadContentRequest(){}

	
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


	public String getB1_reg_date() {
		return b1_reg_date;
	}


	public void setB1_reg_date(String b1_reg_date) {
		this.b1_reg_date = b1_reg_date;
	}


	public String getB1_modify_date() {
		return b1_modify_date;
	}


	public void setB1_modify_date(String b1_modify_date) {
		this.b1_modify_date = b1_modify_date;
	}


	public long getB1_count() {
		return b1_count;
	}


	public void setB1_count(long b1_count) {
		this.b1_count = b1_count;
	}


	public String getBefore_subject() {
		return before_subject;
	}


	public void setBefore_subject(String before_subject) {
		this.before_subject = before_subject;
	}


	public long getBefore_idx() {
		return before_idx;
	}


	public void setBefore_idx(long before_idx) {
		this.before_idx = before_idx;
	}


	public String getAfter_subject() {
		return after_subject;
	}


	public void setAfter_subject(String after_subject) {
		this.after_subject = after_subject;
	}


	public long getAfter_idx() {
		return after_idx;
	}


	public void setAfter_idx(long after_idx) {
		this.after_idx = after_idx;
	}


	public long getB1_idx() {
		return b1_idx;
	}


	public void setB1_idx(long b1_idx) {
		this.b1_idx = b1_idx;
	}
	
	
	
}//class
