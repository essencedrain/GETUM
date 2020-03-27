<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.getum.cart.service.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
Hashtable hcart = null;
CartRequest cReq = null;
int hcartSize = 0;

int priceClass = 0; // int값을 ###,### 원으로 바꾸기 위한 태깅
int priceSum = 0; //상품가격 합계
String uuid=""; //삭제시 보낼 것
%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    <!--  sweetalert2  -->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start cart Area =======================  -->

<section class="cart-area pt-5">
    <div class="container-fluid">
        <div class="col-xl-8 offset-xl-2 col-10 offset-1">
            <h1>장바구니 <i class="fas fa-shopping-cart fa-sm"></i></h1>
        </div>

        <div class="row mt-5">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
                <div class="table-responsive">
                    <table class="table table-bordered text-nowrap">
                        <thead>
                        <tr>
                            <th colspan="2" class="align-middle"><input type="checkbox" class="selectAll" name="selectAll" id="selectAll1"><label for="selectAll1" class="ml-2">전체선택</label></th>
                            <th class="text-center align-middle">상품정보</th>
                            <th class="text-center align-middle">상품금액</th>
                            <th class="text-center align-middle">삭제</th>
                        </tr>
                        </thead>
                        <tbody>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<%
							if(session.getAttribute("cartMap")!=null){
							hcart = (Hashtable) session.getAttribute("cartMap");
							Enumeration hcartKey = hcart.keys();
							hcartSize = hcart.size();
							
								while(hcartKey.hasMoreElements()){
									cReq = (CartRequest) hcart.get(hcartKey.nextElement());
									priceSum += cReq.getPrice()*cReq.getQuantity();
									uuid = cReq.getImgName().substring(0,33);
						%>
									<tr>
	                                <td class="text-left align-middle" style="width: 5%"><input type="checkbox" value="<%= uuid %>" name="cartSelect" class="cartSelect"></td>
	                                <td class="text-center align-middle" style="width: 10%"><img src="../img/thumb/<%= cReq.getImgName() %>" alt="<%= cReq.getImgName() %>" width="80"></td>
	                                <td style="width: 65%">
	                                    <h5><%= cReq.getManufacture() %>, <%= cReq.getName() %>, 1개</h5>
	                                    <hr>
	                                    <div class="text-left text-success my-auto">
		                                    16시 이전 주문 시 당일 배송
		                                    </div>
		                                    <div class="text-right">
		                                    <span id="<%= priceClass%>a"><%= cReq.getPrice() %></span>
		                                    &nbsp;&nbsp;
		                                    
		                                    <input type="text" name="quantity" value="<%=cReq.getQuantity()%>" size="1" id="<%= priceClass%>q">
											<button class="btn btn-sm btn-outline-secondary modifyButton">수정</button>
											<div class="d-none"><%= uuid %></div>
	                                    </div>
	                                </td>
	                                <td class="text-center align-middle" style="width: 15%"><span id="<%= priceClass%>b"><%= cReq.getPrice()*cReq.getQuantity()%></span></td>
	                                <td class="text-center align-middle" style="width: 5%"><button class="btn btn-sm btn-outline-secondary" onclick="location.href='cart.get?flag=delete&uuid=<%= uuid %>'"><i class="fas fa-times"></i></button></td>
                           		</tr>
						<%
								priceClass += 1;
								}//while
							}else{
						%>
							<tr>
								<td colspan="5" class="text-center text-secondary"><h3>장바구니가 비었습니다.</h3></td>
							</tr>
						<%
							}//if(session.getAttribute("cartMap")!=null)
						%>
								
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        </tbody>

                    </table>
                </div><!--<div class="table-responsive-md">-->
            </div><!--<div class="col-12">-->
        </div><!--<div class="row mt-5">-->

        <div class="row">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1 align-middle">
                <input type="checkbox" id="selectAll2" class="selectAll ml-2" name="selectAll">&nbsp;&nbsp;
                <label for="selectAll2" class="mr-2">전체선택 (<span id="selectedNum">0</span> / <%= hcartSize %>)</label>
                <button class="btn btn-sm btn-outline-secondary" onclick="deleteAction()">선택삭제</button>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1">
            <span class="d-block border border-dark pt-3 pb-2 text-center align-middle">
            	<%
            		if(session.getAttribute("cartMap")!=null){
            			hcart = (Hashtable) session.getAttribute("cartMap");
            			if(hcart.size()>0){
            	%>
                			<h5>상품가격 <span id="priceSum"><%= priceSum%></span> + 배송비 3,000원 = 주문금액 <span id="priceSum2"><%= priceSum+3000%></span></h5>
                <%
            			}else{
            	%>
            				<h5>-</h5>
            	<%
            			}//if
                	}else{
                %>
                	<h5>-</h5>
                <%	}//if %>
            </span>
            </div>
        </div>

        <div class="row my-4">
            <div class="col-xl-8 offset-xl-2 col-10 offset-1 text-center">
                <button class="btn btn-lg btn-outline-secondary px-4 m-2" onclick="location.href='product.get'">계속 쇼핑하기</button>
                <%
                	if(session.getAttribute("cartMap")!=null){
                		hcart = (Hashtable)session.getAttribute("cartMap");
                		if(hcart.size()>0){
                %>
                			<button class="btn btn-lg btn-primary px-5 m-2" onclick="location.href='order.get?flag=default&m_id=${authUser.m_id}'">구매하기</button>
				<%
						}else{
				%>
							<button class="btn btn-lg btn-primary px-5 m-2" id="nullCartButton">구매하기</button>
				<%
						}
				%>                			
                <% }else{ %>
                	<button class="btn btn-lg btn-primary px-5 m-2" id="nullCartButton">구매하기</button>
                <% }//if  %>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End cart Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->

