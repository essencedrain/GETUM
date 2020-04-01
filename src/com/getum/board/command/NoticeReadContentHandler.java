package com.getum.board.command;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.board.service.NoticeReadContentRequest;
import com.getum.board.service.NoticeService;
import com.getum.command.CommandHandler;


//==================================================================================================
//NoticeReadContentHandler : 공지사항 내용보기 핸들러 
//GET 요청 : noticeContent.jsp?currentPage=?&idx=?로 리턴 // 여기로 오기 위해선 currentPage, idx필요
//==================================================================================================
public class NoticeReadContentHandler implements CommandHandler{
	
	//field
			private String form_view = "noticeContent.jsp?currentPage=";
			private NoticeService noticeService = new NoticeService();

		
		//==================================================================================================
	    // process() : 핸들러 공통
	    //==================================================================================================
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res){
			
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			long idx = Integer.parseInt(req.getParameter("idx"));
			
			
			NoticeReadContentRequest result = noticeService.getContent(idx);
			
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("contentData", result);
			
			
			return form_view+currentPage;
			
		}
	    //==================================================================================================
	    
	    
	
}//class
