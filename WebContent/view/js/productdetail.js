new WOW().init();
var $changedInput = $("#input");
var $valueOnChange = $("#output");




//온로드
window.onload = function () {
	$("#showPrice").text(numberFormat($("#rawPrice").val()));
	$valueOnChange.html( numberFormat( $("#rawPrice").val()*$changedInput.val() ) );
}





//inputSpinner
$("input[type='number']").inputSpinner();

$changedInput.on("change", function (event) {
    $valueOnChange.html( numberFormat( $("#rawPrice").val()*$changedInput.val() ) );
});






//통화표시
function numberFormat(inputNumber) {
    return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
}
function numberFormat2(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"개";
}


//재고확인 - 장바구니 담기 클릭

function checkStock(){
	if(Number($("#input").val()) > Number($("#stock").val())){
		Swal.fire({
	  		  position: 'center',
	  		  icon: 'error',
	  		  title: "주문 수량이 상품 재고수량("+numberFormat2($("#stock").val())+")보다 많습니다.",
	  		  showConfirmButton: true
	  		  //timer: 1500
		});
		return false;
	}else{
		document.pdForm.submit();
	}
}