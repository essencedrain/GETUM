package com.getum.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.getum.board.service.NoticeReadContentRequest;
import com.getum.board.service.NoticeReadRequest;


//======================================================================================================
//게시판 DAO
//======================================================================================================
public class BoardDAO {

	
		//field
			// 싱글톤
			private static BoardDAO instance = new BoardDAO();
			
		//constructor
			private BoardDAO(){};
		
			
		//method
			//==================================================================================================
			// getInstance() : 싱글톤 객체 얻기
			//==================================================================================================
		    public static BoardDAO getInstance(){
		           return instance;
		    }//getInstance()
		    //==================================================================================================
	
		    
		    //==================================================================================================
		    // getTotalAriticleNum(Connection) : (공지사항) 전체 글 갯수 가져오기
		    //==================================================================================================
		    public int getTotalArticleNum(Connection conn) throws SQLException{
				PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	int result = -1;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("SELECT COUNT(*) FROM board1_notice");
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			result = rs.getInt(1);
		    		}//if
					
				} catch (Exception e) {
					System.out.println("BoardDAO.getTotalArticleNum() 예외 :"+e);
					return result;
				} finally {
					try{
						if(rs!=null){rs.close();}
						if(pstmt!=null){pstmt.close();}
					}catch(Exception ex2){}
				}
		    	
		    	
		    	return result;
		    	
			}
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // selectByPage(Connection,int) : (공지사항) 글 하나 정보 가져오기
		    //==================================================================================================
		    public NoticeReadContentRequest selectByPage(Connection conn, long idx) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	NoticeReadContentRequest result = new NoticeReadContentRequest();
		    	
		    	try {
		    		pstmt = conn.prepareStatement("SELECT * FROM board1_notice WHERE b1_idx=?");
		    		pstmt.setLong(1, idx);
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			
		    			result.setB1_content(rs.getString("b1_content"));
		    			result.setB1_count(rs.getLong("b1_count"));
		    			result.setB1_modify_date(rs.getTimestamp("b1_modify_date")+"");
		    			result.setB1_reg_date(rs.getTimestamp("b1_reg_date")+"");
		    			result.setB1_subject(rs.getString("b1_subject"));
		    			
		    			
		    		}//if
		    		
		    		rs.close();
		    		pstmt.close();
		    		
		    		//다음글 (애프터*비포 바뀜 헷갈려서 ㅋ)
		    		pstmt = conn.prepareStatement("select * from board1_notice WHERE b1_idx < ? order BY b1_reg_date desc limit 1");
		    		pstmt.setLong(1, idx);
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			if(rs.getLong("b1_idx")>0) {
			    			result.setBefore_idx(rs.getLong("b1_idx"));
			    			result.setBefore_subject(rs.getString("b1_subject"));
		    			}
		    		}else {
		    			result.setBefore_idx(-1);
		    		}
		    		
		    		rs.close();
		    		pstmt.close();
		    		
		    		//이전글
		    		pstmt = conn.prepareStatement("select * from board1_notice WHERE b1_idx > ? order BY b1_reg_date asc limit 1");
		    		pstmt.setLong(1, idx);
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			if(rs.getLong("b1_idx")>0) {
			    			result.setAfter_idx(rs.getLong("b1_idx"));
			    			result.setAfter_subject(rs.getString("b1_subject"));
		    			}
		    		}else {
		    			result.setAfter_idx(-1);
		    		}
		    		
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.getTotalArticleNum() 예외 :"+e);
		    		return result;
		    	} finally {
		    		try{
		    			if(rs!=null){rs.close();}
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    	
		    	
		    	return result;
		    	
		    }
		    //==================================================================================================
		    
		    
		    
		    
		    //==================================================================================================
		    // selectByCurrentPage(Connection, int) : DB에서 글 10개 가져오기
		    //==================================================================================================
		    public List<NoticeReadRequest> selectByCurrentPage(Connection conn, int limitParam, int articlePerPage) throws SQLException{
		    	
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	List<NoticeReadRequest> result = new ArrayList<NoticeReadRequest>();
		    	
		    	
		    	try {
		    		pstmt = conn.prepareStatement("select * from board1_notice order by b1_reg_date desc LIMIT ?,?");
		    		pstmt.setInt(1, limitParam);
		    		pstmt.setInt(2, articlePerPage);
		    		rs = pstmt.executeQuery();
		    		
		    		int temp = limitParam+1;
		    		
		    		while(rs.next()) {
		    		
		    			NoticeReadRequest dto = new NoticeReadRequest();
		    			
		    			dto.setNum(temp);
		    			dto.setB1_idx(rs.getLong("b1_idx"));
		    			dto.setB1_subject(rs.getString("b1_subject"));
		    			dto.setB1_content(rs.getString("b1_content"));
		    			dto.setB1_reg_date(rs.getTimestamp("b1_reg_date")+"");
		    			dto.setB1_count(rs.getInt("b1_count"));
		    			
		    			result.add(dto);
		    			temp +=1;
		    		}//if
		    		
				} catch (Exception e) {
					System.out.println("BoardDAO.selectByCurrentPage() 예외 :"+e);
					return null;
				} finally {
					try{
						if(rs!=null){rs.close();}
						if(pstmt!=null){pstmt.close();}
					}catch(Exception ex2){}
				}//try
		    	
		    	
		    	return result;
		    }
		    //==================================================================================================
		    
		    
		    
}//class
