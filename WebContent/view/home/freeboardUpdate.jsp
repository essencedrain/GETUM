<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.board.service.FreeboardReadRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

//현재페이지
int currentPage = (int) request.getAttribute("currentPage");
FreeboardReadRequest contentData = (FreeboardReadRequest) request.getAttribute("contentData");
long idx = contentData.getB2_idx();
%>
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
<!--  ======================= Start noticeUpdate Area =======================  -->

<section class="noticeUpdate-area">
    <div class="container pt-5">
        <div class="pb-1 text-center">
            <h2>자유게시판 수정</h2>
        </div>

        <div class="col-xl-10 offset-xl-1 col-lg-8 offset-lg-2 col-12 mt-3 mb-4">
            <form action="freeboard.get" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="subject" name="subject" value="<%= contentData.getB2_subject()%>">
                </div>
                
                <div class="form-group">
                    <textarea class="form-control" rows="10" id="content" name="content" style="resize:none"><%= contentData.getB2_content() %></textarea>
                </div>
				
				<input type="hidden" name="flag" id="flag" value="update">
				<input type="hidden" name="idx" id="idx" value="<%= idx%>">
				<input type="hidden" name="curentPage" id="curentPage" value="<%= currentPage %>">
				
                <div class="text-right">
	                <button type="button" class="btn btn-outline-secondary text-center mx-1" onclick="javascript:window.history.back()">돌아가기</button>
	                <button type="submit" class="btn btn-primary text-center mx-1">등록</button>
                </div>
            </form>
        </div>
    </div>
</section>

<!--  ======================= End noticeUpdate Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>