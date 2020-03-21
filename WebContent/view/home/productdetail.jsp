<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    
    <style>
     	a:link {text-decoration:none; color:#001627;}
		a:visited {text-decoration:none; color:#001627;}
		a:active {text-decoration:none; color:#001627;}
		a:hover {text-decoration:none; color:#001627;}
    </style>
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start Product Detail Area =======================  -->

<section class="productDetail-area">
    <div class="container">
        <div class="pb-1">
            <a id="goback" href="javascript:window.history.back();"><h4><i class="far fa-arrow-alt-circle-left"></i> 상품 목록</h4></a>
        </div>

        <div class="row mt-5">
            <div class="img col-lg-6 mb-5">
                <img class="img-fluid" src="../img/product/${productDetail.imgName}" alt="${productDetail.imgName}">
            </div>

            <div class="content col-lg-6 my-auto">
                <h1>${productDetail.p_name}</h1>
                <hr>
                <h3 id="showPrice"></h3>
                <input type="hidden" name="rawPrice" id="rawPrice" value="${productDetail.p_price}">
                <hr>
                <h6>배송방법 : 택배</h6>
                <h6>배송비 : 3,000원</h6>
                <hr>
                <h6>상품코드 : ${productDetail.p_code}</h6>
                <h6>출시일 : ${productDetail.p_release_date}</h6>
                <h6>제조사 : ${productDetail.p_manufacture}</h6>
                <hr>
                <h6>수량</h6>
                <div class="bsinput w-50 pb-4">
                    <input type="number" value="0" min="0" max="1000" step="1" id="input"/>
                </div>
                <h3 id="price">총 상품금액 : <span id="output"></span></h3>
                <div class="button-group my-4 float-right">
                    <button class="btn btn-lg btn-outline-secondary mr-1">구매하기</button>
                    <button class="btn btn-lg btn-primary">장바구니</button>
                </div>
            </div>
        </div>
        <div class="detail col-12">
            <hr>
            <p>${productDetail.p_detail}</p>
        </div>
    </div>
</section>

<!--  ======================= End Product Detail Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<!--  Bootstrap input js file  -->
<script src="../js/bootstrap-input-spinner.js"></script>

<!--  ======================= 제품 가격 js ================================ -->
<script>
window.onload = function () {
	$("#showPrice").text(numberFormat($("#rawPrice").val()));
}

$("input[type='number']").inputSpinner();

var $changedInput = $("#input")
var $valueOnChange = $("#output")
$changedInput.on("change", function (event) {
    $valueOnChange.html( numberFormat( $("#rawPrice").val()*$changedInput.val() ) )
})

//가격표시
function numberFormat(inputNumber) {
    return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 }
</script>
<!--  ======================= 제품 가격 js ================================ -->
</body>
</html>