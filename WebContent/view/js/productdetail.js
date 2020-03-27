new WOW().init();
var $changedInput = $("#input");
var $valueOnChange = $("#output");

window.onload = function () {
	$("#showPrice").text(numberFormat($("#rawPrice").val()));
	$valueOnChange.html( numberFormat( $("#rawPrice").val()*$changedInput.val() ) );
}

$("input[type='number']").inputSpinner();

$changedInput.on("change", function (event) {
    $valueOnChange.html( numberFormat( $("#rawPrice").val()*$changedInput.val() ) );
});

//가격표시
function numberFormat(inputNumber) {
    return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 }