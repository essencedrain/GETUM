<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../home/jspf/_essentialHead.jspf" %>
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="../home/jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start ---- Area =======================  -->

<section class="signUp-area">
    <div class="container-fluid pt-5">
            <div class="py-5 text-center">
            <h1 class="display-1 text-danger">501</h1>
            <h3>필요한 기능이 서버에 설치되어 있지 않습니다.</h3>
            <br>
            <h3>잠시후 메인화면으로 이동합니다.</h3>
        	</div>
    </div>
</section>n>

<!--  ======================= End ---- Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="../home/jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="../home/jspf/_essentialFoot.jspf" %>
<script>
setTimeout(function(){location.href="index.jsp"},5000);
</script>
</body>
</html>