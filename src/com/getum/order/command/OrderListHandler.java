package com.getum.order.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.auth.service.User;
import com.getum.command.CommandHandler;
import com.getum.order.service.OrderListService;

//==================================================================================================
//OrderListHandler : 3. 주문내역 보기 핸들러 
//GET 요청 : 'orderList.jsp?currentPage=1'  커런트페이지 필수
//POST 요청 : 일단 없음
//==================================================================================================
public class OrderListHandler implements CommandHandler{

		//field
			private String form_view = "/view/home/orderList.jsp";
			OrderListService orderListService = new OrderListService();
		
		
		//method
		
		//==================================================================================================
	    // process() : 핸들러 공통
	    //==================================================================================================
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res) throws Exception{
			
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
			//field
			List result = null;

			//세션 User, id획득
				User user = (User) req.getSession().getAttribute("authUser");
				String id = user.getM_id();
			
			//currentPage : GET으로 들어온 현재페이지 => 리퀘스트 저장
				int currentPage = Integer.parseInt(req.getParameter("currentPage"));

				
			//totalArticleNum : 해당 아이디 전체 주문 수 획득 => 리퀘스트 저장
				int totalArticleNum = orderListService.getTotalArticleNum(id);
			
				
			//페이지네이션
				int max = (currentPage*3)-1;
				int min = (currentPage-1)*3;
			
			//마지막 페이지일 경우 max값 보정
				if( totalArticleNum <= max ) {
					max = totalArticleNum-1;
				}
				
			//요청한 페이지 주문3건 획득 => 리퀘스트 저장
				result = orderListService.getList(id, max, min);
			
			//리퀘스트 저장 3건
				req.setAttribute("currentPage", currentPage);
				req.setAttribute("totalArticleNum", totalArticleNum);
				req.setAttribute("orderList", result);
			
			return form_view;
		}
	    //==================================================================================================
		
		
		
		//==================================================================================================
	    // processPost() : POST 처리
	    //==================================================================================================
		private String processPost(HttpServletRequest req, HttpServletResponse res) throws Exception{
			
			return form_view;
			
		}
	    //==================================================================================================	
	
}//class
