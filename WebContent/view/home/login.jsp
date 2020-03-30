<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
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
<!--  ======================= Start login Area =======================  -->

<section class="login-area">
    <div class="container">
        <div class="row">
            <div class="loginFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>로그인</h1>
                    테스트 계정 : test/1234
                </div>
                <div class="loginForm">
                    <form name="loginForm" method="post" action="login.get">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" name="m_id" id="m_id" placeholder="아이디">
                        </div>
                        
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="password" class="form-control" name="m_pwd" id="m_pwd" placeholder="비밀번호">
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


<%@ include file="./jspf/_essentialFoot.jspf" %>

<% 
//==================================================================================================
// 로그인 실패시 경고창 띄움 -> 세션어트리뷰트 삭제
//==================================================================================================

if(session.getAttribute("loginError") != null){
	if( (boolean)session.getAttribute("loginError") == true ){
%>
		<script>
			window.onload = function(){
				Swal.fire({
			  		  position: 'center',
			  		  icon: 'error',
			  		  title: "아이디 또는 비밀번호가 일치하지 않습니다.",
			  		  showConfirmButton: false,
			  		  timer: 1500
					});
			}
		</script>
<%
		session.removeAttribute("loginError");
	}//if
}//if
//==================================================================================================
%>

</body>
</html>