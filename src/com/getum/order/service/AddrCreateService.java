package com.getum.order.service;

import java.sql.Connection;

import com.getum.order.model.AddrDAO;
import com.getum.order.model.AddrDTO;
import com.getum.util.DBConnection;

//==================================================================================================
//AddrCreateService : 배송지 기능
//==================================================================================================
public class AddrCreateService {

	//==================================================================================================
    // create() : 배송지 입력 처리
    //==================================================================================================
	public void create(AddrDTO addrDTO) {
		
		AddrDAO dao = AddrDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			if(addrDTO.isA_default_flag()) {
				//convertFlag(Connection, String) : 기본 배송지 플래그 취소  1->0 으로
				dao.convertFlag(conn, addrDTO.getM_id());
			}
			
			dao.insert(conn, addrDTO);
			
		} catch (Exception e1) {
			System.out.println("AddrCreateService.create() 에러"+e1);
		} finally {
			try{
                if(conn!=null){conn.close();}
          }catch(Exception e2){}
		}//try
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
	// update() : 배송지 수정 처리
	//==================================================================================================
	public void update(AddrDTO addrDTO) {
		
		AddrDAO dao = AddrDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
			
			if(addrDTO.isA_default_flag()) {
				//convertFlag(Connection, String) : 기본 배송지 플래그 취소  1->0 으로
				dao.convertFlag(conn, addrDTO.getM_id());
			}
			
			dao.update(conn, addrDTO);
			
		} catch (Exception e1) {
			System.out.println("AddrCreateService.update() 에러"+e1);
		} finally {
			try{
				if(conn!=null){conn.close();}
			}catch(Exception e2){}
		}//try
	}
	//==================================================================================================
	
}//class
