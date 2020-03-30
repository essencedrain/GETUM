<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.order.service.OrderDetailRequest"%>
<%@ page import="com.getum.order.service.OrderListRequest"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
public static String toNumFormat(int num) {
	  DecimalFormat df = new DecimalFormat("#,###");
	  return df.format(num);
	 }
%>
<%
int count=0;

//주문번호
int o_no = (int) request.getAttribute("o_no");

//현재페이지
int currentPage = (int) request.getAttribute("currentPage");

//주문물품들
Hashtable map = (Hashtable) request.getAttribute("orderDetail");

//주문정보 배송지, 결제정보 등
OrderDetailRequest orderContent = (OrderDetailRequest) request.getAttribute("orderContent");
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
<!--  ======================= Start orderSuccess Area =======================  -->
<section class="orderSuccess-area">
    <div class="container pt-5 ">
        <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-12 pb-1 animated fadeInDownBig">
            <h1><i class="far fa-file-alt fa-sm"></i> 주문상세</h1>
        </div>

        <div class="row mt-4 animated fadeInDown">
            <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-12">
            	<h6 class="text-left">주문번호 : <%= o_no %></h6>
            	<h6 class="text-left mb-4">주문일 : <%= orderContent.getDate().substring(0, orderContent.getDate().length()-2) %></h6>
                <hr>
<!-- =================================================상품============================================================== -->
				<% 
					Enumeration mapKeys = map.keys();
				
					while(mapKeys.hasMoreElements()){
						OrderListRequest orderListRequest = (OrderListRequest) map.get(mapKeys.nextElement());
				%>
					<div class="table-sm mb-n2 px-3 py-2">
	       				<table class="table table-bordered text-nowrap text-center align-middle">
	       					<tbody>
		       					<tr>
					       			<td class="align-middle" style="width: 10%"><img src="../img/thumb/<%= orderListRequest.getImgName() %>" alt="<%= orderListRequest.getImgName() %>" width="120"></td>
					       			<td class="align-middle tb-content text-left pl-3" style="width: 65%">
						       			<h5><%= orderListRequest.getName() %>, <%= orderListRequest.getQuantity() %>개</h5>
						       			<span>(<%= toNumFormat((int)orderListRequest.getPrice())%>원</span>
						       			<span>/ 1개)</span>
					       			</td>
					       			<td class="align-middle" style="width: 25%">
					       				<h5 class="my-3"><%= orderListRequest.getStatus() %></h5>
					       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">배송조회</button><br>
					       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">교환신청</button><br>
					       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">반품신청</button><br>
					       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">구매후기 쓰기</button>
					       			</td>
				       			</tr>
			       			</tbody>
		       			</table>
	       			</div>
				<%}//while%>
<!-- =================================================상품============================================================== -->
                <div class="row w-100 mt-2 mb-2">
                    <div class="col-12 p-0">
                        <h5>배송지 정보</h5>
                        <hr>
                        <table class="table table-borderless table-sm">
                            <tbody>
                                <tr>
                                    <td style="width: 30%">이름</td>
                                    <td style="width: 70%"><%= orderContent.getM_name() %></td>
                                </tr>
                                <tr>
                                    <td style="width: 30%">주소</td>
                                    <td style="width: 70%">(<%= orderContent.getM_post() %>) <%= orderContent.getM_addr1() %>, <%= orderContent.getM_addr2() %></td>
                                </tr>
                                <tr>
                                    <td style="width: 30%">연락처</td>
                                    <td style="width: 70%"><%= orderContent.getM_hp() %></td>
                                </tr>
                                <tr>
                                    <td style="width: 30%">요구사항</td>
                                    <td style="width: 70%"><%= orderContent.getM_request() %></td>
                                </tr>
                            </tbody>
                        </table>
					</div>
				</div>
				<div class="row w-100 mt-2">
	                <div class="col-12 p-0">
	                    <h5>결제정보</h5>
	                    <hr>
	                    <table class="table table-sm table-borderless">
	                        <tbody>
	                            <tr>
	                                <td style="width: 30%">결제수단</td>
	                                <td style="width: 70%"><%= orderContent.getPayment_method() %></td>
	                            </tr>
	                            <tr>
	                                <td style="width: 30%">상품금액</td>
	                                <td style="width: 70%" id="totalPrice"><%= orderContent.getTotal_price() %></td>
	                            </tr>
	                            <tr>
	                                <td style="width: 30%">배송비</td>
	                                <c:choose>
	                                	<c:when test="<%= orderContent.isDelivery() %>">
	                                		<td style="width: 70%">3,000원</td>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<td style="width: 70%">무료배송</td>
	                                	</c:otherwise>
	                                </c:choose>
	                            </tr>
	                            <tr>
	                                <td style="width: 30%">포인트사용</td>
	                                <td style="width: 70%" id="usePoint"><%= orderContent.getUse_point() %></td>
	                            </tr>
	                            <tr>
	                                <td style="width: 30%">적립포인트</td>
	                                <td style="width: 70%" id="addPoint"><%= orderContent.getAdd_point() %></td>
	                            </tr>
	                        </tbody>
	                        <tfoot>
	                        	<tr>
	                        		<td class="text-right" colspan="2">
	                        		<h6>총 결제금액</h6><h3 id="paymentPrice"><%= orderContent.getPayment() %></h3>
	                        		</td>
	                        	</tr>
	                        </tfoot>
	                    </table>
	                </div>
                    </div>
                <hr class="mt-n2 mb-4">
                <div class="button-group mb-3 text-center">
                    <button class="btn btn-lg btn-outline-secondary m-2" onclick="javascript:window.history.back();">이전으로</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!--  ======================= End orderSuccess Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->

<%@ include file="./jspf/_essentialFoot.jspf" %>

<script>
//==============================================================================================================
//jsp+온로드 이벤트
//==============================================================================================================
window.onload = function () {

//가격표시
<%
	for(int i = 0; i <= count; i++){
%>
	$("#productPrice<%=i%>").text( numberFormat($("#productPrice<%=i%>").text()) );
<%
	}//for
%>
	$("#totalPrice").text( numberFormat($("#totalPrice").text()) );
	$("#paymentPrice").text( numberFormat($("#paymentPrice").text()) );
	$("#usePoint").text( numberFormat2($("#usePoint").text()) );
	$("#addPoint").text( numberFormat2($("#addPoint").text()) );


}//window_onload)
//==============================================================================================================


//==============================================================================================================
//통화표시 & 포인트표시
//==============================================================================================================
function numberFormat(inputNumber) {
return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
}

function numberFormat2(inputNumber) {
return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"P";
}
//==============================================================================================================
</script>

</body>
</html>