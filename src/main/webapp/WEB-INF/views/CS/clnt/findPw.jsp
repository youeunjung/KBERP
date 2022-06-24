<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
    padding-top: 310px;
    margin-bottom: 30px;
}

.kabang_icon {
	display: inline-block;
}

.kabang_icon img {
	display: block;
	margin: 0 auto;
	width: 30px;
	height: 30px;
	
}

.kabang_black{
	display: inline-block;
}

.kabang_black img {
	display: block;
	margin: 0 auto;
	width: 100px;
	height: 30px;
	margin-left: 5px;
}

#findHead {
	display: inline-block;
	padding-top: 250px;
}

.findPwLogo {
    display: block;
    width: 210px;
    height: 40px;
    margin: 0px auto; 
    background: url(https://t1.daumcdn.net/id/member/2014/img_logo_find_140905.gif) no-repeat 0 0;
    background-size: 210px;
    background-position: 0 -40px;
}

.login_area {
	max-width: 420px;
    padding-top: 40px;
    margin: 0 auto;
}

.input_id input {
	display: block;
    width: 413px;
    height: 42px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 10px;
    margin-top: 10px;
    font-size: 12pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
}

.input_id input::placeholder {
	color: #BDBDBD;
}

.country_code select {
	display: inline-block;
    width: 120px;
    height: 46px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 10px;
    padding: 0px;
    margin-top: 10px;
    font-size: 10pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
    text-align: left;
}

.country_code select option {
	height: 30px;
}

#phone_num1 {
    width: 289px;
	display: inline-block;
}

.find_Btn {
	display: block;
    width: 420px;
    height: 50px;
    border: 1px solid #F2B705;
    border-radius: 2px;
    background-color: #F2B705;
    line-height: 55px;
    font-size: 11pt;
    font-weight: bold;
    margin-top: 15px;
    cursor: pointer;
    -ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

/* 비밀번호 찾기 팝업 */
.findpw {
	text-align: center;
}

.pw_textBox {
	width: 400px;
   	line-height: 30px;
    margin-bottom: 10px;
}

#random_Pw {
	color: #2E83F2;
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
	
	$("#findpwForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$(".find_Btn").click();
			$(this).blur();
			return false;
		}
	});
	
	$(".find_Btn").on("click", function() {
		
		if(checkEmpty("#id")) {
			alert("아이디를 입력해주세요");
				$("#id").focus();
		} else if(checkEmpty("#name")) {
			alert("이름을 입력해주세요");
			$("#name").focus();
		} else if(checkEmpty("#phone_num1")) {
			alert("핸드폰 번호를 입력해주세요");
			$("#phone_num1").focus();
		} else if($("#phone_num1").val().includes("-")) {
			alert("- (하이픈)을 제외하고 입력해주세요.");
			$("#phone_num1").focus();
		} else if($("#phone_num1").val().length!=11) {
			alert("핸드폰 번호 11자리를 입력해주세요");
			$("#phone_num1").val("");
			$("#phone_num1").focus();
	 	} else {
			var html ="";
			
			html += "<div class=\"findpw\">";
			html += "	<div class=\"pw_textBox\">회원님의 임시 비밀번호를 발급해드립니다.</div>";
			html += "	<div class=\"pw_textBox\">로그인 후 비밀번호를 변경해주세요.</div>";
			html += "	<table class=\"board_table\" id=\"guide_table\">";
			html += "		<thead>";
			html += "			<tr>";
			html += "				<th>임시 비밀번호</th>";
			html += "			</tr>";
			html += "		</thead>";
			html += "<tbody>";
			html += "			<tr>";
			html += "				<td id=\"random_Pw\"></td>";
			html += "			</tr>";
			html += "</tbody>";
			html += "		</table>";
			html += "</div>";
	 		
			makePopup({
				depth : 1,
				bg : true,
				width : 400,
				height : 250,
				contents:html,
				title:"비밀번호 찾기",
				contentsEvent:function(){
					
					var params= $("#findpwForm").serialize();
					
					$.ajax({
						type: "post", // 전송형태
						url : "findPwAjax" , //통신 주소
						dataType : "json", //받을 데이터 형태
						data : params, //보낼 데이터. 보낼 것이 없으면 안씀
						success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
						//받아온 데이터중의 list를 그리겠다.
						if(res.res=="failed"){
							users();
						}
						else{
							console.log(res);
							drawList(res.list);
						}
							
						},
						error: function(request, status, error){ // 문제 발생 시 실행 함수
							console.log(request.responseText); //결과텍스트. 스프링 실행 결과
						}
					});
					
				},
				buttons : {
					name : "닫기",
					func:function() {
						console.log("One!");
						closePopup();
					}
				}
			});
			
		}
	}); // find_Btn END
	
	function drawList(list){
		var html ="";
		
		var ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
		var ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
		var ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
		var ranValue4 = ['!','@','#','$','%','&','*'];
		
		var temp_pw = "";
		
		for(i=0 ; i<3; i++) {
			var ranPick1 = Math.floor(Math.random() * ranValue1.length);
			var ranPick2 = Math.floor(Math.random() * ranValue2.length);
			var ranPick3 = Math.floor(Math.random() * ranValue3.length);
			var ranPick4 = Math.floor(Math.random() * ranValue4.length);
			temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
		}
		
		var pw = temp_pw;
		// of: list 하나씩 꺼내오는 for문
		for(var data of list){
			html += "<form action=\"#\" id=\"mdfyForm\" method=\"post\">";
			html += "	<input type=\"hidden\" id=\"clnt_num\" name=\"clnt_num\" value=\""+ data.CLNT_NUM + "\">";
			html += "	<input type=\"hidden\" id=\"pw\" name=\"pw\" value=\""+ pw + "\">";
			html += pw;
			html += "</form>";
		}
		console.log(html);
		$("#random_Pw").html(html);
		
		var params= $("#mdfyForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "signUpActionAjax/m",
			dataType : "json",
			data : params,
			success : function(res) {
				if(res.res == "success") {
				} else {
					alert("작성중 문제가 발생하였습니다.");
				}

			},
			error : function(request, status, error) {
				console.log(request.responseText);

			}
		}); // ajax end
	}
	
	function users(){
		var html="";
			html+="회원정보가 없습니다";
			$(".popup_cont").css("text-align","center");
			$(".popup_cont").css("line-height","150px");
		$(".popup_cont").html(html);
	} 
	
		
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
		<div class="login_middle">
			<div id="findHead">
	            <div class="findPwLogo"></div>
		    </div>
		    <form action="#" id="findpwForm" method="post">
			<div class="login_area">
				<div class="input_id">
					<input type="text" id="id" name="id" placeholder="아이디">
					<input type="text" id="name" name="name" placeholder="이름">
					<div class="country_code">
						<select id="internationalCode" name="internationalCode" title="국가코드" class="country_sel" >
							<option value="" selected disabled hidden>+82</option>
					  	 	<option value="82">대한민국 +82</option>
						</select>
							<input type="text" id="phone_num1" name="phone_num1" placeholder="핸드폰번호">
					</div>
				</div>
				<div class="find_Btn">비밀번호 찾기</div>
			</div>
			</form>
		</div>
		<div class="login_logo">
			<div class="kabang_icon">
				<img alt="카뱅아이콘" src="resources/images/CS/icon_logo.png" />
			</div>
			<div class="kabang_black">
				<img alt="카뱅로고" src="resources/images/CS/logo_black.svg" />
			</div>
		</div>
	</div>
</div>
</body>
</html>