package com.getum.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import com.getum.order.service.OrderDetailRequest;
import com.getum.order.service.OrderListRequest;


//======================================================================================================
//주문내역 DAO
//======================================================================================================
public class OrderListDAO {

	//field
	// 싱글톤
    private static OrderListDAO instance = new OrderListDAO();//객체생성
    
	//constructor
	    private OrderListDAO(){}
	    
	//method
		//==================================================================================================
		// getInstance() : 싱글톤 객체 얻기
		//==================================================================================================
		public static OrderListDAO getInstance(){
		       return instance;
		}//getInstance()
		//==================================================================================================	
		
		
		//==================================================================================================
	    // getTotalArticleNum(Connection, String) : 해당 아이디 전체 주문 수 
	    //==================================================================================================
		public int getTotalArticleNum(Connection conn, String id) throws SQLException{
			PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	int result = -1;
	    	
	    	try {
	    		pstmt = conn.prepareStatement("SELECT COUNT(*) FROM orderlist WHERE m_id=?");
	    		pstmt.setString(1, id);
	    		rs = pstmt.executeQuery();
	    		
	    		if(rs.next()) {
	    			result = rs.getInt(1);
	    		}//if
				
			} catch (Exception e) {
				System.out.println("OrderListDAO.getTotalArticleNum() 예외 :"+e);
				return result;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}
	    	
	    	
	    	return result;
	    	
		}
		//==================================================================================================
		
		
		
