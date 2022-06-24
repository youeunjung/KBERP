<!-- 
	제안 수정 : sales2Update
 -->
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	LocalDateTime version = LocalDateTime.now() ;	
	request.setAttribute("version", version);		//캐시 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안 수정</title>
<!-- popup css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/common_sales.css?version=${version}" />
<!-- popup javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}

/***** 담당자 팝업 *****/
/* 팝업 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
	margin: -10px 0px 0px -10px;
}

.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}

.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}

.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}

.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}

.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}

.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 240px;
	height: 70px;
}

.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 240px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}

.text_size {
	width: 230px;
	height: 19px;
	outline: none;
}

.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}

.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}

.ptm_right_bot {
	width: 94px;
	height: 32px;
	margin-top: 5px;
	text-align: center;
}
/* 팝업 내용 */
.popup_cc_box_left {
	display: inline-block;
	vertical-align: top;
	width: 120px;
	height: 50px;
}

.popup_cc_box_right {
	display: inline-block;
	width: 300px;
	height: 50px;
	font-size: 14px;
	line-height: 50px;
}

.popup_box_in {
	width: calc(100% - 4px);
	height: 50px;
	border: 2px solid #d7d7d7;
	border-radius: 3px;
	background-color: #F2F2F2;
	margin-bottom: 5px;
}

.popup_box_in:hover {
	cursor: pointer;
	border: 2px solid #2E83F2;
}

.company {
	display: inline-block;
	width: 25px;
	height: 25px;
	margin-top: 13px;
	margin-left: 45px;
}

.boldname {
	margin-left: 30px;
	font-weight: bold;
}

.mg_wid {
	margin-left: 50px;
}
/* 팝업 내용 배경색 */
.pc_back {
	background-color: #fff;
}

/* 팝업 페이징 */
.board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding: 5px 0px;
	margin-top: -20px;
}
/* 팝업 끝 */

.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}

.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 40px auto;
}

/* 개인 작업 영역 */
table {
	border: 1px;
	width: 927px;
	margin: 40px auto;
}

td:nth-child(2), td:nth-child(4) {
	border-bottom: 1px solid #d7d7d7;
}

tr:nth-child(9) td:nth-child(3) {
	padding: 0;
}

.btn {
	width: 90px;
	height: 40px;
}

.address {
	width: 90px;
	height: 100px;
}

.btn, .address {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}

.btnImg:hover {
	cursor: pointer;
}

.txt {
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}

.btnImg {
	width: 30px;
	float: right;
	margin-left: 10px;
}

.rmks {
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
	background-color: #F2F2F2;
}

.imgPos {
	text-align: right;
}

.title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-top: 100px;
	margin-bottom: 30px;
}

.box_in {
	width: 885px;
	height: 80px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	background-color: #F2F2F2;
}

.plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}

.drop_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}

.up_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}

.plus_btn:hover, .drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}

.rmks {
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
	background-color: #F2F2F2;
}
/* 의견, 히스토리 */
.mgtop {
	margin-top: 50px;
}

hr { /* 구분선 */
	margin-bottom: 10px;
}

.bot_title {
	font-size: 11pt;
}

.bx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}

.OpinionBox {
	width: 830px;
	height: 70px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}

.name {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 20px;
}

.txtOp, .dt, .del {
	padding-left: 20px;
}

.dt {
	padding-right: 590px;
}

.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}

.del:hover {
	cursor: pointer;
	color: #F2CB05;
}

.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}

textarea {
	width: 757px;
	height: 52px;
	font-size: 10.5pt;
	white-space: pre-wrap;
	resize: none;
	font-family: "맑은 고딕";
	display: inline-block;
	vertical-align: top;
	outline: none;
}

.subm {
	margin-left: 14px;
	width: 35px;
	height: 56px;
	line-height: 56px;
}

.drop_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}

.drop_btn:hover {
	cursor: pointer;
}
/* 영업관리 속성들 */
.page_cont_title_text {
	display: inline-block;
	vertical-align: top;
	width: 400px;
	height: 30px;
	line-height: 30px;
	color: #2E83F2;
	font-size: 12pt;
	font-weight: bold;
	text-shadow: 0px 0 1px #7b7b7b;
	margin: 5px 40px;
}

