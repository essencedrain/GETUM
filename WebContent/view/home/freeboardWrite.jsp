<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
int currentPage = Integer.parseInt(request.getParameter("currentPage"));
String flag = "";
int idx = -1;
int origin = -1;
int origin_step = -1;
int origin_depth = -1;


if(currentPage > -1){ //-1보다 크면 답글, -1은 원글
	idx = Integer.parseInt(request.getParameter("idx"));
	origin = Integer.parseInt(request.getParameter("origin"));
	origin_step = Integer.parseInt(request.getParameter("origin_step"));
	origin_depth = Integer.parseInt(request.getParameter("origin_depth"));
	flag = "reply";
}else{
	flag = "write";
}//if


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
<!--  ======================= Start noticeWrite Area =======================  -->

<section class="noticeWrite-area">
    <div class="container pt-5">
        <div class="pb-1 text-center">
            <h2>자유게시판 글작성</h2>
        </div>

        <div class="col-xl-10 offset-xl-1 col-lg-8 offset-lg-2 col-12 mt-3 mb-4">
            <form action="freeboard.get" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요.">
                </div>
                
                <div class="form-group">
                    <textarea class="form-control" rows="10" id="content" name="content" placeholder="내용을 입력해주세요." style="resize:none"></textarea>
                </div>
                
				<input type="hidden" name="flag" value="<%= flag %>">
				<input type="hidden" name="currentPage" value="<%= currentPage %>">
				<input type="hidden" name="idx" value="<%= idx %>">
				<input type="hidden" name="origin" value="<%= origin %>">
				<input type="hidden" name="origin_step" value="<%= origin_step %>">
				<input type="hidden" name="origin_depth" value="<%= origin_depth %>">
				
                <div class="text-right">
	                <button type="button" class="btn btn-outline-secondary text-center mx-1" onclick="javascript:window.history.back();">돌아가기</button>
	                <button type="submit" class="btn btn-primary text-center mx-1">등록</button>
                </div>
            </form>
        </div>
    </div>
</section>

<!--  ======================= End noticeWrite Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>