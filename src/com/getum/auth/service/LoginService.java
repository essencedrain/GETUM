package com.getum.auth.service;

import java.security.MessageDigest;
import java.sql.Connection;

import com.getum.member.model.MemberDAO;
import com.getum.member.model.MemberDTO;
import com.getum.util.DBConnection;

//==================================================================================================
// LoginService : 로그인 기능
//==================================================================================================
public class LoginService {
	
	
	//==================================================================================================
    // login() : 로그인 method  SHA256, slated
    //==================================================================================================
	public User login(String id, String password) {
		
		MemberDAO dao = MemberDAO.getInstance();
		User user = null;
		Connection conn = null;
		String saltedPass = "ypl"+password;
		String resultPass = null;
		
		try {
			conn = DBConnection.getCon();
			MemberDTO dto = dao.selectById(conn, id);
			
			if(dto == null) {
				//id 없음
				return null;
			}else if(dto.getM_withdraw_flag()==1) {
				//탈퇴한 아이디
				return null;
			}//if
			
			try {
	            MessageDigest digest = MessageDigest.getInstance("SHA-256");
	            byte[] hash = digest.digest(saltedPass.getBytes("UTF-8"));

	            StringBuilder hexString = new StringBuilder();
	            for (int i: hash) {
	            	if(Integer.toHexString(0xFF & i).length() == 2) {
	                    hexString.append(Integer.toHexString(0xFF & i));
	            	}else {
	                    hexString.append ( 0x00 + Integer.toHexString(0xFF & i));
	            	}
	            }
	            resultPass = hexString+"";
	        } catch (Exception e) {
	            System.out.println("비밀번호 해시처리 에러: "+e);
	        }
			
			
			if(!dto.getM_pwd().equals(resultPass)) {
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
