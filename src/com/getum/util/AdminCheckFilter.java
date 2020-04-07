package com.getum.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.getum.auth.service.User;


//==================================================================================================
// AdminCheckFilter : 관리자 체크 필터
//==================================================================================================
public class AdminCheckFilter implements Filter{

	//======================================================================================================
 	// doFilter()
 	//======================================================================================================
	@Override
	public void doFilter (ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException{
		
		HttpServletRequest httpRequest = (HttpServletRequest) req;
		HttpSession session = httpRequest.getSession(false);
		//getSession(false) = HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로 생성하지 않고 그냥 null을 반환합니다.
		
		boolean admin = false;
		
		if(session != null) {
			if(session.getAttribute("authUser") != null) {
				User user = (User) session.getAttribute("authUser");
				if(user.getM_grade()==255) {
					admin = true;
				}//if
			}//if
		}//if
		
		
		if(admin) {
			chain.doFilter(req, res);
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/home/adminOnly.jsp");
			dispatcher.forward(req, res);
		}//if
		
	}//dofilter()
	//======================================================================================================
	
	
	
	//======================================================================================================
 	// init()
 	//======================================================================================================
	@Override
	public void init(FilterConfig config) throws ServletException{
		
		
	}//init()
	//======================================================================================================
	
	
	//======================================================================================================
 	// destroy()
 	//======================================================================================================
	@Override
	public void destroy() {
		
	}
	//======================================================================================================
	
}//class
