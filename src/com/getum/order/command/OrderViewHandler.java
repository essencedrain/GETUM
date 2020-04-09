package com.getum.order.command;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.order.model.AddrDAO;
import com.getum.order.model.AddrDTO;
import com.getum.order.service.AddrCreateService;
import com.getum.util.DBConnection;

//==================================================================================================
//OrderViewHandler : 1. 주문/결제창(order.get?flag=default&m_id=) 보기
//GET 요청 :
//	flag=delete : 배송지 삭제 후 order.get?flag=default&m_id=
//POST 요청 : 
//	flag=create : 배송지 생성 후 order.get?flag=default&m_id=
//	flag=modify : 배송지 수정 후 order.get?flag=default&m_id=
//기타:
//	배송지DB에서 기본 배송지를 가져와서 세션에 넣고 order.jsp로 보낸다.
//		배송지가 없으면 세션에 null 넣고 order.jsp 보낸다
//==================================================================================================
public class OrderViewHandler implements CommandHandler{
	
	//field
		private String form_view = "/view/home/order.jsp?flag=default";
	
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
    // processGet() : GET 처리
    //==================================================================================================
	private String processGet(HttpServletRequest req, HttpServletResponse res) {
		
		
		
		String m_id = req.getParameter("m_id");
		String flag = req.getParameter("flag");
		AddrDTO dto = null;
		List<AddrDTO> list = null;
		AddrDAO dao = AddrDAO.getInstance();
		Connection conn = null;
		
		if(flag.equals("delete")) {
			try {
				conn = DBConnection.getCon();
				dao.delete(conn, req.getParameter("a_no"));
				res.sendRedirect("/GETUM/view/home/order.get?flag=default&m_id="+m_id);
			} catch (Exception e) {
				System.out.println("OrderViewHandler.delete 에러"+e);
			}
			
			return null;
		}else {
			
			try {
				
				conn = DBConnection.getCon();
				dto = dao.selectById(conn, m_id);
				list = dao.selectAllById(conn, m_id);
				
			} catch (Exception e1) {
				System.out.println("OrderViewHandler.default 에러"+e1);
			} finally {
				try{
	                if(conn!=null){conn.close();}
				}catch(Exception e2){}
			}//try
			
			
			
			if(dto==null) {
				req.getSession().setAttribute("userAddr", null);
			}else {
				req.getSession().setAttribute("userAddr", dto);
			}//if
			
			
			
			
			if(list==null) {
				req.getSession().setAttribute("userAddrAll", null);
			}else {
				req.getSession().setAttribute("userAddrAll", list);
			}//if
			
			
			
			if(flag.equals("buy")) {
				return "/view/home/order.jsp?flag=buy";
			}//if
			
		}//if
		return form_view;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processPost() : POST 처리
    //==================================================================================================
	private String processPost(HttpServletRequest req, HttpServletResponse res) {
		String flag = req.getParameter("flag");
		String m_id = req.getParameter("m_id");
		AddrDTO dto = new AddrDTO();
		AddrCreateService acs = new AddrCreateService();
		
		if(flag.equals("create")) {
			
			dto.setA_name(req.getParameter("a_name"));
			dto.setA_addr1(req.getParameter("a_addr1"));
			dto.setA_addr2(req.getParameter("a_addr2"));
			dto.setA_post(req.getParameter("a_post"));
			
			String tempHp = req.getParameter("a_hp");
			String hp = tempHp.substring(0, 3) + tempHp.substring(4, 8) + tempHp.substring(9); 
			dto.setA_hp(hp);
			
			dto.setA_request(req.getParameter("a_request"));
			
			if(req.getParameter("a_default_flag")==null) {
				dto.setA_default_flag(false);
			}else {
				dto.setA_default_flag(true);
			}
			dto.setM_id(m_id);
			
			acs.create(dto);
			
			try {
				res.sendRedirect("/GETUM/view/home/order.get?flag=default&m_id="+m_id);
			} catch (IOException e) {
				System.out.println("OrderViewHandler.processPost.create 에러 " +e);
			}
			
			
		}else if(flag.equals("modify")) {
			
			dto.setA_name(req.getParameter("a2_name"));
			dto.setA_addr1(req.getParameter("a2_addr1"));
			dto.setA_addr2(req.getParameter("a2_addr2"));
			dto.setA_post(req.getParameter("a2_post"));
			String tempHp = req.getParameter("a2_hp");
			String hp = tempHp.substring(0, 3) + tempHp.substring(4, 8) + tempHp.substring(9); 
			dto.setA_hp(hp);
			dto.setA_request(req.getParameter("a2_request"));
			
			if(req.getParameter("a2_default_flag")==null) {
				dto.setA_default_flag(false);
			}else {
				dto.setA_default_flag(true);
			}
			dto.setA_no(Long.parseLong(req.getParameter("a2_no")));
			dto.setM_id(m_id);
			
			acs.update(dto);
			
			try {
				res.sendRedirect("/GETUM/view/home/order.get?flag=default&m_id="+m_id);
			} catch (IOException e) {
				System.out.println("OrderViewHandler.processPost.create 에러 " +e);
			}
			
		}//if
		
		return null;
		//return form_view;
	}
    //==================================================================================================

}//class
