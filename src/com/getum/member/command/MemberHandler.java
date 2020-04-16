package com.getum.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.member.model.MemberDTO;
import com.getum.member.service.JoinMemberRequest;
import com.getum.member.service.MemberService;
import com.getum.point.model.PointDTO;

//==================================================================================================
// MemberHandler : 회원가입 핸들러
// GET 요청 : signup.jsp 리턴
// POST 요청 : 회원가입처리
// 	-> 성공시 : signupSuccess.jsp 리턴 
// 	-> 실패시 : signup.jsp 리턴
//==================================================================================================
public class MemberHandler implements CommandHandler{
	
	//field
		private String form_view = "/view/home/signup.jsp";
		private MemberService memberService = new MemberService();

	
	//==================================================================================================
    // process() : 핸들러 공통
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
		String flag = req.getParameter("flag");
		
		if(flag.equals("mypage")) {
			String m_id = req.getParameter("m_id");
			MemberDTO dto= memberService.getMember(m_id);
			List<PointDTO> pointList = memberService.getPoint(m_id);
			
			req.setAttribute("dto", dto);
			req.setAttribute("list", pointList);
			
			return "/view/home/mypage.jsp";
		}
		
		return null;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processSubmit() : POST 처리
    //==================================================================================================
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		String flag = req.getParameter("flag");
		
		if(flag.equals("join")) {
			//form에서 넘어온 자료 처리
			JoinMemberRequest joinReq = new JoinMemberRequest();
			joinReq.setM_id(req.getParameter("m_id"));
			joinReq.setM_pwd(req.getParameter("m_pwd"));
			joinReq.setM_name(req.getParameter("m_name"));
			joinReq.setM_email(req.getParameter("m_email"));
			
			String temp = req.getParameter("m_hp");
			String hp = temp.substring(0, 3) + temp.substring(4, 8) + temp.substring(9); 
			joinReq.setM_hp(hp);
			
			String now = req.getParameter("year") + "-" + req.getParameter("month") + "-" + req.getParameter("day");
			java.sql.Date d = java.sql.Date.valueOf(now);
			joinReq.setM_birthday(d);
			
			memberService.join(joinReq);
			return "/view/home/signupSuccess.jsp";			
			
		}else if(flag.equals("update")) {
			
			String m_id = req.getParameter("m_id");
			
			MemberDTO dto = new MemberDTO();
			dto.setM_name(req.getParameter("name"));
			dto.setM_email(req.getParameter("email"));
			String temp = req.getParameter("hp");
			String hp = temp.substring(0, 3) + temp.substring(4, 8) + temp.substring(9); 
			dto.setM_hp(hp);
			dto.setM_id(m_id);
			
			memberService.updateMypage(dto);
			
			List<PointDTO> pointList = memberService.getPoint(m_id);
			req.setAttribute("list", pointList);
			
			dto= memberService.getMember(m_id);
			
			
			req.setAttribute("dto", dto);
			
			
			return "/view/home/mypage.jsp";
		
		}//if
		
		return null;
	}
    //==================================================================================================
    
    
	
}//class
