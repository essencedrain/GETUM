package com.getum.board.command;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.auth.service.User;
import com.getum.board.service.FreeboardReadRequest;
import com.getum.board.service.FreeboardService;
import com.getum.command.CommandHandler;

//==================================================================================================
//FreeBoardHandler : 자유게시판 리스트 보기 / 내용 보기 핸들러 (freeBoard.get)
//굳이 핸들러를 여러개로 쪼갤 필요가 없다.
//공지사항과 다르게 CRUD 전부를 핸들러 하나로 합치고 플래그 받음
//GET 요청 : notice.jsp?currentPage=? 로 리턴 // currentPage필요
//	list : freeboard.jsp?currentPage=? 로 리턴
//	content : freeboardContent.jsp?currentPage=?&idx=?로 리턴 // 여기로 오기 위해선 currentPage, idx필요
//==================================================================================================
public class FreeBoardHandler implements CommandHandler{

	//field
	private String view_list = "freeboard.jsp?currentPage=";
	private String view_content = "freeboardContent.jsp?currentPage=";
	private FreeboardService freeboardService = new FreeboardService();
	
	
	
	//==================================================================================================
    // process() : 핸들러 공통
    //==================================================================================================
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res){
		
		if( req.getMethod().equalsIgnoreCase("GET") ) {
			return processGet(req,res);
		} else if ( req.getMethod().equalsIgnoreCase("POST") ) {
			return processPost(req,res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}//if
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
    // processGet() : GET 처리
    //==================================================================================================
	private String processGet(HttpServletRequest req, HttpServletResponse res) {
		
		String flag = req.getParameter("flag");
		
		
		
		if(flag.equals("list")) {
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			Hashtable result = freeboardService.getFreeboardList(currentPage);
			
			
			req.setAttribute("hashMap", result);
			req.setAttribute("currentPage", currentPage);
			
			
			return view_list+currentPage;
			
			
		}else if(flag.equals("content")) {
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			int idx = Integer.parseInt(req.getParameter("idx"));
			
			FreeboardReadRequest result = freeboardService.getContent(idx, false);
			
			result.setB2_idx(idx);
			
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("contentData", result);
			
			
			return view_content+currentPage+"&idx="+idx;
			
		}else if(flag.equals("write")) {
			
			return "freeboardWrite.jsp?currentPage=-1";
			
		}else if(flag.equals("reply")) {
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			int idx = Integer.parseInt(req.getParameter("idx"));
			int origin = Integer.parseInt(req.getParameter("origin"));
			int origin_step = Integer.parseInt(req.getParameter("origin_step"));
			int origin_depth = Integer.parseInt(req.getParameter("origin_depth"));
			
			
			
			return "freeboardWrite.jsp?currentPage="+currentPage+"&idx="+idx+"&origin="+origin+"&origin_step="+origin_step+"&origin_depth="+origin_depth;
		
			
		}else if(flag.equals("delete")) {
			
			long idx = Long.parseLong(req.getParameter("idx"));
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			int origin = Integer.parseInt(req.getParameter("origin"));
			int origin_step = Integer.parseInt(req.getParameter("origin_step"));
			
			freeboardService.doFreeboardDelete(idx, origin, origin_step);
			
			Hashtable result = freeboardService.getFreeboardList(1);
			
			
			req.setAttribute("hashMap", result);
			req.setAttribute("currentPage", 1);
			
			
			return view_list+1;
			
		}else if(flag.equals("update")) {
			long idx = Long.parseLong(req.getParameter("idx"));
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			
			FreeboardReadRequest result = freeboardService.getContent(idx, true);
			
			result.setB2_idx(idx);
			
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("contentData", result);
			
			return "freeboardUpdate.jsp";
			
		}//if
		
		return null;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processPost() : POST 처리
    //==================================================================================================
	private String processPost(HttpServletRequest req, HttpServletResponse res) {
		String flag = req.getParameter("flag");
		User temp = (User) req.getSession().getAttribute("authUser");
		
		String writer = temp.getM_id();
		
		if(flag.equals("write")) {
			String[] article = new String[3];
			article[0] = req.getParameter("subject");
			article[1] = req.getParameter("content");
			article[2] = writer;
			
			freeboardService.doFreeboardWrite(article);
			
			Hashtable result = freeboardService.getFreeboardList(1);
			
			
			req.setAttribute("hashMap", result);
			req.setAttribute("currentPage", 1);
			
			
			return view_list+1;
			
			
		}else if(flag.equals("reply")) {
			String[] article = new String[8];
			article[0] = req.getParameter("subject");
			article[1] = req.getParameter("content");
			article[2] = writer;
			article[3] = req.getParameter("currentPage");
			article[4] = req.getParameter("idx");
			article[5] = req.getParameter("origin");
			article[6] = req.getParameter("origin_step");
			article[7] = req.getParameter("origin_depth");
			
			freeboardService.doFreeboardReply(article);
			
			Hashtable result = freeboardService.getFreeboardList(1);
			
			
			req.setAttribute("hashMap", result);
			req.setAttribute("currentPage", 1);
			
			
			return view_list+1;
			
		}else if(flag.equals("update")) {
			String[] article = new String[3];
			article[0] = req.getParameter("subject");
			article[1] = req.getParameter("content");
			article[2] = req.getParameter("idx");

			
			freeboardService.doFreeboardUpdate(article);
			
			int currentPage = Integer.parseInt(req.getParameter("curentPage"));
			long idx = Long.parseLong(req.getParameter("idx"));
			
			
			FreeboardReadRequest result = freeboardService.getContent(idx, false);
			
			result.setB2_idx(idx);
			
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("contentData", result);
			
			
			return view_content+currentPage+"&idx="+idx;
			
		}//if
		
		return null;
	}
	//==================================================================================================

	
	
}//class
