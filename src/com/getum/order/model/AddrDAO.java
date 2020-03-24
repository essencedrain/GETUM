package com.getum.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


//======================================================================================================
// 배송지 DAO
//======================================================================================================
public class AddrDAO {

	//field
		// 싱글톤
	    private static AddrDAO instance = new AddrDAO();//객체생성
		
		    
	//constructor
		private AddrDAO(){}
	
		
	//method
		//==================================================================================================
		// getInstance() : 싱글톤 객체 얻기
		//==================================================================================================
	    public static AddrDAO getInstance(){
	           return instance;
	    }//getInstance()
	    //==================================================================================================
		    
		    
	    //==================================================================================================
	    // selectById(Connection, String) : 기본 배송지 가져오기
	    //==================================================================================================
	    public AddrDTO selectById(Connection conn, String id) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	AddrDTO addrDTO = new AddrDTO();
	    	
	    	try {
				pstmt = conn.prepareStatement("select * from addr where m_id=? and a_default_flag=1");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					addrDTO.setA_no(rs.getLong("a_no"));
					addrDTO.setA_name(rs.getString("a_name"));
					
					//휴대폰번호 0000000000 -> 000-0000-0000 형식전환
					String hpTemp = rs.getString("a_hp");
					String hpTemp2 = hpTemp.substring(0, 3) + "-" + hpTemp.substring(3, 7) + "-" + hpTemp.substring(7, 11);
					
					addrDTO.setA_hp(hpTemp2);
					addrDTO.setA_addr1(rs.getString("a_addr1"));
					addrDTO.setA_addr2(rs.getString("a_addr2"));
					addrDTO.setA_post(rs.getString("a_post"));
					addrDTO.setA_request(rs.getString("a_request"));
					
					byte temp = rs.getByte("a_default_flag");
					if(temp==1) {
						addrDTO.setA_default_flag(true);
					}else {
						addrDTO.setA_default_flag(false);
					}
					
					return addrDTO;
					
				}else{
					
					//없으면
					return null;
					
				}//if
				
			} catch (Exception e) {
				System.out.println("AddrDAO.selectById() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	
	    	
	    }//selectById()
	    //==================================================================================================		    
	    
	    
	    
	    //==================================================================================================
	    // selectAllById(Connection, String) : 기본 배송지 가져오기
	    //==================================================================================================
	    public List<AddrDTO> selectAllById(Connection conn, String id) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	List<AddrDTO> list = null;
	    	
	    	try {
	    		pstmt = conn.prepareStatement("select * from addr where m_id=? order by a_default_flag desc, a_no");
	    		pstmt.setString(1, id);
	    		rs = pstmt.executeQuery();
	    		list = new ArrayList<AddrDTO>();
	    		
	    		while(rs.next()) {
	    			
	    			AddrDTO addrDTO = new AddrDTO();
	    			
	    			addrDTO.setA_no(rs.getLong("a_no"));
	    			addrDTO.setA_name(rs.getString("a_name"));
	    			
	    			//휴대폰번호 0000000000 -> 000-0000-0000 형식전환
	    			String hpTemp = rs.getString("a_hp");
	    			String hpTemp2 = hpTemp.substring(0, 3) + "-" + hpTemp.substring(3, 7) + "-" + hpTemp.substring(7, 11);
	    			
	    			addrDTO.setA_hp(hpTemp2);
	    			addrDTO.setA_addr1(rs.getString("a_addr1"));
	    			addrDTO.setA_addr2(rs.getString("a_addr2"));
	    			addrDTO.setA_post(rs.getString("a_post"));
	    			addrDTO.setA_request(rs.getString("a_request"));
	    			
	    			byte temp = rs.getByte("a_default_flag");
	    			if(temp==1) {
	    				addrDTO.setA_default_flag(true);
	    			}else {
	    				addrDTO.setA_default_flag(false);
	    			}
	    			
	    			list.add(addrDTO);
	    			
	    		}//while
	    		
	    	} catch (Exception e) {
	    		System.out.println("AddrDAO.selectById() 예외 :"+e);
	    		return null;
	    	} finally {
	    		try{
	    			if(rs!=null){rs.close();}
	    			if(pstmt!=null){pstmt.close();}
	    		}catch(Exception ex2){}
	    	}//try
	    	
	    	if(list.isEmpty() || list.size()==0) {
	    		return null;
	    	}else {
	    		
	    		return list;
	    	}
	    	
	    }//selectById()
	    //==================================================================================================		    
		    
		
	    
	    //==================================================================================================
	    // insert(Connection, CreateProductRequest) : 상품정보 삽입
	    //==================================================================================================
	    public void insert(Connection conn, AddrDTO addrDTO) throws SQLException{
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	    		pstmt = conn.prepareStatement("insert into addr(a_name, a_hp, a_addr1, a_addr2, a_post, a_request, a_default_flag, m_id) value(?,?,?,?,?,?,?,?)");
	    		
	    		pstmt.setString(1, addrDTO.getA_name());
	    		pstmt.setString(2, addrDTO.getA_hp());
	    		pstmt.setString(3, addrDTO.getA_addr1());
	    		pstmt.setString(4, addrDTO.getA_addr2());
	    		pstmt.setString(5, addrDTO.getA_post());
	    		pstmt.setString(6, addrDTO.getA_request());
	    		
	    		if(addrDTO.isA_default_flag()) {
	    			pstmt.setInt(7, 1);
	    		}else {
	    			pstmt.setInt(7, 0);
	    		}
	    		
	    		pstmt.setString(8, addrDTO.getM_id());
	    		
	    		pstmt.executeUpdate();
	    		
			} catch (Exception e) {
				System.out.println("AddrDAO.insert() 예외 :"+e);
			} finally {
				try{
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    }
	    //==================================================================================================
}//class
