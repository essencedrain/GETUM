package com.getum.auth.service;

import java.sql.Connection;

import com.getum.member.model.MemberDAO;
import com.getum.member.model.MemberDTO;
import com.getum.util.DBConnection;

//==================================================================================================
// LoginService : 로그인 기능
//==================================================================================================
public class LoginService {
	
	
	//==================================================================================================
    // login() : 로그인 method
    //==================================================================================================
	public User login(String id, String password) {
		
		MemberDAO dao = MemberDAO.getInstance();
		User user = null;
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			MemberDTO dto = dao.selectById(conn, id);
			
			if(dto == null) {
				//id 없음
				return null;
			}//if
			
			if(!dto.getM_pwd().equals(password)) {
				//비번 틀림
				return null;
			}//if
			
			user = new User();
			user.setM_id(dto.getM_id());
			user.setM_name(dto.getM_name());
			user.setM_point(dto.getM_point());
			user.setM_grade(dto.getM_grade());
			user.setM_email(dto.getM_email());
			
		} catch (Exception e1) {
			System.out.println("LoginService.login() 에러"+e1);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
		return user;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // 
    //==================================================================================================
    //==================================================================================================

	
}//class
