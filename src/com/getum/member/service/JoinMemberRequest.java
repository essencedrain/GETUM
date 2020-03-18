package com.getum.member.service;

import java.sql.Date;
import java.util.Map;


//==================================================================================================
// JoinMemberRequest : 폼으로부터 회원가입에 필요한 데이터를 담는 객체
//==================================================================================================
public class JoinMemberRequest {
	
	private String m_id;
	private String m_pwd;
	private String m_pwd2;
	private String m_name;
	private String m_email;
	private String m_hp;
	private Date m_birthday;
	
	
	//method
	
	//==================================================================================================
    // isPasswordEqualToConfirm() : 비번확인
	// return 불린
    //==================================================================================================
	public boolean isPasswordEqualToConfirm() {
		return m_pwd != null && m_pwd.equals(m_pwd2);
	}//isPasswordEqualToConfirm()
    //==================================================================================================
	
	
	
	//==================================================================================================
    // validate() : 유효성확인
    //==================================================================================================
	public void validate(Map<String, Boolean> errors) {
		
		checkEmpty(errors, m_id, "m_id");
		checkEmpty(errors, m_pwd, "m_pwd");
		checkEmpty(errors, m_pwd2, "m_pwd2");
		checkEmpty(errors, m_name, "m_name");
		checkEmpty(errors, m_email, "m_email");
		checkEmpty(errors, m_hp, "m_hp");
		checkEmpty2(errors, m_birthday, "m_birthday");
		
		if(errors.containsKey("m_pwd2")) {
			
		}//if
		
	}//validate()
    //==================================================================================================	
	

	
	//==================================================================================================
    // checkEmpty() : 이 JoinMemberRequest 클래스의 필드(파라미터론 value)가 비어있는지 확인함
	// 				  비어있으면 같이 넘어온 errors MAP에 해당 변수를 키로 TRUE 추가
    //==================================================================================================
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		
		if( value == null || value.isEmpty() ) {
			errors.put(fieldName, Boolean.TRUE);
		}//if
		
	}//checkEmpty()
    //==================================================================================================
	
	
	
	//==================================================================================================
	// checkEmpty2() : checkEmpty의 DATE 버전
	//==================================================================================================
	private void checkEmpty2(Map<String, Boolean> errors, Date value, String fieldName) {
		
		if( value == null ) {
			errors.put(fieldName, Boolean.TRUE);
		}//if
		
	}//checkEmpty()
	//==================================================================================================
	
	
	
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
	public String getM_pwd2() {
		return m_pwd;
	}
	public void setM_pwd2(String m_pwd2) {
		this.m_pwd = m_pwd2;
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
