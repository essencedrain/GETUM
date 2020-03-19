package com.getum.member.service;

import java.sql.Connection;

import com.getum.member.model.MemberDAO;
import com.getum.util.DBConnection;


//==================================================================================================
//JoinMemberService : 회원가입 기능
//==================================================================================================
public class JoinMemberService {

	
	
	//==================================================================================================
    // join(JoinMemberRequest) : 회원가입처리
    //==================================================================================================
	public void join(JoinMemberRequest joinReq) {
		
		MemberDAO dao = MemberDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			dao.insert(conn, joinReq);
			
		} catch (Exception e1) {
			System.out.println("JoinMemberService.join() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
	}
    //==================================================================================================
	
	
}//class