		//==================================================================================================
		// selectByOrderNumber(Connection, int) : 주문번호로 주문상세내역 가져오기 
		//==================================================================================================
		public Hashtable<String, OrderListRequest> selectByOrderNumber(Connection conn, int orderNum) throws SQLException{
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Hashtable<String, OrderListRequest> map = new Hashtable<>();
			
			try {
				pstmt = conn.prepareStatement("SELECT * FROM order_detail WHERE order_id=?");
				pstmt.setInt(1, orderNum);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String od_uuid = rs.getString("p_uuid");
					
					OrderListRequest orderListRequest = new OrderListRequest();
					orderListRequest.setName(rs.getString("od_name"));
					orderListRequest.setPrice(rs.getLong("od_price"));
					orderListRequest.setQuantity(rs.getInt("od_quantity"));
					
					//주문상태
					switch (rs.getInt("od_status")) {
					case 0:
						orderListRequest.setStatus("결제완료");
						break;
					case 1:
						orderListRequest.setStatus("배송준비중");
						break;
					case 2:
						orderListRequest.setStatus("배송중");
						break;
					case 3:
						orderListRequest.setStatus("배송완료");
						break;
					}
					
					//imgName
    				String imgChar = od_uuid.substring(0,1);
    				//uuid첫글자에따라 확장자 설정 
	    		    	if(imgChar.equals("j")){
	    		    		orderListRequest.setImgName(od_uuid+".jpg");
	    		    	}else if(imgChar.equals("p")){
	    		    		orderListRequest.setImgName(od_uuid+".png");
	    		    	}else if(imgChar.equals("g")){
	    		    		orderListRequest.setImgName(od_uuid+".gif");
	    		    	}//if
	    		    	
	    		    
	    		    map.put(od_uuid, orderListRequest);
				}//while()
				
				
			} catch (Exception e) {
				System.out.println("OrderListDAO.getTotalArticleNum() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}
			
			
			return map;
			
		}
		//==================================================================================================
		
		
		
		//==================================================================================================
		// selectByOrderNumber2(Connection, int) : 주문번호로 주문 배송지, 결제정보 가져오기 
		//==================================================================================================
		public OrderDetailRequest selectByOrderNumber2(Connection conn, int orderNum) throws SQLException{
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			OrderDetailRequest result = new OrderDetailRequest();
			
			try {
				pstmt = conn.prepareStatement("SELECT * FROM orderlist WHERE o_no=?");
				pstmt.setInt(1, orderNum);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					result.setDate(rs.getTimestamp("o_order_date")+"");
					result.setTotal_price(rs.getLong("o_total_price"));
					result.setUse_point(rs.getLong("o_use_point"));
					
					if(rs.getInt("o_delivery_flag")==1) {
						result.setDelivery(true);
					}else {
						result.setDelivery(false);
					}
					
					result.setPayment(rs.getLong("o_payment"));
					
					switch (rs.getInt("o_payment_method")) {
					case 1:
						result.setPayment_method("계좌이체");
						break;
					case 2:
						result.setPayment_method("신용카드");
						break;
					case 3:
						result.setPayment_method("무통장입금");
						break;
					}//switch
					
					result.setAdd_point(rs.getLong("o_add_point"));
					result.setM_name(rs.getString("o_name"));
					result.setM_hp(rs.getString("o_hp").substring(0,3)+"-"+rs.getString("o_hp").substring(3,7)+"-"+rs.getString("o_hp").substring(7,11));
					result.setM_addr1(rs.getString("o_addr1"));
					result.setM_addr2(rs.getString("o_addr2"));
					result.setM_post(rs.getString("o_post"));
					result.setM_request(rs.getString("o_request"));
					
					
				}//if
				
				
			} catch (Exception e) {
				System.out.println("OrderListDAO.getTotalArticleNum() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}
			
			
			return result;
			
		}
		//==================================================================================================
		
		
		
		
		//==================================================================================================
	    // selectById(Connection, String) : 주문내역 리스트 가져오기
	    //==================================================================================================
		/*
		 	자료구조
		 	
		 		List bigList (
		 			(0)List smallList(
		 					(0)od_no,						 				[주문번호]
		 					(1)od_date, 									[주문일]
			 				(2)Hashtable map(
									od_uuid :	OrderListRequest( 			key: [UUID]
													od_name,				[상품명]
													od_price,				[1개 가격]
													od_puantity				[주문수량]
													od_status,				[주문상태]
													imgName,				[이미지이름]
													date					[주문일]여기서 안씀 위에서 씀
												)
							)
	 				),
	 				(1)List smallList,
	 				(2)List smallList,
	 				.
	 				.
	 				.
	 				.
	 				
		 		)
		 
		 
		 */
		/*
		  쿼리
		  	SELECT y.order_id AS od_no, x.o_no,DATE_FORMAT(x.o_order_date,'%Y/%m/%d') AS od_date, y.od_name AS od_name, y.od_price AS od_price, y.od_quantity AS od_quantity, y.od_status AS od_status, y.p_uuid AS od_uuid
			FROM orderlist x JOIN order_detail y
			ON x.o_no = y.order_id
			AND x.m_id='test'
			WHERE y.order_id >= (
										SELECT o_no
										FROM orderlist
										WHERE m_id='test'
										ORDER BY o_no desc
										LIMIT 2,1
										)
					AND y.order_id <= (
											SELECT o_no
											FROM orderlist
											WHERE m_id='test'
											ORDER BY o_no desc
											LIMIT 0,1
											)
			ORDER BY od_no DESC
		 */
	    public List<List<Object>> selectById(Connection conn, String id, int max, int min) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;

	    	List<List<Object>> result = new ArrayList<>();
	    			
	    	
	    	try {
				pstmt = conn.prepareStatement("SELECT y.order_id AS od_no, x.o_no,DATE_FORMAT(x.o_order_date,'%Y/%m/%d') AS od_date, y.od_name AS od_name, y.od_price AS od_price, y.od_quantity AS od_quantity, y.od_status AS od_status, y.p_uuid AS od_uuid FROM orderlist x JOIN order_detail y ON x.o_no = y.order_id AND x.m_id=? WHERE y.order_id >= (SELECT o_no FROM orderlist WHERE m_id=? ORDER BY o_no desc LIMIT ?,1) AND y.order_id <= (SELECT o_no FROM orderlist WHERE m_id=? ORDER BY o_no desc LIMIT ?,1) ORDER BY od_no DESC");
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				pstmt.setInt(3, max);
				pstmt.setString(4, id);
				pstmt.setInt(5, min);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					long od_no = rs.getLong("od_no");
					String od_uuid = rs.getString("od_uuid");
					int result_idx = -1;
					
					
					
					OrderListRequest orderListRequest = new OrderListRequest();
						orderListRequest.setName(rs.getString("od_name"));
						orderListRequest.setPrice(rs.getLong("od_price"));
						orderListRequest.setQuantity(rs.getInt("od_quantity"));
						
						//주문상태
						switch (rs.getInt("od_status")) {
						case 0:
							orderListRequest.setStatus("결제완료");
							break;
						case 1:
							orderListRequest.setStatus("배송준비중");
							break;
						case 2:
							orderListRequest.setStatus("배송중");
							break;
						case 3:
							orderListRequest.setStatus("배송완료");
							break;
						}
						
						//imgName
	    				String imgChar = od_uuid.substring(0,1);
	    				//uuid첫글자에따라 확장자 설정 
		    		    	if(imgChar.equals("j")){
		    		    		orderListRequest.setImgName(od_uuid+".jpg");
		    		    	}else if(imgChar.equals("p")){
		    		    		orderListRequest.setImgName(od_uuid+".png");
		    		    	}else if(imgChar.equals("g")){
		    		    		orderListRequest.setImgName(od_uuid+".gif");
		    		    	}//if
						
						
						
					for(int i=0; i<result.size(); i++) {
						if(od_no == (Long) result.get(i).get(0)) { //result에 이미 있는 주문번호
							result_idx = i; //result에 이미 주문번호가 있는 곳 인덱스값 저장
						}//if
					}//for
					
					if(result_idx == -1) { //없는 주문번호
						
						List<Object> smallList = new ArrayList<>(3);
						Hashtable<String, OrderListRequest> map = new Hashtable<>();
						
						map.put(od_uuid, orderListRequest);
						
						smallList.add(od_no);
						smallList.add(rs.getString("od_date"));
						smallList.add(map);
						
						result.add(smallList);			
						
					}else { //이미 있는 주문번호
						
						Hashtable<String, OrderListRequest> map = (Hashtable<String, OrderListRequest>) result.get(result_idx).get(2);
						
						map.put(od_uuid, orderListRequest);
						
						result.get(result_idx).remove(2);
						result.get(result_idx).add(map);
						
					}//if
					
					
				}//while
				
			} catch (Exception e) {
				System.out.println("OrderListDAO.selectById() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	return result;
	    }//selectById()
	    //==================================================================================================
	
}//class
