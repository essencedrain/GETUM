<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.order.service.OrderSuccessRequest"%>
<%@ page import="com.getum.cart.service.CartRequest"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
int count=0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    
    <!-- animate css -->
    <link rel="stylesheet" href="../css/animate.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start orderSuccess Area =======================  -->
<section class="orderSuccess-area">
    <div class="container pt-5">
        <div class="pb-1 animated fadeInDown">
            <h1><i class="fas fa-check"></i> 주문완료</h1>
        </div>

        <div class="row mt-3 animated fadeInDown">
            <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-12">
            	<h6 class="text-right">주문번호 : ${orderResult.r_no}</h6>
                <h4 class="text-center">결제가 완료되었습니다.</h4>
                <h4 class="text-center mb-4">이용해주셔서 감사합니다.</h4>
                <hr>
                <h5>주문하신 상품</h5>
                <div class="table-responsive table-sm mb-n2">
                    <table class="table table-bordered text-nowrap text-center align-middle">
                        <thead>
                            <tr>
                                <td colspan="2">상품명</td>
                                <td>수량</td>
                                <td>상품금액</td>
                            </tr>
                        </thead>
                        <tbody>
                       	<%
	                       	OrderSuccessRequest temp = (OrderSuccessRequest)request.getAttribute("orderResult");
	        		        Hashtable<String, CartRequest> hcart = temp.getHcart();
	        		        Enumeration hcartKey = hcart.keys();
	        		        CartRequest cReq = null;
	        		        count = 0;
	        		        	while(hcartKey.hasMoreElements()){
	        		        		cReq = (CartRequest) hcart.get(hcartKey.nextElement());
                       	%>
		                            <tr>
		                                <td class="align-middle" style="width: 5%"><img src="../img/thumb/<%= cReq.getImgName() %>" alt="<%= cReq.getImgName() %>" width="80"></td>
		                                <td class="align-middle" style="width: 70%">[<%= cReq.getManufacture() %>] <%= cReq.getName() %></td>
		                                <td class="align-middle" style="width: 10%"><%= cReq.getQuantity() %></td>
		                                <td class="align-middle" style="width: 15%" id="productPrice<%=count%>"><%= cReq.getPrice() * cReq.getQuantity() %></td>
		                            </tr>
						<%
		        				count += 1;
	        		        	}//while
		        		%>
                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="row w-100 mt-4">
                    <div class="col-md-6 p-0">
                        <h5>배송지 정보</h5>
                        <table class="table table-borderless table-sm small">
                            <tbody>
                                <tr>
                                    <td style="width: 20%">이름</td>
                                    <td style="width: 75%">${orderResult.r_name}</td>
                                    <td style="width: 5%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">주소</td>
                                    <td style="width: 75%">(${orderResult.r_post}) ${orderResult.r_addr1}, ${orderResult.r_addr2}</td>
                                    <td style="width: 5%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">연락처</td>
                                    <td style="width: 75%">${orderResult.r_hp}</td>
                                    <td style="width: 5%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">요구사항</td>
                                    <td style="width: 75%">${orderResult.r_request}</td>
                                    <td style="width: 5%"></td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        <div class="col-md-6 p-0">
                            <h5>결제금액</h5>
                            <h3 class="text-right" id="paymentPrice">${orderResult.r_payment}</h3>
                            <p class="small text-right mb-1">(${orderResult.r_payment_method})</p>
                            <table class="table table-sm table-borderless small text-right">
                                <tbody>
                                    <tr>
                                        <td style="width: 70%">상품금액</td>
                                        <td style="width: 30%" id="totalPrice">${orderResult.r_total_price}</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 70%">배송비</td>
                                        <c:choose>
                                        	<c:when test="${orderResult.r_delivery_flag == 1}">
                                        		<td style="width: 30%">3,000원</td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td style="width: 30%">무료배송</td>
                                        	</c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td style="width: 70%">포인트사용</td>
                                        <td style="width: 30%" id="usePoint">${orderResult.r_use_point}</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 70%">적립포인트</td>
                                        <td style="width: 30%" id="addPoint">${orderResult.r_add_point}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <hr>
                <div class="button-group my-3 text-center">
                    <button class="btn btn-lg btn-outline-secondary mx-2">계속 쇼핑하기</button>
                    <button class="btn btn-lg btn-primary mx-2">주문내역 보기</button>
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

<!--  wow js file  -->
<script src="../js/wow.js"></script>

<script>
new WOW().init();

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