package com.getum.order.service;


//==================================================================================================
//OrderDetailRequest : 주문상세내역에서 결제정보, 배송지 정보 담기 위한 객체
//==================================================================================================
public class OrderDetailRequest {
	
	
	//field  13개
		private String date;
		private long total_price;
		private long use_point;
		private boolean isDelivery;
		private long payment;
		private String payment_method;
		private long add_point;
		private String m_name;
		private String m_hp;
		private String m_addr1;
		private String m_addr2;
		private String m_post;
		private String m_request;
		
		
	//constructor
		public OrderDetailRequest() {}

	//G&S
		public String getDate() {
			return date;
		}


		public void setDate(String date) {
			this.date = date;
		}


		public long getTotal_price() {
			return total_price;
		}


		public void setTotal_price(long total_price) {
			this.total_price = total_price;
		}


		public long getUse_point() {
			return use_point;
		}


		public void setUse_point(long use_point) {
			this.use_point = use_point;
		}


		public boolean isDelivery() {
			return isDelivery;
		}


		public void setDelivery(boolean isDelivery) {
			this.isDelivery = isDelivery;
		}


		public long getPayment() {
			return payment;
		}


		public void setPayment(long payment) {
			this.payment = payment;
		}


		public String getPayment_method() {
			return payment_method;
		}


		public void setPayment_method(String payment_method) {
			this.payment_method = payment_method;
		}


		public long getAdd_point() {
			return add_point;
		}


		public void setAdd_point(long add_point) {
			this.add_point = add_point;
		}


		public String getM_name() {
			return m_name;
		}


		public void setM_name(String m_name) {
			this.m_name = m_name;
		}


		public String getM_hp() {
			return m_hp;
		}


		public void setM_hp(String m_hp) {
			this.m_hp = m_hp;
		}


		public String getM_addr1() {
			return m_addr1;
		}


		public void setM_addr1(String m_addr1) {
			this.m_addr1 = m_addr1;
		}


		public String getM_addr2() {
			return m_addr2;
		}


		public void setM_addr2(String m_addr2) {
			this.m_addr2 = m_addr2;
		}


		public String getM_post() {
			return m_post;
		}


		public void setM_post(String m_post) {
			this.m_post = m_post;
		}


		public String getM_request() {
			return m_request;
		}


		public void setM_request(String m_request) {
			this.m_request = m_request;
		}
		
	
}//class
