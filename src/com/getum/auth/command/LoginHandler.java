package com.getum.auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.auth.service.LoginService;
import com.getum.auth.service.User;
import com.getum.command.CommandHandler;

//==================================================================================================
//LoginHandler : 로그인 핸들러
//GET 요청 : login.jsp 리턴
//POST 요청 : 로그인 처리
//	-> 성공시 : index.jsp 리턴 
//	-> 실패시 : login.jsp 리턴
//==================================================================================================
public class LoginHandler implements CommandHandler{

	//field
	private String form_view = "/view/home/login.jsp";
	private LoginService loginService = new LoginService();
	
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
		return form_view;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processSubmit() : POST 처리
    //==================================================================================================
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String id = trim(req.getParameter("m_id"));
		String password = trim(req.getParameter("m_pwd"));
		
		try {
			
			User user = loginService.login(id, password);
			
			//id가 존재하고 비밀번호가 일치하는 경우
			//세션에 user 담아 index로 보냄
			if(user!=null) {
				req.getSession().setAttribute("authUser", user);
				res.sendRedirect("/GETUM/view/home/index.jsp");
				return null;
				
			}else {
				//그렇지 않으면 리퀘스트에 로그인에러 셋어트리뷰트
				req.getSession().setAttribute("loginError", new Boolean(true));
				return form_view;
			}//if
			
		} catch (Exception e) {
			System.out.println("LoginHandler.processSubmit() 에러 : " + e);
			req.getSession().setAttribute("loginError", new Boolean(true));
			return form_view;
		}//try
		
		
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // trim(String str) : null이면 null 리턴 / 문자면 트림처리 
    //==================================================================================================
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
    //==================================================================================================
	
}//class
