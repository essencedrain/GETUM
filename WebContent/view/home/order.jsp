<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<%@ page import="com.getum.cart.service.*" %>
<%@ page import="com.getum.auth.service.*" %>
<%@ page import="com.getum.order.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
CartRequest cReq = null;
User user = null;
int hcartSize = 0;
int priceSum = 0;

Hashtable hcart = null;
if(request.getParameter("flag")!=null){
	if(request.getParameter("flag").equals("default")){
		hcart = (Hashtable) session.getAttribute("cartMap");
	}else{
		hcart = (Hashtable) session.getAttribute("cartMap2");
	}
}//if
Enumeration hcartKey = hcart.keys();
hcartSize = hcart.size();

//user = (User) session.getAttribute("authUser");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start order Area =======================  -->
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<section class="order-area pt-5">
    <div class="container-fluid p-0 animated fadeIn faster">
        <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
            <h1 class="d-inline"><i class="far fa-credit-card fa-sm"></i> 주문 / 결제</h1>
            <hr>
        </div>

        <div class="row mt-4">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
                <h5>구매자정보</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">이름</td>
                            <td style="width: 90%">${authUser.m_name}</td>
                        </tr>
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">이메일</td>
                            <td style="width: 90%">${authUser.m_email}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
<!-- ////////////////////////////////////////////////////////////start 배송지//////////////////////////////////////////////////////////////////////////////////////// -->   
	<c:choose>
		<c:when test="${empty userAddr}">
			<div class="row mt-3">
	            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
	                <div class="mb-2">
	                    <h5 class="d-inline">받는사람정보</h5>
	                    <button type="button" class="btn btn-sm btn-outline-secondary mx-1" data-toggle="modal" data-target="#addrModal">배송지추가</button>
	                </div>
	                <div class="table-responsive">
	                    <table class="table table-bordered text-nowrap">
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">이름</td>
	                            <td style="width: 90%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">배송주소</td>
	                            <td style="width: 90%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">연락처</td>
	                            <td style="width: 90%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">배송 요청사항</td>
	                            <td style="width: 90%">-</td>
	                        </tr>
	                    </table>
	                </div>
	                <input type="hidden" name="addrFlag" id="addrFlag" value="0">
	            </div>
	        </div>
		</c:when>
		<c:otherwise>
			<%
				AddrDTO dto = new AddrDTO();
				dto = (AddrDTO)session.getAttribute("userAddr");
			%>
			<div class="row mt-3">
	            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
	                <div class="mb-2">
	                    <h5 class="d-inline">받는사람정보</h5>
	                    <button type="button" class="btn btn-sm btn-outline-secondary mx-1" data-toggle="modal" data-target="#addrModal">배송지변경</button>
	                </div>
	                <div class="table-responsive">
	                    <table class="table table-bordered  text-nowrap">
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">이름</td>
	                            <td style="width: 90%" id="receiverName"><%= dto.getA_name() %></td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">배송주소</td>
	                            <td style="width: 90%" id="receiverAddr"><%= dto.getA_addr1() %>, <%= dto.getA_addr2() %> (<%= dto.getA_post() %>)</td>
	                            <input type="hidden" name="getA_addr1" id="getA_addr1" value="<%= dto.getA_addr1() %>">
	                            <input type="hidden" name="getA_addr2" id="getA_addr2" value="<%= dto.getA_addr2() %>">
	                            <input type="hidden" name="getA_post" id="getA_post" value="<%= dto.getA_post() %>">
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">연락처</td>
	                            <td style="width: 90%" id="receiverHp"><%= dto.getA_hp() %></td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary text-right" style="width: 10%">배송 요청사항</td>
	                            <td style="width: 90%" id="receiverReq"><%= dto.getA_request() %></td>
	                        </tr>
	                    </table>
	                </div>
	                <input type="hidden" name="addrFlag" id="addrFlag" value="1">
	            </div>
	        </div>
		</c:otherwise>
	</c:choose>
        
<!-- ////////////////////////////////////////////////////////////end 배송지//////////////////////////////////////////////////////////////////////////////////////// -->
        <div class="row mt-3">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
                <h5>주문내역</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
<!-- ////////////////////////////////////////////////////////////start 상품내역//////////////////////////////////////////////////////////////////////////////////////// -->   
						<%
							while(hcartKey.hasMoreElements()){
								cReq = (CartRequest) hcart.get(hcartKey.nextElement());
						%>                 	
		                        <tr>
		                            <td style="width: 5%" class="text-center align-middle"><img src="../img/thumb/<%= cReq.getImgName() %>" alt="<%= cReq.getImgName() %>" width="80"></td>
		                            <td style="width: 95%" class="align-middle"><h5><%= cReq.getManufacture() %>, <%= cReq.getName() %>, <%= cReq.getQuantity() %>개</h5></td>
		                        </tr>
                        <%
								priceSum += cReq.getPrice() * cReq.getQuantity();
							}//while
                        %>
