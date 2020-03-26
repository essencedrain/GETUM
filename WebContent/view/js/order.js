//==============================================================================================================
// jsp+온로드 이벤트
//==============================================================================================================
window.onload = function () {

//가격표시
	$("#priceSum").text( numberFormat($("#priceSum").text()) );
	$("#priceSum2").text( numberFormat($("#priceSum2").text()) );


//배송지 목록에서 선택시, 주문/결제창에 반영
$('.selectAddr').click(function(){
	$("#receiverName").text( $(this).find("input").eq(0).val() );
	$("#receiverAddr").text( $(this).find("input").eq(1).val() + ", " + $(this).find("input").eq(2).val() + " (" + $(this).find("input").eq(5).val() + ")");
	$("#getA_addr1").val( $(this).find("input").eq(1).val() );
	$("#getA_addr2").val( $(this).find("input").eq(2).val() );
	$("#getA_post").val( $(this).find("input").eq(5).val() );
	$("#receiverHp").text( $(this).find("input").eq(3).val() );
	$("#receiverReq").text( $(this).find("input").eq(4).val() );
});

// 배송지 수정 버튼 클릭시 수정창에 선택내용 적용
$('.selectModiAddr').on('click',function() {
	$("#a2_name").val( $(this).find("input").eq(0).val() );
	$("#a2_addr1").val( $(this).find("input").eq(1).val() );
	$("#a2_addr2").val( $(this).find("input").eq(2).val() );
	$("#a2_post").val( $(this).find("input").eq(5).val() );
	$("#a2_hp").val( $(this).find("input").eq(3).val() );
	$("#a2_request").val( $(this).find("input").eq(4).val() );
	$("#a2_no").val( $(this).find("input").eq(6).val() );
});
}//window_onload)




//==============================================================================================================
//가격 변환
//==============================================================================================================
function numberFormat(inputNumber) {
  return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
}
//==============================================================================================================
	
	
	
//==============================================================================================================
// 다음 주소
//==============================================================================================================
function openDaumPostcode(){

    new daum.Postcode({
           oncomplete:function(data){
                  document.getElementById('a_post').value=data.zonecode;
                  document.getElementById('a_addr1').value=data.roadAddress;
                  $("#addr2").removeClass("d-none");
           }
    }).open();

}//openDaumPostcode()---

//배송지 수정창 전용
function openDaumPostcode2(){

    new daum.Postcode({
           oncomplete:function(data){
                  document.getElementById('a2_post').value=data.zonecode;
                  document.getElementById('a2_addr1').value=data.roadAddress;
                  document.getElementById('a2_addr2').value="";
           }
    }).open();

}//openDaumPostcode()---
//==============================================================================================================
	
	
	
//==============================================================================================================
// 배송지 삭제버튼
//==============================================================================================================
function addrDelete() {
	location.href = "order.get?flag=delete&a_no=" + $("#a2_no").val() + "&m_id=" + $("#a2_id").val();
}
//==============================================================================================================
	
	
//==============================================================================================================
// 휴대폰 번호 (-) 삽입
//==============================================================================================================
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
//==============================================================================================================