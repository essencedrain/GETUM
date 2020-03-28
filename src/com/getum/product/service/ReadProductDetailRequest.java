package com.getum.product.service;

//==================================================================================================
//ReadProductDetailRequest : 상품상세 정보에서 필요한 데이터만 담는 객체
//==================================================================================================
public class ReadProductDetailRequest {
	
	//field 7개
		private String imgName; //이미지 로딩
		private String p_name;
		private String p_code;
		private long p_price;
		private String p_release_date;
		private String p_manufacture;
		private String p_detail;
		private long p_stock;
		
		//g&s
		public String getImgName() {
			return imgName;
		}
		public void setImgName(String imgName) {
			this.imgName = imgName;
		}
		public String getP_name() {
			return p_name;
		}
		public void setP_name(String p_name) {
			this.p_name = p_name;
		}
		public String getP_code() {
			return p_code;
		}
		public void setP_code(String p_code) {
			this.p_code = p_code;
		}
		public long getP_price() {
			return p_price;
		}
		public void setP_price(long p_price) {
			this.p_price = p_price;
		}
		public String getP_release_date() {
			return p_release_date;
		}
		public void setP_release_date(String p_release_date) {
			this.p_release_date = p_release_date;
		}
		public String getP_manufacture() {
			return p_manufacture;
		}
		public void setP_manufacture(String p_manufacture) {
			this.p_manufacture = p_manufacture;
		}
		public String getP_detail() {
			return p_detail;
		}
		public void setP_detail(String p_detail) {
			this.p_detail = p_detail;
		}
		public long getP_stock() {
			return p_stock;
		}
		public void setP_stock(long p_stock) {
			this.p_stock = p_stock;
		}
		
		
		
		
}//class
