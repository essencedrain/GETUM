<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    
    <!--  sweetalert2  -->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->
<section class="productCreate pt-5">
    <div class="container">
        <div class="row">
            <div class="productCreateFormWrap mx-auto col-md-6 col-md-offset-3">
                <div class="heading pb-1 text-center pb-4">
                    <h1>상품등록</h1>
                </div>
                <div class="productCreateForm">
                    <form name="productCreateForm" action="productCreate.get" method="post" encType="multipart/form-data">
                        <div class="form-row mb-2">
                            <div class="form-group col-lg-6">
                                <label for="p_name">상품명</label>
                                <input type="text" class="form-control" placeholder="상품명을 입력해주세요" id="p_name" name="p_name">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="p_code">상품코드</label>
                                <input type="text" class="form-control" placeholder="상품코드를 입력해주세요" id="p_code" name="p_code">
                            </div>
                        </div>
                        <div class="form-row mb-2">
                            <div class="form-group col-lg-6">
                                <label for="p_price">상품가격</label>
                                <input type="text" class="form-control" placeholder="상품가격을 입력해주세요" id="p_price" name="p_price">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="p_manufacture">제조사</label>
                                <input type="text" class="form-control" placeholder="제조사를 입력해주세요" id="p_manufacture" name="p_manufacture">
                            </div>
                        </div>


                        <div class="form-group mb-2">
                            <label for="p_stock">재고수량</label>
                            <input type="text" class="form-control" placeholder="재고수량을 입력해주세요" id="p_stock" name="p_stock">
                        </div>

                        <label>제품 출시일</label>
                        <div class="input-group mb-2">
                            <select  class="form-control" name="year" id="select_year" onchange="javascript:lastday();">
                            </select>
                            <select class="form-control" name="month" id="select_month" onchange="javascript:lastday();">
                                <option value="" selected>월</option>
                              </select>
                              <select class="form-control" name="day" id="select_day">
                                <option value="" selected>일</option>
                              </select>
                        </div>
                        <label>카테고리</label>
                        <div class="form-group mb-2">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" name="cateChk" id="inlineCheckbox1" value="신제품">
                                <label class="form-check-label" for="inlineCheckbox1">신상품</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" name="cateChk" id="inlineCheckbox2" value="인기상품">
                                <label class="form-check-label" for="inlineCheckbox2">인기상품</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="cateRadio" id="inlineRadio1" value="스테인리스" checked="checked">
                                <label class="form-check-label" for="inlineRadio1">스테인리스</label>
                              </div>
                              <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="cateRadio" id="inlineRadio2" value="플라스틱">
                                <label class="form-check-label" for="inlineRadio2">플라스틱</label>
                              </div>
                        </div>

                        <div class="form-group mb-2">
                            <label for="p_detail">상세설명</label>
                            <textarea class="form-control" id="p_detail"  name="p_detail" rows="8"></textarea>
                        </div>

                        <div class="custom-file mb-2">
                            <input type="file" class="custom-file-input" name = "file" id="customFile" accept=".gif,.jpg,.png">
                            <label class="custom-file-label" for="customFile">이미지 파일을 업로드 하세요</label>
                        </div>
                        <button type="submit" class="btn btn-lg btn-primary w-100 mb-5">상품등록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

<!--  sweetalert2 js file  -->
<script src="../js/sweetalert2.min.js"></script>

<!-- productCreate.js -->
<script src="../js/productCreate.js"></script>


</body>
</html>
