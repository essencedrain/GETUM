package com.getum.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//==================================================================================================
// CharacterEncodingFilter : utf-8 페이지 인코딩 필터
//==================================================================================================
public class CharacterEncodingFilter implements Filter{
	
	private String encoding;
	
	//======================================================================================================
 	// doFilter()
 	//======================================================================================================
	@Override
	public void doFilter (ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException{
		
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
		
	}//dofilter()
	//======================================================================================================
	
	
	
	//======================================================================================================
 	// init()
 	//======================================================================================================
	@Override
	public void init(FilterConfig config) throws ServletException{
		encoding = config.getInitParameter("encoding");
		
		if(encoding == null) {
			encoding = "UTF-8";
		}
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
