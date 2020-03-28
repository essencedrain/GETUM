package com.getum.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//======================================================================================================
//주문상세 DAO
//======================================================================================================
public class OrderDetailDAO {
	//field
			// 싱글톤
		    private static OrderDetailDAO instance = new OrderDetailDAO();//객체생성
		    
	    //constructor
		    private OrderDetailDAO(){}
		    
	    //method
			//==================================================================================================
			// getInstance() : 싱글톤 객체 얻기
			//==================================================================================================
			public static OrderDetailDAO getInstance(){
			       return instance;
			}//getInstance()
			//==================================================================================================
			
			
			
			//==================================================================================================
		    // insert(Connection, OrderDetailDTO) : 주문상세 삽입
		    //==================================================================================================
		    public void insert(Connection conn, OrderDetailDTO dto) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	
		    	try {
					pstmt = conn.prepareStatement("insert into order_detail values(null,?,?,?,0,?,?)");
					
					pstmt.setString(1, dto.getOd_name());
					pstmt.setInt(2, dto.getOd_quantity());
					pstmt.setLong(3, dto.getOd_price());
					pstmt.setLong(4, dto.getOrder_id());
					pstmt.setString(5, dto.getP_uuid());
					
					pstmt.executeUpdate();
					
					
				} catch (Exception e) {
					System.out.println("OrderDetailDAO.insert() 예외 :"+e);
				}finally {
					try{
						if(pstmt!=null){pstmt.close();}
					}catch(Exception ex2){}
				}//try
		    }//insert()
		    //==================================================================================================
		    
}//class
