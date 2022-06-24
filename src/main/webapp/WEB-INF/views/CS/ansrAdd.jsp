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
.popup_cont {
	text-align: center;
	line-height: 100px;
}

#ansr_File {
	display: none;
}

#att_textBox {
	display: none;
}

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
	height: 377px;
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

.inqry_info tbody td {
	height: 25px;
}

.inqry_info tbody td input {
	width: 200px;
	height: 20px;
	padding: 5px 10px;
	border: none;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

.inqry_info tbody td input:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

.inqry_info tr:nth-child(2) input, tr:nth-child(4) input {
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
}

.ansr_dtls_see_top .wrtng_title {
	display: inline-block;
	width: 750px;
	height: 40px;
	margin-left: 30px;
	margin-top: 10px;
}

.ansr_dtls_see_top .wrtng_title input {
	display: inline-block;
	width: 710px;
	height: 20px;
	padding: 5px 10px;
	border: 1px solid #d1d1d1;
	outline: none;
}

.cnsl_middle {
	width: 800px;
	height: 350px;
	margin-left: 30px;
	margin-top: 10px;
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
	font-size: 10pt;
	margin-left: 30px;
	margin-top: 25px;
}

#show_att {
	font-weight: bold;
}

.cnsl_bottom input[type="file"] {
	width: 200px;
	position: absolute;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
	background: none;
	border: 1px solid #999999ff;
	vertical-align: top;
}

#fileDelBtn {
	width: 100px;
	height: 26px;
	vertical-align: top;
	background-color: #747474;
	color: #f6f6f6;
	border: 1px solid #747474;
	border-radius: 2px;
	cursor: pointer;
	
}

.ansr_btn {
	float: right;
	margin-top: 25px;
	margin-right: 30px;
}

/* 대응가이드 팝업 */
#guide_table {
	margin-top: 70px;
	text-align: center;
}

#guide_wrap {
	width: 830px;
	text-align: left;
	line-height: 18px;
}
#guide_title_text{
	font-size: 12pt;
}
#guide_table thead tr{
	height : 23px;
	font-size: 8pt;
}
#guide_table tbody tr{
	height : 23px;
	font-size: 8pt;
}

#clnt_type {
	display: inline-block;
	height: 21px;
	width: 107px;
    margin-left: -4px;
} 

#type_case {
	display: inline-block;
	width: 100px;
}

#type_case_div {
	display: inline-block;
}

#type_case {
	display: inline;
}

#rspndAddBtn, #rspndUpBtn, #rspndCanBtn{
	float:right;
	margin-top: -51px;
    margin-bottom: 22px;
}

.add #rspndUpBtn, .add #rspndCanBtn{
	display: none;
}
.update #rspndAddBtn{
	display: none;
}

#rspns_plan{
	display: inline-block;
	vertical-align: top;
	resize: none;
	margin-bottom: 5px;
	white-space: pre-wrap;
	text-overflow: ellipsis;
}

.rspnd_top_row1 {
	height: 30px;
}

.rspndPopTxt{
	display: inline-block;
	vertical-align: top;
	font-weight: bold;
	background-color: #F2F2F2;
	width: 80px;
	height: 20px;
	text-align: center;
	border-radius: 2px;
}

#rspndActionForm input:focus {
	outline: 2px solid #F2CB05;
}
#rspndActionForm textarea:focus{
	outline: 2px solid #F2CB05;
}