.hr_width {
	width: 900px;
	margin: 10px 40px;
	border: none;
	height: 0.2px;
	background-color: #333;
	opacity: 0.5;
}

.adc_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 45px;
	margin-bottom: 5px;
	vertical-align: middle;
}

.spc {
	margin-bottom: 30px;
}

.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 45px;
	font-size: 12pt;
}

.btnImg_in {
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	cursor: pointer;
	margin-right: 5px;
}

.mdhr {
	margin-bottom: 10px;
	float: right;
}

.drop_btn2 {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 15px 15px;
	float: right;
	margin-top: 15px;
	margin-right: 5px;
}

.hr_bot {
	margin-bottom: 20px;
}

.mng_txt {
	width: 680px;
}

#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
}
.salesCont {
	width: 927px;
	height: 1138px;
}
[href] {
	color: black;
	text-decoration: none;
}
.popup_cont2 {
	/* 내용 변경용 */
	font-size: 12pt;
	font-weight: bold;
	text-align: center;
	line-height: 100px;
}
.popup_cont3 {
	/* 내용 변경용 */
	font-size: 12pt;
    font-weight: bold;
    text-align: center;
    height: 40px;
    line-height: 50px;
    padding-top: 10px;
}
.popup_cont4 {
	/* 내용 변경용 */
	font-size: 12pt;
    font-weight: bold;
    text-align: center;
    height: 40px;
    line-height: 40px;
    padding-bottom: 10px;
}
/* 끝 */
</style>
<script type="text/javascript">
$(document).ready(function() {
	console.log($("#attFile").val());
	// 목록 버튼
	$("#listBtn").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont3\">작성중인 내용이 저장되지 않습니다.</div>";
		html += "<div class=\"popup_cont4\">나가시겠습니까?</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "알림",
			contents : html,
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func : function() {
					$("#backForm").attr("action", "sales2SgstnCont");
					$("#backForm").submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			} ]
		});
	});
	
	// 첨부파일
	$(".att_btn").on("click", function() {
		$("#att").click();
	});
	
	$("#fileDelete").on("click", function() {
		$("#file_name").remove();
		$(this).remove();
		
		var html = "";
		
		html += "<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
		
		$("#uploadBtn").html(html);
	});
	
	$(".adc_txt").on("click", ".aff_btn", function() {
		$("#att").click();
	});
	
	// 저장 버튼
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#sgstnLoanScale")) {
			makeAlert("필수 항목 알림", popContOneLine("대출 규모를 입력하세요."), function() {
				$("#sgstnLoanScale").focus();
			});
		} else if(isNaN($("#sgstnLoanScale").val())) {
			makeAlert("알림", popContOneLine("대출 규모는 숫자만 입력 가능합니다."), function() {
				$("#sgstnLoanScale").val("");
				$("#sgstnLoanScale").focus();
			});
		} else if($("#sgstnloanTime").val() > $("#sgstnRdmptnTime").val()) {
			makeAlert("알림", popContOneLine("상환 시기는 대출 시기보다 빠를 수 없습니다."), function() {
				$("#sgstnRdmptnTime").focus();
			});
		} else if(checkEmpty("#sgstnTotalAmnt")) {
			makeAlert("필수 항목 알림", popContOneLine("자산 총액을 입력하세요."), function() {
				$("#sgstnTotalAmnt").focus();
			});
		} else if(isNaN($("#sgstnTotalAmnt").val())) {
			makeAlert("알림", popContOneLine("자산 총액은 숫자만 입력 가능합니다."), function() {
				$("#sgstnTotalAmnt").val("");
				$("#sgstnTotalAmnt").focus();
			});
		} else if(checkEmpty("#sgstnDebtAmnt")) {
			makeAlert("필수 항목 알림", popContOneLine("부채액을 입력하세요."), function() {
				$("#sgstnDebtAmnt").focus();
			});
		} else if(isNaN($("#sgstnDebtAmnt").val())) {
			makeAlert("알림", popContOneLine("부채액은 숫자만 입력 가능합니다."), function() {
				$("#sgstnDebtAmnt").val("");
				$("#sgstnDebtAmnt").focus();
			});
		} else if(isNaN($("#sgstnAvgRvnAmnt").val())) {
			makeAlert("알림", popContOneLine("평균 매출액은 숫자만 입력 가능합니다."), function() {
				$("#sgstnAvgRvnAmnt").val("");
				$("#sgstnAvgRvnAmnt").focus();
			});
		} else if(isNaN($("#sgstnEmpCount").val())) {
			makeAlert("알림", popContOneLine("사원 수는 숫자만 입력 가능합니다."), function() {
				$("#sgstnEmpCount").val("");
				$("#sgstnEmpCount").focus();
			});
		} else if(checkEmpty("#dtlCont")) {
			makeAlert("필수 항목 알림", popContOneLine("상세내용을 입력하세요."), function() {
				$("#dtlCont").focus();
			});
		} else {
			

			var html = "";
			
			html += "<div class=\"popup_cont2\">저장하시겠습니까?</div>";
			
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : html,
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "확인",
					func : function() {
						/* 여기에 넣기 */
						var updateForm = $("#updateForm");

						updateForm
								.ajaxForm({
									success : function(res) {
										// 물리파일명 보관
										if (res.fileName.length > 0) {
											$("#attFile").val(res.fileName[0]);
										}

										// 글 수정
										var params = $("#updateForm").serialize();

										$.ajax({
											type : "post",
											url : "salesMng2ActionAjax/update",
											dataType : "json",
											data : params,
											success : function(res) {
												if (res.res == "success") {
													$("#backForm").attr("action", "sales2SgstnCont");
													$("#backForm").submit();
												} else {
													makeAlert("알림", popContOneLine("수정중 문제가 발생하였습니다."));
												}
											},
											error : function(request, status, error) {
												console.log(request.responseText);
											}
										});
									},
									error : function(req) {
										console.log(req.responseText);
									}
								}); // ajaxForm end

								updateForm.submit();
								console.log("One!");
								closePopup();
					}
				}, {
					name : "닫기"
				}]
			}); // makePopup end
		}
	}); // saveBtn end

	
	// 선택박스 초기값
	$("#loanCauseNum").val(${data.LOAN_CAUSE_NUM}).prop("selected", true);
	$("#loanHopeType").val(${data.LOAN_HOPE_TYPE}).prop("selected", true);
	$("#loanHopeTime").val(${data.LOAN_HOPE_TIME}).prop("selected", true);
	$("#expctdBsnsType").val(${data.EXPCTD_BSNS_TYPE}).prop("selected", true);
	
	$("#sgstnloanCauseNum").val(${data2.SGSTN_LOAN_CAUSE_NUM}).prop("selected", true);
	$("#sgstnloanType").val(${data2.SGSTN_LOAN_TYPE}).prop("selected", true);
		
	$("#sgstnLoanScale").attr("value", rmComma($("#sgstnLoanScale").val()));
	$("#sgstnTotalAmnt").attr('value', rmComma($("#sgstnTotalAmnt").val()));
	$("#sgstnDebtAmnt").attr('value', rmComma($("#sgstnDebtAmnt").val()));
	$("#sgstnAvgRvnAmnt").attr('value', rmComma($("#sgstnAvgRvnAmnt").val()));
	$("#sgstnEmpCount").attr('value', rmComma($("#sgstnEmpCount").val()));
	
	// 담당자 조회 버튼
	$("#userIcon").on("click", function() {
 		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form id=\"popupForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
		html +=						"<option value=\"6\">영업부</option>";
		html +=						"<option value=\"7\">영업1팀</option>";
		html +=						"<option value=\"8\">영업2팀</option>";
		html +=					"</select>";
		html +=				"</div>";		
		html +=				"<div class=\"ptm_mid_bot\">";
		html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
		html +=						"<option value=\"0\">사원번호</option>";
		html +=						"<option value=\"1\">사원명</option>";
		html +=					"</select>";
		html +=				"</div>";	
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid_right\">";
		html +=				"<div class=\"ptm_mid_right_top\"></div>";
		html +=				"<div class=\"ptm_mid_right_bot\">";
		html +=					"<input type=\"text\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn\" id=\"mngrBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\" id=\"mngrBox\"></div>";
		html +=	"</div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\" id=\"mngrpb\"></div>";
		html +=		"</div>"; 
		
		makePopup({
			depth : 1,
			bg : true,
			width : 600,
			height : 500,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				mngrList();
				
				// 담당자 조회 값 가져오기
				$(".popup_box").on("click", ".popup_box_in", function() {
					var mngrNm = $(this).children("#mngrNm").val();
					var mngrN = $(this).children("#mngrN").val();
					
					document.getElementById("mngrName").value = mngrNm;
					document.getElementById("empNum").value = mngrN;
					
					closePopup();
				});
				
				//페이징 
				$("#mngrpb").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					mngrList();
				});
				// 검색버튼
				$("#mngrBtn").on("click", function () {
					$("#page").val("1");
					
					mngrList();
					
				});
				
				$("#searchTxt").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#page").val("1");
						
						mngrList();
						return false;
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
	});
	
	$(".salesCont").hide();
	
	$("#sales_btn").on("click", "#salesContBtn_h", function() {
		$(".salesCont").hide();
		html = "<div class=\"up_btn\" id=\"salesContBtn_s\"></div>";
		$("#sales_btn").html(html);
	});
	
	$("#sales_btn").on("click", "#salesContBtn_s", function() {
		$(".salesCont").show();
		html = "<div class=\"drop_btn\" id=\"salesContBtn_h\"></div>";
		$("#sales_btn").html(html);
	});
	
	
});


