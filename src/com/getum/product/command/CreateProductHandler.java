package com.getum.product.command;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.product.service.CreateProductRequest;
import com.getum.product.service.CreateProductService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//==================================================================================================
//CreateProductHandler : 상품등록 핸들러
//GET 요청 : productCreate.jsp 리턴
//POST 요청 : 상품등록 처리
//	-> 성공시 :  
//	-> 실패시 : productCreate.jsp 리턴
//==================================================================================================
public class CreateProductHandler implements CommandHandler{

	//field
		private String form_view = "/view/home/productCreate.jsp";
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
		
		
		
		
        //uuid 생성
			String uuid = UUID.randomUUID().toString().replace("-", "");
		
			
			
		//이미지 업로드
		
			// 파일 업로드를 하기 위해서 WEB-INF/lib/cos.jar 추가 및 객체 생성
			MultipartRequest multi = null;
			
			// 업로드 될 파일의 최대 사이즈 (10메가)
	        int sizeLimit = 10 * 1024 * 1024;
	        
	        // 파일이 업로드될 실제 tomcat 폴더의 경로 (WebContent 기준)
	        String savePath = req.getSession().getServletContext().getRealPath("/view/img/product");
	        
	        //섬네일 저장경로
	        String saveThumb = req.getSession().getServletContext().getRealPath("/view/img/thumb");
	        
			
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
	        
	        
	        
        //uuid로 rename
	        //폼안의 전송된 파일 정보를 가져오기
	    	Enumeration formNames = multi.getFileNames();
	    	
	    	//자료가 많을 경우는 while문을 사용
	    	String formName = (String)formNames.nextElement();
	    	
	    	//서버에 저장된 파일 이름을 얻기
	    	String fileName = multi.getFilesystemName(formName).trim();
	    	
	    	//확장자명 얻기
	    	int find = fileName.indexOf(".");
	    	String ext = fileName.substring(find); // .jpg
	    	
	    	//확장자 첫글자 + UUID 
	    		int typeImg = 0; //리사이즈에서 png/ jpg,gif와 구분하기 위해서 쓰는 변수
		    	if(ext.equals(".jpg")){
		    		uuid = "j" + uuid;
		    		typeImg = 1;
		    	}else if(ext.equals(".png")){
		    		uuid = "p" + uuid;
		    		typeImg = 2;
		    	}else if(ext.equals(".gif")){
		    		uuid = "g" + uuid;
		    		typeImg = 1;
		    	}//if
			
	    	//uuid로 rename하여 저장 + 이미지 리사이즈
	    	if(!fileName.equals("")) {
	    	     String fullFileName = savePath + "/" + fileName; //E:\git-clone\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GETUM\view\img\product/a1.gif
	    	     String newFileName = savePath + "/" + uuid + ext; //E:\git-clone\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GETUM\view\img\product/g512ed698d63942f58245c74f75fbb0f3.gif
	    	     
	    	     //리사이즈
		    	    try {
		    	    	//원본 이미지 세로 600 리사이즈후 원래 위치에 덮어쓰기
						imgOnload(fullFileName, 600, fullFileName, typeImg);
						//썸네일 이미지 세로 300 리사이즈 후 썸네일 폴더에 저장
						imgOnload(fullFileName, 300, saveThumb+"/"+uuid+ext, typeImg);
					} catch (Exception e) {
						System.out.println("CreateProductHandler.원본이미지리사이즈 에러 : " + e);
					}
	    	     
		    	    
	    	     java.io.File f1 = new java.io.File(fullFileName);
	    	     
	    	     if(f1.exists()) {     // 업로드된 파일명이 존재하면 Rename한다.
	    	          java.io.File newFile = new java.io.File(newFileName); 
	    	          f1.renameTo(newFile);   // rename...
	    	     }//if
	    	   
	    	}//if
    	
    	
	        
		//form에서 넘어온 자료 처리
	    	proReq.setP_uuid(uuid);
			proReq.setP_name(multi.getParameter("p_name"));
			proReq.setP_code(multi.getParameter("p_code"));
			proReq.setP_price(Long.parseLong(multi.getParameter("p_price")));
			
			String date = multi.getParameter("year") + "-" + multi.getParameter("month") + "-" + multi.getParameter("day");
			java.sql.Date d = java.sql.Date.valueOf(date);
			proReq.setP_release_date(d);
			
			proReq.setP_manufacture(multi.getParameter("p_manufacture"));
			proReq.setP_detail(multi.getParameter("p_detail"));
			proReq.setP_stock(Long.parseLong(multi.getParameter("p_stock")));
			
			String cateResult ="";
			String tempChk[] = multi.getParameterValues("cateChk");
			if(tempChk!=null) {
				cateResult = multi.getParameter("cateRadio") + ",";
				for(int i=0; i<tempChk.length; i++) {
					if( (i+1) == tempChk.length) {
						cateResult += tempChk[i];
					}else {
						cateResult += tempChk[i] + ",";
					}//if
				}//for
			}else {
				cateResult = multi.getParameter("cateRadio");
			}
			proReq.setP_category(cateResult);
		
			
		//DB 삽입 후 리턴
			try {
				createProductService.create(proReq);
				return "/view/home/productCreate.jsp";
			} catch (Exception e) {
				System.out.println("CreateProductHandler.processSubmit() 에러 : " + e);
				return form_view;
			}//try
		
	}
    //==================================================================================================
	
	
	
	//==================================================================================================
    // 썸네일 처리
    //==================================================================================================
	/*
	 * 
	 * imgUrl = 파일 경로

	 * h = 변경할 height, 없을경우 원본 사이즈

	 * outPath = 경로에 저장

	 */

	public void imgOnload(String imgUrl, int h, String outPath, int typeImg) throws Exception{

		int extIndex = imgUrl.lastIndexOf(".");

		String fileExt = imgUrl.substring(extIndex+1);

		BufferedImage sourceImage= ImageIO.read(new File(imgUrl));

		int width = sourceImage.getWidth();

		int height = sourceImage.getHeight();
		
		int param_h = h;

		double temp = (double)width/(double)height;
		double temp2 = temp*h;
		
		int param_w = (int)temp2;
		
		
		BufferedImage img = null;
		if(typeImg==1) {
			//jpg, gif
			img = new BufferedImage(param_w, param_h, BufferedImage.TYPE_INT_RGB);
		}else if(typeImg==2) {
			//png
			img = new BufferedImage(param_w, param_h, BufferedImage.TYPE_INT_ARGB);
		}//if

		Image scaledImage = sourceImage.getScaledInstance(param_w,param_h, Image.SCALE_SMOOTH);

		img.createGraphics().drawImage(scaledImage, 0, 0, null);
		
		BufferedImage img2 = null;
		if(typeImg==1) {
			//jpg, gif
			img2 = new BufferedImage(param_w, param_h, BufferedImage.TYPE_INT_RGB);
		}else if(typeImg==2) {
			//png
			img2 = new BufferedImage(param_w, param_h, BufferedImage.TYPE_INT_ARGB);
		}//if


		img2 = img.getSubimage(0, 0, param_w, param_h);

		if(outPath !=null){

			OutputStream os =new FileOutputStream(outPath);

			ImageIO.write(img2, fileExt, os);

			os.close();

		}

	}

	//==================================================================================================
}//class
