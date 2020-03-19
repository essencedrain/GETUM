package com.getum.auth.service;


//==================================================================================================
// User : 로그인한 사용자 정보를 세션에 담을 객체
//==================================================================================================
public class User {

	private String m_id;
	private String m_name;
	private Long m_point;
	private short m_grade;
	
	//constructor
	public User(){}
	
	
	//G&S

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public Long getM_point() {
		return m_point;
	}

	public void setM_point(Long m_point) {
		this.m_point = m_point;
	}

	public short getM_grade() {
		return m_grade;
	}

	public void setM_grade(short m_grade) {
		this.m_grade = m_grade;
	}
	
		
	
	
	
	
}//class
