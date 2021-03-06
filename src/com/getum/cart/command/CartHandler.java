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
						 boolean error = cartService.modifyCart(req);
						 
						 if(!error) {
							 req.setAttribute("errorStock", 2);
						 }
						
					} else if(flag.equals("delete")) {
						cartService.deleteCart(req);
					} else if(flag.equals("error")) { //OrderHandler post처리에서 보낸다.
						req.getSession().setAttribute("cartMap", null); //세션 장바구니 null
						req.setAttribute("errorStock", 1);
					}
				}
				
				return form_view+"?flag=process";
		}
	    //==================================================================================================
		
		
		
		//==================================================================================================
	    // processSubmit() : POST 처리
	    //==================================================================================================
		private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
			
				String flag = req.getParameter("flag");
				if(flag.equals("cart")) {
					cartService.insertCart(req);
					return form_view+"?flag=process";
					
				}else {
					
					cartService.insertCart2(req);
					
					return form_view+"?flag=buy";
				}//if

				
			
		}
	    //==================================================================================================
		
	
}//class
