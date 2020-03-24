package com.getum.order.service;

import java.sql.Connection;

import com.getum.order.model.AddrDAO;
import com.getum.order.model.AddrDTO;
import com.getum.util.DBConnection;

//==================================================================================================
//AddrCreateService : 주소지 기능
//==================================================================================================
public class AddrCreateService {

	//==================================================================================================
    // create() : 회원가입처리
    //==================================================================================================
	public void create(AddrDTO addrDTO) {
		
		AddrDAO dao = AddrDAO.getInstance();
		Connection conn = null;
		
		try {
			conn = DBConnection.getCon();
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
	
}//class
