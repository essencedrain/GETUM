<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
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
<!--  ======================= Start Product Detail Area =======================  -->

<section class="productDetail-area">
    <div class="container">
        <div class="pb-1">
            <h1>제품 상세설명</h1>
        </div>

        <div class="row mt-5">
            <div class="img col-lg-6 mb-5">
                <img class="img-fluid" src="./img/product/1.png" alt="">
            </div>

            <div class="content col-lg-6 my-auto">
                <h1>502 스댕</h1>
                <hr>
                <h3>19,800원</h3>
                <hr>
                <h6>배송방법 : 택배</h6>
                <h6>배송비 : 3,000원</h6>
                <hr>
                <h6>상품코드 : B46931</h6>
                <h6>출시일 : 2020-02-02</h6>
                <h6>제조사 : (주)GETUM</h6>
                <hr>
                <h6>수량</h6>
                <div class="bsinput w-50 pb-4">
                    <input type="number" value="0" min="0" max="1000" step="1" id="input"/>
                </div>
                <h3 id="price">총 상품금액 : <span id="output"></span></h3>
                <div class="button-group my-4 float-right">
                    <button class="btn btn-lg btn-outline-secondary mr-1">구매하기</button>
                    <button class="btn btn-lg btn-secondary">장바구니</button>
                </div>
            </div>
        </div>
        <div class="detail col-12">
            <hr>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ex suscipit quidem quaerat minima. Voluptatem commodi culpa odit ipsum possimus quam corrupti, atque adipisci impedit repudiandae animi dolorem facere vel aspernatur consequatur. Nobis eum minus, nisi accusamus, animi dicta officia consectetur voluptatum, ad qui perferendis vero repellat dolor temporibus ullam natus quos tempore illo cupiditate itaque optio non laborum! Sapiente reiciendis cumque, voluptatibus velit omnis quibusdam iusto voluptatem fuga aliquid obcaecati exercitationem aliquam placeat tempora itaque deleniti possimus nesciunt, beatae culpa veritatis eum! Expedita repellat, molestias laudantium mollitia incidunt voluptas nesciunt magni nisi rem fugit id soluta ad dicta aliquid odit atque facilis distinctio dignissimos, pariatur officiis, quasi placeat natus enim. Quod quae fuga unde, voluptas quos delectus similique. Dolorem dolor sapiente nihil labore, totam obcaecati inventore laboriosam ullam laborum debitis aliquam magni accusantium reiciendis sint quae voluptate velit nostrum quibusdam consequuntur eum ut. Animi ut perspiciatis quidem accusamus quasi, natus sit ipsa ea molestias facilis placeat autem odit nam nisi aliquam, expedita, iusto impedit ratione ad possimus? Repudiandae, repellendus similique? Nesciunt eveniet voluptates ad soluta ipsa aliquid dicta, deleniti non consequuntur inventore qui sit placeat nemo aperiam tenetur similique beatae repellendus mollitia et ducimus excepturi. Voluptatibus vel obcaecati eligendi at quo deserunt odit nemo ut? Nulla quos voluptates, suscipit optio dolore commodi animi? Inventore ad ipsa rem voluptates similique non qui vitae, a quis ullam nisi mollitia, maxime omnis earum necessitatibus quae cupiditate commodi impedit obcaecati. Similique iusto laborum fuga quis non natus laboriosam iure debitis necessitatibus sed nemo, excepturi hic tempora impedit soluta quas illum est sit illo ad alias exercitationem. Quasi culpa alias dolores officiis doloribus repudiandae eveniet quia ut esse error, repellendus ipsam quam amet odit dolorem laborum, corrupti, voluptates praesentium omnis voluptatem sequi ullam! Beatae ducimus ipsum dignissimos optio eos, iusto aliquam eius ex atque, soluta nulla exercitationem fugiat facere, magnam repellendus hic in eligendi ab molestiae. Mollitia, velit modi ullam repudiandae distinctio, accusantium veritatis, voluptas saepe eveniet alias ab officia accusamus blanditiis quia obcaecati eaque. Culpa accusantium quos, libero quidem fugiat ipsam adipisci vero sint rem nobis beatae suscipit voluptatem repudiandae ipsa consectetur ad? Sed error similique molestiae incidunt laboriosam animi aut numquam repudiandae consequuntur magni laudantium mollitia architecto accusantium recusandae ad voluptatibus impedit inventore eaque provident voluptates iure, tenetur amet nihil! Voluptatem pariatur repellendus corrupti nobis soluta eum quasi quibusdam alias dolorem reiciendis obcaecati, ipsa earum fugiat? Officia asperiores velit doloribus maxime officiis odio adipisci corrupti ea veniam minima a molestias optio, sapiente modi minus rerum placeat deserunt exercitationem necessitatibus impedit, ipsum magnam praesentium aspernatur quam? Minus corrupti, possimus cupiditate non magni nemo, molestiae veritatis iusto quod est soluta voluptate aspernatur esse ullam amet voluptas doloremque voluptates blanditiis, vitae ratione hic similique eum. Voluptates ipsam, esse iure aspernatur eum exercitationem, temporibus iusto eius, illo distinctio eaque. Quaerat unde ullam repellat, magni nobis ad veritatis id nihil sit odit atque. Accusantium mollitia temporibus impedit vitae laboriosam aperiam ipsum, deleniti, incidunt quam, culpa unde eligendi similique blanditiis optio laudantium numquam sunt quos sint saepe quod.
            </p>
        </div>
    </div>
</section>

<!--  ======================= End Product Detail Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<!--  Jquery js file  -->
<script src="./js/jquery.3.4.1.js"></script>

<!--  Bootstrap js file  -->
<script src="./js/bootstrap.min.js"></script>

<!--  Bootstrap input js file  -->
<script src="./js/bootstrap-input-spinner.js"></script>
<script>
    $("input[type='number']").inputSpinner();
</script>
<script>
var $changedInput = $("#input")
var $valueOnChange = $("#output")
$changedInput.on("change", function (event) {
    $valueOnChange.html( numberFormat( 19800*$changedInput.val() ) )
})
</script>

<!--  custom js file  -->
<script src="./js/main.js"></script>

</body>
</html>