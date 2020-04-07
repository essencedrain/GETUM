<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.auth.service.User" %> 
<%@ page import="com.getum.point.model.*" %> 
<%@ page import="com.getum.member.model.MemberDTO" %> 
<%@ page import="java.util.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%
List<PointDTO> list= null;
if(request.getAttribute("list")!=null){
list = (List<PointDTO>) request.getAttribute("list");
}//if

MemberDTO dto = (MemberDTO) request.getAttribute("dto");
String grade = "";
switch (dto.getM_grade()) {
case 1:
	grade="브론즈";
	break;
case 2:
	grade="실버";
	break;
case 3:
	grade="골드";
	break;
case 255:
	grade="관리자";
	break;

default:
	grade="일반";
	break;
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
<!--  ======================= Start mypage Area =======================  -->

<section class="mypage-area">
    <div class="container-fluid pt-5">
        <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 pb-1">
            <h1>마이페이지</h1>
        </div>
        <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 pb-1">
        	<form name="updateForm" action="mypage.get" method="post">
            <div class="table-responsive mt-4">
                <table class="table table-bordered">
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">회원등급</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;"><%= grade %></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">아이디</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;"><%= dto.getM_id() %><button type="button" class="btn btn-sm btn-outline-danger mx-2" onclick="withdraw()">회원탈퇴</button></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">이름</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;"><input type="text" name="name" id="name" value="<%= dto.getM_name()%>" maxlength="30" size="8"></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">이메일</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;"><input type="text" name="email" id="email" value="<%= dto.getM_email()%>" maxlength="30" size="20"></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">휴대폰 번호</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;"><input type="text" name="hp" id="hp" value="<%= dto.getM_hp() %>" maxlength="13" size="13" onKeyup="inputPhoneNumber(this);"></td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">배송지</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;">배송지는 주문창에서 수정할 수 있습니다.</td>
                    </tr>
                    <tr>
                        <td style="width: 20%; overflow:hidden;text-overflow:ellipsis;">포인트</td>
                        <td style="width: 80%; overflow:hidden;text-overflow:ellipsis;">
                            <span id="point2"><%= dto.getM_point() %></span>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#pointModal">
                                내역조회
                              </button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="button-group my-2 text-center">
                <button type="button" class="btn btn-lg btn-outline-secondary mx-2" onclick="updateBtn()">정보수정하기</button>
                <button type="button" class="btn btn-lg btn-primary mx-2" data-toggle="modal" data-target="#pwdModal">비밀번호변경</button>
            </div>
            <input type="hidden" name="flag" id="flag" value="update">
            <input type="hidden" name="m_id" id="m_id" value="<%= dto.getM_id() %>">
            </form>
        </div>
    </div>
</section>
<!-- -----------------------------------------------------------------------------------------------------------point Modal -->
<div class="modal fade" id="pointModal" tabindex="-1" role="dialog" aria-labelledby="pointModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="pointModalCenterTitle">포인트 내역</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <table class="table mx-auto text-center table-bordered table-sm">
          	<thead>
	      		<tr>
	         		<td>포인트</td>
	         		<td>내역</td>
	         		<td>일시</td>
	         	</tr>
          	</thead>
          	<tbody>
          		<% for(PointDTO i : list){ %>
	          	<tr>
	          		<% if(i.getPo_usesave_flag()>0){ %>
	          			<td class="text-success">+<%= i.getPo_point() %></td>
	          		<% }else{ %>
	          			<td class="text-danger"><%= i.getPo_point() %></td>
	          		<% }//if %>
	          		<td><%= i.getPo_detail() %></td>
	          		<td><%= i.getPo_date().substring(0, i.getPo_date().length()-2) %></td>
	          	</tr>
	          	<% }//for %>
          	</tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
<!-- -----------------------------------------------------------------------------------------------------------point Modal -->
<!-- -----------------------------------------------------------------------------------------------------------pwd Modal -->
<div class="modal fade" id="pwdModal" tabindex="-2" role="dialog" aria-labelledby="pwdModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="pwdModalCenterTitle">비밀번호변경</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        	<form name="changePwd" action="mypage.get" method="post">
        		<table class="mx-auto">
        			<tr>
        				<td>현재 비밀번호&nbsp;</td>
        				<td><input type="password" name="recentPwd" id="recentPwd"></td>
        			</tr>
        			<tr>
        				<td>신규 비밀번호&nbsp;</td>
        				<td><input type="password" name="newPwd" id="newPwd"></td>
        			</tr>
        			<tr>
        				<td>비밀번호 확인&nbsp;</td>
        				<td><input type="password" name="checkPwd" id="checkPwd"></td>
        			</tr>
        		</table>
        		<input type="hidden" name="m_pwd" id="m_pwd" value="<%= dto.getM_pwd()%>">
        		<div class="button-group my-2 text-center">
                <button type="button" class="btn btn-lg btn-outline-secondary mx-2" data-dismiss="modal">취소하기</button>
                <button type="button" class="btn btn-lg btn-primary mx-2" onclick="changePwd2()">변경하기</button>
            </div>
        	</form>
        </div>
      </div>
    </div>
  </div>
<!-- -----------------------------------------------------------------------------------------------------------pwd Modal -->
<!--  ======================= End mypage Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->

<%@ include file="./jspf/_essentialFoot.jspf" %>


<script>
$(document).ready(function(){
	$("#point2").text(numberFormat2($("#point2").text()));
	
});
//==============================================================================================================
//통화&포인트 표시
//==============================================================================================================
function numberFormat2(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"P";
}
//==============================================================================================================

	
	
//==============================================================================================================
// withdraw() 회원탈퇴
//==============================================================================================================
function withdraw(){
	
	Swal.fire({
			  title: '정말 탈퇴하시겠습니까?',
			  text: "다시 한 번 확인해주세요",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#007042',
			  cancelButtonColor: '#d33',
			  cancelButtonText: '아니오',
			  confirmButtonText: '예 탈퇴합니다.'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '완료!',
			      '회원탈퇴 처리 되었습니다',
			      'success'
			    ).then((result2)=> {location.href="withdraw.jsp?m_id="+$('#m_id').val();})
			    
			  }
	});
}
//==============================================================================================================
	
	
//==============================================================================================================
// 정보변경 얼럿
//==============================================================================================================
function updateBtn(){
	
	if($("#name").val()=="<%= dto.getM_name()%>" && $("#hp").val()=="<%= dto.getM_hp()%>" && $("#email").val()=="<%= dto.getM_email()%>"){
		Swal.fire(
				  '오류',
				  '변경된 정보가 없습니다',
				  'warning'
				);
	}else{
	
		Swal.fire({
			  title: '정말 변경하시겠습니까?',
			  text: "다시 한 번 확인해주세요",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#007042',
			  cancelButtonColor: '#d33',
			  cancelButtonText: '아니오',
			  confirmButtonText: '예 변경합니다.'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '완료!',
			      '회원정보가 변경되었습니다.',
			      'success'
			    ).then((result2)=> {document.updateForm.submit();})
			    
			  }
			});
	}
}
//==========================================================================================================
	
	
	
