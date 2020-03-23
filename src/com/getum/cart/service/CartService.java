package com.getum.cart.service;


import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

//==================================================================================================
//CartService : 장바구니 삽입/수정/삭제 처리
//==================================================================================================
public class CartService {
	
	private Hashtable<String, CartRequest> hcart = new Hashtable<>();
	
	//==================================================================================================
    // insertCart(HttpServletRequest) : 장바구니 등록 처리
    //==================================================================================================
	public void insertCart(HttpServletRequest req) {
		
		String uuid = req.getParameter("imgName").substring(0,33);
		
		CartRequest cartRequest = new CartRequest();
		
		cartRequest.setImgName(req.getParameter("imgName"));
		cartRequest.setName(req.getParameter("name"));
		cartRequest.setManufacture(req.getParameter("manufacture"));
		cartRequest.setPrice(Integer.parseInt(req.getParameter("rawPrice")));
		cartRequest.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		
		if(req.getSession().getAttribute("cartMap")!=null) {
						
			hcart = (Hashtable) req.getSession().getAttribute("cartMap");
			
			if(hcart.containsKey(uuid)) {
				int tempQuantity = hcart.get(uuid).getQuantity() + cartRequest.getQuantity();
				cartRequest.setQuantity(tempQuantity);
				hcart.put(uuid, cartRequest);
			}else{
				hcart.put(uuid, cartRequest);
			}//if
			req.getSession().setAttribute("cartMap", hcart);
		} else {
			
			hcart.put(uuid, cartRequest);
			req.getSession().setAttribute("cartMap", hcart);
		}
		
	}
	//==================================================================================================
	
	
	//==================================================================================================
    // deleteCart(HttpServletRequest) : 장바구니 삭제 처리
    //==================================================================================================
	public void deleteCart(HttpServletRequest req) {
		
		String uuid = req.getParameter("uuid");
		String multiUuid[];
		
		if(uuid.length()>33) {
			multiUuid = uuid.split(",");
			
			hcart = (Hashtable) req.getSession().getAttribute("cartMap");

			for(int i=0; i<multiUuid.length; i++) {
				hcart.remove(multiUuid[i]);
			}//for
		}else{
			hcart = (Hashtable) req.getSession().getAttribute("cartMap");
			hcart.remove(uuid);
		}//if
		
		req.getSession().setAttribute("cartMap", hcart);
	}
	//==================================================================================================
	
	
	
	//==================================================================================================
    // modifyCart(HttpServletRequest) : 장바구니 수정 처리
    //==================================================================================================
	public void modifyCart(HttpServletRequest req) {
		
		String uuid = req.getParameter("uuid");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		hcart = (Hashtable) req.getSession().getAttribute("cartMap");
		hcart.get(uuid).setQuantity(quantity);
		
		req.getSession().setAttribute("cartMap", hcart);
	}
	//==================================================================================================
}//class
