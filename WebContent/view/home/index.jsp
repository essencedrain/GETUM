<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>

    <!--  font awesome icons  -->
    <link rel="stylesheet" href="../css/all.min.css">

    <!-- animate css -->
    <link rel="stylesheet" href="../css/animate.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">

<!--  ======================= start home Area =======================  -->
<section class="home overflow-hidden">
    <div class="landing">
        <div class="home-wrap">
            <div class="animated fadeIn home-inner">
    
            </div>
        </div>
    </div>

    <div class="animated bounce delay-1s caption text-center">
        <h1>get your</h1>
        <h1>tumbler</h1>
    </div>

</section>
<!--  ======================= END home Area =======================  -->

<!--  ======================= Start new Area =======================  -->
<section class="new container overflow-hidden my-5 py-5">
    <div class="row mt-5">
        <div class="col-md-6 my-5">
            <img class="wow animated fadeInLeft img-fluid" alt="" src="../img/main/1.png">
        </div>
        <div class="col-md-6 my-auto">
            <div class="row">
                <div class="home-content overflow-hidden ml-n2">
                    <h1 class="wow animated fadeInLeft delay-1s pb-1">신상품 출시</h1>
                    <h1 class="wow animated fadeInLeft delay-1s pb-3">502 <span>스댕</span> 텀블러</h1>
                    <p class="wow animated fadeInLeft delay-1s pb-3">GETUM에서 새롭게 선보이는 502 스댕 텀블러는 GETUM사의 최신 기술을 대거 적용한 텀블러로써 제품에 녹이 슬지 않고 강력한 보온 보냉 성능을 보장합니다. 지금 바로 구매하세요!</p>
                    <button class="wow animated fadeIn delay-1s btn btn-lg btn-outline-secondary">구매하기</button>
                    <button class="wow animated fadeIn delay-1s btn btn-lg btn-secondary" onclick="location.href='product.jsp'">상품목록</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  ======================= END new Area =======================  -->

<!--  ======================= Start 회원가입 Area =======================  -->
<section class="join overflow-hidden py-5">
    <div class="text-center py-3">
        <h1 class="wow animated fadeInDown pb-4">아직 회원이 아니신가요?</h1>
        <h2 class="wow animated fadeInDown pb-5 mb-3">회원가입 시 다양한 서비스를 받으실 수 있습니다.</h2>
        <div class="mx-auto heading-line"></div>
    </div>
    <div class="container py-3">
        <div class="row">
            <div class="wow animated bounceInDown col-md-4 text-center py-2">
                <i class="fas fa-gifts mt-5"></i>
                <h4 class="py-3">신규 쿠폰 즉시 지급</h4>
            </div>
            <div class="wow animated bounceInDown col-md-4 text-center py-2">
                <i class="fas fa-birthday-cake mt-5"></i>
                <h4 class="py-3">생일축하쿠폰 지급</h4>
            </div>
            <div class="wow animated bounceInDown col-md-4 text-center py-2">
                <i class="fas fa-coins mt-5"></i>
                <h4 class="py-3">구매 시 5% 포인트 적립</h4>
            </div>
            <div class="wow animated bounceInDown slow col-md-4 text-center py-2">
                <i class="fas fa-medal mt-5"></i>
                <h4 class="py-3">등급별 혜택</h4>
            </div>
            <div class="wow animated bounceInDown slow col-md-4 text-center py-2">
                <i class="fas fa-paper-plane mt-5"></i>
                <h4 class="py-3">신상품, 이벤트 정보 제공</h4>
            </div>
            <div class="wow animated bounceInDown slow col-md-4 text-center py-2">
                <i class="fas fa-tools mt-5"></i>
                <h4 class="py-3">체계적인 A/S관리</h4>
            </div>
            <div class="col-md-12 text-center pt-4">
                <button class="wow animated fadeIn btn btn-lg btn-secondary" onclick="location.href='signup.jsp'">회원가입</button>
            </div>
        </div>
    </div>
</section>
<!--  ======================= END 회원가입 Area =======================  -->

