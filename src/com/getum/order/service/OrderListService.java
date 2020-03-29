package com.getum.order.service;

import java.sql.Connection;
import java.util.List;

import com.getum.order.model.OrderListDAO;
import com.getum.util.DBConnection;

	//==================================================================================================
	//OrderService : 주문내역 조회
	//==================================================================================================
	public class OrderListService {
	
		
		//==================================================================================================
		//getList : 해당 페이지 주문 3건 가져오기
		//==================================================================================================
		public List getList(String m_id, int max, int min) {
			
			OrderListDAO dao = OrderListDAO.getInstance();
			Connection conn = null;
			List result = null;
			
			try {
				
				conn = DBConnection.getCon();
				
				result = dao.selectById(conn, m_id, max, min);
				
				
			} catch (Exception e1) {
				System.out.println("OrderListService.getList() 에러 : "+e1);
			} finally {
				try {
					if(conn!=null){conn.close();}
				} catch (Exception e2) {}
			}
			
			return result;
			
		}//getList()
		//==================================================================================================
		
		
		
		
		//==================================================================================================
		//getTotalArticleNum : 주문내역 조회
		//==================================================================================================
		public int getTotalArticleNum(String m_id) {
			
			OrderListDAO dao = OrderListDAO.getInstance();
			Connection conn = null;
			int result = -1;
			
			try {
				
				conn = DBConnection.getCon();
				
				result = dao.getTotalArticleNum(conn, m_id);
				
				
			} catch (Exception e1) {
				System.out.println("OrderListService.getTotalArticleNum() 에러 : "+e1);
				return result;
			} finally {
				try {
					if(conn!=null){conn.close();}
				} catch (Exception e2) {}
			}
			
			return result;
			
		}//getTotalArticleNum()
		//==================================================================================================
	
}//class
