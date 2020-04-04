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
    // getContent(int idx, boolean isUpdate) : 조회수 증가 + 내용보기 // 수정일떈 조회수 증가 안함
    //==================================================================================================
	public NoticeReadContentRequest getContent(long idx, boolean isUpdate) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		NoticeReadContentRequest result = null;
		
			try {
			
			conn = DBConnection.getCon();
			
			if(!isUpdate) {
				dao.addCount(conn, idx);
			}
			
			result = dao.selectByPage(conn, idx);
			
			
		} catch (Exception e) {
			System.out.println("NoticeService.getContent() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
			
		return result;
	}
	//==================================================================================================

	
	
	//==================================================================================================
	// doNoticeWrite(String[] 글) : (공지사항) 글 작성
	//==================================================================================================
	public void doNoticeWrite(String[] article) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.addNoticeArticle(conn, article);
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeService.doNoticeWrite() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================
	
	
	//==================================================================================================
	// doNoticeDelete(String[] 글) : (공지사항) 글 삭제
	//==================================================================================================
	public void doNoticeDelete(long idx) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.deleteArticle(conn, idx);
			
		} catch (Exception e) {
			System.out.println("NoticeService.doNoticeDelete() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
	// doNoticeUpdate(String[] 글) : (공지사항) 글 수정
	//==================================================================================================
	public void doNoticeUpdate(String[] article) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.updateNoticeArticle(conn, article);
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeService.doNoticeUpdate() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================
	
	
	
	
	//==================================================================================================
    // getNoticeList(int currentPage) : 공지사항 목록 보기
    //==================================================================================================
	public Hashtable getNoticeList(int currentPage){
		
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
