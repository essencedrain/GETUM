package com.getum.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.getum.member.model.MemberDAO;
import com.getum.member.model.MemberDTO;
import com.getum.util.DBConnection;


//==================================================================================================
//JoinMemberService : 회원가입 기능
//==================================================================================================
public class JoinMemberService {

	
	
	//==================================================================================================
    // join() : 회원가입처리
	// 파라미터 : JoinMemberRequest
    //==================================================================================================
	public void join(JoinMemberRequest joinReq) {
		
		MemberDAO dao = MemberDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			MemberDTO dto = dao.selectById(conn, joinReq.getM_id());
			
			if(dto != null) {
				throw new DuplicateIdException();
			}//if
			
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
	
	
	
	//==================================================================================================
    // 
    //==================================================================================================
    //==================================================================================================
	
	
	
	//==================================================================================================
    // 
    //==================================================================================================
    //==================================================================================================
	
}//class
