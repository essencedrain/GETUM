package com.getum.order.service;

import java.sql.Connection;
import java.util.Enumeration;
import java.util.Hashtable;

import com.getum.cart.service.CartRequest;
import com.getum.member.model.MemberDAO;
import com.getum.order.model.OrderDAO;
import com.getum.order.model.OrderDTO;
import com.getum.order.model.OrderDetailDAO;
import com.getum.order.model.OrderDetailDTO;
import com.getum.point.model.PointDAO;
import com.getum.product.model.ProductDAO;
import com.getum.util.DBConnection;

//==================================================================================================
//OrderService : 주문처리 기능
//==================================================================================================
public class OrderService {
	
	//==================================================================================================
    // insert(OrderDTO) : 주문입력
    //==================================================================================================
	public OrderSuccessRequest insert(OrderDTO dto, Hashtable<String, CartRequest> hcart) {
		
		OrderDAO orderDao = OrderDAO.getInstance();
		OrderDetailDAO orderDetailDao = OrderDetailDAO.getInstance();
		ProductDAO productDAO = ProductDAO.getInstance();
		MemberDAO memberDAO = MemberDAO.getInstance();
		PointDAO pointDAO = PointDAO.getInstance();
		
		CartRequest cReq = null;
		Connection conn = null;
		
		long o_no = 0; //주문번호 orderlist의 pk
		OrderSuccessRequest result = new OrderSuccessRequest(); //주문결과용 리턴
		
		try {
			
			conn = DBConnection.getCon();
			
			//1. orderlist에 주문 삽입
			o_no = orderDao.insert(conn, dto);
			
			//2. member에 add_point만큼 포인트 추가
			memberDAO.addPoint(conn, dto.getM_id(), dto.getO_add_point());
			
			//3. point에 포인트 적립 내역 추가
			pointDAO.insertFromOrder(conn, dto);
			
			//4. order_detail주문상세 삽입 + product 재고 감소
			Enumeration hcartKey = hcart.keys();
			
			while(hcartKey.hasMoreElements()){
				cReq = (CartRequest) hcart.get(hcartKey.nextElement());
				OrderDetailDTO dto2 = new OrderDetailDTO();
				
				dto2.setOd_name(cReq.getName());
				dto2.setOd_quantity(cReq.getQuantity());
				dto2.setOd_price((long)cReq.getPrice());
				dto2.setOrder_id(o_no);
				dto2.setP_uuid(cReq.getImgName().substring(0,33));
				
				orderDetailDao.insert(conn, dto2);
				productDAO.stockProcess(conn, dto2);
			}//while
			
		} catch (Exception e1) {
			System.out.println("OrderService.insert() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
		
		result.setR_no(o_no);
		result.setHcart(hcart);
		result.setR_name(dto.getO_name());
		result.setR_hp(dto.getO_hp());
		result.setR_addr1(dto.getO_addr1());
		result.setR_addr2(dto.getO_addr2());
		result.setR_post(dto.getO_post());
		result.setR_request(dto.getO_request());
		result.setR_total_price(dto.getO_total_price());
		result.setR_use_point(dto.getO_use_point());
		result.setR_delivery_flag(dto.getO_delivery_flag());
		result.setR_payment(dto.getO_payment());
		result.setR_payment_method(dto.getO_payment_method());
		result.setR_add_point(dto.getO_add_point());
		
		return result;
	}
    //==================================================================================================
}//class