/* 담당자 조회 팝업 */
function mngrList() {
	var params = $("#popupForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngrListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			mngrDrawList(res.list);
			drawPaging(res.pb, "#mngrpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}
function mngrDrawList(list) {
	var html = "";
		
	for(var data of list) {
		
		html +=	"<div class=\"popup_box_in\">";
		html += "<input type=\"hidden\" id=\"mngrNm\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mngrN\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	 data.EMP_NUM + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";	
	}
	
	$("#mngrBox").html(html);
	
}

function drawPaging(pb, sel) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
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
	
	$(sel).html(html);
}

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}

function rmComma(str) {

	n = parseInt(str.replace(/,/g,""));

	return n;

}

</script>
</head>
<body>
	<form action="#" id="backForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" id="salesNum" name="salesNum" value="${data.SALES_NUM}" />
		<input type="hidden" name="prgrsStage1" value="${param.prgrsStage1}" />
		<input type="hidden" name="prgrsStage2" value="${param.prgrsStage2}" />
		<input type="hidden" name="mngName" value="${param.mngName}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" name="listSort" value="${param.listSort}" />
		<!-- 영업번호 -->
	</form>
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
			<div class="page_title_text">영업관리 - 제안 수정</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" /> <img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
					<!-- 시작 -->
					<!-- ********** 영업기회 시작 ********** -->
				<form action="fileUploadAjax" id="updateForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" name="top" value="${param.top}" />
						<input type="hidden" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" name="menuType" value="${param.menuType}" />
						<input type="hidden" id="salesNum" name="salesNum" value="${data.SALES_NUM}" /> <!-- 영업번호 -->
						<div class="bot_title">
							<h3>영업기회<span id="sales_btn"><div class="up_btn" id="salesContBtn_s"></div></span></h3>
						</div>
						<div class="salesCont">
						<div class="page_cont_title_text">기본정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="영업명*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${data.LEAD_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${data.CLNT_CMPNY_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${data.CLNT_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사 등급" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${data.GRADE_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="영업시작일*" />
									</td>
									<td colspan="3">
										<input type="date" class="txt" readonly="readonly" value="${data.START_DATE}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="담당자 *" readonly="readonly" />
									</td>
									<td colspan="3" value="${data.MNGR_EMP_NUM}">
										<input type="text" class="txt mng_txt" id="mngrName" name="mngrName" readonly="readonly" value="${data.EMP_NAME}" />
										<input type="hidden" id="empNum" name="empNum" value="${data.MNGR_EMP_NUM}" />
										<img class="btnImg_in" id="userIcon" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">대출 상세정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="대출 원인*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanCauseNum" name="loanCauseNum" disabled="disabled">
											<option value="0">사업확장</option>
											<option value="1">제품개발</option>
											<option value="2">토지매매</option>
											<option value="3">기타</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예상 대출 규모" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctnLoanScale" name="expctnLoanScale" value="${data.EXPCTN_LOAN_SCALE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeType" name="loanHopeType" disabled="disabled">
											<option value="0">장기대출</option>
											<option value="1">단기대출</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 시기*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeTime" name="loanHopeTime" disabled="disabled">
											<option value="0">근시일 내</option>
											<option value="1">3개월 이후</option>
											<option value="2">6개월 이후</option>
											<option value="3">1년 이후</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">예정 사업 상세정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예정 사업명" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctdBsnsName" name="expctdBsnsName" value="${data.EXPCTD_BSNS_NAME}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예정 사업 형태" />
									</td>
									<td colspan="3">
										<select class="txt" id="expctdBsnsType" name="expctdBsnsType" value="${data.EXPCTD_BSNS_TYPE}" disabled="disabled">
											<option value="0">민수 사업</option>
											<option value="1">관공 사업</option>
											<option value="2">기타</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmks" name="rmks" value="${data.RMKS}" readonly="readonly" />
									</td>
								</tr>
							</tbody>
						</table>
						<br />
						<!-- 첨부자료  -->
						<c:set var="salesFileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
						<c:set var="salesFileName" value="${fn:substring(data.ATT_FILE_NAME, 20, salesFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부자료
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${salesFileName}">${salesFileName}</a>
							</div> 
						</div>
					</div>
						<!-- ********** 영업기회 끝 ********** -->
						<hr class="hr_bot" color="#4B94F2" width="925px">
						<!-- *************** 제안 부분 시작 **************** -->
						<div class="bot_title">
							<h3>제안</h3>
						</div>
						<div class="page_cont_title_text">대출 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="대출 원인*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum">
											<optgroup>
												<option value="0">사업확장</option>
												<option value="1">제품개발</option>
												<option value="2">토지매매</option>
												<option value="3">기타</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 규모*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" value="${data2.SGSTN_LOAN_SCALE}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType">
											<option value="0">장기 대출</option>
											<option value="1">단기 대출</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" value="${data2.SGSTN_LOAN_TIME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" value="${data2.SGSTN_RDMPTN_TIME}" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">고객사 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="자산 총액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" value="${data2.SGSTN_TOTAL_AMNT}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" value="${data2.SGSTN_DEBT_AMNT}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" value="${data2.SGSTN_AVG_RVN_AMNT}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" value="${data2.SGSTN_EMP_COUNT}" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">상세정보</div>
						<hr class="hr_width">
						<table class="detail_info_table">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상세내용*" />
									</td>
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont">${data2.DTL_CONT}</textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" value="${data2.RMRKS}" />
									</td>
								</tr>
								<tr height="10"></tr>
							</tbody>
						</table>
						<!-- 첨부자료  -->
						<c:set var="sgstnFileLength" value="${fn:length(data2.ATT_FILE_NAME)}"></c:set>
						<c:set var="sgstnFileName" value="${fn:substring(data2.ATT_FILE_NAME, 20, sgstnFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt"> 첨부자료
								<span id="uploadBtn">
									<c:if test="${empty data2.ATT_FILE_NAME}">
										<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" />
									</c:if>
								</span>
							</div>
							<div class="cntrct_box_in">
							<span id="file_name">${sgstnFileName}</span>
								<c:if test="${!empty data2.ATT_FILE_NAME}">
									<input type="button" id="fileDelete" value="삭제" />
								</c:if>
									<input type="text" id="fileName" readonly="readonly" />
							</div>
						<input type=file id="att" name="att" onchange="uploadName(this)" />
						<input type="hidden" id="attFile" name="attFile" value="${data2.ATT_FILE_NAME}" />
						</div>
						<!-- ********** 제안 끝 ********** -->
					</form>
					<!-- 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>