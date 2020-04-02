package com.getum.board.service;

import java.sql.Connection;
import java.util.Hashtable;
import java.util.List;

import com.getum.board.model.BoardDAO;
import com.getum.util.DBConnection;

//==================================================================================================
//NoticeReadService : 공지사항 목록 읽기 서비스
//==================================================================================================
public class NoticeService {

	
	
	//==================================================================================================
    // getContent(int idx) : 상품목록 보기 method
    //==================================================================================================
	public NoticeReadContentRequest getContent(long idx) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		NoticeReadContentRequest result = null;
		
			try {
			
			conn = DBConnection.getCon();
			
			result = dao.selectByPage(conn, idx);
			
			
		} catch (Exception e) {
			System.out.println("NoticeService.getList() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
			
		return result;
	}
	//==================================================================================================
	
	
	//==================================================================================================
    // getList(int currentPage) : 상품목록 보기 method
    //==================================================================================================
	public Hashtable getList(int currentPage){
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		Hashtable result = new Hashtable();
		List<NoticeReadRequest> list = null;
		
		//전체 글 갯수
		int totalArticleNum = 0;
		
		//한 페이지당 글 갯수
		int articlePerPage = 10;
		
		
		
		try {
			
			conn = DBConnection.getCon();
			
			totalArticleNum = dao.getTotalArticleNum(conn);
			
			
			//LIMIT에 넣을 값 
			
			int limitParam = (currentPage-1) * articlePerPage;
			
			list = dao.selectByCurrentPage(conn,limitParam,articlePerPage);
			
			
			result.put("totalArticleNum", totalArticleNum);
			result.put("boardData", list);
			
		} catch (Exception e) {
			System.out.println("NoticeService.getList() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
		return result;
		
	}//getList();
	//==================================================================================================
	
	
}//class
