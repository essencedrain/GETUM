<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>

    <!--  font awesome icons  -->
    <link rel="stylesheet" href="../css/all.min.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start signup Area =======================  -->

<section class="signUp-area">
    <div class="container">
        <div class="row">
            <div class="signUpFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>회원가입</h1>
                </div>
                <div class="signUpForm">
                    <form name="signUpForm" method="post" action="./proc/signupproc.jsp">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control"  placeholder="아이디" name="m_id">
                        </div>
                        
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호" name="m_pwd">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="m_pwd2">
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이름" name="m_name">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이메일" name="m_email">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="휴대폰 번호" name="m_hp">
                        </div>
                        
                        <div class="input-group mb-5">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                            </div>
                            <select name="year" class="form-control" id="select_year" onchange="javascript:lastday();">
                            </select>
                            <select class="form-control" name="month" id="select_month" onchange="javascript:lastday();">
                                <option value="" selected>월</option>
                              </select>
                              <select class="form-control" name="day" id="select_day">
                                <option value="" selected>일</option>
                              </select>
                        </div>
						
                        <button type="submit" class="btn btn-lg btn-primary w-100">가입하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End signup Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!-- 선택한 년과 월에 따라 마지막 일 구하기 -->
<script>
var today = new Date();
var today_year= today.getFullYear();
var start_year= today_year-120;// 시작할 년도
var target_year = today_year-30;
var index=0;
for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도
	
	if(y==target_year){
		document.getElementById('select_year').options[index] = new Option(y, y, false, true);
		index++;
	}else{
		document.getElementById('select_year').options[index] = new Option(y, y);
		index++;
	}
}
index=1;
for(var m=1; m<=12; m++){
	document.getElementById('select_month').options[index] = new Option(m, m);
	index++;
}

lastday();

function lastday(){ //년과 월에 따라 마지막 일 구하기 
	var Year=document.getElementById('select_year').value;
	var Month=document.getElementById('select_month').value;
	/*
	86400000ms는 1day를 의미한다.
	1s = 1,000ms
	1m = 60s * 1,000ms = 60,000ms
	1h = 60m * 60,000ms = 3,600,000ms
	1d = 24h * 3,600,000ms = 86,400,000ms
	
	new Date(year, month[, day, hour, minute, second, millisecond])
	new Date(2019, 4) ---> Wed May 01 2019 00:00:00 GMT+0900 (한국 표준시)
	
	아래는 코드는
	month가 0~11이다 보니 선택한 month는 실제 month+1이다
	선택한 월 1일에서 1day(86400000)를 빼주면
	실제 month의 말일 date를 가져올 수 있다.
	*/
	var day=new Date(new Date(Year,Month,1)-86400000).getDate();
	
	var dayindex_len=document.getElementById('select_day').length;
	
	// 월과 일 selectbox에 기본적으로 '월', '일'이 있음
	// 이거 생각해서 계산 
	if(dayindex_len!=1){
		if(day>=dayindex_len){//바뀐 year, month의 말일이 지금 셀렉트사이즈보다 같거나 크면
			for(var i=(dayindex_len); i<=day; i++){
				document.getElementById('select_day').options[i] = new Option(i, i);
			}
		}
		else if(day<dayindex_len){//바뀐 year, month의 말일이 지금 셀렉트사이즈보다 작으면
			for(var i=dayindex_len-1; i>=day; i--){
				document.getElementById('select_day').options[i+1]=null;
			}
		}
	}else{
		for(var i=1; i<=day; i++){//최초 실행
			document.getElementById('select_day').options[i] = new Option(i, i);
		}
	}
}
</script>
<!-- 선택한 년과 월에 따라 마지막 일 구하기 -->


<!--  Jquery js file  -->
<script src="../js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="../js/bootstrap.min.js"></script>

</body>
</html>