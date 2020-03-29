<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.getum.order.service.OrderListRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	List orderList = (List) request.getAttribute("orderList"); //주문내역 DATA
	int currentPage = (int) request.getAttribute("currentPage"); //현재 페이지
	int totalArticleNum = (int) request.getAttribute("totalArticleNum"); //전체 주문 수
	int articlePerPage = 3; //1페이지 주문 갯수
	int blockPerPage = 5; //페이지네이션 갯수
	
	//총 페이지 수
	int totalPages = (int) Math.floor((totalArticleNum / articlePerPage));
	if( (totalArticleNum % articlePerPage)>0){
		totalPages += 1;
	}//if
	
	//총 블럭 수
	int totalBlock = (int) Math.ceil((totalPages / blockPerPage));
	
	//현재 블럭
	int currentBlock = (int) Math.floor( (currentPage - 1) / 5 );
	
	//시작페이지
	int startPage = (currentBlock*blockPerPage) + 1;
	
	//끝 페이지 + 마지막블럭에서 보정
	int endPage = startPage+(blockPerPage-1);
	if(totalPages < endPage ){
		endPage = totalPages;
	}
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
<!--  ======================= Start orderList Area =======================  -->

<section class="orderList-area pt-5">
    <div class="container">
	    <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-sm-12">
            <h1><i class="far fa-list-alt"></i> 주문내역</h1>
        </div>
        <%
        	for(int i=0; i<orderList.size(); i++){
        		List smallList = (List)orderList.get(i);
        		Hashtable listMap = (Hashtable)smallList.get(2);
        		int listMapSize = listMap.size();
        		Enumeration listMapKey = listMap.keys();
       	%>
     	<div class="row mt-3">
            <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-12 py-2">
				<table class="table table-bordered text-center">
					<tr class="tb-head">
						<td class="tb-heading">
							<span class="float-left">주문번호: <%= smallList.get(0) %> (<%= smallList.get(1) %>)</span>
		       				<button class="btn btn-sm btn-primary float-right tb-button">주문상세보기</button>
						</td>
					</tr>
					<tr>
						<td>
       	<%
			       			while(listMapKey.hasMoreElements()){
			       				OrderListRequest orderListRequest = (OrderListRequest) listMap.get(listMapKey.nextElement());
       	%>
			       				<div class="table-responsive table-sm mb-n2 px-3 py-2">
				       				<table class="table table-bordered text-nowrap text-center align-middle">
				       					<tbody>
					       					<tr>
								       			<td class="align-middle" style="width: 10%"><img src="../img/thumb/<%= orderListRequest.getImgName() %>" alt="<%= orderListRequest.getImgName() %>" width="120"></td>
								       			<td class="align-middle tb-content text-left pl-3" style="width: 65%">
									       			<h5><%= orderListRequest.getName() %></h5>
									       			<span><%= orderListRequest.getPrice() %></span>
									       			<span>원 / 1개</span>
								       			</td>
								       			<td class="align-middle" style="width: 25%">
								       				<h5 class="my-3"><%= orderListRequest.getStatus() %></h5>
								       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">배송조회</button><br>
								       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">교환신청</button><br>
								       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">반품신청</button><br>
								       				<button class="btn btn-sm btn-outline-secondary my-1 tb-button2">구매후기 쓰기</button>
								       			</td>
							       			</tr>
						       			</tbody>
					       			</table>
				       			</div>
			       			<%}//while%>
       					</td>
					</tr>
				</table>
     		</div>
       	</div>
       	<% }//for i %>
       	<ul class="pagination justify-content-center">
       		<% if(startPage>1){ %>
		    	<li class="page-item"><a class="page-link" href="orderList.get?currentPage=<%= startPage-1 %>">이전</a></li>
		    <% }else{ %>
		    	<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">이전</a></li>
		    <% } %>
		    <%
		    	for(int i=startPage; i<=endPage; i++){
		    		if(currentPage == i){
		    %>
		    			<li class="page-item active"><a class="page-link" href="orderList.get?currentPage=<%= i %>"><%= i %></a></li>
		    	<% }else{ %>
	    				<li class="page-item"><a class="page-link" href="orderList.get?currentPage=<%= i %>"><%= i %></a></li>
		    <%
		    		}//if
		    	}//for
		    %>
		    <% if(currentBlock == totalBlock){ %>
		    	<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">다음</a></li>
		    <% }else{ %>
		    	<li class="page-item"><a class="page-link" href="orderList.get?currentPage=<%= endPage+1 %>">다음</a></li>
		    <% }//if %>
	  	</ul>
    </div>
</section>

<!--  ======================= End orderList Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>