//==========================================================================================================
// changePwd2() 비밀번호 변경 ajax
//==========================================================================================================
function changePwd2(){
	
	console.log("여기까지 오니?222");
	if($("#newPwd").val()==$("#checkPwd").val()){
		
		//Ajax사용
	    $.ajax({
	        type : 'POST',
	        url : '../ajax/changePwd.jsp',
	        data : "m_id="+$('#m_id').val()+"&m_pwd="+$('#m_pwd').val()+"&recentPwd="+$('#recentPwd').val()+"&newPwd="+$('#newPwd').val(), //서버로 보내는 파라미터 값
	        dataType:'JSON', //서버가 보내주는 자료 형태
	        //cache : false,
	        //async : true,
	        success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	        							
	        							console.log("여기까지 오니?");						
	        	
				                        if(data.check==-1){
				                        	swa("error","현재 비밀번호가 틀렸습니다.");
				                        }else if(data.check==0){
				                        	swa("error","비밀번호 변경중 에러 발생");
				                        }else if(data.check==1){
				                        	swa("success",'비밀번호가 변경되었습니다.');
				                        	setTimeout(function(){location.href="mypage.get?flag=mypage&m_id="+$('#m_id').val()},1200);
				                        	
				                        }//if
		       						}
	    });
	
	
	}else{
		Swal.fire(
				  '오류',
				  '비밀번호 확인값이 틀립니다.',
				  'warning'
				);
	}
	
}
//==========================================================================================================
	

	
//==========================================================================================================
// sweetalert
//==========================================================================================================
function swa(flag, msg){
	if(flag=="success"){
		Swal.fire({
    		  position: 'center',
    		  icon: 'success',
    		  title: msg,
    		  showConfirmButton: false,
    		  timer: 1200
    		});
	}else if(flag=="error"){
		Swal.fire({
    		  position: 'center',
    		  icon: 'error',
    		  title: msg,
    		  showConfirmButton: false,
    		  timer: 1200
    		});
	}
}
//==========================================================================================================	
	

	
//==========================================================================================================
// 휴대폰 번호 (-) 삽입
//==========================================================================================================
function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
//==========================================================================================================
</script>
</body>
</html>