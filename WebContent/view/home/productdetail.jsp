<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    <style>
     	.site-main a:link {text-decoration:none; color:#001627;}
		.site-main a:visited {text-decoration:none; color:#001627;}
		.site-main a:active {text-decoration:none; color:#001627;}
		.site-main a:hover {text-decoration:none; color:#001627;}
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
    <div class="container animated fadeIn faster">
        <div class="pb-1">
            <a id="goback" href="product.get"><h4><i class="far fa-arrow-alt-circle-left"></i> 상품 목록</h4></a>
        </div>
		<form name="pdForm" method="post" action="cart.get">
        <div class="row mt-5">
            <div class="img col-lg-6 mb-5">
                <img class="img-fluid" src="../img/product/${productDetail.imgName}" alt="${productDetail.imgName}">
            </div>

            <div class="content col-lg-6 my-auto">
	                <h1>${productDetail.p_name}</h1>
	                <hr>
	                <h3 id="showPrice"></h3>
	                <hr>
	                <h6>배송방법 : 택배</h6>
	                <h6>배송비 : 3,000원 (2만원 이상 구매 시 무료배송)</h6>
	                <hr>
	                <h6>상품코드 : ${productDetail.p_code}</h6>
	                <h6>출시일 : ${productDetail.p_release_date}</h6>
	                <h6>제조사 : ${productDetail.p_manufacture}</h6>
	                <hr>
	                <h6>수량</h6>
	                <div class="bsinput w-50 pb-4 ">
	                    <input type="number" value="1" min="1" max="999" step="1" id="input" name="quantity"/>
	                </div>
	                <h3 id="price">총 상품금액 : <span id="output"></span></h3>
	                <div class="button-group my-4 float-right ">
	                    <button type="button" class="btn btn-lg btn-outline-secondary mr-1">구매하기</button>
	                    <button type="button" class="btn btn-lg btn-primary" onclick="return checkStock();">장바구니</button>
	                </div>
            </div>
        </div>
        <input type="hidden" name="imgName" value="${productDetail.imgName}">
        <input type="hidden" name="name" value="${productDetail.p_name}">
        <input type="hidden" name="manufacture" value="${productDetail.p_manufacture}">
        <input type="hidden" name="rawPrice" id="rawPrice" value="${productDetail.p_price}">
        <input type="hidden" name="stock" id="stock" value="${productDetail.p_stock}">
        </form>
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

<!-- productdetail.js -->
<script src="../js/productdetail.js"></script>
</body>
</html>