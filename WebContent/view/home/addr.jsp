<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
</head>
<body>
<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start addr Area =======================  -->

<section class="addr-area">
    <div class="container">
        <div class="row">
            <div class="addrFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading text-center pt-4">
                    <h4>배송지 선택</h4>
                    <hr>
                </div>
                <div class="row">
                    <table class="table table-bordered">
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        <tr>
                            <td>
                                <h6>구태형</h6>
                                <p>서울특별시 구로구 구로중앙로 99길 99, 1499호</p>
                                <p>010-9999-9999</p>
                                <p>요청사항 : </p>
                                <div>
                                    <button class="btn btn btn-outline-secondary float-left">수정</button>
                                    <button class="btn btn btn-primary float-right">선택</button>
                                </div>
                            </td>
                        </tr>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        <tr>
                            <td>
                                <h6>구태형</h6>
                                <p>서울특별시 구로구 구로중앙로 99길 99, 1499호</p>
                                <p>010-9999-9999</p>
                                <p>요청사항 : </p>
                                <div>
                                    <button class="btn btn btn-outline-secondary float-left">수정</button>
                                    <button class="btn btn btn-primary float-right">선택</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    <button class="btn btn-lg btn-outline-secondary w-100">+배송지 추가</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!--  ======================= End addr Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->

<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>