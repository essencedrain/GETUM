package com.getum.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.board.service.NoticeService;
import com.getum.command.CommandHandler;


//==================================================================================================
//NoticeHandler : 공지사항 C / U / D
//GET 요청 : notice.get?flag=
//	-> write	: 글쓰기창 리턴 
//	-> update	: 업데이트창 리턴
//	-> delete	: 삭제창 리턴
//POST 요청  : post flag
//	-> write	: 글쓰기 처리
//	-> update	: 업데이트 처리
//	-> delete	: 삭제 처리
//==================================================================================================
public class NoticeHandler implements CommandHandler{
	
		//field
			private NoticeService noticeService = new NoticeService();
			private String view_notice = "notice.jsp?currentPage=";
			
			
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
			return null;
		}
	    //==================================================================================================
		
		
		
		//==================================================================================================
	    // processPost() : POST 처리
	    //==================================================================================================
		private String processPost(HttpServletRequest req, HttpServletResponse res) {
			return null;
		}
		//==================================================================================================
	
}//class
