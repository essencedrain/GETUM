package com.getum.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.auth.service.User;
import com.getum.board.service.NoticeReadContentRequest;
import com.getum.board.service.NoticeService;
import com.getum.command.CommandHandler;


//==================================================================================================
//NoticeHandler : 공지사항 C / U / D
//GET 요청 : notice.get?flag=
//	-> write	: 글쓰기창 리턴 
//	-> update	: 업데이트창 리턴
//	-> delete	: 삭제창 처리
//POST 요청  : post flag
//	-> write	: 글쓰기 처리
//	-> update	: 업데이트 처리
//==================================================================================================
public class NoticeHandler implements CommandHandler{
	
		//field
			private NoticeService noticeService = new NoticeService();
			private String view_notice = "notice.get?currentPage=";
			
			
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
			
			if(flag.equals("write")) {
				return "noticeWrite.jsp";
			
			}else if(flag.equals("update")) {
				long idx = Long.parseLong(req.getParameter("idx"));
				int currentPage = Integer.parseInt(req.getParameter("currentPage"));
				
				NoticeReadContentRequest result = noticeService.getContent(idx, true);
				
				result.setB1_idx(idx);
				
				req.setAttribute("currentPage", currentPage);
				req.setAttribute("contentData", result);
				
				return "noticeUpdate.jsp";
				
			}else if(flag.equals("delete")) {
				long idx = Long.parseLong(req.getParameter("idx"));
				int currentPage = Integer.parseInt(req.getParameter("currentPage"));
				
				noticeService.doNoticeDelete(idx);
				
			}
			
			return view_notice+1;
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
				
				noticeService.doNoticeWrite(article);
				
				return view_notice+1;
				
			}else if(flag.equals("update")) {
				String[] article = new String[4];
				article[0] = req.getParameter("subject");
				article[1] = req.getParameter("content");
				article[2] = writer;
				article[3] = req.getParameter("idx");
				
				noticeService.doNoticeUpdate(article);
				
				
				int currentPage = Integer.parseInt(req.getParameter("curentPage"));
				long idx = Long.parseLong(req.getParameter("idx"));
				
				
				return "noticeContent.get?currentPage="+currentPage+"&idx="+idx;
			}
			return view_notice+1;
		}
		//==================================================================================================
	
}//class
