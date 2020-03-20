package com.getum.product.service;

import java.sql.Connection;

import com.getum.product.model.ProductDAO;
import com.getum.util.DBConnection;

//==================================================================================================
// CreateProductService : 상품등록 기능
//==================================================================================================
public class CreateProductService {

	//==================================================================================================
    // create(CreateProductRequest) : 상품등록 처리
    //==================================================================================================
	public void create(CreateProductRequest proReq) {
		ProductDAO dao = ProductDAO.getInstance();
		Connection conn = null;
		
		try {
			
			conn = DBConnection.getCon();
			
			dao.insert(conn, proReq);
			
		} catch (Exception e1) {
			System.out.println("CreateProductService.create() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
			}catch(Exception e2){}
		}//try
		
	}
    //==================================================================================================
	
}//class
