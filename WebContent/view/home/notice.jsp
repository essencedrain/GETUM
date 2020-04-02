<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>    
<%@ page import="com.getum.board.service.NoticeReadRequest" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%
//현재페이지
int currentPage = (int) request.getAttribute("currentPage");

//DB에서 받아온 map 자료 (전체 글 수, 해당페이지 글 10건)
Hashtable map = (Hashtable) request.getAttribute("hashMap");
	int totalArticleNum = (int) map.get("totalArticleNum");
	List<NoticeReadRequest> list = (List<NoticeReadRequest>) map.get("boardData");


int articlePerPage = 10; //1페이지 주문 갯수
int blockPerPage = 10; //페이지네이션 갯수

//총 페이지 수
int totalPages = (int) Math.floor((totalArticleNum / articlePerPage));
if( (totalArticleNum % articlePerPage)>0){
	totalPages += 1;
}//if

//총 블럭 수
int totalBlock = (int) Math.ceil((totalPages / blockPerPage))-1;
if(totalBlock<0){
	totalBlock =0;
}

//현재 블럭
int currentBlock = (int) Math.floor( (currentPage - 1) / blockPerPage );

//시작페이지
int startPage = (currentBlock*blockPerPage) + 1;

//끝 페이지 + 마지막블럭에서 보정
int endPage = startPage+(blockPerPage-1);
if(totalPages < endPage ){
	endPage = totalPages;
}//if


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    <style>
     	.notice-area a:link {text-decoration:none; color:#001627;}
		.notice-area a:visited {text-decoration:none; color:#001627;}
		.notice-area a:active {text-decoration:none; color:#001627;}
		.notice-area a:hover {text-decoration:none; color:#001627;}
	</style>
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start notice Area =======================  -->

<section class="notice-area">
    <div class="container-fluid pt-5">
        <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 pb-1">
            <h1>공지사항</h1>
        </div>
        <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 pb-1">
            <div class="table-responsive mt-4">
                <table class="table table-bordered">
                    <thead class="text-center">
                        <td style="width: 10%">번호</td>
                        <td style="width: 70%">제목</td>
                        <td style="width: 10%; overflow:hidden;text-overflow;ellipsis;">등록일</td>
                        <td style="width: 10%; overflow:hidden;text-overflow;ellipsis;">조회수</td>
                    </thead>
                    <tbody class="text-center">
                    <%
                    	for(NoticeReadRequest i : list){
                   	%>
						<tr>
	                        <td style="width: 10%"><%= i.getNum() %></td>
	                        <td style="width: 70%"><a href="noticeContent.get?currentPage=<%= currentPage%>&idx=<%= i.getB1_idx()%>"><%= i.getB1_subject() %></a></td>
	                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr><%= i.getB1_reg_date().substring(0, 10) %></nobr></td>
	                        <td style="width: 10%"><%= i.getB1_count() %></td>
						</tr>
                    <%	}//for %>
                    </tbody>
                </table>
                <ul class="pagination justify-content-center">
		       		<% if(startPage>1){ %>
				    	<li class="page-item"><a class="page-link" href="notice.get?currentPage=<%= startPage-1 %>">이전</a></li>
				    <% }else{ %>
				    	<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">이전</a></li>
				    <% } %>
				    <%
				    	for(int j=startPage; j<=endPage; j++){
				    		if(currentPage == j){
				    %>
				    			<li class="page-item active"><a class="page-link" href="notice.get?currentPage=<%= j %>"><%= j %></a></li>
				    	<% }else{ %>
			    				<li class="page-item"><a class="page-link" href="notice.get?currentPage=<%= j %>"><%= j %></a></li>
				    <%
				    		}//if
				    	}//for j
				    %>
				    <% if(currentBlock == totalBlock || totalBlock*articlePerPage==currentPage){ %>
				    	<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">다음</a></li>
				    <% }else{ %>
				    	<li class="page-item"><a class="page-link" href="notice.get?currentPage=<%= endPage+1 %>">다음</a></li>
				    <% }//if %>
		  		</ul>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End notice Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>