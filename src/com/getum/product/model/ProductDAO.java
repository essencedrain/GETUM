package com.getum.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.getum.product.service.CreateProductRequest;

//======================================================================================================
//제품 DAO
//======================================================================================================
public class ProductDAO {

	//field
		// 싱글톤
		private static ProductDAO instance = new ProductDAO();
		
	//constructor
		private ProductDAO(){};
	
		
	//method
		//==================================================================================================
		// getInstance() : 싱글톤 객체 얻기
		//==================================================================================================
	    public static ProductDAO getInstance(){
	           return instance;
	    }//getInstance()
	    //==================================================================================================
	    
	    
	    
	    //==================================================================================================
	    // selectByUuid(Connection, String) : 상품정보 정보 가져오기
	    //==================================================================================================
	    public ProductDTO selectByUuid(Connection conn, String uuid) throws SQLException{
	    	
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	ProductDTO dto = new ProductDTO();
	    	
	    	try {
	    		pstmt = conn.prepareStatement("select * from product where p_uuid = ?");
	    		pstmt.setString(1, uuid);
	    		rs = pstmt.executeQuery();
	    		
	    		
	    		if(rs.next()) {
	    			
	    			dto.setP_uuid(rs.getString("p_uuid"));
	    			dto.setP_name(rs.getString("p_name"));
	    			dto.setP_code(rs.getString("p_code"));
	    			dto.setP_price(rs.getLong("p_price"));
	    			dto.setP_reg_date(rs.getTimestamp("p_reg_date"));
	    			dto.setP_release_date(rs.getDate("p_release_date"));
	    			dto.setP_manufacture(rs.getString("p_manufacture"));
	    			dto.setP_detail(rs.getString("p_detail"));
	    			dto.setP_stock(rs.getLong("p_stock"));
	    			dto.setP_category(rs.getString("p_category"));
	    			dto.setP_delete_flag(rs.getByte("p_delete_flag"));
	    			
	    		}//if
	    		
			} catch (Exception e) {
				System.out.println("ProductDAO.selectByUuid() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	
	    	return dto;
	    }
	    //==================================================================================================
	    
	    
	    
	    //==================================================================================================
	    // insert(Connection, CreateProductRequest) : 상품정보 삽입
	    //==================================================================================================
	    public void insert(Connection conn, CreateProductRequest proReq) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	    		pstmt = conn.prepareStatement("insert into product value(?,?,?,?,now(),?,?,?,?,?,0)");
	    		
	    		pstmt.setString(1, proReq.getP_uuid());
	    		pstmt.setString(2, proReq.getP_name());
	    		pstmt.setString(3, proReq.getP_code());
	    		pstmt.setLong(4, proReq.getP_price());
	    		pstmt.setDate(5, proReq.getP_release_date());
	    		pstmt.setString(6, proReq.getP_manufacture());
	    		pstmt.setString(7, proReq.getP_detail());
	    		pstmt.setLong(8, proReq.getP_stock());
	    		pstmt.setString(9, proReq.getP_category());
	    		
	    		pstmt.executeUpdate();
	    		
			} catch (Exception e) {
				System.out.println("ProductDAO.insert() 예외 :"+e);
			} finally {
				try{
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    }
	    //==================================================================================================
	    
	    
}//class
