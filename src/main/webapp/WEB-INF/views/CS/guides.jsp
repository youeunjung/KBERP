<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.save_cont{
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 110px;
}

.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.mh{      
	margin-right:5px;
}
.cont{
	overflow: auto;
	width: 898px;
	height: 500px;
	border: 1px solid #F0F0F0;
	font-size: 15px;
	margin-bottom: 5px;
}
.inf_title{
	display: inline-block;
	width: 250px;
	height: 30px;
	text-align: center;
	border : 0.1px solid;
	border-bottom: 0px;
	border-color:#F0F0F0;
	font-size: 2pt;
	background-color: white;
	line-height: 30px;
	font-size: 13pt;
	}
.inf_wrtr{
	display: inline-block;
	width: 150px;
	height: 30px;
	text-align: center;
	border : 0.1px solid;
	border-bottom: 0px;
	border-color:#F0F0F0;
	float: right;
	font-size: 2pt;
	background-color: white;
	line-height: 30px;
	font-size: 11pt;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action","guideWrtng");
		$("#actionForm").submit();
	});
	
	$("#listBtn2").on("click", function() {
		$("#actionForm").attr("action","strgBox");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action","guideWrtngUpdate")
		$("#actionForm").submit();
	});
	
	$("#strgBtn").on("click", function() {
		var html = "";
		
		html += "<div class=\"save_cont\">복원 하시겠습니까?</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "복원",
			contents : html,
			buttons : [{
				name : "복원",
				func:function() {
					var params= $("#actionForm").serialize();
					
					$.ajax({
						type: "post", // 전송형태
						url : "guidesActionAjax/strg" , //통신 주소
						dataType : "json", //받을 데이터 형태
						data : params, //보낼 데이터. 보낼 것이 없으면 안씀
						success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res=="success"){
								$("#backForm").attr("action","strgBox");
								$("#backForm").submit();
							}else{
								alert("복원중 문제가 발생하였습니다");
							}
						},
						error: function(request, status, error){ // 문제 발생 시 실행 함수
							console.log(request.responseText); //결과텍스트. 스프링 실행 결과
						}
					});
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$("#deleteBtn").on("click", function() {
		var html = "";
		
		html += "<div class=\"save_cont\">삭제 하시겠습니까?</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "삭제",
			contents : html,
			buttons : [{
				name : "삭제",
				func:function() {
					var params= $("#actionForm").serialize();
					
					$.ajax({
						type: "post", // 전송형태
						url : "guidesActionAjax/delete" , //통신 주소
						dataType : "json", //받을 데이터 형태
						data : params, //보낼 데이터. 보낼 것이 없으면 안씀
						success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res=="success"){
								$("#backForm").attr("action","guideWrtng");
								$("#backForm").submit();
							}else{
								alert("삭제중 문제가 발생하였습니다");
							}
						},
						error: function(request, status, error){ // 문제 발생 시 실행 함수
							console.log(request.responseText); //결과텍스트. 스프링 실행 결과
						}
					});
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
});
</script>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">안내글</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<div class="inf_title">${data.CMBN_TITLE}</div>
		<div class="inf_wrtr">${data.EMP_NAME}</div>
		<br/>
		<div class="cont">${data.CMBN_CONT}</div>
		<div class="board_bottom">
		
<c:choose>
	<c:when test="${data.DEL_CHECK eq 1}">
	<div class="cmn_btn_ml" id="listBtn">목록</div>
	<div class="cmn_btn_ml" id="updateBtn">수정</div>
	<div class="cmn_btn_ml" id="deleteBtn">삭제</div>
	</c:when>
	
	<c:otherwise>
	<div class="cmn_btn_ml" id="listBtn2">목록</div>
		<div class="cmn_btn_ml" id="strgBtn">복원</div>
	</c:otherwise>
</c:choose>
			</div>
		</div>
	</div>
	
	<form action="#" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="no" name="no" value="${param.no} "/>
		<input type="hidden" id="page" name="page" value="${param.page}"/>
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	</form>
	
	<form action="#" id="backForm" method="post">
         <input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="no" name="no"/>
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
    </form>
    
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>