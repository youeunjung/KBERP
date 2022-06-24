<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
    padding-top: 366px;
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

.findIdLogo {
    display: block;
    width: 200px;
    height: 40px;
    margin: 0px auto; 
    background: url(https://t1.daumcdn.net/id/member/2014/img_logo_find_140905.gif) no-repeat 0 0;
    background-size: 210px;
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

thead{
text-align: center;
font-size: 2pt;
font-weight: strong;
}

.user{
font-size: 10pt;
}

.popup_cont{
text-align
line-height 
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
	
	
	$("#name,#phone_num1").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$(".find_Btn").click();
				
			return false;
		}
	});
	
	
	$(".find_Btn").on("click", function() {
		


		if($("#name").val()=="") {
			alert("이름을 입력해주세요");
			$("#name").focus();
			}
		 else if($("#phone_num1").val()=="") {
			alert("핸드폰 번호를 입력해주세요");
			$("#phone_num1").focus();
			}
		 else if($("#phone_num1").val().includes("-")) {
				alert("- (하이픈)을 제외하고 입력해주세요.");
				$("#phone_num1").focus();
		 }
		 else if($("#phone_num1").val().length!=11) {
				alert("핸드폰 번호 11자리를 입력해주세요");
				$("#phone_num1").val("");
				$("#phone_num1").focus();
		 }
		 else {
			var html=""
			
			html+="<table class=\"board_table\">";
			html+="<thead>";
			html+="<tr>";
			html+="<td>이름</td>";
			html+="<td>아이디</td>";
			html+="</tr>";
			html+="</thead>";
			html+="<tbody></tbody>";
			html+="</table>";
			makePopup({
				depth : 1,
				bg : true,
				width : 400,
				height : 200,
				title:"아이디 찾기",
				contents:html,
				contentsEvent:function(){
					var params= $("#findidForm").serialize();
					
					$.ajax({
						type: "post", // 전송형태
						url : "findIdAjax" , //통신 주소
						dataType : "json", //받을 데이터 형태
						data : params, //보낼 데이터. 보낼 것이 없으면 안씀
						success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
						//받아온 데이터중의 list를 그리겠다.
						if(res.res=="failed"){
							users();
						}
						else{
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
	
		
		
}); // document.ready END


//아이디 불러오기
function drawList(list){
	var html ="";
	
	// of: list 하나씩 꺼내오는 for문
	for(var data of list){
		html+="<tr>";
		html+="<td>"+data.CLNT_NAME+"</td>";
		html+="<td>"+data.ID+"</td>";
		html+="</tr>";
	}
	$("tbody").html(html);
}

//회원정보 없을시
function users(){
	var html="";
		html+="회원정보가 없습니다";
		$(".popup_cont").css("text-align","center");
		$(".popup_cont").css("line-height","100px");
	$(".popup_cont").html(html);
}
</script>
</head>
<body>
<div class="login_bg">
	<div class="kabang_wrap">
		<div class="login_middle">
			<div id="findHead">
	            <div class="findIdLogo"></div>
		    </div>
		    <form action="#" id="findidForm" method="post">
			<div class="login_area">
				<div class="input_id">
					<input type="text" name="name" id="name" placeholder="이름">
					<div class="country_code">
						<select id="internationalCode" name="internationalCode" title="국가코드" class="country_sel" >
							<option value="" selected disabled hidden>+82</option>
					  	 	<option value="82">대한민국 +82</option>
						</select>
							<input type="text" id="phone_num1" name="phone_num1"placeholder="핸드폰번호">
					</div>
				</div>
				<div class="find_Btn">아이디 찾기</div>
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