//==========================================================================================================
// (온로드) ajax 아이디 중복확인
//==========================================================================================================
$(function(){
	var validation = 0;
	$('#m_id').focus();
	
	//버튼에 자동으로 포커스 잡히는걸 막음
	$('button').focus(function() {
        this.blur();
    });
	
	
	//=============================================================================================
	//$("#m_id").focus
	//=============================================================================================
	$("#m_id").focus(function(){
		//가리기
		//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
		if(!$("#m_id_len").hasClass("d-none")){$("#m_id_len").addClass("d-none");}
		//"아이디는 영어 소문자로 시작해야 합니다."
		if(!$("#m_id_fir").hasClass("d-none")){$("#m_id_fir").addClass("d-none");}
		//"아이디에 특수문자는 사용할 수 없습니다."
        if(!$("#m_id_spe").hasClass("d-none")){$("#m_id_spe").addClass("d-none");}
	});
	//=============================================================================================
	
	
	//=============================================================================================
	//$("#m_id").keyup
	//=============================================================================================
	$("#m_id").keyup(function(){
		var str = $("#m_id").val().toUpperCase();
		var len = $("#m_id").val().length;
		//특수문자플래그
		var isSpe = false;
		
		if( str == "" ){//글자가 없으면
    		
    	}else if( len < 4 ){ //4글자 이하면
        	
	    		// 1 -> 오류
	        	validation = 1;
	        	
	        	//보이기
	        	//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
	            if($("#m_id_len").hasClass("d-none")){$("#m_id_len").removeClass("d-none");}
	            
	            
	            //첫글자가 영문자가 아니면
		    	if( !( 'A'<= str.charAt(0) && 'Z'>= str.charAt(0) ) ){
		    		//보이기
	            	//"아이디는 영어 소문자로 시작해야 합니다."
	                if($("#m_id_fir").hasClass("d-none")){$("#m_id_fir").removeClass("d-none");}
		    	}else{
		    		//가리기
		    		//"아이디는 영어 소문자로 시작해야 합니다."
		    		if(!$("#m_id_fir").hasClass("d-none")){$("#m_id_fir").addClass("d-none");}
		    	}//if
		    	
		    	//특수문자 존재 여부
		    	for(var i=1; i<len; i++){
        			if( ( 'A' <= str.charAt(i) && 'Z' >= str.charAt(i) ) || ( '0'<=str.charAt(i) && '9'>=str.charAt(i) ) ){
        				// 가리기
        				//"아이디에 특수문자는 사용할 수 없습니다."
        		        if(!$("#m_id_spe").hasClass("d-none")){$("#m_id_spe").addClass("d-none");}
        			}else{
        				//보이기
    	            	//"아이디에 특수문자는 사용할 수 없습니다."
    	                if($("#m_id_spe").hasClass("d-none")){$("#m_id_spe").removeClass("d-none");}
        			}//if
        		}//for
            
                        
        }else{// 4글자 이상이면 
        	
	        	//첫글자가 영문자이면
	        	if( 'A' <= str.charAt(0) && 'Z' >= str.charAt(0) ){
	        		
	        		for(var i=1; i<len; i++){
	        			//특수문자가 없다
	        			if( ( 'A' <= str.charAt(i) && 'Z' >= str.charAt(i) ) || ( '0'<=str.charAt(i) && '9'>=str.charAt(i) ) ){
	        				// -1 -> 정상
	    	        		validation = -1;
	    	        		
	    	        	//특수문자가 있다
	        			}else{
	        				
	        				isSpe = true;
	    	                
	        			}//if
	        		}//for
	        		
	        		if(isSpe){
	        			validation = 1;
	        			//보이기
    	            	//"아이디에 특수문자는 사용할 수 없습니다."
    	                if($("#m_id_spe").hasClass("d-none")){$("#m_id_spe").removeClass("d-none");}
	        		}//if
	        		
	        		
	        	}else{
	        		//보이기
	            	//"아이디는 영어 소문자로 시작해야 합니다."
	                if($("#m_id_fir").hasClass("d-none")){$("#m_id_fir").removeClass("d-none");}
	                
	        	}//if
	        	
	        	//가리기
	    		//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
	    		if(!$("#m_id_len").hasClass("d-none")){$("#m_id_len").addClass("d-none");}
    		
        }//if
        
    });
	//=============================================================================================
	
	
	
	//=============================================================================================
	//$("#m_id").blur
	//=============================================================================================
    $("#m_id").blur(function(){
        if(validation > -1){
            //alert("ID를 정확히 입력해주세요");
            $('#m_id').focus();
            
        }else{
        
            //Ajax사용
            $.ajax({
                type : 'POST',
                url : '../ajax/confirmId.jsp',
                data : "m_id="+$('#m_id').val(), //서버로 보내는 파라미터 값
                dataType:'JSON', //서버가 보내주는 자료 형태
                //cache : false,
                //async : true,
                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
                       //alert(data);
                       //alert(data.check);
					                        if(data.check==1){
					                        	swa("error","중복된 아이디 입니다.");
					                            validation = 1;
					                            
					                            $('#m_id').val("");
					                        	$('#m_id').focus();
					                            
					                        }else{
					                            //alert("사용가능한 id" );
					                            //$("#m_id_ok").removeClass("d-none");
					                        	swa("success",'사용가능한 아이디 입니다.');
					                            validation = -1;
					                        }//else---
                						}

            });
        	
        }//if
        
    });
});
//==========================================================================================================



