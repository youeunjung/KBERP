<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP 로그인</title>
<!-- Favicon -->
<link rel="shortcut icon" href="resources/favicon/favi.gif">
<!-- 공용 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<style type="text/css">
.login {
	font-size: 11pt;
	position: absolute;
	width: 400px;
	height: 300px;
	top: calc(50% - 200px);
	left: calc(50% - 200px);
	text-align: center;
}

.logo_area, .input {
	width: 100%;
	height: 100px;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.logo {
	cursor: default;
}

.input {
	width: 384px;
	height: 40px;
	margin-bottom: 10px;
	font-size: 11pt;
	padding-left: 10px;
}

.input:focus {
	outline-color: #F2CB05;
}

.cmn_btn {
	width: 450px;
	height: 46px;
	display: table-cell;
	vertical-align: middle;
}

.text {
	color: gray;
	margin-top: 30px;
}
</style>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 팝업 js 파일 -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!-- Util js 파일 -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* 
	if('${sEmpNum}' != '') {
		$("#locationForm").submit();
	}
	 */
	$(".cmn_btn").on("click", function() {
		if(checkEmpty("#loginId")) {
			makeAlert("로그인 안내", "사원번호를 입력해 주세요.", function() {
				$("#loginId").focus();
			});
		} else if(checkEmpty("#loginPw")) {
			makeAlert("로그인 안내", "비밀번호를 입력해 주세요.", function() {
				$("#loginPw").focus();
			});
		} else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "loc";
					} else if(result.res == "FAILED") {
						makeAlert("로그인 실패", "아이디나 비밀번호가 틀렸습니다.");
					} else {
						makeAlert("로그인 경고", "로그인 체크 중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#loginForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$(".cmn_btn").click();
			$(this).blur();
			return false;
		}
	});
});
</script>
</head>
</head>
<body>
	<!-- <form action="sample" id="locationForm" method="post">
		<input type="hidden" id="top" name="top" value="21" />
		<input type="hidden" id="menuNum" name="menuNum" value="1" />
		<input type="hidden" id="menuType" name="menuType" value="B" />
	</form> -->
    <div class = "login">
    	<div class="logo_area">
	    	<div class="logo">
				<div class="logo_erp_text">ERP</div>
			</div>
    	</div>
    	<form action="#" id="loginForm" method="post">
        <input type="text" class="input" id="loginId" name="id" placeholder="사원번호"/>
        <input type="password" class="input" id="loginPw" name="pw" placeholder="비밀번호"/>
        </form>
        <div class="cmn_btn">로그인</div>
        <div class="text">GDJ43 - TeamProject</div>
    </div>
</body>
</html>