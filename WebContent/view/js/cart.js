//==============================================================================================================
//가격 변환
//==============================================================================================================
function numberFormat(inputNumber) {
    return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 }
//==============================================================================================================
	
	
//==============================================================================================================	
//전체 선택/해제
//==============================================================================================================
var $selectAll = $('.selectAll');
$selectAll.change(function () {
    var $this = $(this);
    var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
    // console.log(checked);
    $('input[name="cartSelect"]').prop('checked', checked).trigger('change');
    $('input[name="selectAll"]').prop('checked', checked);
});

var boxes = $('input[name="cartSelect"]');
boxes.change(function () {
	var boxLength = boxes.length;
    // 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
    var checkedLength = $('input[name="cartSelect"]:checked').length;
    var selectAll = (boxLength == checkedLength);

    $selectAll.prop('checked', selectAll);

});
//==============================================================================================================
	
	
//==============================================================================================================
//선택 삭제
//==============================================================================================================
function deleteAction(){
  var checkRow = "";
  $( "input[name='cartSelect']:checked" ).each (function (){
    checkRow = checkRow + $(this).val()+"," ;
  });
  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
 
  if(checkRow == ''){
    Swal.fire({
		  position: 'center',
		  icon: 'error',
		  title: "삭제할 대상을 선택하세요.",
		  showConfirmButton: false,
		  timer: 1500
		});
    return false;
    
  }else{
	  location.href = "cart.get?flag=delete&uuid=" + checkRow;
  }//if
 
}
//==============================================================================================================
	