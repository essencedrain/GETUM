package com.getum.member.service;

import java.sql.Date;


//==================================================================================================
// JoinMemberRequest : 폼으로부터 회원가입에 필요한 데이터를 담는 객체
//==================================================================================================
public class JoinMemberRequest {
	
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_hp;
	private Date m_birthday;
	
	
	//g&s
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_hp() {
		return m_hp;
	}
	public void setM_hp(String m_hp) {
		this.m_hp = m_hp;
	}
	public Date getM_birthday() {
		return m_birthday;
	}
	public void setM_birthday(Date m_birthday) {
		this.m_birthday = m_birthday;
	}
	
	
	
}//class