<!-- ////////////////////////////////////////////////////////////end 상품내역//////////////////////////////////////////////////////////////////////////////////////// -->                    
                    </table>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12">
                <h5>결제정보</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">총상품가격</td>
                            <td style="width: 90%" id="priceSum"><%= priceSum %></td>
                            <input type="hidden" name="priceSum3" id="priceSum3" value="<%= priceSum %>">
                        </tr>
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">배송비</td>
                            <c:choose>
                            	<c:when test="<%= priceSum < 20000 %>">
		                            <td style="width: 90%">3,000원 (2만원 이상 구매 시 무료배송)</td>
		                            <input type="hidden" name="deliveryFee" id="deliveryFee" value="3000">
                            	</c:when>
                            	<c:otherwise>
                            		<td style="width: 90%">무료배송</td>
                            		<input type="hidden" name="deliveryFee" id="deliveryFee" value="0">
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">포인트사용</td>
                            <td style="width: 90%">
                                <span id="UsingPoint">0</span><span class="mr-4">P</span>
                                <input type="hidden" name="UsingPoint2" id="UsingPoint2" value="0">
                                <span class="mr-2">보유 : </span><span id="pointBalance">${authUser.m_point}</span>
                                <input type="hidden" name="pointBalance2" id="pointBalance2" value="${authUser.m_point}">
                                <button class="btn btn-sm btn-outline-secondary mx-1" id="pointButton">포인트사용</button>
                            </td>
                        </tr>
                        <tr class="d-none" id="pointUseBox">
                            <td class="table-secondary text-right" style="width: 10%"></td>
                            <td style="width: 90%">
                                <input class="ml-2 mr-1" type="text" name="pointInput" id="pointInput" size="3" value="0">P
                                <button class="btn btn-sm btn-primary mx-1" type="button" onclick="return pointUse();">포인트적용</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">총결제금액</td>
                            <c:choose>
                            	<c:when test="<%= priceSum < 20000 %>">
		                            <td style="width: 90%" id="priceSum2"><%= priceSum + 3000 %></td>
                            	</c:when>
                            	<c:otherwise>
                            		<td style="width: 90%" id="priceSum2"><%= priceSum %></td>
                            	</c:otherwise>
                            </c:choose>
                            
                        </tr>
                        <tr>
                            <td class="table-secondary text-right" style="width: 10%">결제방법</td>
                            <td style="width: 90%">
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio" value="1" checked="checked">계좌이체
                                    </label>
                                  </div>
                                  <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio" value="2">신용카드
                                    </label>
                                  </div>
                                  <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio" value="3">무통장입금
                                    </label>
                                  </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="row my-2">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-sm-12 text-center">
                <button class="btn btn-lg btn-outline-secondary px-5 m-2" onclick="javascript:window.history.back();">이전으로</button>
                <form name="payment" method="post" action="pay.get" class="d-inline">
                	<input type="hidden" name="o_total_price" id="o_total_price" value="">
                	<input type="hidden" name="o_use_point" id="o_use_point" value="">
                	<c:choose>
	                   	<c:when test="<%= priceSum < 20000 %>">
	                    	<input type="hidden" name="o_delivery_flag" id="o_delivery_flag" value="true">
	                   	</c:when>
	                   	<c:otherwise>
	                   		<input type="hidden" name="o_delivery_flag" id="o_delivery_flag" value="false">
	                   	</c:otherwise>
                    </c:choose>
                	<input type="hidden" name="o_payment" id="o_payment" value="">
                	<input type="hidden" name="o_payment_method" id="o_payment_method" value="">
                	<input type="hidden" name="o_name" id="o_name" value="">
                	<input type="hidden" name="o_hp" id="o_hp" value="">
                	<input type="hidden" name="o_addr1" id="o_addr1" value="">
                	<input type="hidden" name="o_addr2" id="o_addr2" value="">
                	<input type="hidden" name="o_post" id="o_post" value="">
                	<input type="hidden" name="o_request" id="o_request" value="">
                	<input type="hidden" name="m_id" id="m_id" value="${authUser.m_id}">
                	<input type="hidden" name="m_point" value="${authUser.m_point}">
                	<%
                	if(request.getParameter("flag")!=null){
                		if(request.getParameter("flag").equals("default")){
                	%>
                			<input type="hidden" name="flag" value="default">
                			
                	<% }else if(request.getParameter("flag").equals("buy")){ %>
                			<input type="hidden" name="flag" value="buy">
                	<%
                		}//if
                	}//if
                	%>
                	<button type="button" class="btn btn-lg btn-primary px-5 m-2" onclick="return payment1();">결제하기</button>
                </form>
            </div>
        </div>

    </div>
