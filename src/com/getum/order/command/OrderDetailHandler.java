package com.getum.order.command;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.order.service.OrderDetailRequest;
import com.getum.order.service.OrderDetailService;
import com.getum.order.service.OrderListRequest;

//==================================================================================================
//OrderDetailHandler : 주문상세 내역
//GET 요청 : 주문상세 내역 보여주기
//POST 요청 : 없음
//==================================================================================================
public class OrderDetailHandler implements CommandHandler{

	
	//field
		private String form_view = "/view/home/orderDetail.jsp";
		OrderDetailService orderDetailService = new OrderDetailService();
	
	//==================================================================================================
    // process() : 핸들러 공통
    //==================================================================================================
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		if( req.getMethod().equalsIgnoreCase("GET") ) {
			return processGet(req,res);
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
		Hashtable<String, OrderListRequest> map = new Hashtable<>();
		OrderDetailRequest orderContent = new OrderDetailRequest();
		
		//o_no : GET에서 들어온 주문번호 => 리퀘스트 저장
			int o_no = Integer.parseInt(req.getParameter("o_no"));
			
		//currentPage : GET에서 들어온 현재페이지 => 리퀘스트 저장
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));

		//주문 상세 내역 받아오기
			map = orderDetailService.getDetail(o_no);
		
		//주문 배송지, 결제 정보 받아오기
			orderContent = orderDetailService.getOrder(o_no);
		
			
		//리퀘스트 세팅
			req.setAttribute("o_no", o_no);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("orderDetail", map);
			req.setAttribute("orderContent", orderContent);
		
		return form_view;
	}
    //==================================================================================================
	
}//class
