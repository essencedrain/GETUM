package com.getum.product.command;

import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.product.service.CreateProductRequest;
import com.getum.product.service.CreateProductService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//==================================================================================================
//CreateProductHandler : 상품등록 핸들러
//GET 요청 : /authOnly/productCreate.jsp 리턴
//POST 요청 : 상품등록 처리
//	-> 성공시 :  
//	-> 실패시 : /authOnly/productCreate.jsp 리턴
//==================================================================================================
public class CreateProductHandler implements CommandHandler{

	//field
		private String form_view = "/view/home/authOnly/productCreate.jsp";
		private CreateProductService createProductService = new CreateProductService();
		
		
		
	//==================================================================================================
    // process() : 핸들러 공통
    //==================================================================================================
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res){
		
		if( req.getMethod().equalsIgnoreCase("GET") ) {
			return processForm(req,res);
		} else if ( req.getMethod().equalsIgnoreCase("POST") ) {
			return processSubmit(req,res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}//if
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
    // processForm() : GET 처리
    //==================================================================================================
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return form_view;
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // processSubmit() : POST 처리
    //==================================================================================================
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		CreateProductRequest proReq = new CreateProductRequest();
		
		//==================================================================================================		
        //uuid 생성
        //==================================================================================================	
		String uuid = UUID.randomUUID().toString().replace("-", "");
		proReq.setP_uuid(uuid);
		//==================================================================================================
		
		
		
		//==================================================================================================
		//이미지 업로드
		//==================================================================================================
		
		
			// 파일 업로드를 하기 위해서 WEB-INF/lib/cos.jar 추가 및 객체 생성
			MultipartRequest multi = null;
			
			// 업로드 될 파일의 최대 사이즈 (10메가)
	        int sizeLimit = 10 * 1024 * 1024;
	        
	        // 파일이 업로드될 실제 tomcat 폴더의 경로 (WebContent 기준)
	        String savePath = req.getSession().getServletContext().getRealPath("/view/img/product");
	        
			
	        try{
	            multi=new MultipartRequest(
	                    req
	                    , savePath
	                    , sizeLimit
	                    , "UTF-8"
	                    , new DefaultFileRenamePolicy());
	 
	         }catch (Exception e) {
	        	 System.out.println("CreateProductHandler.processSubmit.이미지처리 : "+e);
	         }//try
	        
	        //폼안의 전송된 파일 정보를 가져오기
	    	Enumeration formNames = multi.getFileNames();
	    	
	    	//자료가 많을 경우는 while문을 사용
	    	String formName = (String)formNames.nextElement();
	    	
	    	//서버에 저장된 파일 이름을 얻기
	    	String fileName = multi.getFilesystemName(formName).trim();
	    	
	    	//확장자 얻기
	    	int find = fileName.indexOf(".");
	    	String ext = fileName.substring(find);
	    	
	    	if(!fileName.equals("")) {
	    	     String fullFileName = savePath + "/" + fileName;
	    	     java.io.File f1 = new java.io.File(fullFileName);
	    	     
	    	     if(f1.exists()) {     // 업로드된 파일명이 존재하면 Rename한다.
	    	          java.io.File newFile = new java.io.File(savePath + "/" + uuid + ext);
	    	          f1.renameTo(newFile);   // rename...
	    	     }//if
	    	}//if

        //==================================================================================================	        
		
	        
		//==================================================================================================		
		//form에서 넘어온 자료 처리
		//==================================================================================================
		proReq.setP_name(multi.getParameter("p_name"));
		proReq.setP_code(multi.getParameter("p_code"));
		proReq.setP_price(Long.parseLong(multi.getParameter("p_price")));
		
		String date = multi.getParameter("p_release_date");
		java.sql.Date d = java.sql.Date.valueOf(date);
		proReq.setP_release_date(d);
		
		proReq.setP_manufacture(multi.getParameter("p_manufacture"));
		proReq.setP_detail(multi.getParameter("p_detail"));
		proReq.setP_stock(Long.parseLong(multi.getParameter("p_stock")));
		proReq.setP_category(multi.getParameter("p_category"));
		//==================================================================================================
		
		
		try {
			createProductService.create(proReq);
			return "/view/home/index.jsp";
		} catch (Exception e) {
			System.out.println("CreateProductHandler.processSubmit() 에러 : " + e);
			return form_view;
		}//try
		
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // 
    //==================================================================================================
	//==================================================================================================
}//class
