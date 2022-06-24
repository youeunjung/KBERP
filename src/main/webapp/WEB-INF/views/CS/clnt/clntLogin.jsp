<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 로그인</title>
<!-- 공용 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<link rel="icon" href="resources/favicon/favi.gif" />
<style type="text/css">
html, body {
    height: 100%;
    min-height: 100%;
}

body {
    background-color: #ececee;
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-family: '맑은 고딕';
}

.login_bg {
	width: 100%;
	height: 100%;
}

.kabang_wrap {
	max-width: 700px;
    min-height: 100%;
    margin: 0 auto;
    background: #fff;
    text-align: center;
}

.login_logo {
    padding-top: 250px;
}

.kabang_icon {
	display: inline-block;
	cursor: pointer;
}

.kabang_icon img {
	display: block;
	margin: 0 auto;
	width: 50px;
	height: 50px;
	
}

.kabang_black{
	display: inline-block;
	cursor: pointer;
}

.kabang_black img {
	display: block;
	margin: 0 auto;
	width: 160px;
	height: 50px;
	margin-left: 5px;
}

.login_area {
	max-width: 420px;
    padding-top: 40px;
    margin: 0 auto;
}

.input_id input {
	display: block;
    width: 420px;
    height: 42px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 15px;
    margin-top: 10px;
    font-size: 12pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
}

.input_id input::placeholder {
	color: #BDBDBD;
}

.login_Btn {
	display: block;
    width: 425px;
    height: 50px;
    border: 1px solid #F2B705;
    border-radius: 2px;
    background-color: #F2B705;
    line-height: 55px;
    font-size: 11pt;
    font-weight: bold;
    margin-top: 15px;
    cursor: pointer;
}


.login_logo, .input_id input, .login_Btn, .login_bottom, .login_foot {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

form {
	display: inline;
}

.find, .foot_text {
	display: inline-block;
	margin-top: 30px;
	font-size: 11pt;
	color: #8c8c8c;
	margin-right: 10px;
	margin-left: 10px;
	letter-spacing: -2px;
	cursor: pointer;
	
}

.login_foot {
	padding-top: 50px;
}

.login_foot div {
	font-size: 10.5pt;
	letter-spacing: 0px;
}

.popup_cont {
	text-align: center;
	line-height: 100px;
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
	
	$(".kabang_icon").on("click", function() {
		$("#loginForm").attr("action", "indvdlLogin");
		$("#loginForm").submit();
	});
	
	$(".kabang_black").on("click", function() {
		$("#loginForm").attr("action", "indvdlLogin");
		$("#loginForm").submit();
	});
	
	
	$("#loginForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$(".login_Btn").click();
			$(this).blur();
			return false;
		}
	});
	
	$(".login_Btn").on("click", function() {
		if(checkEmpty("#loginId")) {
			makeAlert("로그인 안내", "아이디를 입력해 주세요.", function() {
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
				url : "indvdlLoginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "cmbnInfo";
					} else if(result.res == "FAILED") {
						makeAlert("로그인 실패", "아이디나 비밀번호가 틀렸습니다.");
					} else {
						makeAlert("로그인 경고", "로그인 중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
			
		}
	}); // login_Btn END
	
		$("#sign").on("click", function() {
			$("#signForm").attr("action", "signUp");
			$("#signForm").submit();
		});
		
		$("#find_id").on("click", function() {
			$("#findIdForm").attr("action", "findId");
			$("#findIdForm").submit();
		});
		
		$("#find_pw").on("click", function() {
			$("#findPwForm").attr("action", "findPw");
			$("#findPwForm").submit();
		});
		
		$("#gdj").on("click", function() {
			makePopup({
				depth : 1,
				bg : true,
				width : 300,
				height : 200,
				title : "카카오뱅크 ERP 외부용",
				contents : "GDJ43의 팀 프로젝트입니다.",
				buttons : {
					name : "확인",
					func:function() {
						console.log("One!");
						closePopup();
					}
				}
			});
		});
	
		$("#center").on("click", function() {
			$("#centerForm").attr("action", "cmbnInfo");
			$("#centerForm").submit();
		});
		
}); // document.ready END

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}

}
</script>
</head>
<body>
	<div class="login_bg">
	<div class="kabang_wrap">
		<div class="login_logo">
			<div class="kabang_icon">
				<img alt="카뱅아이콘" src="resources/images/CS/icon_logo.png"/>
			</div>
			<div class="kabang_black">
				<img alt="카뱅로고" src="resources/images/CS/logo_black.svg"/>
			</div>
		</div>
		<div class="login_middle">
			<div class="login_area">
				<div class="input_id">
					<form action="#" id="loginForm" method="post">
						<input type="text" id="loginId" name="id" placeholder="아이디">
						<input type="password" id="loginPw" name="pw" placeholder="비밀번호">
					</form>
				</div>
				<div class="login_Btn">로그인</div>
			</div>
		</div>
		<div class="login_bottom">
			<form action="#" id="findIdForm" method="post">
				<div class="find" id="find_id">아이디 찾기</div>
			</form>
			<span class="txt_bar">|</span>
			<form action="#" id="findPwForm" method="post">
				<div class="find" id="find_pw">비밀번호 찾기</div>
			</form>
			<span class="txt_bar">|</span>
			<form action="#" id="signForm" method="post">
				<div class="find" id="sign">회원가입</div>
			</form>
		</div>
		<div class="login_foot">
			<div class="foot_text" id="gdj">GDJ43</div>
			<span class="txt_bar">|</span>
			<form action="#" id="centerForm" method="post">
				<div class="foot_text" id="center">고객센터</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>