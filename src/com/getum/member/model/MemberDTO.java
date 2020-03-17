package com.getum.member.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDTO {
	//field
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_hp;
	private long m_point;
	private Timestamp m_join_date;
	private Date m_birthday;
	private short m_grade;
	private byte m_withdraw_flag;
	
	//constructor
	public MemberDTO(
					String m_id,
					String m_pwd,
					String m_name,
					String m_email,
					String m_hp,
					long m_point,
					Timestamp m_join_date,
					Date m_birthday,
					short m_grade,
					byte m_withdraw_flag
										){
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_hp = m_hp;
		this.m_point = m_point;
		this.m_join_date = m_join_date;
		this.m_birthday = m_birthday;
		this.m_grade = m_grade;
		this.m_withdraw_flag = m_withdraw_flag;
				
	}
	
	//method
	
	//비번확인
	public boolean matchPassword(String pwd) {
		return m_pwd.equals(pwd);
	}
	
	
	//아래는 게터세터
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

	public long getM_point() {
		return m_point;
	}

	public void setM_point(long m_point) {
		this.m_point = m_point;
	}

	public Timestamp getM_join_date() {
		return m_join_date;
	}

	public void setM_join_date(Timestamp m_join_date) {
		this.m_join_date = m_join_date;
	}

	public Date getM_birthday() {
		return m_birthday;
	}

	public void setM_birthday(Date m_birthday) {
		this.m_birthday = m_birthday;
	}

	public short getM_grade() {
		return m_grade;
	}

	public void setM_grade(short m_grade) {
		this.m_grade = m_grade;
	}

	public byte getM_withdraw_flag() {
		return m_withdraw_flag;
	}

	public void setM_withdraw_flag(byte m_withdraw_flag) {
		this.m_withdraw_flag = m_withdraw_flag;
	}
	
	
}//class
