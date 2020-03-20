package com.getum.product.service;

import java.sql.Connection;
import java.util.List;

import com.getum.product.model.ProductDAO;
import com.getum.util.DBConnection;

//==================================================================================================
//ReadProductListService : 상품목록 조회 기능
//==================================================================================================
public class ReadProductListService {

	public List<ReadProductList> listService() {
		
		ProductDAO dao = ProductDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			List<ReadProductList> list = dao.getList(conn);
			return list;
			
		} catch (Exception e1) {
			System.out.println("ReadProductListService.process() 에러"+e1);
			return null;
		} finally {
			try{
	            if(conn!=null){conn.close();}
			}catch(Exception e2){}
		}//try
		
		
	}//listService()
	
	
}//class
