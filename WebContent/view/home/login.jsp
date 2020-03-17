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
<!--  ======================= Start login Area =======================  -->

<section class="login-area">
    <div class="container">
        <div class="row">
            <div class="loginFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>로그인</h1>
                </div>
                <div class="loginForm">
                    <form>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" id="uid" placeholder="아이디">
                        </div>
                        
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="password" class="form-control" id="pwd" placeholder="비밀번호">
                        </div>

                        <button type="submit" class="btn btn-lg btn-outline-secondary w-100">로그인</button>
                    </form>
                    <hr>
                    <button class="btn btn-lg btn-primary w-100" onclick="location.href='signup.jsp'">회원가입</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End login Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!--  Jquery js file  -->
<script src="./js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="./js/bootstrap.min.js"></script>

<!--  custom js file  -->
<script src="./js/main.js"></script>

</body>
</html>