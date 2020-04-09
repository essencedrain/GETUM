package com.getum.point.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

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
		    public void insertFromOrder(Connection conn, String m_id, String msg, int useOrSave, long point) throws SQLException{
		    	PreparedStatement pstmt = null;
		    	try {
					pstmt = conn.prepareStatement("insert into point values(null,?,?,?,now(),?)");
					
					pstmt.setInt(1, useOrSave);
					pstmt.setLong(2, point);
					pstmt.setString(3, msg);
					pstmt.setString(4, m_id);
					
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
		    
		    
		    
		    //==================================================================================================
		    // getPointDetail(Connection, m_id) : 포인트내역 가져오기
		    //==================================================================================================
		    public List<PointDTO> getPointDetail(Connection conn, String m_id)throws SQLException{
		    	
		    	List<PointDTO> result = new ArrayList<>();
		    	PreparedStatement pstmt = null;
		    	ResultSet rs = null;
		    	DecimalFormat df = new DecimalFormat("#,###");
		    	try {
					pstmt = conn.prepareStatement("select * from point where m_id=? order by po_no desc");
					pstmt.setString(1, m_id);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						PointDTO dto = new PointDTO();
						dto.setPo_no(rs.getLong("po_no"));
						dto.setPo_usesave_flag(rs.getByte("po_usesave_flag"));
						if(dto.getPo_usesave_flag()==1) {
							//적립
							dto.setPo_point(df.format(rs.getLong("po_point")));
						}else {
							//사용
							dto.setPo_point(df.format(rs.getLong("po_point")*-1));
						}
						
						dto.setPo_detail(rs.getString("po_detail"));
						dto.setPo_date(rs.getTimestamp("po_date")+"");
						
						result.add(dto);
						
					}//while
					
					
				} catch (Exception e) {
					System.out.println("PointDAO.insertFromOrder() 예외 :"+e);
					return null;
				}finally {
					try{
						if(rs!=null){rs.close();}
						if(pstmt!=null){pstmt.close();}
					}catch(Exception ex2){}
				}//try
		    	
		    	return result;
		    }
		    //==================================================================================================
	
		    
	
}//class
