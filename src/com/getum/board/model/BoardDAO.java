package com.getum.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.getum.board.service.FreeboardReadRequest;
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
		    // addCount(Connection, long) : (공지사항) 조회수 추가
		    //==================================================================================================
		    public void addCount(Connection conn, long idx) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("update board1_notice set b1_count=b1_count+1 where b1_idx=?");
		    		pstmt.setLong(1, idx);
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addCount() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // addCount2(Connection, long) : (자유게시판) 조회수 추가
		    //==================================================================================================
		    public void addCount2(Connection conn, long idx) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("update board2_free set b2_count=b2_count+1 where b2_idx=?");
		    		pstmt.setLong(1, idx);
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addCount2() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // deleteArticle(Connection, long) : (공지사항) 삭제
		    //==================================================================================================
		    public void deleteArticle(Connection conn, long idx) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("delete from board1_notice where b1_idx=?");
		    		pstmt.setLong(1, idx);
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addCount() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // checkArticle(Connection, long) : (자유게시판) 게시물 삭제전 딸린 글이 있는지 확인
		    //==================================================================================================
		    public boolean checkArticle(Connection conn, int origin, int origin_step) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	try {
		    		pstmt = conn.prepareStatement("select count(*) from board2_free where b2_origin=? and b2_origin_step>?");
		    		pstmt.setLong(1, origin);
		    		pstmt.setLong(2, origin_step);
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			if(rs.getInt(1)>0) {
		    				return true;
		    			}else {
		    				return false;
		    			}
		    		}
		    		
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.checkArticle() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(rs!=null){rs.close();}
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    	
		    	return false;
		    	
		    }
		    //==================================================================================================
		    
		    
		    
		    
		    //==================================================================================================
		    // deleteArticle2(Connection, long) : (자유게시판) 게시물 삭제 [플래그만 변경]
		    //
		    // 0:정상글 1:자식이 딸린글 2:완전삭제
		    //==================================================================================================
		    public void deleteArticle2(Connection conn, long idx, int flag) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("update board2_free set b2_delete_flag=? where b2_idx=?");
		    		pstmt.setLong(1, flag);
		    		pstmt.setLong(2, idx);
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.deleteArticle2() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // addNoticeArticle(Connection, String[]) : (공지사항) 글 삽입
		    //==================================================================================================
		    public void addNoticeArticle(Connection conn, String[] article) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("insert into board1_notice values(null,?,?,now(),now(),0,?)");
		    		pstmt.setString(1, article[0]);
		    		pstmt.setString(2, article[1]);
		    		pstmt.setString(3, article[2]);
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addCount() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // addFreeboardArticle(Connection, long) : (자유게시판) 글 삽입
		    //==================================================================================================
		    public void addFreeboardArticle(Connection conn, String[] article) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	int num = 0;
		    	try {
		    		//최대글번호
		    		pstmt=conn.prepareStatement("select max(b2_idx) from board2_free");
                    rs=pstmt.executeQuery();
                    
                    if(rs.next()){
                        num = rs.getInt(1)+1;//최대글번호+1
                    }else {
                    	num = 1;
                    }
                    
		    		
		    		pstmt = conn.prepareStatement("insert into board2_free values(null,?,?,now(),now(),0,0,?,0,0,?)");
		    		pstmt.setString(1, article[0]); //제목
		    		pstmt.setString(2, article[1]); //내용
		    		pstmt.setInt(3, num); //origin
		    		pstmt.setString(4, article[2]); //글쓴이
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addFreeboardArticle() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // addFreeboardReply(Connection, long) : (자유게시판) 답글 삽입
		    //==================================================================================================
		    public void addFreeboardReply(Connection conn, String[] article) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	int currentPage = Integer.parseInt(article[3]);
		    	int idx = Integer.parseInt(article[4]);
		    	int origin = Integer.parseInt(article[5]);
		    	int origin_step = Integer.parseInt(article[6]);
		    	int origin_depth = Integer.parseInt(article[7]);
		    	
		    	try {
		    		
		    		//글 밀어내기
		    		String sql="update board2_free set b2_origin_step=b2_origin_step+1 where b2_origin=? and b2_origin_step>?";
		    		pstmt=conn.prepareStatement(sql);
                    pstmt.setInt(1, origin);
                    pstmt.setInt(2, origin_step);
                    pstmt.executeUpdate();//쿼리실행
                    
                    origin_step += 1;
                    origin_depth += 1;
                    
                    pstmt.close();
		    		
                    
		    		pstmt = conn.prepareStatement("insert into board2_free values(null,?,?,now(),now(),0,0,?,?,?,?)");
		    		pstmt.setString(1, article[0]); //제목
		    		pstmt.setString(2, article[1]); //내용
		    		pstmt.setInt(3, origin); //origin
		    		pstmt.setInt(4, origin_step); //origin_step
		    		pstmt.setInt(5, origin_depth); //origin_depth
		    		pstmt.setString(6, article[2]); //글쓴이
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.addFreeboardArticle() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    }
		    //==================================================================================================
		    
		    
		    
		    //==================================================================================================
		    // updateNoticeArticle(Connection, long) : (공지사항) 글 수정
		    //==================================================================================================
		    public void updateNoticeArticle(Connection conn, String[] article) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("update board1_notice set b1_subject=?, b1_content=?, m_id=?, b1_modify_date=now() where b1_idx=?");
		    		pstmt.setString(1, article[0]);
		    		pstmt.setString(2, article[1]);
		    		pstmt.setString(3, article[2]);
		    		pstmt.setLong(4, Long.parseLong(article[3]));
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.updateNoticeArticle() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    	
		    	
		    	
		    }
		    //==================================================================================================
		    
		    
		    
		    
		    
		    //==================================================================================================
		    // updateFreeboardArticle(Connection, long) : (자유게시판) 글 수정
		    //==================================================================================================
		    public void updateFreeboardArticle(Connection conn, String[] article) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("update board2_free set b2_subject=?, b2_content=?,  b2_modify_date=now() where b2_idx=?");
		    		pstmt.setString(1, article[0]);
		    		pstmt.setString(2, article[1]);
		    		pstmt.setLong(3, Long.parseLong(article[2]));
		    		pstmt.executeUpdate();
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.updateFreeboardArticle() 예외 :"+e);
		    	} finally {
		    		try{
		    			if(pstmt!=null){pstmt.close();}
		    		}catch(Exception ex2){}
		    	}
		    	
		    	
		    	
		    }
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
		    // getTotalAriticleNum2(Connection) : (자유게시판) 전체 글 갯수 가져오기
		    //==================================================================================================
		    public int getTotalArticleNum2(Connection conn) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	int result = -1;
		    	
		    	try {
		    		pstmt = conn.prepareStatement("SELECT COUNT(*) FROM board2_free");
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			result = rs.getInt(1);
		    		}//if
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.getTotalArticleNum2() 예외 :"+e);
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
		    // selectByPage2(Connection,int) : (자유게시판) 글 하나 정보 가져오기
		    //==================================================================================================
		    public FreeboardReadRequest selectByPage2(Connection conn, long idx) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	FreeboardReadRequest result = new FreeboardReadRequest();
		    	
		    	try {
		    		pstmt = conn.prepareStatement("SELECT * FROM board2_free WHERE b2_idx=?");
		    		pstmt.setLong(1, idx);
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			result.setB2_subject(rs.getString("b2_subject"));
		    			result.setB2_content(rs.getString("b2_content"));
		    			result.setB2_modify_date(rs.getTimestamp("b2_modify_date")+"");
		    			result.setB2_reg_date(rs.getTimestamp("b2_reg_date")+"");
		    			result.setB2_count(rs.getLong("b2_count"));
		    			result.setB2_origin(rs.getLong("b2_origin"));
		    			result.setB2_origin_step(rs.getLong("b2_origin_step"));
		    			result.setB2_origin_depth(rs.getLong("b2_origin_depth"));
		    			result.setM_id(rs.getString("m_id"));
		    			result.setB2_delete_flag(rs.getInt("b2_delete_flag"));
		    			
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
		    // selectByCurrentPage(Connection, int) : (공지사항) DB에서 글 10개 가져오기
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
		    
		    
		    
		    
		    
		    //==================================================================================================
		    // selectByCurrentPage(Connection, int) : (자유게시판) DB에서 글 10개 가져오기
		    //==================================================================================================
		    public List<FreeboardReadRequest> selectByCurrentPage2(Connection conn, int limitParam, int articlePerPage) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	List<FreeboardReadRequest> result = new ArrayList<FreeboardReadRequest>();
		    	
		    	
		    	try {
		    		pstmt = conn.prepareStatement("select * from board2_free order by b2_origin desc, b2_origin_step asc LIMIT ?,?");
		    		pstmt.setInt(1, limitParam);
		    		pstmt.setInt(2, articlePerPage);
		    		rs = pstmt.executeQuery();
		    		
		    		int temp = limitParam+1;
		    		
		    		while(rs.next()) {
		    			
		    			
		    			if(rs.getInt("b2_delete_flag")==0 || rs.getInt("b2_delete_flag")==1) {	
		    			
		    			FreeboardReadRequest dto = new FreeboardReadRequest();
		    			
		    			dto.setNum(temp);
		    			dto.setB2_idx(rs.getLong("b2_idx"));
		    			dto.setB2_subject(rs.getString("b2_subject"));
		    			dto.setB2_content(rs.getString("b2_content"));
		    			dto.setB2_reg_date(rs.getTimestamp("b2_reg_date")+"");
		    			dto.setB2_modify_date(rs.getTimestamp("b2_modify_date")+"");
		    			dto.setB2_count(rs.getInt("b2_count"));
		    			dto.setB2_origin(rs.getLong("b2_origin"));
		    			dto.setB2_origin_step(rs.getLong("b2_origin_step"));
		    			dto.setB2_origin_depth(rs.getLong("b2_origin_depth"));
		    			dto.setM_id(rs.getString("m_id"));
		    			if(rs.getInt("b2_delete_flag")==0) {
		    				dto.setB2_delete_flag(0);
		    			}else{
		    				dto.setB2_delete_flag(1);
		    			}//if(rs.getInt("b2_delete_flag")==0)
		    			
		    			result.add(dto);
		    			temp +=1;
		    			
		    			}//if
		    			
		    		}//while
		    		
		    	} catch (Exception e) {
		    		System.out.println("BoardDAO.selectByCurrentPage2() 예외 :"+e);
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
