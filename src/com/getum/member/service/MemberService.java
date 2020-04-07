package com.getum.member.service;

import java.sql.Connection;
import java.util.List;

import com.getum.member.model.MemberDAO;
import com.getum.member.model.MemberDTO;
import com.getum.point.model.PointDAO;
import com.getum.point.model.PointDTO;
import com.getum.util.DBConnection;


//==================================================================================================
//MemberService : 회원관리 기능
//==================================================================================================
public class MemberService {

	
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
			System.out.println("MemberService.join() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
	}
    //==================================================================================================
	
	
	//==================================================================================================
    // getMember(JoinMemberRequest) : (마이페이지용) 회원정보 가져오기
    //==================================================================================================
	public MemberDTO getMember(String id) {
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = null;
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			dto = dao.selectById(conn, id);
			
		} catch (Exception e1) {
			System.out.println("MemberService.getMember() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
		
		return dto;
		
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
	// getPoint(JoinMemberRequest) : (마이페이지용) 포인트내역 가져오기
	//==================================================================================================
	public List<PointDTO> getPoint(String id) {
		
		PointDAO pointDao = PointDAO.getInstance();
		List<PointDTO> result = null;
		Connection conn = null;
		//전체 포인트내역 갯수
		int totalArticleNum = 0;
		
		
		try {
			conn = DBConnection.getCon();
			
			result = pointDao.getPointDetail(conn, id);
			
		} catch (Exception e1) {
			System.out.println("MemberService.getMember() 에러"+e1);
		} finally {
			try{
				if(conn!=null){conn.close();}
			}catch(Exception e2){}
		}//try
		
		return result;
		
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
	// updateMypage(MemberDTO) : (마이페이지용) 회원정보수정
	//==================================================================================================
	public void updateMypage(MemberDTO dto) {
		
		MemberDAO dao = MemberDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			dao.updateMypage(conn, dto);
			
		} catch (Exception e1) {
			System.out.println("MemberService.updateMypage() 에러"+e1);
		} finally {
			try{
				if(conn!=null){conn.close();}
			}catch(Exception e2){}
		}//try
		
	}
	//==================================================================================================
	
	
	
}//class
