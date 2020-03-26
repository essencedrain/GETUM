package com.getum.cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.cart.service.CartService;
import com.getum.command.CommandHandler;

//==================================================================================================
//CartHandler : 로그인 핸들러
//GET 요청 : cart.jsp 리턴
//	-> flag "modify" : 수정 후 cart.jsp 리턴
//	-> flag "delete" : 삭제 후 cart.jsp 리턴
//POST 요청 : 장바구니 삽입 처리 
//==================================================================================================
public class CartHandler implements CommandHandler{

	//field
		private String form_view = "/view/home/cart.jsp";
		private CartService cartService = new CartService();
		
		//method
		
		//==================================================================================================
	    // process() : 핸들러 공통
	    //==================================================================================================
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res) throws Exception{
			
			if( req.getMethod().equalsIgnoreCase("GET") ) {
				return processForm(req,res);
			} else if ( req.getMethod().equalsIgnoreCase("POST") ) {
				return processSubmit(req,res);
			} else {
				res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				return null;
			}//if
			
		}
	    //==================================================================================================
		
		
		//==================================================================================================
	    // processForm() : GET 처리
	    //==================================================================================================
		private String processForm(HttpServletRequest req, HttpServletResponse res) {
				
				String flag = req.getParameter("flag");
				
				if(flag!=null) {
					if(flag.equals("modify")) {
						cartService.modifyCart(req);
					} else if(flag.equals("delete")) {
						cartService.deleteCart(req);
					}
				}
				
				return form_view;
		}
	    //==================================================================================================
		
		
		
		//==================================================================================================
	    // processSubmit() : POST 처리
	    //==================================================================================================
		private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
			
				
				cartService.insertCart(req);
				
				return form_view;
			
		}
	    //==================================================================================================
		
	
}//class
