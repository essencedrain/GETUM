<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
    
    <!-- animate css -->
    <link rel="stylesheet" href="../css/animate.css">
    
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->
<div class="container pt-5">
    <form action="productCreate.get" method="post" encType="multipart/form-data">
    <table>
        <tr>
        	<td>상품명 : </td>
            <td><input type="text" id="1i" class="1c" name="p_name" value=""></td>
        </tr>
        <tr>
            <td>상품코드 : </td>
            <td><input type="text" id="2i" class="2c" name="p_code" value="ZC20200301"></td>
        </tr>
        <tr>
            <td>상품가격 : </td>
            <td><input type="text" id="3i" class="3c" name="p_price" value="19800"></td>
        </tr>
        <tr>
            <td>출시일 : </td>
            <td><input type="text" id="4i" class="4c" name="p_release_date" value="2019-03-19"></td>
        </tr>
        <tr>
            <td>제조사 : </td>
            <td><input type="text" id="5i" class="5c" name="p_manufacture" value="(주)GETUM"></td>
        </tr>
        <tr>
        	<td>재고수량 : </td>
            <td><input type="text" id="6i" class="6c" name="p_stock" value="9999"></td>
        </tr>
        <tr>
            <td>카테고리 : </td>
            <td><input type="text" id="7i" class="7c" name="p_category" value="신제품, 인기상품, 스테인리스, 플라스틱"></td>
        </tr>
        <tr>
            <td>상세설명 : </td>
            <td><textarea name="p_detail" id="8i" cols="30" rows="10">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et feugiat ligula, ut interdum sem. Aliquam at iaculis nisl. Donec ultrices neque ultrices dolor mattis, vel faucibus eros vulputate. Praesent congue sapien arcu, vel auctor nulla condimentum sed. Aenean hendrerit magna quis finibus volutpat. Duis consequat dapibus sapien vitae venenatis. Fusce non dapibus eros, eget aliquam arcu. Nam scelerisque lorem ante, eu tincidunt nisi molestie ac. Curabitur blandit libero vitae mi convallis porta. Praesent elementum, magna eu viverra dapibus, ipsum erat vehicula arcu, vel ultricies orci mi quis tortor. Praesent eu massa fringilla, sollicitudin est nec, aliquam mauris. Donec sollicitudin purus in tortor laoreet dictum eu at felis.

Phasellus facilisis tristique magna, euismod semper nibh pulvinar tincidunt. Nunc convallis nisi sapien, nec faucibus turpis pharetra eu. Nam ligula ipsum, tristique ac tincidunt in, pellentesque a felis. Donec nec felis consequat magna tempor vulputate. Etiam rhoncus ut lorem vitae pulvinar. Vestibulum et augue id libero malesuada tincidunt a sed arcu. Sed sapien ante, dapibus sed suscipit ac, finibus in mauris. Pellentesque nec sodales arcu. Donec scelerisque molestie ullamcorper. Vivamus rhoncus quam leo, consequat accumsan quam commodo ut. Vestibulum id lorem at eros placerat tempor. Cras laoreet, odio at maximus hendrerit, mauris dolor tempus nisi, et interdum neque nibh ut purus. Donec volutpat convallis euismod. Ut nec laoreet nulla, et sagittis sem. Mauris vel sodales massa.

Suspendisse eget dictum ex, et gravida ipsum. Fusce dolor augue, mollis eu eros eu, vulputate bibendum libero. Curabitur porttitor, felis iaculis aliquam pretium, lacus ipsum consequat ex, eget tincidunt quam ex non metus. Curabitur eu bibendum nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut purus porta, congue quam vitae, fringilla massa. Praesent pellentesque, augue id egestas condimentum, neque lacus fringilla libero, id commodo lacus elit nec augue. Nullam venenatis magna viverra urna egestas tempus. Morbi commodo cursus dolor semper commodo. Sed tortor nibh, mattis non magna nec, pulvinar egestas dui. In hac habitasse platea dictumst. Cras ligula augue, facilisis vitae nulla quis, tincidunt laoreet ligula. Nullam ipsum metus, fermentum id cursus a, faucibus bibendum risus. Nullam dignissim orci eget pretium faucibus.</textarea></td>
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

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>
