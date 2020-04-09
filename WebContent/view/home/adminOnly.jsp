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
<!--  ======================= Start signupSuccess Area =======================  -->

<section class="signupSuccess-area">
<div class="container-fluid pt-5">
	<div class="py-5 text-center">
            <h1 class="display-3">관리자 전용 페이지 입니다.</h1>
            <h3>잠시후 메인페이지로 이동합니다.</h3>
        </div>
</div>
</section>


<!--  ======================= End signupSuccess Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<script>
setTimeout(function(){location.href="index.jsp"},3000);
</script>
</body>
</html>