<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<!--  ======================= Start signup Area =======================  -->

<section class="signUp-area">
    <div class="container">
        <div class="row">
            <div class="signUpFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>회원가입</h1>
                </div>
                <div class="signUpForm">
                    <form name="signUpForm" method="post" action="join.get" onsubmit="return check9(this)">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control"  placeholder="아이디" name="m_id" id="m_id">
                        </div>
                        
                        <div class="mb-3 d-none" id="m_id_len"><h6>아이디는 4글자 이상 사용해야 합니다.</h6></div>
                        <div class="mb-3 d-none" id="m_id_fir"><h6>아이디는 영어 소문자로 시작해야 합니다.</h6></div>
                        <div class="mb-3 d-none" id="m_id_spe"><h6>아이디에 특수문자는 사용할 수 없습니다.</h6></div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호" name="m_pwd" id="m_pwd">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="m_pwd2" id="m_pwd2">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이름" name="m_name" id="m_name">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이메일" name="m_email" id="m_email">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="휴대폰 번호" name="m_hp" id="m_hp" maxlength="13" onKeyup="inputPhoneNumber(this);">
                        </div>
                        
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                            </div>
                            <select name="year" class="form-control" id="select_year" onchange="javascript:lastday();">
                            </select>
                            <select class="form-control" name="month" id="select_month" onchange="javascript:lastday();">
                                <option value="" selected>월</option>
                              </select>
                              <select class="form-control" name="day" id="select_day">
                                <option value="" selected>일</option>
                              </select>
                        </div>
                        <input type="hidden" name="flag" id="flag" value="join">
                        <button type="submit" class="btn btn-lg btn-primary w-100">가입하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End signup Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->

<%@ include file="./jspf/_essentialFoot.jspf" %>

<!-- signup js file -->
<script src="../js/signup.js"></script>

</body>
</html>