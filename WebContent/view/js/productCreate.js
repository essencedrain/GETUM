//==========================================================================================================
// 선택 파일명 표시
//==========================================================================================================
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
//==========================================================================================================

//==========================================================================================================
// 파일 확장자 경고
//==========================================================================================================
    var fileInput = document.getElementById("customFile");
    var allowedExtension1 = ".jpg";
    var allowedExtension2 = ".png";
    var allowedExtension3 = ".gif";

    fileInput.addEventListener("change", function() {
    // Check that the file extension is supported.
    // If not, clear the input.
    var hasInvalidFiles = false;
    for (var i = 0; i < this.files.length; i++) {
        var file = this.files[i];

        if ( !( file.name.endsWith(allowedExtension1) || file.name.endsWith(allowedExtension2) ||file.name.endsWith(allowedExtension3) ) ) {
        hasInvalidFiles = true;
        }
    }

    if(hasInvalidFiles) {
        fileInput.value = ""; 
        Swal.fire({
			  		  position: 'center',
			  		  icon: 'error',
			  		  title: "jpg, png, gif 파일만 업로드 가능합니다."
					});
        $(this).siblings(".custom-file-label").addClass("selected").html("이미지 파일을 업로드 하세요");
    }
    });
//==========================================================================================================

//==========================================================================================================
//선택한 년과 월에 따라 마지막 일 구하기
//==========================================================================================================
var today = new Date();
var today_year= today.getFullYear();
var start_year= today_year-20;// 시작할 년도
var target_year = today_year; //처음에 표시할 연도
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
//==========================================================================================================