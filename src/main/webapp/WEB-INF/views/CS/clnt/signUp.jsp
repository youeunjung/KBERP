<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<c:import url="/cHeader"></c:import>
<style type="text/css">

.main{
    text-align: center;
	margin-top: 20px;
}

html, body {
    margin: 0;
    padding: 0;
    font-size: 12px;
    height: 100%;
    font-family: '맑은 고딕';
    min-width: 1400px;
    overflow-x: auto;
    overflow-y: auto;
}

body {
	display: flex;
}

.login_bg {
	width: 100%;
	height: 100%;
}

.kabang_wrap {
    min-height: 100%;
    margin: 0 auto;
    background: #fff;
    text-align: center;
}

.kabang_icon {
	display: inline-block;
}

.kabang_icon img {
	display: block;
	margin: 0 auto;
	width: 50px;
	height: 50px;
	
}

.kabang_black{
	display: inline-block;
}

.kabang_black img {
	display: block;
	margin: 0 auto;
	width: 160px;
	height: 50px;
	margin-left: 5px;
}

.signup_wrap {
	margin-top: 35px;
}
/*input 아이디박스*/
.login_id_wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 아이디 form*/
#input_id{
    border: none;
    outline:none;
    width:100%;
}
/*input 패스워드박스*/
.login_pw_wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 패스워드 form*/
#input_pw{
    border: none;
    outline:none;
    width:100%;
}
/*로그인버튼박스*/
.login_btn_wrap{
    height: 52px;
    line-height: 55px;
    margin: 0px 10px 8px 10px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #03c75a;
    color: #fff;
    cursor: pointer;
}
/*로그인버튼*/
#login_btn{
    width:100px;
    background-color: #03c75a;
    border: none;
    color:#fff;
    font-size: 18px;
    outline:none;
    cursor: pointer;
}
/*로그인 아래 박스*/
.under_login{
    height: 50px;
    border-bottom: 1px solid gainsboro;
    margin: 0px 10px 35px 10px;
}
/*회원가입*/
.sign_up{
    margin: 3px;
    font-size: 14px;
}
/*저작권 표시X*/
footer{
    display: none;
}


/*저작권 표시*/
footer{
    display:block;
}

/*회원가입 부분*/
.main_signup{
    text-align: center;
    width: 460px;
    margin: auto;
}
h3{
    margin:19px 0px 8px;
    text-align: left;
    font-size: 14px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

.terms_choice {
    font-size: 12px;
    font-weight: 400;
    color: #8e8e8e;
    margin-left: 5px;
}

.signup_input {
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
.signup_input input {
    height: 29px;
    border: none;
    outline:none;
    width:100%;
}

.pw_lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}
.cpw_lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}
#signup_name, #signup_phone, #signup_cnum{
    width:100%;
    height: 29px;
    border: none;
    outline:none;
}
/*회원가입버튼박스*/
.signup_btn_wrap{
    height: 52px;
    line-height: 55px;
    margin: 10px 0px 50px 0px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #F2B705;
    color: #000;
    font-size: 12pt;
    font-weight: bold;
    cursor: pointer;
}

.bg{
	position:absolute;
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	background-color: #ACACAC;
	z-index: 50;
	opacity: 0.6;/* opacity : 투명도 */
}