//==========================================================================================================
//선택한 년과 월에 따라 마지막 일 구하기
//==========================================================================================================
var today = new Date();
var today_year= today.getFullYear();
var start_year= today_year-120;// 시작할 년도
var target_year = today_year-30; //처음에 표시할 연도
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



//==========================================================================================================
//유효성 검사 check9()
//==========================================================================================================
function check9(ff){
	
	if(!isID(ff.m_id)){
		ff.m_id.focus();
		return false;
	}//if
	
	if(!isSame(ff.m_pwd,ff.m_pwd2)){
		ff.m_pwd.value="";
		ff.m_pwd2.value="";
		ff.m_pwd.focus();
		return false;
	}
	
	if(!isNull(ff.m_name,"이름을 입력하세요")){
		//ff.m_name.focus();
		setTimeout(ff.m_name.focus(),10);
		return false;
	}//if
	
	if(!isEmail(ff.m_email)){
		ff.m_email.focus();
		return false;
	}//if
	
	if(!isHP(ff.m_hp)){
		ff.m_hp.value="";
		ff.m_hp.focus();
		return false;
	}//if
	
	if(!isBirth(ff.month, ff.day)){
		ff.year.focus();
		return false;
	}//if
	
	
}//check9()
//==========================================================================================================


//==========================================================================================================
// sweetalert
//==========================================================================================================
function swa(flag, msg){
	if(flag=="success"){
		Swal.fire({
    		  position: 'center',
    		  icon: 'success',
    		  title: msg,
    		  showConfirmButton: false,
    		  timer: 1200
    		});
	}else if(flag=="error"){
		Swal.fire({
    		  position: 'center',
    		  icon: 'error',
    		  title: msg,
    		  showConfirmButton: false,
    		  timer: 1200
    		});
	}
}
//==========================================================================================================



//==========================================================================================================
// 유효성 검사 샘플
//==========================================================================================================

function isNull(obj, msg){
    if(obj.value==""){
        
        if(msg){
        	swa("error",msg);
        }//if
        
        return false;//입력이 안되었으면 false
    }
    return true;//입력이 되었으면 true
}//isNull end -----------------------------

//===========================================
//ID
//===========================================
function isID(obj){
    
    var str2=obj.value;
    if(str2.length==0){
    	swa("error","아이디를 입력하세요");
        return false;
    }//if
    str2=str2.toUpperCase();//대문자로 변환 ,A~Z, a~z
    
    //ID 첫글자가 영문자 이어야한다
    if(!('A'<=str2.charAt(0) && 'Z'>=str2.charAt(0))){ 
    	swa("error","첫글자를 영문자로 입력하세요");
        return false;
    }//if

    for(var i=1; i<str2.length; i++){
        if( !( ('A'<=str2.charAt(i) && 'Z'>=str2.charAt(i)) || ('0'<=str2.charAt(i) && str2.charAt(i)<='9') ) ) {
        	console.log(str2.charAt(i));
            swa("error","영문자, 숫자만 사용가능합니다.");
            return false;
        }//if
    }//for
    return true;
}//isID

//==========================
//Email
//==========================
function isEmail(obj){
    var str=obj.value;
    
    if(str==""){
    	swa("error","이메일 주소를 입력하세요");
        return false;
    }//if
    
    var i=str.indexOf("@");
    if(i<0){
    	swa("error","올바르지 않은 이메일 형식입니다.");
        return false;
    }
    
    i=str.indexOf(".");
    if(i<0){
    	swa("error","올바르지 않은 이메일 형식입니다.");
        return false;
    }
    return true;
    
}//isEmail() end

//==========================
//p1, p2 암호 
//==========================
function isSame(ob1,ob2){
    var str1=ob1.value;
    var str2=ob2.value;
    
    if(str1.length==0 || str2.length==0){
    	swa("error","암호를 입력하세요");
        return false;
    }
    
    if(str1 != str2){
    	swa("error","암호가 일치하지 않습니다");
        return false;
    }
    return true;
}

//==========================
// 휴대폰 유효성
//==========================
function isHP(obj){
    
    var str=obj.value;
    
    if(str=="" || str.length==0){
    	swa("error","휴대폰 번호를 입력해주세요.");
        return false;
    }//if
    
    if(str.length<13){
    	swa("error","휴대폰 번호가 올바르지 않습니다.");
        return false;
    }//if
    
    return true;
}//isHP

//==========================
// 생일 유효성
//==========================

function isBirth(ob1, ob2){
	
    var str1=ob1.value;
    var str2=ob2.value;
    
    if(str1.length==0 || str2.length==0){
    	swa("error","생일을 정확히 선택해 주세요.");
        return false;
    }
 
    return true;
}//isBirth


//==========================
// 휴대폰 번호 (-) 삽입
//==========================
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
//==========================================================================================================