package com.getum.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


//======================================================================================================
// 주문 DAO
//======================================================================================================
public class OrderDAO {

	//field
		// 싱글톤
	    private static OrderDAO instance = new OrderDAO();//객체생성
	    
    //constructor
	    private OrderDAO(){}
	    
    //method
		//==================================================================================================
		// getInstance() : 싱글톤 객체 얻기
		//==================================================================================================
		public static OrderDAO getInstance(){
		       return instance;
		}//getInstance()
		//==================================================================================================
		
		
		
		//==================================================================================================
	    // insert(Connection, OrderDTO) : 주문 삽입
	    //==================================================================================================
	    public long insert(Connection conn, OrderDTO dto) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	try {
				pstmt = conn.prepareStatement("insert into orderlist values(null,0,now(),?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
				
				pstmt.setLong(1, dto.getO_total_price());
				pstmt.setLong(2, dto.getO_use_point());
				pstmt.setByte(3, dto.getO_delivery_flag());
				pstmt.setLong(4, dto.getO_payment());
				pstmt.setShort(5, dto.getO_payment_method());
				pstmt.setLong(6, dto.getO_add_point());
				pstmt.setString(7, dto.getO_name());
				pstmt.setString(8, dto.getO_hp());
				pstmt.setString(9, dto.getO_addr1() );
				pstmt.setString(10, dto.getO_addr2() );
				pstmt.setString(11, dto.getO_post() );
				pstmt.setString(12, dto.getO_request() );
				pstmt.setString(13, dto.getM_id() );
				
				pstmt.executeUpdate();
				
				ResultSet rs = pstmt.getGeneratedKeys();
				
				if(rs.next()) {
					return rs.getLong(1);
				}
			} catch (Exception e) {
				
				System.out.println("OrderDAO.insert() 예외 :"+e);
			}finally {
				try{
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	return 0;
	    }//insert()
	    //==================================================================================================
}//class
