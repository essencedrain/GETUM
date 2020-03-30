<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<!--  ======================= Start Product Area =======================  -->

<section class="product-area">
    <div class="container animated fadeIn faster">
        <div class="pb-5">
	        <c:if test="${empty productList}">
            <h1>등록된 상품 없음</h1>
			</c:if>
			<c:if test="${!empty productList}">
            <h1>텀블러</h1>
            </c:if>
        </div>

        <!-- ============================================productList isotope============================================ -->
		<c:if test="${productList!=null}">
	        <div class="button-group">
	            <button type="button" class="active" id="btn1" data-filter="*">All</button>
	            <button type="button" data-filter=".popular">인기상품</button>
	            <button type="button" data-filter=".latest">신제품</button>
	            <button type="button" data-filter=".stainless">스테인리스</button>
	            <button type="button" data-filter=".plastic">플라스틱</button>
	        </div>
	
	        <div class="row grid mt-5">
		
			<c:forEach var="product" items="${productList}">
				<div class='col-lg-4 col-md-6 col-sm-12 element-item p-5 <c:forEach var="productClass" items="${product.p_category_en}"><c:out value="${productClass} "/></c:forEach>'>
	                <div class="our-product">
	                    <div class="img">
	                        <a class="test-popup-link" href="productDetail.get?p_uuid=${product.p_uuid}">
	                            <img src='../img/thumb/<c:out value="${product.p_imgName}"/>' alt='<c:out value="${product.p_uuid}"/>' class="img-fluid">
	                        </a>
	                    </div>
	                    <div class="title py-4 text-center">
	                        <h3 class="">${product.p_name}</h3>
	                        <h5 class="text-secondary">
	                        	<c:forEach var="category" items="${product.p_category}" varStatus="status">
	                        	
	                        		<c:if test="${status.last}">
	                        			<c:out value="${category}"/>
	                        		</c:if>
	                        		
	                        		<c:if test="${!status.last}">
	                        			<c:out value="${category}, "/>
	                        		</c:if>
	                        		
	                        	</c:forEach>
	                        </h5>
	                        <h5 class="">${product.p_price}</h5>
	                    </div>
	                </div>
	            </div>	
			</c:forEach>
		<!-- ============================================productList============================================ -->
       	</div>
		</c:if>
    </div>
</section>

<!--  ======================= End Product Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->
<%@ include file="./jspf/_footer.jspf" %>
<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<!--  isotope js library  -->
<script src="../js/isotope.min.js"></script>

<!--  custom js file  -->
<script src="../js/main.js"></script>

</body>
</html>