package com.getum.product.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;
import com.getum.product.service.ReadProductList;
import com.getum.product.service.ReadProductListService;

//==================================================================================================
//ReadProductListHandler : 상품목록보기
//GET/POST 요청 : product.jsp 리턴
//==================================================================================================
public class ReadProductListHandler implements CommandHandler{
	
		//==================================================================================================
	    // process() : 핸들러 공통
	    //==================================================================================================
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res){
			
			ReadProductListService readProductListService = new ReadProductListService();
			
			List<ReadProductList> list = readProductListService.listService();
			
			if(list==null) {
				req.setAttribute("productList", null);
				return "/view/home/product.jsp";
			}else {
				req.setAttribute("productList", list);
				return "/view/home/product.jsp";
			}
		}
		//==================================================================================================
		
}//class

