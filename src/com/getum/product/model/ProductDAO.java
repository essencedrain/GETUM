package com.getum.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.getum.product.service.CreateProductRequest;
import com.getum.product.service.ReadProductDetailRequest;
import com.getum.product.service.ReadProductList;

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
	    // selectAllByUuid(Connection, String) : 상품정보 *모든* 정보 가져오기
	    //==================================================================================================
	    public ProductDTO selectAllByUuid(Connection conn, String uuid) throws SQLException{
	    	
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
	    // selectByUuid(Connection, String) : *상품상세 정보보기용* 가져오기 productdetail.jsp
	    //==================================================================================================
	    public ReadProductDetailRequest selectByUuid(Connection conn, String uuid) throws SQLException{
	    	
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	ReadProductDetailRequest rPDReq = new ReadProductDetailRequest();
	    	
	    	try {
	    		pstmt = conn.prepareStatement("select p_name, p_code, p_price, p_release_date, p_manufacture, p_detail from product where p_uuid = ?");
	    		pstmt.setString(1, uuid);
	    		rs = pstmt.executeQuery();
	    		
	    		
	    		if(rs.next()) {
	    			
	    			rPDReq.setP_name(rs.getString("p_name"));
	    			rPDReq.setP_code(rs.getString("p_code"));
	    			rPDReq.setP_price(rs.getLong("p_price"));
    				rPDReq.setP_release_date(""+rs.getDate("p_release_date"));
	    			rPDReq.setP_manufacture(rs.getString("p_manufacture"));
	    			rPDReq.setP_detail(rs.getString("p_detail"));
	    			
	    			//imgName
    				String imgChar = uuid.substring(0,1);
    				//uuid첫글자에따라 확장자 설정 
	    		    	if(imgChar.equals("j")){
	    		    		rPDReq.setImgName(uuid+".jpg");
	    		    	}else if(imgChar.equals("p")){
	    		    		rPDReq.setImgName(uuid+".png");
	    		    	}else if(imgChar.equals("g")){
	    		    		rPDReq.setImgName(uuid+".gif");
	    		    	}//if
	    			
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
	    	
	    	
	    	return rPDReq;
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
	    
	    
	    
	    //==================================================================================================
	    // getList(Connection) : 상품목록 가져오기
	    // 리턴값 : List<ReadProductList>
	    //==================================================================================================
	    public List<ReadProductList> getList(Connection conn) throws SQLException{
	    	
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	List<ReadProductList> list = null;
	    	
	    	try {
	    		pstmt = conn.prepareStatement("select p_uuid, p_name, p_price, p_category from product where p_delete_flag = ?");
	    		pstmt.setInt(1, 0);
	    		rs = pstmt.executeQuery();
	    		
	    		
    			list = new ArrayList<ReadProductList>();
    			String[] krTemp;
    			String[] enTemp;
    			
    			while(rs.next()) {
    				
    				ReadProductList readProductList = new ReadProductList(); 
    				
    				readProductList.setP_uuid(rs.getString("p_uuid"));
    				readProductList.setP_name(rs.getString("p_name"));
    				
    				//가격 콤마찍기
    				DecimalFormat formatter = new DecimalFormat("###,###");
    				readProductList.setP_price( formatter.format(rs.getLong("p_price")) + "원" );
    				
    				//카테고리 -> ","콤마 구분자로 쪼개서 -> 배열 변환
    				krTemp = rs.getString("p_category").split(",");
    				
    				//trim()
    				for(int i=0;i<krTemp.length;i++){
    					krTemp[i] = krTemp[i].trim();
    				}//for
    				
    				//위 한글카테고리를 영어로 변환
    				enTemp = Arrays.copyOf(krTemp, krTemp.length); //한글판 복사
    				
    				for(int i=0;i<enTemp.length;i++){
    					switch (enTemp[i]) {
						case "신제품":
							enTemp[i] = "latest";
							break;
						case "인기상품":
							enTemp[i] = "popular";
							break;
						case "스테인리스":
							enTemp[i] = "stainless";
							break;
						case "플라스틱":
							enTemp[i] = "plastic";
							break;
						}//switch/case
    				}//for
    				
    				readProductList.setP_category(krTemp); //한글 카테고리
    				readProductList.setP_category_en(enTemp); //영어 카테고리
    				
    				
    				//imgName
	    				String imgTemp = readProductList.getP_uuid();
	    				String imgChar = imgTemp.substring(0,1);
	    				
	    				//uuid첫글자에따라 확장자 설정 
		    		    	if(imgChar.equals("j")){
		    		    		readProductList.setP_imgName(imgTemp+".jpg");
		    		    	}else if(imgChar.equals("p")){
		    		    		readProductList.setP_imgName(imgTemp+".png");
		    		    	}else if(imgChar.equals("g")){
		    		    		readProductList.setP_imgName(imgTemp+".gif");
		    		    	}//if
    				
	    			list.add(readProductList);
	    			
    			}//while
	    			
			} catch (Exception e) {
				System.out.println("ProductDAO.selectByUuid() 예외 :"+e);
				return null;
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
				}catch(Exception ex2){}
			}//try
	    	
	    	return list;
	    }
	    //==================================================================================================
	    
}//class
