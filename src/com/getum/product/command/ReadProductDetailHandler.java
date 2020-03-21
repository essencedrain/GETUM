package com.getum.product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.product.service.ReadProductDetailRequest;
import com.getum.product.service.ReadProductDetailService;

//==================================================================================================
// ReadProductDetailHandler : 상품 상세정보 보기
// GET/POST 요청 : productdetail.jsp
//==================================================================================================
public class ReadProductDetailHandler implements CommandHandler{

	//==================================================================================================
    // process() : 핸들러 공통
    //==================================================================================================
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res){
			
			ReadProductDetailService rPDSer = new ReadProductDetailService();
			
			String p_uuid = req.getParameter("p_uuid");
			
			ReadProductDetailRequest rPDReq = rPDSer.productDetail(p_uuid);
			
			if(rPDReq==null) {
				req.setAttribute("productDetail", null);
				return "/view/home/productdetail.jsp";
			}else {
				req.setAttribute("productDetail", rPDReq);
				return "/view/home/productdetail.jsp";
			}			
			
			
	}
	//==================================================================================================
	
}//class
