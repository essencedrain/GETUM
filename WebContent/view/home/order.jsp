<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<%@ page import="com.getum.cart.service.*" %>
<%@ page import="com.getum.auth.service.*" %>
<%@ page import="com.getum.order.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
Hashtable hcart = null;
CartRequest cReq = null;
User user = null;
int hcartSize = 0;
int priceSum = 0;

hcart = (Hashtable) session.getAttribute("cartMap");
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
    <div class="container-fluid">
        <div class="col-xl-8 offset-xl-2 col-10 offset-1">
            <h1 class="d-inline">주문 / 결제</h1>
            <hr>
        </div>

        <div class="row mt-4">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
                <h5>구매자정보</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
                        <tr>
                            <td class="table-secondary" style="width: 20%">이름</td>
                            <td style="width: 80%">${authUser.m_name}</td>
                        </tr>
                        <tr>
                            <td class="table-secondary" style="width: 20%">이메일</td>
                            <td style="width: 80%">${authUser.m_email}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
<!-- ////////////////////////////////////////////////////////////배송지//////////////////////////////////////////////////////////////////////////////////////// -->   
	<c:choose>
		<c:when test="${empty userAddr}">
			<div class="row mt-3">
	            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
	                <div class="mb-2">
	                    <h5 class="d-inline">받는사람정보</h5>
	                    <button type="button" class="btn btn-sm btn-outline-secondary mx-1" data-toggle="modal" data-target="#addrModal">배송지추가</button>
	                </div>
	                <div class="table-responsive">
	                    <table class="table table-bordered text-nowrap">
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">이름</td>
	                            <td style="width: 80%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">배송주소</td>
	                            <td style="width: 80%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">연락처</td>
	                            <td style="width: 80%">-</td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">배송 요청사항</td>
	                            <td style="width: 80%">-</td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	        </div>
		</c:when>
		<c:otherwise>
			<%
				AddrDTO dto = new AddrDTO();
				dto = (AddrDTO)session.getAttribute("userAddr");
			%>
			<div class="row mt-3">
	            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
	                <div class="mb-2">
	                    <h5 class="d-inline">받는사람정보</h5>
	                    <button type="button" class="btn btn-sm btn-outline-secondary mx-1" data-toggle="modal" data-target="#addrModal">배송지변경</button>
	                </div>
	                <div class="table-responsive">
	                    <table class="table table-bordered text-nowrap">
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">이름</td>
	                            <td style="width: 80%"><%= dto.getA_name() %></td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">배송주소</td>
	                            <td style="width: 80%"><%= dto.getA_addr1() %> &nbsp; <%= dto.getA_addr2() %></td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">연락처</td>
	                            <td style="width: 80%"><%= dto.getA_hp() %></td>
	                        </tr>
	                        <tr>
	                            <td class="table-secondary" style="width: 20%">배송 요청사항</td>
	                            <td style="width: 80%"><%= dto.getA_request() %></td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	        </div>
		</c:otherwise>
	</c:choose>
        
<!-- ////////////////////////////////////////////////////////////배송지//////////////////////////////////////////////////////////////////////////////////////// -->
        <div class="row mt-3">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
                <h5>주문내역</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
<!-- ////////////////////////////////////////////////////////////상품내역//////////////////////////////////////////////////////////////////////////////////////// -->   
						<%
							while(hcartKey.hasMoreElements()){
								cReq = (CartRequest) hcart.get(hcartKey.nextElement());
						%>                 	
		                        <tr>
		                            <td style="width: 5%" class="text-center align-middle"><img src="../img/thumb/<%= cReq.getImgName() %>" alt="<%= cReq.getImgName() %>" width="80"></td>
		                            <td style="width: 95%" class="align-middle"><%= cReq.getManufacture() %>, <%= cReq.getName() %>, <%= cReq.getQuantity() %>개</td>
		                        </tr>
                        <%
								priceSum += cReq.getPrice() * cReq.getQuantity();
							}//while
                        %>
