<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    
    <!--  font awesome icons  -->
    <link rel="stylesheet" href="../css/all.min.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start Product Area =======================  -->

<section class="product-area">
    <div class="container">
        <div class="pb-5">
            <h1>텀블러</h1>
        </div>

        <div class="button-group">
            <button type="button" class="active" id="btn1" data-filter="*">All</button>
            <button type="button" data-filter=".popular">인기상품</button>
            <button type="button" data-filter=".latest">신제품</button>
            <button type="button" data-filter=".stainless">스테인리스</button>
            <button type="button" data-filter=".plastic">플라스틱</button>
        </div>

        <div class="row grid mt-5">
        <!-- ============================================productList============================================ -->
        <c:if test="${empty productList}">
		    <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 latest stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="productdetail.jsp">
                            <img src="../img/product/1.png" alt="product-1" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3 class="">등록된 상품 없음</h3>
                        <h5 class="text-secondary">더미상품</h5>
                        <h5 class="">999,999원</h5>
                    </div>
                </div>
            </div>
		</c:if>
		
		<c:if test="${productList!=null}">
			<c:forEach var="product" items="${productList}">
				<div class='col-lg-4 col-md-6 col-sm-12 element-item p-5 <c:forEach var="productClass" items="${product.p_category_en}"><c:out value="${productClass} "/></c:forEach>'>
	                <div class="our-product">
	                    <div class="img">
	                        <a class="test-popup-link" href="productdetail.jsp">
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
		</c:if>
		<!-- ============================================productList============================================ -->
           
        </div>
    </div>
</section>

<!--  ======================= End Product Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->
<%@ include file="./jspf/_footer.jspf" %>
<!--  ======================= END footer Area ================================ -->


<!--  Jquery js file  -->
<script src="../js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="../js/bootstrap.min.js"></script>

<!--  isotope js library  -->
<script src="../js/isotope.min.js"></script>

<!--  custom js file  -->
<script src="../js/main.js"></script>

</body>
</html>