#btn2Btn makePopup, #btn3Btn makePopup {
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
	
	$("#fileDelBtn").on("click", function() {
		$("#ansrAttName").remove();
		$("#show_att").remove();
		$(this).remove();
		$("#ansr_File").show();
		$("#att_textBox").show();
		
		$("#ansr_attFile").val("");
	});
	
	// 대응가이드 팝업
	$("#guide_btn").on("click", function() {
		var html = "";
		
		html += "<div class=\"cont_wrap\" id=\"guide_wrap\">";
		html += "	<div class=\"page_title_bar\">";
		html += "		<div class=\"page_title_text\" id=\"guide_title_text\">대응가이드(1:1문의)</div>";
		html += "	</div>";
		html += "	<div class=\"rspnd_cont_area\">";
		html += "		<form action=\"#\" id=\"rspndActionForm\" method=\"post\">";
		html += "			<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += "			<input type=\"hidden\" id=\"gbn\" name=\"gbn\"/>";
		html += "			<input type=\"hidden\" id=\"guide_num\" name=\"guide_num\"/>";
		html += "			<input type=\"hidden\" id=\"emp_num\" name=\"emp_num\" value=\"" + $("#emp_num").val() + "\"/>";
		html += "			<div class=\"rspnd_top_row1\">";
		html += "				<div class=\"rspndPopTxt\">고객유형</div>";
		html += "           		<select id=\"clnt_type\" name=\"clnt_type\">";
		html += "						<option value=\"일반\">일반</option>";
		html += "						<option value=\"폭언\">폭언</option>";
		html += "						<option value=\"성희롱\">성희롱</option>";
		html += "						<option value=\"허위 민원\">허위 민원</option>";
		html += "						<option value=\"반복적 민원\">반복적 민원</option>";
		html += "						<option value=\"노인/농아자\">노인/농아자</option>";
		html += "						<option value=\"기타\">기타</option>";
		html += "					</select>";
		html += "				<div class=\"rspndPopTxt\">대응방안</div><textarea rows=\"7\" cols=\"58\" id=\"rspns_plan\" name=\"rspns_plan\"></textarea>";
		html += "			</div>";
		html += "			<div class=\"rspndPopTxt\" id=\"type_case_div\">유형별 사례</div><input type=\"text\" id=\"type_case\" name=\"type_case\"/>";
		html += "			<div class=\"add\">";
		html += "				<div class=\"cmn_btn_mr\" id=\"rspndAddBtn\">등록</div>";
		html += "				<div class=\"cmn_btn_mr\" id=\"rspndCanBtn\">취소</div>";
		html += "				<div class=\"cmn_btn_mr\" id=\"rspndUpBtn\">수정</div>";
		html += "			</div>";
		html += "		</form>";
		html += "		<table class=\"board_table\" id=\"guide_table\">";
		html += "			<colgroup>";
		html += "				<col width=\"100\"/>";
		html += "				<col width=\"200\"/>";
		html += "				<col width=\"200\"/>";
		html += "				<col width=\"100\"/>";
		html += "			</colgroup>";
		html += "			<thead>";
		html += "				<tr>";
		html += "					<th>고객유형</th>";
		html += "					<th>유형별 사례</th>";
		html += "					<th>대응방안</th>";
		html += "					<th>수정/삭제</th>";
		html += "				</tr>";
		html += "			</thead>";
		html += "			<tbody id=\"guide_table_tbody\"></tbody>";
		html += "		</table>";
		html += "	</div>";
		html += "		<div class=\"board_bottom\">";
		html += "			<div class=\"pgn_area\" id=\"paging_wrap\"></div>";
		html += "		</div>";
		html += "</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			width: 850,
			height: 700,
			title : "대응가이드",
			contents : html,
			contentsEvent : function() {
				rspndRe();
				
				$("#paging_wrap").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					rspndRe();
				});
				
				// 대응가이드 등록
				$("#rspndAddBtn").on("click", function() {
					
					if(checkEmpty("#clnt_type")) {
						alert("고객유형을 입력해 주세요");
						$("#clnt_type").focus();
					} else if(checkEmpty("#type_case")) {
						alert("유형별 사례를 입력해 주세요");
						$("#type_case").focus();
					} else if(checkEmpty("#rspns_plan")) {
						alert("대응방안을 입력해 주세요");
						$("#rspnd_plan").focus();
					} else {
						
						var params = $("#rspndActionForm").serialize();
						
						$.ajax({
							type : "post",
							url : "inqryRspndListActionAjax/i",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									rspndRe();
								} else {
									alert("작성중 문제가 발생하였습니다.");
								}
	
							},
							error : function(request, status, error) {
								console.log(request.responseText);
	
							}
						}); // ajax end
					}
					$("#clnt_type").val("일반"); // 고객유형
					$("#rspns_plan").val(""); // 대응방안
					$("#type_case").val(""); // 유형별 사례
				});
				// 목록의 수정버튼
				$("#guide_table_tbody").on("click", "#uBtn", function() {
					// tr
					var tr = $(this).parent().parent();
					
					$("#guide_num").val(tr.attr("no"));
					// tr의 첫번째 자식의 내용을 취득
					$("#clnt_type").val(tr.children(":nth-child(1)").html());
					$("#type_case").val(tr.children(":nth-child(2)").html());
					$("#rspns_plan").val(tr.children(":nth-child(3)").html());
					
					// 작성 부분 버튼 변경
					$(".add").attr("class", "update");
				});
				// 수정영역 취소버튼
				$("#rspndActionForm").on("click", "#rspndCanBtn", function() {
					$("#guide_num").val("");
					$("#clnt_type").val("일반");
					$("#type_case").val("");
					$("#rspns_plan").val("");
					
					// 수정 부분 버튼 변경
					$(".update").attr("class", "add");
				});
				
				// 대응가이드 수정
				$("#rspndUpBtn").on("click", function() {
					
					if(checkEmpty("#clnt_type")) {
						alert("고객유형을 입력해 주세요");
						$("#clnt_type").focus();
					} else if(checkEmpty("#type_case")) {
						alert("유형별 사례를 입력해 주세요");
						$("#type_case").focus();
					} else if(checkEmpty("#rspns_plan")) {
						alert("대응방안을 입력해 주세요");
						$("#rspnd_plan").focus();
					} else {
						
						var params = $("#rspndActionForm").serialize();
						
						$.ajax({
							type : "post",
							url : "inqryRspndListActionAjax/u",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									rspndRe();
								} else {
									alert("작성중 문제가 발생하였습니다.");
								}
	
							},
							error : function(request, status, error) {
								console.log(request.responseText);
	
							}
						}); // ajax end
						
					}
					$("#clnt_type").val("일반"); // 고객유형
					$("#rspns_plan").val(""); // 대응방안
					$("#type_case").val(""); // 유형별 사례
					$(".update").attr("class", "add");
				});
				
				// 대응가이드 삭제버튼
				$("#guide_table_tbody").on("click", "#dBtn", function() {
					if(confirm("삭제하시겠습니까?")) {
						// tr
						var tr = $(this).parent().parent();
						
						$("#guide_num").val(tr.attr("no"));
						
						var params = $("#rspndActionForm").serialize();
						
						$.ajax({
							type : "post",
							url : "inqryRspndListActionAjax/d",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									rspndRe();
								} else {
									alert("작성중 문제가 발생하였습니다.");
								}
	
							},
							error : function(request, status, error) {
								console.log(request.responseText);
	
							}
						}); // ajax end
						
					}
					$("#clnt_type").val("일반"); // 고객유형
					$("#rspns_plan").val(""); // 대응방안
					$("#type_case").val(""); // 유형별 사례
				});
			},
			draggable : true,
			buttons : [{
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}]
		});
		
	});

	// 대응가이드 리로드
	function rspndRe() {
		var params = $("#rspndActionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "inqryRspndListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				drawRspndList(res.list);
				drawPaging(res.pb);
			},
			error : function(request, status, error) {
				console.log(request.responseText);

			}
			
		});
	}
	// 대응가이드 리스트
	function drawRspndList(list) {
		var html = "";
		
		for(var data of list) {
			html += "<tr no=\"" + data.GUIDE_NUM +"\">";
			html += "<td>" + data.CLNT_TYPE + "</td>";
			html += "<td>" + data.TYPE_CASE + "</td>";
			html += "<td>" + data.RSPNS_PLAN + "</td>";
			html += "<td>";
			html += "<input type=\"button\" value=\"수정\" id=\"uBtn\"/>";
			html += "<input type=\"button\" value=\"삭제\" id=\"dBtn\"/>";
			html += "</td>";
			html += "</tr>";
		}
		$("#guide_table_tbody").html(html);
	}
	// 페이지 리스트
	function drawPaging(pb) {
		var html = "";
		
		html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
		
		if($("#page").val() == "1") {
			html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
		}
		
		for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
			if($("#page").val() == i){
				html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
			} else {
				html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
			}
		}
		
		if($("#page").val() == pb.maxPcount) {
			html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
		}
		
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
		
		$("#paging_wrap").html(html);
	}
	
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "등록",
			contents : "게시글을 등록하시겠습니까?",
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
						var writeForm = $("#writeForm");
						
						writeForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#ansr_attFile").val(res.fileName[0]);
								}
								
								// 글 저장
								var params =  $("#writeForm").serialize();
						
								$.ajax({
									type : "post",
									url : "inqryActionAjax/insert",
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
						
						writeForm.submit(); // ajaxForm 실행
							closePopup();
						} // else end
				} // func:function end
					}, {
						name : "아니오"
					}]
		}); // makePopup end
	}); // btn2Btn end
	
	$("#btn3Btn").on("click", function() {
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
						closePopup();
					} else if(checkEmpty("#ansr_cont")) {
						alert("내용을 입력하세요.");
						$("#ansr_cont").focus();
						closePopup();
					} else {
						var writeForm = $("#writeForm");
						
						writeForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#ansr_attFile").val(res.fileName[0]);
								}
								
								// 글 수정
								var params =  $("#writeForm").serialize();
						
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
						
						writeForm.submit(); // ajaxForm 실행
							closePopup();
						} // else end
				}
					}, {
						name : "아니오"
					}]
		}); // makePopup end
	}); // btn3Btn end
	
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
		<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NAME}" />
		<input type="hidden" id="ctgry_name" name="ctgry_name" value="${data.CTGRY_NAME}" />
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
										<input type="text" id="att" name="att" readonly="readonly" value="${data.ATT_FILE}" >
										<input type="hidden" id="attFile" name="attFile" readonly="readonly" >
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
						<form action="fileUploadAjax" id="writeForm" method="post"
							  enctype="multipart/form-data">
							<input type="hidden" name="no" value="${param.no}" />
							<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}" />
							<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NAME}" />
							<input type="hidden" id="ctgry_name" name="ctgry_name" value="${data.CTGRY_NAME}" />
							<input type="hidden" id="top" name="top" value="${param.top}"/>
							<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
							<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
							<c:choose>
								<c:when test="${empty data.ANSR_TITLE}">
									<div class="ansr_title">
										<div class="wrtng_title">
											<input type="text" placeholder="제목" id="ansr_title" name="ansr_title"/>
										</div>
									</div> <!-- ansr_title end-->
									<div class="cnsl_middle">
										<textarea class="ansr_cont" id="ansr_cont" name="ansr_cont" rows="15" cols="110" placeholder="내용을 입력하세요."></textarea>
									</div>
									<div class="cnsl_bottom">
										<div class="file_atch">
											<input type="file" name="ansr_file" />
											<input type="text" id="ansr_att" name="ansr_att" readonly="readonly"/>
											<input type="hidden" id="ansr_attFile" name="ansr_attFile"/>
										</div>
										<div class="ansr_btn">
											<div class="cmn_btn_mr" id="guide_btn">대응가이드</div>
											<div class="cmn_btn_mr" id="btn2Btn">답변등록</div>
											<div class="cmn_btn_mr" id="cancelBtn">취소</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="ansr_title">
										<div class="wrtng_title">
											<input type="text" placeholder="제목" id="ansr_title" name="ansr_title" value="${data.ANSR_TITLE}"/>
										</div>
									</div> <!-- ansr_title end-->
									<div class="cnsl_middle">
										<textarea class="ansr_cont" id="ansr_cont" name="ansr_cont" rows="15" cols="110" placeholder="내용을 입력하세요.">${data.ANSR_CONT}</textarea>
									</div>
									<div class="cnsl_bottom">
											<div class="file_atch">
											<c:choose>
											 	<c:when test="${!empty data.ANSR_ATT_FILE}">
													<span id="show_att">첨부파일 :   </span>
													<c:set var="fileLength" value="${fn:length(data.ANSR_ATT_FILE)}"></c:set>
													<c:set var="fileName" value="${fn:substring(data.ANSR_ATT_FILE, 20, fileLength)}"></c:set>
													<span id="ansrAttName">${fileName}</span>
													<input type="button" value="첨부파일 삭제" id="fileDelBtn" />
													<input type="hidden" id="ansr_attFile" name="ansr_attFile" value="${data.ANSR_ATT_FILE}" />
													<input type="file" id="ansr_File" name="ansr_File" />
													<input type="text" id="att_textBox" name="att_textBox" readonly="readonly" />
												</c:when>
												<c:otherwise>
													<input type="file" name="ansr_file" />
													<input type="text" id="att_textBox2" name="att_textBox" readonly="readonly"/>
													<input type="hidden" id="ansr_attFile" name="ansr_attFile"/>
												</c:otherwise>
											</c:choose>
											</div>
										<div class="ansr_btn">
											<div class="cmn_btn_mr" id="guide_btn">대응가이드</div>
											<div class="cmn_btn_mr" id="btn3Btn">수정완료</div>
											<div class="cmn_btn_mr" id="cancelBtn">취소</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
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