.popup_cont {
	text-align: center;
	line-height: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#sign_Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "회원가입",
			contents : "회원가입 하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					if(checkEmpty("#signup_id")) {
						alert("아이디를 입력하세요.");
						$("#signup_id").focus();
					} else if(checkEmpty("#signup_pw")) {
						alert("비밀번호를 입력하세요.");
						$("#signup_pw").focus();
					} else if(checkEmpty("#signup_cpw")) {
						alert("비밀번호 재확인을 입력하세요.");
						$("#signup_cpw").focus();
					} else if($("#signup_pw").val() != $("#signup_cpw").val()) {
						alert("비밀번호가 일치하지 않습니다."); 
						$("#signup_cpw").focus();
					} else if(checkEmpty("#signup_name")) {
						alert("이름을 입력하세요.");
						$("#signup_name").focus();
					} else if(checkEmpty("#phone_num1")) {
						alert("휴대전화를 입력하세요.");
						$("#phone_num1").focus();
					} else {
						var params= $("#signUpForm").serialize();
						
						$.ajax({
							type: "post", // 전송형태
							url : "signUpActionAjax/i" , //통신 주소
							dataType : "json", //받을 데이터 형태
							data : params, //보낼 데이터. 보낼 것이 없으면 안씀
							success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
								
								if(res.res=="success"){
									if(res.chc=="falied"){
										alert("아이디가 중복되었습니다");
									}else{
									location.href = "indvdlLogin";
									}
								}else{
									alert("작성중 문제가 발생하였습니다");
								}
							},
							error: function(request, status, error){ // 문제 발생 시 실행 함수
								console.log(request.responseText); //결과텍스트. 스프링 실행 결과
							}
						});
					} // else end
				
					closePopup();
						
				} // func:function end
			}, {
				name : "아니오"
			}]
		}); // makePopup end
	}); // btn2Btn end
	
}); // document ready end

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
    <div class="main_signup">
    	<div class="kabang_wrap">
        <!--웹페이지 상단-->
        <header>
            <!--NAVER LOGO-->
            <div class="signUp_logo">
				<div class="kabang_icon">
					<img alt="카뱅아이콘" src="resources/images/CS/icon_logo.png" />
				</div>
				<div class="kabang_black">
					<img alt="카뱅로고" src="resources/images/CS/logo_black.svg" />
				</div>
			</div>
        </header>

        <!--회원가입 부분-->
        <form action="signUp" id="signUpForm" method="post">
	        <section class="signup_wrap">
	
	            <div>
	                <!--아이디,비번,비번재확인-->
	
	                <h3>아이디</h3>
	                <span class="signup_input">
	                    <input type="text" id="signup_id" name="signup_id" />
	                </span>
	
	                <h3>비밀번호</h3>
	                <span class="signup_input">
	                    <input type="password" id="signup_pw" name="signup_pw" />
	                    <span class="pw_lock"></span>
	                </span>
	
	                <h3>비밀번호 재확인</h3>
	                <span class="signup_input">
	                    <input type="password" id="signup_cpw" name="signup_cpw" />
	                    <span class="cpw_lock"></span>
	                </span>
	
	            </div>
	
	            <div>
	                <!--이름,생년월일,성별,이메일-->
	                <h3>이름</h3>
	                <span class="signup_input">
	                    <input type="text" id="signup_name" name="signup_name" />
	                </span>
	            </div>
	
	            <div>
	                <!--휴대전화-->
	                <h3>휴대전화</h3>
	                <div>
	                    <span class="signup_input">
	                        <input type="text" id="phone_num1" name="phone_num1" placeholder="전화번호 입력" />
	                    </span>
	                </div>
	            </div>
				
				<div>
	                <!--주소-->
	                <h3>주소<span class="terms_choice">(선택)</span></h3>
	                <div>
	                    <span class="signup_input">
	                        <input type="text" id="adrs" name="adrs"/>
	                    </span>
	                    <span class="signup_input">
	                        <input type="text" class="txt" placeholder="상세주소" id="dtlAdrs" name="dtlAdrs"/>
	                    </span>
	                </div>
	           	</div>
				
	            <div>
	                <!--가입하기-->
	                <div class="signup_btn_wrap" id="sign_Btn">회원가입</div>
	            </div>
	        </section>
		</form>
        <!--저작권 정보-->
        <footer>
            <div class="copyright_wrap">
                <div>GDJ43 Team Project</div>
            </div>
        </footer>
		</div>
    </div>
</body>
</html>