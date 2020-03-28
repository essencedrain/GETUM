package com.getum.point.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.getum.order.model.OrderDTO;

//======================================================================================================
// 포인트 DAO
//======================================================================================================
public class PointDAO {

	//field
			// 싱글톤
		    private static PointDAO instance = new PointDAO();//객체생성
		    
	    //constructor
		    private PointDAO(){}
		    
	    //method
			//==================================================================================================
			// getInstance() : 싱글톤 객체 얻기
			//==================================================================================================
			public static PointDAO getInstance(){
			       return instance;
			}//getInstance()
			//==================================================================================================
			
			
			
			//==================================================================================================
		    // insertFromOrder(Connection, OrderDTO, String) : 주문에서 포인트적립
		    //==================================================================================================
		    public void insertFromOrder(Connection conn, OrderDTO dto, String msg, int useOrSave, long point) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	try {
					pstmt = conn.prepareStatement("insert into point values(null,?,?,?,now(),?)");
					
					pstmt.setInt(1, useOrSave);
					pstmt.setLong(2, point);
					pstmt.setString(3, msg);
					pstmt.setString(4, dto.getM_id());
					
					pstmt.executeUpdate();
					
					
				} catch (Exception e) {
					System.out.println("PointDAO.insertFromOrder() 예외 :"+e);
				}finally {
					try{
						if(pstmt!=null){pstmt.close();}
					}catch(Exception ex2){}
				}//try
		    }//insert()
		    //==================================================================================================
	
	
}//class
