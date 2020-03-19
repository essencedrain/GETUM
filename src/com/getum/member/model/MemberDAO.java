package com.getum.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.getum.member.service.JoinMemberRequest;


//======================================================================================================
//회원 DAO
//======================================================================================================
public class MemberDAO {
	//field
		// 싱글톤
	    private static MemberDAO instance = new MemberDAO();//객체생성
	
	    
	    
	//constructor
	private MemberDAO(){}
	
	//method
		//==================================================================================================
		// getInstance() : 싱글톤 객체 얻기
		//==================================================================================================
	    public static MemberDAO getInstance(){
	           return instance;
	    }//getInstance()
	    //==================================================================================================
		
	    
	    
	    //==================================================================================================
	    // selectById(Connection, String) : 회원 정보 가져오기
	    //==================================================================================================
	    public MemberDTO selectById(Connection conn, String id) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	MemberDTO memberDTO = new MemberDTO();
	    	
	    	try {
				pstmt = conn.prepareStatement("select * from member where m_id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					
					memberDTO.setM_id(rs.getString("m_id"));
					memberDTO.setM_pwd(rs.getString("m_pwd"));
					memberDTO.setM_name(rs.getString("m_name"));
					memberDTO.setM_email(rs.getString("m_email"));
					memberDTO.setM_point(rs.getLong("m_point"));
					memberDTO.setM_join_date(rs.getTimestamp("m_join_date"));
					memberDTO.setM_birthday(rs.getDate("m_birthday"));
					memberDTO.setM_grade(rs.getShort("m_grade"));
					memberDTO.setM_withdraw_flag(rs.getByte("m_withdraw_flag"));
					
				}//if
				
			} catch (Exception e) {
				System.out.println("MemberDAO.selectById() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	return memberDTO;
	    	
	    }//selectById()
	    //==================================================================================================
	    
	    
	    //==================================================================================================
	    // insert(Connection, JoinMemberRequest) : 회원정보 삽입
	    //==================================================================================================
	    public void insert(Connection conn, JoinMemberRequest mem) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	try {
				pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,0,NOW(),?,0,0)");
				
				pstmt.setString(1, mem.getM_id());
				pstmt.setString(2, mem.getM_pwd());
				pstmt.setString(3, mem.getM_name());
				pstmt.setString(4, mem.getM_email());
				pstmt.setString(5, mem.getM_hp());
				pstmt.setDate(6, mem.getM_birthday());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("MemberDAO.insert() 예외 :"+e);
			}finally {
				try{
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    }//insert()
	    //==================================================================================================
	    
	    
	    
	    //==================================================================================================
	    // confirmId(Connection, String) : 아이디 중복확인 (1 = 중복 / -1 = 사용가능)
	    //==================================================================================================
	    public int confirmId(Connection conn, String id) throws SQLException{
	    	int result = 0;
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	
	    	try {
	    		
	    		pstmt = conn.prepareStatement("select m_id from member where m_id=?");
	    		pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()){
	                result = 1; //사용중인 id
	            }else{
	                result = -1; //사용가능한 id
	            }
	    		
			} catch (Exception e) {
				System.out.println("confirmId() 예외 :"+e);
			}finally {
				try{
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	return result;
	    }
	    //==================================================================================================
	    
	    
	    
	    //==================================================================================================
	    // 
	    //==================================================================================================
	    //==================================================================================================
	    
	    
}//class