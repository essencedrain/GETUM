package com.getum.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.member.service.JoinMemberRequest;
import com.getum.member.service.JoinMemberService;

//==================================================================================================
// JoinMemberHandler : 회원가입 핸들러
// GET 요청 : signup.jsp 리턴
// POST 요청 : 회원가입처리
// 	-> 성공시 : signupSuccess.jsp 리턴 
// 	-> 실패시 : signup.jsp 리턴
//==================================================================================================
public class JoinMemberHandler implements CommandHandler{
	
	//field
		private String form_view = "/view/home/signup.jsp";
		private JoinMemberService joinService = new JoinMemberService();

	
	//==================================================================================================
    // process() : 
    //==================================================================================================
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res){
		
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
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		//form에서 넘어온 자료 처리
		JoinMemberRequest joinReq = new JoinMemberRequest();
		joinReq.setM_id(req.getParameter("m_id"));
		joinReq.setM_pwd(req.getParameter("m_pwd"));
		joinReq.setM_pwd2(req.getParameter("m_pwd2"));
		joinReq.setM_name(req.getParameter("m_name"));
		joinReq.setM_email(req.getParameter("m_email"));
		joinReq.setM_hp(req.getParameter("m_hp"));
		
		String now = req.getParameter("year") + "-" + req.getParameter("month") + "-" + req.getParameter("day");
		java.sql.Date d = java.sql.Date.valueOf(now);
		joinReq.setM_birthday(d);
		
		//에러 모으는 맵 선언
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return form_view;
		}
		
		
	}
    //==================================================================================================
    
    
    
    //==================================================================================================
    // 
    //==================================================================================================
    //==================================================================================================
	
}//class