</section>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!--  ======================= End order Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!--  ======================= Start 배송지 Modal 1뎁스 Area ================================ -->
<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addrModalTitle">배송지 선택</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
	        <div class="row">
	            <table class="table table-bordered">
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					<c:choose>
						<c:when test="${empty userAddrAll}">
							<tr class="text-center">
								<td><h5>등록된 배송지 없음</h5></td>
							</tr>
						</c:when>
						<c:otherwise>
						<%
							List<AddrDTO> list = new ArrayList<AddrDTO>();
							list = (List)session.getAttribute("userAddrAll");
							
							for(AddrDTO i : list){
						%>
			                <tr>
			                    <td>
			                        <h6>
			                        	<%= i.getA_name() %>
										<% if(i.isA_default_flag()){%>
											<span class="badge badge-danger">기본배송지</span>
										<%}//if %>
			                        </h6>
			                        <p><%= i.getA_addr1() %>, <%= i.getA_addr2() %> </p>
			                        <p><%= i.getA_hp() %></p>
			                        <p>요청사항 : <%= i.getA_request() %></p>
			                        <div>
			                            <button type="button" class="btn btn btn-outline-secondary float-left selectModiAddr" data-toggle="modal" data-target="#addrModiModal">
			                            	수정
			                            	<input type="hidden" name="0" value="<%= i.getA_name() %>">
		                            		<input type="hidden" name="1" value="<%= i.getA_addr1() %>">
		                            		<input type="hidden" name="2" value="<%= i.getA_addr2() %>">
		                            		<input type="hidden" name="3" value="<%= i.getA_hp() %>">
		                            		<input type="hidden" name="4" value="<%= i.getA_request() %>">
		                            		<input type="hidden" name="5" value="<%= i.getA_post() %>">
		                            		<input type="hidden" name="6" value="<%= i.getA_no() %>">
		                            		<input type="hidden" name="7" value="<%= i.isA_onlyOne_flag() %>">
			                            </button>
		                            	<button type="button" class="btn btn btn-primary float-right selectAddr" data-dismiss="modal">
		                            		선택
		                            		<input type="hidden" name="0" value="<%= i.getA_name() %>">
		                            		<input type="hidden" name="1" value="<%= i.getA_addr1() %>">
		                            		<input type="hidden" name="2" value="<%= i.getA_addr2() %>">
		                            		<input type="hidden" name="3" value="<%= i.getA_hp() %>">
		                            		<input type="hidden" name="4" value="<%= i.getA_request() %>">
		                            		<input type="hidden" name="5" value="<%= i.getA_post() %>">
		                            	</button>
			                        </div>
			                    </td>
			                </tr>
						<%
							}//for
						%>
						</c:otherwise>
					</c:choose>
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	            </table>
	        </div>
	        <div class="row">
	            <button type="button" class="btn btn-lg btn-outline-secondary w-100" data-toggle="modal" data-target="#addrAddModal">+배송지 추가</button>
	        </div>
    	</div>
      </div>
    </div>
  </div>
</div>
<!--  ======================= End 배송지 Modal 1뎁스 Area ================================ -->


<!--  ======================= Start 배송지 Modal 2뎁스 (추가) Area ================================ -->
<div class="modal fade" id="addrAddModal" tabindex="-1" role="dialog" aria-labelledby="addrAddModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addrAddModalTitle">배송지 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
	        <div class="row">
	        	<form name="addrAddForm" method="post" action="order.get" class="w-100">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control"  placeholder="받는사람" name="a_name" id="a_name">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-map"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="주소" name="a_addr1" id="a_addr1" readonly="readonly">
                        </div>
						
						<div class="input-group mb-3 d-none" id="addr2">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="상세주소" name="a_addr2" id="a_addr2">
                        </div>
						
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="우편번호" name="a_post" id="a_post" readonly="readonly">
                            <div class="input-group-append">
						    	<button type="button" class="btn btn-outline-secondary" onclick="openDaumPostcode()"><i class="fas fa-search"></i></button>
						    </div>
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="휴대폰 번호" name="a_hp" id="a_hp" maxlength="13" onKeyup="inputPhoneNumber(this);">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-comment-dots"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="요청사항" name="a_request" id="a_request">
                        </div>
                        <input type="hidden" name="flag" value="create">
						<input type="hidden" name="m_id" value="${authUser.m_id}">
                        <c:choose>
							<c:when test="${empty userAddrAll}">
								<input type="hidden" name="a_default_flag" value="true">
		                        <button type="submit" class="btn btn-lg btn-primary w-100">저장</button>
							</c:when>
							<c:otherwise>
								<div class="form-check-inline mb-3">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" name="a_default_flag" value="true">기본배송지로 저장
								  </label>
								</div>
		                        <button type="submit" class="btn btn-lg btn-primary w-100">저장</button>
							</c:otherwise>
						</c:choose>
                    </form>
	        </div>
		</div>
      </div>
    </div>
  </div>
