<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead2.jspf" %>

    <!--  font awesome icons  -->
    <link rel="stylesheet" href="../../css/all.min.css">

    <!-- animate css -->
    <link rel="stylesheet" href="../../css/animate.css">
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header2.jspf" %>
<!--  ======================= End Header Area ============================== -->
<div class="container pt-5">
    <form action="productCreate.get" method="post" encType="multipart/form-data">
    <table>
        <tr>
        	<td>상품명 : </td>
            <td><input type="text" id="1i" class="1c" name="p_name" value="스벅텀블러"></td>
        </tr>
        <tr>
            <td>상품코드 : </td>
            <td><input type="text" id="2i" class="2c" name="p_code" value="ZC20193949"></td>
        </tr>
        <tr>
            <td>상품가격 : </td>
            <td><input type="text" id="3i" class="3c" name="p_price" value="30000"></td>
        </tr>
        <tr>
            <td>출시일 : </td>
            <td><input type="text" id="4i" class="4c" name="p_release_date" value="2019-03-19"></td>
        </tr>
        <tr>
            <td>제조사 : </td>
            <td><input type="text" id="5i" class="5c" name="p_manufacture" value="아이조아"></td>
        </tr>
        <tr>
        	<td>재고수량 : </td>
            <td><input type="text" id="6i" class="6c" name="p_stock" value="8000"></td>
        </tr>
        <tr>
            <td>카테고리 : </td>
            <td><input type="text" id="7i" class="7c" name="p_category" value="new,stainless"></td>
        </tr>
        <tr>
            <td>상세설명 : </td>
            <td><textarea name="p_detail" id="8i" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <td>첨부파일 : </td>
            <td><input type="file" id="9i" class="9c" name="file"></td>
        </tr>
    </table>
    <input type="submit" value="전송">
</form>
</div>
<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer2.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!--  Jquery js file  -->
<script src="../../js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="../../js/bootstrap.min.js"></script>
</body>
</html>
