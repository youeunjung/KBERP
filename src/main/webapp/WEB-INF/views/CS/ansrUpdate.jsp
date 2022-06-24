<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERD 답변등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cmn_btn_mr, .open_cnsl_btn, .see_cnsl_header,
.open_ansr_btn, .see_ansr_header {
	/* 마우스 드래그 금지 */
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.cont_area {
	display: inline-block;
	margin-left: 30px;
	margin-top: 10px;
}

.see_cnsl {
	display: inline-block;
	width: 800px;
	height: 415px;
}

.open_cnsl_head {
	display: inline-block;
	width: 800px;
	height: 35px;
	background-color: #F2CB05;
	box-shadow: 0px 1px 2px 0px #999;
	margin-bottom: 2px;
}

.open_cnsl_btn {
	display: inline-block;
	width: 40px;
	height: 30px;
	line-height: 24px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2CB05;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
	margin-top: 3px;
}

.see_cnsl_header {
	display: inline-block;
	vertical-align: top;
	font-size: 12pt;
	font-weight: bold;
	color: #000;
	width: 50px;
	line-height: 35px;
}

.see_cnsl_title_icon {
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 20pt;
}

.see_cnsl_title {
	width: 750px;
	height: 30px;
	display: inline-block;
	line-height: 30px;
}

.see_cnsl_title input {
	width: 700px;
	height: 28px;
	border: none;
	background: none;
	outline: none;
	font-size: 11pt;
	font-weight: bold;

}

.see_cnsl_cont {
	display: inline-block;
	width: 750px;
	height: 120px;
	vertical-align: top;
	line-height: 25px;
	text-indent: 50px;
}

.see_cnsl_cont textarea {
	border: none;
	background: none;
	outline: none;
	font-size: 10pt;
}

.ansr_dtls_see {
	display: inline-block;
}

.ansr_dtls_see_top {
	display: inline-block;
	width: 800px;
}

.open_ansr_head {
	display: inline-block;
	width: 800px;
	height: 35px;
	box-shadow: 0px 1px 1px 0px #999;
	background-color: #F2CB05;
	vertical-align: top;
}

.open_ansr_btn {
	display: inline-block;
	width: 40px;
	height: 30px;
	line-height: 24px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2CB05;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
	margin-top: 3px;
}

.see_ansr_header {
	display: inline-block;
	vertical-align: top;
	font-size: 12pt;
	font-weight: bold;
	color: #000;
	width: 50px;
	line-height: 35px;
}

.cnsl_cont {
	display: none;
	width: 800px;
	font-size: 10.5pt;
	background-color: #FAFAFA;
}

.inqry_info {
	text-indent: 25px;
}

.inqry_info th {
	text-align: left;
	width: 100px;
	height: 50px;
}

.es_text {
	display: inline;
	line-height: 50px;
    font-size: 10pt;
    text-shadow: none;
    text-indent: 645px;
}

.th_star {
	display: inline-block;
	color: #2E83F2;
	margin-left: -30px;
}

.th_star_input {
	display: inline;
	color: #999;
	font-weight: normal;
}

tbody td {
	height: 25px;
}

tbody td input {
	width: 200px;
	height: 20px;
	padding: 5px 10px;
	border: none;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

tbody td input:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

tr:nth-child(2) input, tr:nth-child(4) input {
	width: 606px;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

.wrtng_cont {
	resize: none;
	font-family: 맑은고딕;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
	padding: 10px 10px;
}

.open_ansr_cont {
	width: 800px;
	height: 480px;
	background-color: #FAFAFA;
}


.ansr_title {
	display: inline-block;
	width: 800px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}

.ansr_dtls_see_top .wrtng_title {
	display: inline-block;
	width: 750px;
	height: 40px;
	margin-left: 20px;
	margin-top: 10px;
}

.ansr_dtls_see_top .wrtng_title input {
	display: inline-block;
	width: 725px;
	height: 25px;
	border: 1px solid #d1d1d1;
	outline: none;
}

.cnsl_middle {
	width: 800px;
	height: 350px;
	margin-left: 20px;
}

.wrtng_cont {
	display: inline-block;
	resize: none;
	font-family: 고딕;
}

.cnsl_bottom .file_atch {
	width: 400px;
	height: 50px;
	display: inline-block;
	position: relative;
	margin-left: 20px;
}

.cnsl_bottom input[type="file"] {
	width: 200px;
	margin-top: 25px;
	position: absolute;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
	background: none;
	border: 1px solid #999999ff;
	vertical-align: top;
	margin-top: 25px;
}

.ansr_btn {
	float: right;
	margin-top: 20px;
	margin-right: 37px;
}

.popup_cont {
	text-align: center;
	line-height: 100px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("ansr_cont", {
		// 옵션
		resize_enabled : false, // 크기변경
		language : "ko", // 언어
		enterMode : 2, // 엔터 <br/>처리
		width : "730", // 가로
		height : "250" // 세로
	});
	
	$(".open_cnsl_btn").on("click", function() {
		
		$(".cnsl_cont").slideToggle(300);
		  
	});
	
	$(".open_ansr_btn").on("click", function() {
		
		$(".open_ansr_cont").slideToggle(300);
		  
	});
	
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width : 500,
			height : 600,
			title : "대응가이드",
			contents : "",
			buttons : {
				name : "확인",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "수정",
			contents : "게시글을 수정하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					$("#ansr_cont").val(CKEDITOR.instances['ansr_cont'].getData());
					if(checkEmpty("#ansr_title")) {
						alert("제목을 입력하세요.");
						$("#ansr_title").focus();
					} else if(checkEmpty("#ansr_cont")) {
						alert("내용을 입력하세요.");
						$("#ansr_cont").focus();
					} else {
						var updateForm = $("#updateForm");
						
						updateForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#ansr_attFile").val(res.fileName[0]);
								}
								
								// 글 수정
								var params =  $("#updateForm").serialize();
						
								$.ajax({
									type : "post",
									url : "inqryActionAjax/update",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#backForm").submit();
										} else {
											alert("수정중 문제가 발생하였습니다.");
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
	
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
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
	<form action="inqry" id="backForm" method="post">
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
			<span class="page_title_text">1:1 문의</span>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cnsl_dtls_see">
				<div class="see_cnsl">
					<div class="open_cnsl_head">
						<div class="open_cnsl_btn">+</div>
						<div class="see_cnsl_header">상담글</div>
					</div>
					<div class="cnsl_cont">
						<table class="inqry_info">
							<tbody>
								<tr>
									<th scope="row">이름
										<span class="th_star">*</span>
									</th>
									<td>
										<input type="text" id="clnt_name" name="clnt_name" readonly="readonly" value="${data.CLNT_NAME}">
									</td>
								</tr>
								<tr>
									<th scope="row">문의 제목
										<span class="th_star">*</span>
									</th>
									<td>
										<input type="text" name="wrtng_title" readonly="readonly" value="${data.WRTNG_TITLE}">
									</td>
								</tr>
								<tr>
									<th scope="row">문의 내용
										<span class="th_star">*</span>
									</th>
									<td>
										<textarea class="wrtng_cont" name="wrtng_cont" rows="10" cols="95" readonly="readonly">${data.WRTNG_CONT}</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<input type="text" id="att" name="att" readonly="readonly" >
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="ansr_dtls_see">
				<div class="ansr_dtls_see_top">
					<div class="open_ansr_head">
						<div class="open_ansr_btn">+</div>
						<div class="see_ansr_header">답변글</div>
					</div>
					<div class="open_ansr_cont">
						<form action="fileUploadAjax" id="updateForm" method="post"
							  enctype="multipart/form-data">
							<input type="hidden" name="no" value="${param.no}" />
							<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}" />
							<input type="hidden" id="top" name="top" value="${param.top}"/>
							<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
							<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
							<div class="ansr_title">
								<div class="wrtng_title">
									<input type="text" placeholder="제목" id="ansr_title" name="ansr_title" value="${data.ANSR_TITLE}"/>
								</div>
							<div class="cnsl_middle">
								<textarea class="ansr_cont" id="ansr_cont" name="ansr_cont" rows="15" cols="110" placeholder="내용을 입력하세요.">${data.ANSR_CONT}</textarea>
							</div>
							<div class="cnsl_bottom">
								<div class="file_atch">
									<input type="file" name="ansr_file" />
									<input type="text" id="ansr_att" name="ansr_att" readonly="readonly"/>
									<input type="hidden" id="ansr_attFile" name="ansr_attFile"/>
								</div>
								<div class="ansr_btn">
									<div class="cmn_btn_mr" id="btn1Btn">대응가이드</div>
									<div class="cmn_btn_mr" id="btn2Btn">수정</div>
									<div class="cmn_btn_mr" id="cancelBtn">취소</div>
								</div>
							</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>