package com.getum.order.service;

import java.sql.Connection;
import java.util.Hashtable;

import com.getum.order.model.OrderListDAO;
import com.getum.util.DBConnection;

	//==================================================================================================
	//OrderDetailService : 주문내역 조회
	//==================================================================================================
	public class OrderDetailService {
	
		
		//==================================================================================================
		//getDetail(int) : 주문번호로부터 상세내역 가져오기
		//==================================================================================================
		public Hashtable<String, OrderListRequest> getDetail(int o_no) {
			
			OrderListDAO dao = OrderListDAO.getInstance();
			Connection conn = null;
			Hashtable<String, OrderListRequest> result = null;
			
			try {
				
				conn = DBConnection.getCon();
				
				result = dao.selectByOrderNumber(conn, o_no);
				
				
			} catch (Exception e1) {
				System.out.println("OrderListService.getList() 에러 : "+e1);
				return null;
			} finally {
				try {
					if(conn!=null){conn.close();}
				} catch (Exception e2) {}
			}
			
			return result;
			
		}//getList()
		//==================================================================================================
		
		
		//==================================================================================================
		//getOrder(int) : 주문번호로부터 상세내역 가져오기
		//==================================================================================================
		public OrderDetailRequest getOrder(int o_no) {
			
			OrderListDAO dao = OrderListDAO.getInstance();
			Connection conn = null;
			OrderDetailRequest result = null;
			
			try {
				
				conn = DBConnection.getCon();
				
				result = dao.selectByOrderNumber2(conn, o_no);
				
				
			} catch (Exception e1) {
				System.out.println("OrderListService.getList() 에러 : "+e1);
				return null;
			} finally {
				try {
					if(conn!=null){conn.close();}
				} catch (Exception e2) {}
			}
			
			return result;
			
		}//getList()
		//==================================================================================================
		
	
}//class
