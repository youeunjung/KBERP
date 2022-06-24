<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객센터 > 이벤트 > 진행중 이벤트 수정 페이지</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/CS/content.css" />
<link rel="stylesheet" type="text/css" href="resources/css/CS/event.css" />

<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.popup_bg {
	/* 숨김용 */
	/* display: none; */
	display: none;
}
.popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 600px;
	height: 400px;
	top: calc(50% - 200px); /* 높이 반  */
	left: calc(50% - 300px); /* 너비 반 */
	display: none;
}

.popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
}
/* 개인 작업 영역 */

p {
	text-align: left;
	font-size: 20px;
	
}

#subject_line{

	margin-top: 5px;
	margin-bottom: 5px;
}

#title{
	
	width:800px;
	height:35px;
	font-size: 20px;
	
}

#emp_num {
	font-size: 20px;
}

#content_line{
	
	margin-top: 5px;
	margin-bottom: 5px;
}

#btn_file{

	width: 300px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;

	padding-bottom: -5px;
	
	margin-top: 10px;

}
		
.eventAdd_btn {
	float: right;
	margin-top: 15px;
	margin-right: 80px;
}

#cont{

	width:850px;
	height: 500px;
	font-size: 20px;
	
}

#emp_line {
	margin-top: 5px;
	margin-bottom: 5px;

}
</style>
<script type="text/javascript">

$(document).ready(function() {
	CKEDITOR.replace("cont", {
		// 옵션
		resize_enabled : false, // 크기변경
		language : "ko", // 언어
		enterMode : 2, // 엔터 <br/>처리
		width : "800", // 가로
		height : "250" // 세로
	});
	
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "수정",
			contents : "게시글을 수정하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					$("#cont").val(CKEDITOR.instances['cont'].getData());
					if(checkEmpty("#title")) {
						alert("제목을 입력하세요.");
						$("#title").focus();
					}   else if (checkEmpty("#cont")) {
						alert("내용을 입력하세요.");
						$("#cont").focus();
					} else {
						var updateForm = $("#updateForm");
						
						updateForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#event_attFile").val(res.fileName[0]);
								}
								
								// 글 수정
								var params =  $("#updateForm").serialize();
						
								$.ajax({
									type : "post",
									url : "eventAction/update",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#backForm").submit();
										} else {
											alert("작성중 문제가 발생하였습니다.");
										}
									}, // success end
									error : function(request, status, error) {
										console.log(request.responseText);
									} // error end
								}); // ajax end
							}, // success end
							error : function(req) {
								console.log(req.responseText);
							} // error end
						});// ajaxForm end
						
						updateForm.submit(); // ajaxForm 실행
							closePopup();
						} // else end
				}
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

<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<form action="event" id="backForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="top" name="top" value="${param.top}"/>
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
	</form>
	
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">진행중 이벤트 수정</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="container">
				<form action="fileUploadAjax" id="updateForm" method="post"
							  enctype="multipart/form-data">
							<input type="hidden" name="no" value="${param.no}" />
							<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}" />
							<!--<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NAME}" />-->
							<input type="hidden" id="top" name="top" value="${param.top}"/>
							<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
							<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
				<p id="emp_line">작성자</p>
				<input type="text" id="emp_name" value="${sEmpName}">
				<p id="subject_line">제목</p>
				<input type="text" name="title" id="title" value="${data.EVENT_TITLE}">
				<p id="content_line">글내용</p>
				<textarea name="cont" id="cont">${data.EVENT_CONT}</textarea>
				<!-- <div class="add_file">
						<input type="file" name="event_file" />
						<input type="text" id="event_att" name="event_att" readonly="readonly"/>
						<input type="hidden" id="event_attFile" name="event_attFile"/>
				</div> -->
				<!--<div><input type="file" value="첨부파일" id="btn_file"></div>-->
				<div class="eventAdd_btn">
					<div class="cmn_btn_mr" id="updateBtn">수정</div>
					<div class="cmn_btn_mr" id="cancelBtn">취소</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>