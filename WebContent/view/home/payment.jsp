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
<!--  ======================= Start ---- Area =======================  -->

<section class="signUp-area">
    <div class="container">
        <div class="row">
            <h1>테스트</h1>
            <div>
            <ul>
            	<li>o_totalprice : <%=request.getParameter("o_totalprice")%></li>
            	<li>o_use_point : <%=request.getParameter("o_use_point")%></li>
            	<li>o_delivery_flag : <%=request.getParameter("o_delivery_flag")%></li>
            	<li>o_payment : <%=request.getParameter("o_payment")%></li>
            	<li>o_payment_method : <%=request.getParameter("o_payment_method")%></li>
            	<li>o_name : <%=request.getParameter("o_name")%></li>
            	<li>o_hp : <%=request.getParameter("o_hp")%></li>
            	<li>o_addr1 : <%=request.getParameter("o_addr1")%></li>
            	<li>o_addr2 : <%=request.getParameter("o_addr2")%></li>
            	<li>o_post : <%=request.getParameter("o_post")%></li>
            	<li>o_request : <%=request.getParameter("o_request")%></li>
            	<li>m_id : <%=request.getParameter("m_id")%></li>
            </ul>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End ---- Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>