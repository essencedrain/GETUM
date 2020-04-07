package com.getum.board.service;

import java.sql.Connection;
import java.util.Hashtable;
import java.util.List;

import com.getum.board.model.BoardDAO;
import com.getum.util.DBConnection;

//==================================================================================================
//FreeboardService : 자유게시판 서비스
//==================================================================================================
public class FreeboardService {
	
	
	
	//==================================================================================================
	// doFreeboardUpdate(String[] 글) : (자유게시판) 글 수정
	//==================================================================================================
	public void doFreeboardUpdate(String[] article) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.updateFreeboardArticle(conn, article);;
			
			
			
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
    // getContent(int idx, boolean isUpdate) : 조회수 증가 + 내용보기 // 수정일떈 조회수 증가 안함
    //==================================================================================================
	public FreeboardReadRequest getContent(long idx, boolean isUpdate) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		FreeboardReadRequest result = null;
		
			try {
			
			conn = DBConnection.getCon();
			
			if(!isUpdate) {
				dao.addCount2(conn, idx);
			}
			
			result = dao.selectByPage2(conn, idx);
			
			
		} catch (Exception e) {
			System.out.println("FreeboardService.getContent() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
			
		return result;
	}
	//==================================================================================================
	
	
	//==================================================================================================
    // getFreeboardList(int currentPage) : 자유게시판 목록 보기
    //==================================================================================================
	public Hashtable getFreeboardList(int currentPage){
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		Hashtable result = new Hashtable();
		List<FreeboardReadRequest> list = null;
		
		//전체 글 갯수
		int totalArticleNum = 0;
		
		//한 페이지당 글 갯수
		int articlePerPage = 10;
		
		
		
		try {
			
			conn = DBConnection.getCon();
			
			totalArticleNum = dao.getTotalArticleNum2(conn);
			
			
			//LIMIT에 넣을 값 
			
			int limitParam = (currentPage-1) * articlePerPage;
			
			list = dao.selectByCurrentPage2(conn,limitParam,articlePerPage);
			
			
			result.put("totalArticleNum", totalArticleNum);
			result.put("boardData", list);
			
		} catch (Exception e) {
			System.out.println("FreeboardService.getFreeboardList() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
		return result;
		
	}//getList();
	//==================================================================================================
	
	
	
	//==================================================================================================
	// doFreeboardWrite(String[] 글) : (자유게시판) 글 작성
	//==================================================================================================
	public void doFreeboardWrite(String[] article) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.addFreeboardArticle(conn, article);
			
		} catch (Exception e) {
			System.out.println("FreeboardService.doFreeboardWrite() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
	// doFreeboardReply(String[] 글) : (자유게시판) 답글 작성
	//==================================================================================================
	public void doFreeboardReply(String[] article) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.addFreeboardReply(conn, article);
			
		} catch (Exception e) {
			System.out.println("FreeboardService.doFreeboardReply() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
	// doFreeboardDelete(String[] 글) : (자유게시판) 글 삭제
	//==================================================================================================
	public void doFreeboardDelete(long idx, int origin, int origin_step) {
		
		BoardDAO dao = BoardDAO.getInstance();
		Connection conn = null;
		boolean check = false; //삭제전에 답글이 딸린 글인지 확인
		
		try {
			
			conn = DBConnection.getCon();
			check = dao.checkArticle(conn, origin, origin_step);
			
			if(check) { //자식딸린글 = 1
				dao.deleteArticle2(conn, idx,1);
			}else { //아니면 완전삭제 = 2
				dao.deleteArticle2(conn, idx,2);
			}
			
			
		} catch (Exception e) {
			System.out.println("FreeboardService.doFreeboardDelete() 오류 : " + e);
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}//try
		
	}
	//==================================================================================================

}//class