<!-- ////////////////////////////////////////////////////////////상품내역//////////////////////////////////////////////////////////////////////////////////////// -->                    
                    </table>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
                <h5>결제정보</h5>
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
                        <tr>
                            <td class="table-secondary" style="width: 20%">총상품가격</td>
                            <td style="width: 80%" id="priceSum"><%= priceSum %></td>
                        </tr>
                        <tr>
                            <td class="table-secondary" style="width: 20%">배송비</td>
                            <td style="width: 80%">3,000원</td>
                        </tr>
                        <tr>
                            <td class="table-secondary" style="width: 20%">포인트</td>
                            <td style="width: 80%">
                                <span class="mr-5">0원</span>
                                <span class="mr-2">보유 : ${authUser.m_point}원</span>
                                <button class="btn btn-sm btn-outline-secondary mx-1">포인트사용</button>
                            </td>
                        </tr>
                        <tr class="d-none">
                            <td class="table-secondary" style="width: 20%"></td>
                            <td style="width: 80%">
                                <input class="ml-2 mr-1" type="text" placeholder="0" name="pointInput" size="3">원
                                <button class="btn btn-sm btn-primary mx-1">포인트적용</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-secondary" style="width: 20%">총결제금액</td>
                            <td style="width: 80%" id="priceSum2"><%= priceSum + 3000 %></td>
                        </tr>
                        <tr>
                            <td class="table-secondary" style="width: 20%">결제방법</td>
                            <td style="width: 80%">
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio">계좌이체
                                    </label>
                                  </div>
                                  <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio">신용카드
                                    </label>
                                  </div>
                                  <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" name="optradio">무통장입금
                                    </label>
                                  </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="row my-2">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1 text-center">
                <button class="btn btn-lg btn-outline-secondary px-5 m-2" onclick="javascript:window.history.back();">이전으로</button>
                <button class="btn btn-lg btn-primary px-5 m-2">결제하기</button>
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


<!--  ======================= Start Modal Area ================================ -->
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
											<span class="badge badge-primary">기본배송지</span>
										<%}//if %>
			                        </h6>
			                        <p><%= i.getA_addr1() %>, <%= i.getA_addr2() %> </p>
			                        <p><%= i.getA_hp() %></p>
			                        <p>요청사항 : <%= i.getA_request() %></p>
			                        <div>
			                            <button class="btn btn btn-outline-secondary float-left">수정</button>
			                            <button class="btn btn btn-primary float-right">선택</button>
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
	            <!-- <button class="btn btn-lg btn-outline-secondary w-100">+배송지 추가</button>-->
	            <button type="button" class="btn btn-lg btn-outline-secondary w-100" data-toggle="modal" data-target="#addrAddModal">+배송지 추가</button>
	        </div>
    	</div>
      </div>
    </div>
  </div>
</div>
<!--  ======================= End Modal Area ================================ -->
<!-- Modal -->
<div class="modal fade" id="addrAddModal" tabindex="-1" role="dialog" aria-labelledby="addrAddModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addrAddModalTitle">배송지 선택</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
	        <div class="row">
	        	<form name="addrAddForm" method="post" action="order.get" onsubmit="return check9(this)" class="w-100">
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
                        <div class="form-check-inline mb-3">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" name="a_default_flag" value="true">기본배송지로 저장
						  </label>
						</div>
						<input type="hidden" name="flag" value="create">
						<input type="hidden" name="m_id" value="${authUser.m_id}">
                        <button type="submit" class="btn btn-lg btn-primary w-100">저장</button>
                    </form>
	        </div>
		</div>
      </div>
    </div>
  </div>
</div>

<%@ include file="./jspf/_essentialFoot.jspf" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function openDaumPostcode(){

    new daum.Postcode({
           oncomplete:function(data){
                  document.getElementById('a_post').value=data.zonecode;
                  document.getElementById('a_addr1').value=data.roadAddress;
				  $("#addr2").removeClass("d-none");
           }
    }).open();

}//openDaumPostcode()---
</script>



<script>
var openWin;
//==============================================================================================================
// jsp+온로드 이벤트
//==============================================================================================================
window.onload = function () {

//가격표시
	$("#priceSum").text( numberFormat($("#priceSum").text()) );
	$("#priceSum2").text( numberFormat($("#priceSum2").text()) );

}//window_onload)




//==============================================================================================================
//가격 변환
//==============================================================================================================
function numberFormat(inputNumber) {
  return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
}
//==============================================================================================================
	
</script>



</body>
</html>