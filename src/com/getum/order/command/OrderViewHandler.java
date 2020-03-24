package com.getum.order.command;

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
//OrderViewHandler : 주문/결제창(order.jsp) 보기
//GET 요청 : order.jsp 리턴
//POST 요청 : 배송지 선택창에서 배송지 고르고 order.jsp 보냄
//기타:
//	배송지DB에서 기본 배송지를 가져와서 세션에 넣고 order.jsp로 보낸다.
//		배송지가 없으면 세션에 null 넣고 order.jsp 보낸다
//==================================================================================================
public class OrderViewHandler implements CommandHandler{
	
	//field
		private String form_view = "/view/home/order.jsp";
	
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
		AddrDTO dto = null;
		List<AddrDTO> list = null;
		AddrDAO dao = AddrDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			dto = dao.selectById(conn, m_id);
			list = dao.selectAllById(conn, m_id);
			
		} catch (Exception e1) {
			System.out.println("OrderViewHandler.conn() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
		
		if(dto==null) {
			req.getSession().setAttribute("userAddr", null);
		}else {
			req.getSession().setAttribute("userAddr", dto);
		}
		
		if(list==null) {
			req.getSession().setAttribute("userAddrAll", null);
		}else {
			req.getSession().setAttribute("userAddrAll", list);
		}
		
		return form_view;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processPost() : POST 처리
    //==================================================================================================
	private String processPost(HttpServletRequest req, HttpServletResponse res) {
		String flag = req.getParameter("flag");
		AddrDTO dto = new AddrDTO();
		AddrCreateService acs = new AddrCreateService();
		
		if(flag.equals("create")) {
			
			dto.setA_name(req.getParameter("a_name"));
			dto.setA_addr1(req.getParameter("a_addr1"));
			dto.setA_addr2(req.getParameter("a_addr2"));
			dto.setA_post(req.getParameter("a_post"));
			dto.setA_hp(req.getParameter("a_hp"));
			dto.setA_request(req.getParameter("a_request"));
			
			if(req.getParameter("a_default_flag").equals("true")) {
				dto.setA_default_flag(true);
			}else {
				dto.setA_default_flag(false);
			}
			dto.setM_id(req.getParameter("m_id"));
			acs.create(dto);
			
		}//if
		
		return form_view;
	}
    //==================================================================================================

}//class
