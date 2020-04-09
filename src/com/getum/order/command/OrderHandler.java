package com.getum.order.command;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.auth.service.User;
import com.getum.cart.service.CartRequest;
import com.getum.command.CommandHandler;
import com.getum.order.model.OrderDTO;
import com.getum.order.service.OrderService;
import com.getum.order.service.OrderSuccessRequest;

//==================================================================================================
//OrderHandler : 2. 결제 핸들러
//GET 요청 : 없음
//POST 요청 : oderlist / order_detail - 주문 등록
//			: member - 포인트추가
//			: product - 재고감소
//			: point - 적립내역 추가, 사용내역 추가
//==================================================================================================
public class OrderHandler implements CommandHandler{
	
	
	//field
		private String form_view = "/view/home/orderSuccess.jsp";
		private OrderService os = new OrderService();
	
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
    // processGet() : GET 처리 ===> 에러페이지 소환
    //==================================================================================================
	private String processGet(HttpServletRequest req, HttpServletResponse res) {
		res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return null;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processPost() : POST 처리
    //==================================================================================================
	private String processPost(HttpServletRequest req, HttpServletResponse res) {
		
		String flag = req.getParameter("flag");
		
		//form에서 넘어온 자료 처리
		OrderDTO dto = new OrderDTO();
		dto.setO_total_price(Long.parseLong(req.getParameter("o_total_price")));
		dto.setO_use_point(Long.parseLong(req.getParameter("o_use_point")));
		
		
		//배송비 플래그 처리 (true or null 로 넘어옴)
		if(req.getParameter("o_delivery_flag").equals("true")) {
			dto.setO_delivery_flag((byte) 1); //배송비 있음
		}else {
			dto.setO_delivery_flag((byte) 0); //배송비 없음
		}
		
		dto.setO_payment( Long.parseLong(req.getParameter("o_payment")) - Long.parseLong(req.getParameter("o_use_point")) );
		dto.setO_payment_method(Short.parseShort(req.getParameter("o_payment_method")));
		
		
		//적립포인트 1%
		long tempAddPoint = 0;
		if( (dto.getO_total_price() - dto.getO_use_point()) > 0) {
			tempAddPoint = Math.round( ( dto.getO_total_price() - dto.getO_use_point() ) * 0.01);
		}else {
			tempAddPoint = Math.round(dto.getO_total_price() * 0.01);
		}//if
		
		
		dto.setO_add_point(tempAddPoint);
		
		dto.setO_name(req.getParameter("o_name"));
		
		//폰번호 하이픈 삭제
		String tempHp = req.getParameter("o_hp");
		String hp = tempHp.substring(0, 3) + tempHp.substring(4, 8) + tempHp.substring(9); 
		dto.setO_hp(hp);
		
		dto.setO_addr1(req.getParameter("o_addr1"));
		dto.setO_addr2(req.getParameter("o_addr2"));
		dto.setO_post(req.getParameter("o_post"));
		dto.setO_request(req.getParameter("o_request"));
		dto.setM_id(req.getParameter("m_id"));
		
		
		//장바구니 데이터 획득
		Hashtable<String, CartRequest> hcart = null;
		if(flag.equals("default")) {
			hcart = (Hashtable) req.getSession().getAttribute("cartMap");
		}else if(flag.equals("buy")){ //구매하기 버튼 전용 임시 장바구니
			hcart = (Hashtable) req.getSession().getAttribute("cartMap2");
		}//if
		
		try {
			OrderSuccessRequest osr = os.insert(dto, hcart);
			if(osr==null) {
				res.sendRedirect("cart.get?flag=error");
				return null;
			}
			req.setAttribute("orderResult", osr);
			
			req.getSession().setAttribute("cartMap", null); //세션 장바구니 null
			req.getSession().setAttribute("cartMap2", null); //세션 구매하기용 임시 장바구니 null
			
			//세션에 User 포인트 새로고침
			User user = (User)req.getSession().getAttribute("authUser");
			user.setM_point( Long.parseLong(req.getParameter("m_point")) - dto.getO_use_point() + dto.getO_add_point() );
			req.getSession().setAttribute("authUser", user);
			
			return "/view/home/orderSuccess.jsp";			
		} catch (Exception e) {
			System.out.println("OrderHandler.processPost() 에러 : " + e);
			return form_view;
		}//try
	}
    //==================================================================================================
	
}//class
