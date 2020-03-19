<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 latest stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="productdetail.jsp">
                            <img src="../img/product/1.png" alt="product-1" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3 class="">502 스댕</h3>
                        <h5 class="text-secondary">신제품, 스테인리스</h5>
                        <h5 class="">19,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 popular plastic">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/2.png" alt="product-2" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>502 RED</h3>
                        <h5 class="text-secondary">인기상품, 플라스틱</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 popular stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/3.png" alt="product-3" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>마그나</h3>
                        <h5 class="text-secondary">인기상품, 스테인리스</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 popular plastic">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/4.png" alt="product-4" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3 class="text-uppercase">매드캡</h3>
                        <h5 class="text-secondary">인기상품, 플라스틱</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/5.png" alt="product-5" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3 class="text-uppercase">크림슨</h3>
                        <h5 class="text-secondary">스테인리스</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 latest stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/6.png" alt="product-6" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>늑대소년</h3>
                        <h5 class="text-secondary">신제품, 스테인리스</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/7.png" alt="product-7" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>핑크V</h3>
                        <h5 class="text-secondary">스테인리스</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/8.png" alt="product-8" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>들러리</h3>
                        <h5 class="text-secondary">스테인리스</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 element-item p-5 plastic stainless">
                <div class="our-product">
                    <div class="img">
                        <a class="test-popup-link" href="#">
                            <img src="../img/product/9.png" alt="product-9" class="img-fluid">
                        </a>
                    </div>
                    <div class="title py-4 text-center">
                        <h3>리프카페</h3>
                        <h5 class="text-secondary">스테인리스, 플라스틱</h5>
                        <h5 class="">13,800원</h5>
                    </div>
                </div>
            </div>
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