<%@ include file="./jspf/_essentialFoot.jspf" %>

<!--  sweetalert2 js file  -->
<script src="../js/sweetalert2.min.js"></script>

<!--  cart js file  -->
<script src="../js/cart.js"></script>

<script>
//==============================================================================================================
// jsp+온로드 이벤트
//==============================================================================================================
window.onload = function () {

//가격변환	
<%
	for(int i = 0; i <= priceClass; i++){
%>
	$("#<%=i%>a").text( numberFormat($("#<%=i%>a").text()) );
	$("#<%=i%>b").text( numberFormat($("#<%=i%>b").text()) );
<%
	}//for
%>
	$("#priceSum").text( numberFormat($("#priceSum").text()) );
	$("#priceSum2").text( numberFormat($("#priceSum2").text()) );
	
// 체크박스 선택 갯수 표시
	$(".cartSelect").change(function(){
		console.log($("input:checkbox[name='cartSelect']:checked").length);
		$("#selectedNum").text( $("input:checkbox[name='cartSelect']:checked").length );
    });
    
//수량 수정하기
	$('.modifyButton').click(function() {
	   
	   if($(this).prev().val() > 0 && $(this).prev().val() < 1000){
			location.href = "cart.get?flag=modify&uuid="+ $(this).next().text() +"&quantity=" + $(this).prev().val();
		}else{
			Swal.fire({
		  		  position: 'center',
		  		  icon: 'error',
		  		  title: "수량 입력 범위는 1~999개 입니다.",
		  		  showConfirmButton: false,
		  		  timer: 1500
				});
		}
	});


//장바구니가 비었을때 장바구니 클릭
	$('#nullCartButton').click(function() {
		Swal.fire({
	  		  position: 'center',
	  		  icon: 'error',
	  		  title: "장바구니가 비었습니다.",
	  		  showConfirmButton: false,
	  		  timer: 1500
			});
	});
}
//==============================================================================================================
</script>

</body>
</html>