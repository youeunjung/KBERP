
/* ajax 공통함수*/
function ajaxComm(url, data, type) {
	var t = "post";
	
	if(type == ""){
		type = t;
	}; 
	
	var callback = $.ajax({
		url:url,
		data:data,
		type:type,
		dataType:'json'
	});
	return callback;
}


/* 값이 null인 경우 '' 리턴 */
function nullCheckFunc(obj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return '';
	}else {
		return obj;
	}
}


/* 값이 null인 경우 returnObj 리턴 */
function nullCheckFuncToRtnObj(obj, returnObj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return returnObj;
	}else {
		return obj;
	}
}

/* 필수항목이 있는지 없는지 확인하는 함수. 값이 있는 경우 true, 없는 경우 false 리턴 */
function checkEmpty(sel){
	if($.trim($(sel).val()) == "") {
		return true;
	}else{
		return false;
	}
}

/*들어온 값이 -1 인지 확인하는 함수. 값이 -1인경우 true, -1이 아닌경우 false 리턴*/
function checkMinusOne(sel){
	if($.trim($(sel).val()) == "-1") {
		return true;
	}else{
		return false;
	}
}

/* 셀렉트 박스 안의 값을 확인하는 함수. 값이 null 이거나 -1이면 true 아닌경우 false 리턴 */
function checkSelect(sel) {
	if(checkEmpty(sel) || checkMinusOne(sel)){
		return true;
	}else{
		return false;
	} 
}

/* 들어온 값이 숫자인지 확인하는 함수. 값이 숫자인 경우 true, 숫자가 아닌 경우false 리턴*/
function checkNum(sel) {
	if(isNaN($(sel).val())) {
		return true;
	}else {
		return false;
	}
	
}

/* 날짜 포맷 yyyy-mm-dd 형식으로 변환하는 함수 */
function dateFormatter(targetDate){
	
	var year = targetDate.getFullYear();
	var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
	var day = ('0' + targetDate.getDate()).slice(-2);
	var dateString = year + '-' + month + '-' + day;
	
	return dateString;
}

// 팝업 한줄 내용
function popContOneLine(cont) {
	var content = "<div class=\"cont_bin\"><span class=\"popContOneLine\">" + cont + "</span></div>";
	return content;
}

// 팝업 두줄 내용
function popContTwoLine(cont) {
	var content = "<div class=\"cont_bin\"><div class=\"popContTwoLine\">" + cont + "</div></div>";
	return content;
}