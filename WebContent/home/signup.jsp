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
<!--  ======================= Start signup Area =======================  -->

<section class="signUp-area">
    <div class="container">
        <div class="row">
            <div class="signUpFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>회원가입</h1>
                </div>
                <div class="signUpForm">
                    <form name="signUpForm" method="post" action="./proc/signupproc.jsp">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control"  placeholder="아이디" name="m_id">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호" name="m_pwd">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="m_pwd2">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이름" name="m_name">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이메일" name="m_email">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="휴대폰 번호" name="m_hp">
                        </div>
                        
                        <div class="input-group mb-5">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="생년" name="year">
                            <select class="form-control" name="month">
                                <option value="" selected>월</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                              </select>
                              <select class="form-control" name="day">
                                <option value="" selected>일</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                              </select>
                        </div>

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


<!--  Jquery js file  -->
<script src="./js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="./js/bootstrap.min.js"></script>

<!--  custom js file  -->
<script src="./js/main.js"></script>

</body>
</html>