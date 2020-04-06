<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.board.service.FreeboardReadRequest" %>
<%@ page import="com.getum.auth.service.User" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%

User user = null;

if(session.getAttribute("authUser")!=null){
user = (User) session.getAttribute("authUser");
}

//현재페이지
int currentPage = (int) request.getAttribute("currentPage");
FreeboardReadRequest contentData = (FreeboardReadRequest) request.getAttribute("contentData");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<style>
     	.noticeContent-area a:link {text-decoration:none; color:#001627;}
		.noticeContent-area a:visited {text-decoration:none; color:#001627;}
		.noticeContent-area a:active {text-decoration:none; color:#001627;}
		.noticeContent-area a:hover {text-decoration:none; color:#001627;}
</style>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start noticeContent Area =======================  -->

<section class="noticeContent-area">
    <div class="container pt-5">
        <div class="col-xl-10 offset-xl-1 col-lg-8 offset-lg-2 col-12 pb-1 pb-1">
            <a id="goback" href="freeboard.get?flag=list&currentPage=<%=currentPage%>"><h4><i class="far fa-arrow-alt-circle-left"></i> 목록으로</h4></a>
        </div>
        <div class="col-xl-10 offset-xl-1 col-lg-8 offset-lg-2 col-12 pb-1">
            <div class="table-responsive mt-4">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td><%=contentData.getB2_subject() %></td>
                        </tr>
                        <tr>
                            <td>등록일 : <%= contentData.getB2_reg_date().substring(0, 10) %>  <small>/</small>  조회수 : <%= contentData.getB2_count() %></td>
                        </tr>
                        <tr>
                            <td><%= contentData.getB2_content() %></td>
                        </tr>
                    </tbody>
                </table>
                
				<div class="float-right mt-3">
                <%
		  				if(user!=null){
		  					if(user.getM_id().equals(contentData.getM_id())){
		  		%>
								<button type="button" class="btn btn-outline-secondary text-center" onclick="deleteBtn()">삭제하기</button>
								<button type="button" class="btn btn-outline-secondary text-center" onclick="location.href='freeboard.get?flag=update&idx=<%= contentData.getB2_idx()%>&currentPage=<%=currentPage %>'">수정하기</button>
				<%
							}//if
				%>
							<button type="button" class="btn btn-outline-secondary text-center" onclick="location.href='freeboard.get?flag=reply&idx=<%= contentData.getB2_idx()%>&currentPage=<%=currentPage %>&origin=<%= contentData.getB2_origin()%>&origin_step=<%= contentData.getB2_origin_step()%>&origin_depth=<%= contentData.getB2_origin_depth()%>'">답글달기</button>
				<%
		  				}//if
				%>
						<button type="button" class="btn btn-primary text-center" onclick="location.href='freeboard.get?flag=list&currentPage=<%=currentPage%>'">목록으로</button>
				</div>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End noticeContent Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<script>

function deleteBtn(){
	
	Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "삭제된 글을 복구가 불가합니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#007042',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '아니오',
		  confirmButtonText: '예 삭제합니다'
		}).then((result) => {
		  if (result.value) {
		    location.href="freeboard.get?flag=delete&idx=<%= contentData.getB2_idx()%>&currentPage=<%=currentPage %>&origin=<%= contentData.getB2_origin()%>"
		  }
		});
}

</script>

</body>
</html>