<!--  ======================= Start best Area =======================  -->
<section class="best container overflow-hidden py-5 my-5">
    <div class="row mt-5">
        
        <div class="col-md-6 my-auto">
            <div class="row">
                <div class="home-content ml-n2">
                    <h1 class="wow animated fadeInLeft delay-1s pb-1">베스트셀러</h1>
                    <h1 class="wow animated fadeInLeft delay-1s pb-3">502 <span>RED</span> 텀블러</h1>
                    <p class="wow animated fadeInLeft delay-1s pb-3">GETUM에서 새롭게 선보이는 502 스댕 텀블러는 GETUM사의 최신 기술을 대거 적용한 텀블러로써 제품에 녹이 슬지 않고 강력한 보온 보냉 성능을 보장합니다. 지금 바로 구매하세요!</p>
                    <button class="wow animated fadeIn delay-1s btn btn-lg btn-outline-secondary">구매하기</button>
                    <button class="wow animated fadeIn delay-1s btn btn-lg btn-secondary" onclick="location.href='product.jsp'">상품목록</button>
                </div>
            </div>
        </div>
        <div class="col-md-6 mt-5">
            <img class="wow animated fadeInRight img-fluid" alt="" src="../img/main/3.png">
        </div>
    </div>
</section>
<!--  ======================= END best Area =======================  -->

<!--  ======================= Start feature Area =======================  -->
<section class="feature-area overflow-hidden pt-5">
    <div class="fixed-background">
        <div class="row dark text-center py-5">
            <div class="col-12">
                <h1 class="wow animated fadeInDown heading pb-4">GETUM 텀블러</h1>
                <div class="mx-auto heading-line"></div>
            </div>
            <div class="wow animated fadeIn slow col-md-4 mt-5">
                <h3>친환경</h3>
                <div class="feature">
                    <i class="fas fa-leaf fa-3x"></i>
                </div>
                <p class="lead">환경을 먼저 생각합니다</p>
            </div>
    
            <div class="wow animated fadeIn slow col-md-4 mt-5">
                <h3>내구성</h3>
                <div class="feature">
                    <i class="fas fa-crown fa-3x"></i>
                </div>
                <p class="lead">고급 소재만을 이용합니다</p>
            </div>
    
            <div class="wow animated fadeIn slow col-md-4 mt-5">
                <h3>보온력</h3>
                <div class="feature">
                    <i class="fas fa-temperature-low fa-3x"></i>
                </div>
                <p class="lead">뛰어난 보온 성능을 보장합니다</p>
            </div>
            <div class="wow animated fadeIn slow col-md-12 text-center pt-5">
                <button class="btn btn-lg btn-secondary" onclick="location.href='product.jsp'">상품보러가기</button>
            </div>
        </div> <!-- End row Dark -->
        <div class="fixed-wrap">
            <div class="fixed">
    
            </div>
        </div>
        </div> <!-- End Fixed Backgruond -->
    
</section>
<!--  ======================= END feature Area =======================  -->


<!--  ======================= Start Contact Area =======================  -->

<section class="contact overflow-hidden">
    <div class="container">
        <div class="text-center py-5">
            <h2 class="wow animated slideInDown py-3">Contact us</h2>
            <div class="mx-auto heading-line"></div>
        </div>
        <div class="row">
            <div class="wow animated bounceInLeft col-lg-6">
                <!-- google map -->
                <div id="map-container-google-1" class="z-depth-1-half map-container mb-4">
                    <iframe width="100%" height="424" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=%EA%B2%BD%EC%98%81%EA%B8%B0%EC%88%A0%EA%B0%9C%EB%B0%9C%EC%9B%90&key=AIzaSyBdWvmrcFJ1Z0A5n3zyl3d64q42sv60b2U"></iframe>
                </div>
                <!-- google map -->
            </div>
            <form class="wow animated bounceInRight col-lg-6">
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" aria-describedby="emailHint" placeholder="이메일을 입력해주세요">
                    <small id="emailHint" class="form-text text-muted">&nbsp;&nbsp;&nbsp;이메일은 문의에 대한 답변용으로만 사용됩니다.</small>
                </div>
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="message">내용</label>
                    <textarea id="message" class="form-control noresize" placeholder="문의 내용을 입력해주세요" rows="5"></textarea>
                </div>
                <button type="submit" class="btn btn-lg btn-outline-secondary">보내기</button>
            </form>
        </div>
    </div>
</section>

<!--  ======================= End Contact Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!--  Jquery js file  -->
<script src="../js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="../js/bootstrap.min.js"></script>

<!--  wow js file  -->
<script src="../js/wow.js"></script>
<script>
    new WOW().init();
</script>

<!--  custom js file  -->
<!--
<script src="../js/main.js"></script>
-->


</body>
</html>