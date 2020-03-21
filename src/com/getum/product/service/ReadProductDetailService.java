package com.getum.product.service;

import java.sql.Connection;

import com.getum.product.model.ProductDAO;
import com.getum.util.DBConnection;

//==================================================================================================
//ReadProductDetailService : 상품상세 조회 기능 DAO호출, 핸들러에 ReadProductDetailRequest 리턴
//==================================================================================================
public class ReadProductDetailService {

	public ReadProductDetailRequest productDetail(String p_uuid) {
		
		ProductDAO dao = ProductDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			ReadProductDetailRequest rPDReq = dao.selectByUuid(conn, p_uuid);
			
			return rPDReq;
			
		} catch (Exception e1) {
			System.out.println("ReadProductDetailRequest 에러 : "+e1);
			return null;
		} finally {
			try {
				if(conn!=null){conn.close();}
			} catch (Exception e2) {}
		}
		
		
		
	}//productDetail()
	
}//class