</div>
<!--  ======================= End 배송지 Modal 2뎁스 (추가) Area ================================ -->



<!--  ======================= Start 배송지 Modal 2뎁스 (수정,삭제) Area ================================ -->
<div class="modal fade" id="addrModiModal" tabindex="-1" role="dialog" aria-labelledby="addrModiModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addrModiModalTitle">배송지 수정/삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
	        <div class="row">
	        	<form name="addrModiForm" method="post" action="order.get" class="w-100">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control"  placeholder="받는사람" name="a2_name" id="a2_name">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-map"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="주소" name="a2_addr1" id="a2_addr1" readonly="readonly">
                        </div>
						
						<div class="input-group mb-3" id="addr2">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="상세주소" name="a2_addr2" id="a2_addr2">
                        </div>
						
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="우편번호" name="a2_post" id="a2_post" readonly="readonly">
                            <div class="input-group-append">
						    	<button type="button" class="btn btn-outline-secondary" onclick="openDaumPostcode2()"><i class="fas fa-search"></i></button>
						    </div>
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="휴대폰 번호" name="a2_hp" id="a2_hp" maxlength="13" onKeyup="inputPhoneNumber(this);">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-comment-dots"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="요청사항" name="a2_request" id="a2_request">
                        </div>
                        
                        <input type="hidden" name="flag" value="modify">
                        <input type="hidden" name="a2_no" value="" id="a2_no">
						<input type="hidden" name="m_id" value="${authUser.m_id}" id="a2_id">
						
						<div class="form-check-inline mb-3">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" name="a2_default_flag" id="checkbox99" value="true">기본배송지로 저장
						  </label>
						</div>
                        <button type="submit" class="btn btn-lg btn-primary w-100 mb-2">저장</button>
                        <button type="button" class="btn btn-lg btn-outline-danger w-100" onclick="addrDelete()">삭제</button>

                    </form>
	        </div>
		</div>
      </div>
    </div>
  </div>
</div>
<!--  ======================= End 배송지 Modal 2뎁스 (수정,삭제) Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<!-- 다음 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- order.js  -->
<script src="../js/order.js"></script>

<!-- 스크립트릿 때문에 js에 못담은 function -->
<script>
//==============================================================================================================
//결제하기 버튼
//==============================================================================================================
function payment1() {
	
	$("#o_total_price").val( "<%= priceSum%>" );
	$("#o_use_point").val( $("#UsingPoint2").val() );
	
	<% if(priceSum<20000){ %>
		$("#o_payment").val( "<%= priceSum+3000 %>" );
	<% }else{ %>
		$("#o_payment").val( "<%= priceSum %>" );
	<% }//if %>
	
	$("#o_payment_method").val( $("input:radio[name=optradio]:checked").val() );
	$("#o_name").val( $("#receiverName").text() );
	$("#o_hp").val( $("#receiverHp").text() );
	$("#o_addr1").val( $("#getA_addr1").val() );
	$("#o_addr2").val( $("#getA_addr2").val() );
	$("#o_post").val( $("#getA_post").val() );
	$("#o_request").val( $("#receiverReq").text() );
	 
	//배송지 없이 결제 시도시 리턴
	if($("#addrFlag").val()=="0"){		
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: "배송지 정보가 올바르지 않습니다.",
			showConfirmButton: false,
			timer: 1500
		});
		return false;
	 }
	
	document.payment.submit();
}
//==============================================================================================================
	
	
//==============================================================================================================
//포인트적용 버튼
//==============================================================================================================
function pointUse() {
	
	if( Number( $("#pointInput").val() ) > Number( $("#pointBalance2").val() ) ){
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: "입력한 값이 보유한 포인트보다 큽니다.",
			showConfirmButton: false,
			timer: 1500
		});
		$("#pointInput").focus();
		return false;
	}else{
		if( Number( $("#pointInput").val() ) <= ( Number( $("#deliveryFee").val() ) + Number( $("#priceSum3").val() ) ) ){
			//정상사용
			$("#UsingPoint2").val( $("#pointInput").val() );
			$("#UsingPoint").text( numberFormat3($("#pointInput").val()) );
			$("#pointUseBox").addClass("d-none");
			
		}else{
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: "입력한 값이 총결제금액보다 큽니다.",
				showConfirmButton: false,
				timer: 1500
			});
			$("#pointInput").focus();
			return false;
		}//if
	}//if
	$("#priceSum2").text( numberFormat( Number( $("#deliveryFee").val() ) + Number( $("#priceSum3").val() ) - Number( $("#UsingPoint2").val() ) ) );
	$("#pointUseBox").addClass("d-none");
}
//==============================================================================================================
</script>
</body>
</html>