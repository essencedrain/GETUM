package com.getum.board.command;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.board.service.NoticeService;
import com.getum.command.CommandHandler;


//==================================================================================================
//NoticeReadHandler : 공지사항 리스트 보기 핸들러 
//GET 요청 : notice.jsp?currentPage=?로 리턴 // currentPage필요
//==================================================================================================
public class NoticeReadHandler implements CommandHandler{
	
		//field
			private String form_view = "notice.jsp?currentPage=";
			private NoticeService noticeService = new NoticeService();

		
		//==================================================================================================
	    // process() : 핸들러 공통
	    //==================================================================================================
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res){
			
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			
			Hashtable result = noticeService.getNoticeList(currentPage);
			
			
			
			req.setAttribute("hashMap", result);
			req.setAttribute("currentPage", currentPage);
			
			
			return form_view+currentPage;
			
		}
	    //==================================================================================================
	    
	
}//class
