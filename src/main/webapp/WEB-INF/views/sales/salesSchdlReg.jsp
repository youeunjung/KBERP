<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	LocalDateTime version = LocalDateTime.now();
	request.setAttribute("version", version);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 일정</title>
<!-- popup css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/common_sales.css?version=${version}" />
<!-- popup javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}" /></script>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */
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
table{
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(n+2) {
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3), td:nth-child(4){
	text-align: center;
}
td:nth-child(3) {
	border : none;
}
.btn{
	width : 90px;
	height: 40px;
}
.address{
	width : 90px;
	height: 100px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}
.txt_in:hover, .btnImg:hover{
	cursor: pointer;
}
.txt{
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
.txt:hover{
	cursor : pointer;
}
.sales_txt, .lead_txt{
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
	background-image: url(resources/images/sales/popup.png);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: right;
}
.sales_txt:hover, .lead_txt:hover{
	cursor : pointer;
}
input {
	font-size: 10.5px;
}
.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
}
.btnImg_in{
	position: absolute;
	left: 691px;
    top: 4px;
    width: 25px;
    cursor: pointer;
}

.imgName {
	padding-right: 30px;
}
.imgPos{
	width: 613px;
	display: inline-block;
	vertical-align: top;
	text-align: right;
}
.imgP{
	position: relative;
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

.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.plus_btn:hover, .drop_btn:hover {
	cursor: pointer;
}
.txt_in {
	width: 100%;
	border: none;
	outline: none;
}
.date_sign {
	text-align: center;
}
/* 활동시간 입력칸 */
.num_in {
	width: 130px;
	outline: none;
	border: none;
}
.ta_box {
 width: 718px;
 height: 80px;
 border: none;
 outline: none;
 background-color: #f2f2f2;
 resize: none;
 margin: 5px 0px;
}
.jo_box {
 width: 718px;
 height: 40px;
 border: none;
 outline: none;
 background-color: #f2f2f2;
 resize: none;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
}
.plus_btn:hover, .up_btn:hover {
	cursor: pointer;
}
/* 날짜 입력칸 */
.date_box {
	width: 100%;
	height: 33px;
	font-size: 10.5px;
	border: none;
	outline: none;
}
/* 물결용 */
.wave {
	display: inline-block;
	vertical-align: top;
	width: 15px;
	height: 15px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 20px;
	line-height: 15px;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.rvn_txt {
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
	margin-left: 40px;
	margin-bottom: 5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}

#att {
	display : none;
}
/* 팝업 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
    height: 70px;
    margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
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
	width: 200px;
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
.popup_sales_box{
   display: inline-block;
   margin-top : 8px;
   width: 558px;
   height: 50px;
   margin-left : 10px;
}
.popup_lead_box{
   display: inline-block;
   width: 558px;
   height: 50px;
   margin-left : 10px;
}

.prgrs {
	font-weight : bold;
	color : #2E83F2;
	margin-left : 15px;
}
.popup_box_in {
   width: calc(100% - 4px);
   height: 55px;
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
   background-size: 25px 25px;
   background-repeat: no-repeat;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	font-weight: bold;
	margin-left : 15px;
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
}
/* 첨부파일 */
#fileName {
	border : hidden;
	outline : none;
}
/*----- 팝업 CSS 끝 ----- */
</style>
<script type="text/javascript">
$(document).ready(function() {

	console.log("${param.dt}");
	
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	
	/* 목록 이동 이벤트 */
	$("#listBtn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : false,
			title : "알림",
			contents : popContTwoLine("내용이 저장되지 않았습니다.<br/>페이지를 나가시겠습니까?"),
			contentsEvent : function() {
				
			},
			buttons : [{
				name : "확인",
				func:function() {
					$("#backForm").submit();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	/* 첨부자료 플러스 버튼 눌렀을 때 */
	$(".aff_btn").on("click", function() {
		$("#att").click();
	});
	
	/* 저장 이동 및 알림 이벤트 */
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#ssname")){
			makeAlert("필수 정보 입력", popContTwoLine("일정명을 입력하세요.<br/>나가시겠습니까?"), function() {
				$("#ssname").focus();			
			});
		} else if($("#ssactvtyclsfy").val() == 9){
			makeAlert("필수 정보 입력", popContTwoLine("활동분류를 입력하세요.<br/>나가시겠습니까?"), function() {
				$("#ssactvtyclsfy").focus();			
			});
		} else if(checkEmpty("#sdt")){
			makeAlert("필수 정보 입력", popContTwoLine("시작일을 입력하세요.<br/>나가시겠습니까?"), function() {
				$("#sdt").focus();				
			});
		} else if(checkEmpty("#ssactvtycont")){
			makeAlert("필수 정보 입력", popContTwoLine("활동내용을 입력하세요.<br/>나가시겠습니까?"), function() {
				$("#ssactvtycont").focus();			
			});
		} else {
			makePopup({
				bg : false,
				bgClose : false,
				title : "저장",
				contents : popContOneLine("저장하시겠습니까?"),
				contentsEvent : function() {
					$("#popup").draggable();
				},
				draggable : true,
				width : 400,
				height: 180,
				buttons : [{
					name : "확인",
					func:function(){
						
						var RegForm = $("#RegForm");
						
						RegForm.ajaxForm({
							success: function(res) {
								if(res.fileName.length > 0) {
									$("#schdlAttFile").val(res.fileName[0]);
								}
								
								var params = $("#RegForm").serialize();
								
								$.ajax({
									type  : "post",
									url : "salesSchdlAction/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success"){
											$("#schdlnum").val(res.schdlnum);
											savePop();								
										} else {
											makeAlert("알림", popContTwoLine("등록 중 문제가 발생하였습니다.<br/>나가시겠습니까?"));
										}
									},
									error : function(request, status, error) {
										console.log(request.responseTxt);
									}
								});
							},
							error : function(req) {
								console.log(req.responseTxt);
							}
						});
						
						RegForm.submit();
						}
						}, {
							name : "취소"
						}]
				});
						
		}
		
	});
	


/* 비어있는지 확인하기 위한 함수 */
function checkEmpty(sel) {
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
	}
}


function savePop() {
	var html = "";
	
	html += "<div class=\"popup_cont\">저장되었습니다</div>";
	
	makePopup({
		bg : false,
		bgClose : false,
		title : "저장",
		draggable : true,
		contents : html,
		width : 400,
		height : 180,
		buttons : [{
			name : "확인",
			func:function() {
				$("#actionForm").submit();
			}
		}]
	});
}


/* 영업관리 팝업 */
 $("#salesPop").on("click", function() {
	 var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form id=\"popupSalesForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">담당자</div>";		
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
		html +=					"<div class=\"cmn_btn\" id=\"salesBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\" id=\"salesBox\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\"></div>";
		html +=		"</div>"; 
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "영업 조회",
			contents : html,
			contentsEvent : function() {
				salesList();
				//페이징 
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					salesList();
				});
				// 검색버튼
				$("#salesBtn").on("click", function () {
					$("#page").val("1");
					
					salesList();
					
				});
				
				$("#searchTxt").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#page").val("1");
						
						salesList();
						return false;
					}
				});
				
				
				$("#salesBox").on("click", ".popup_sales_box ", function() {
					//변수에 값 넣어줌
					var snm = $(this).children("#snm").val();
					var sna = $(this).children("#sna").val();
					var ccnm = $(this).children("#ccnm").val();
					var clnm = $(this).children("#clnm").val();
					
					// 본문에 해당하는 아이디에 값 넣어줌
					$("#sNum").attr("value", snm);
					$("#sName").attr("value", sna);
					$("#ccName").attr("value", ccnm);
					$("#clName").attr("value", clnm);
					
					if($("#lName").val() != ""){ // 리드명이 비워져있지 않을때, 리드 선택했을 경우 동시 입력 방지
						$("#lName").val("");
					}
					
					closePopup();
				});					
				
			},
			width : 600,
			height : 500,
			buttons : [ {
				name : "취소"
			}]
		});
	}); 
	/* 영업 조회 팝업 목록 함수 */
	function salesList() {
		var params = $("#popupSalesForm").serialize();
		
		$.ajax({
			type : "post",
			url : "salesPopAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				salesDrawList(res.salesList);
				drawPaging(res.salesPb);
			},
			error : function(req) {
				console.log(req.responseText);
			}
		});
	}
	
	function salesDrawList(salesList) {
		var html = "";
		
		for(var data of salesList){
			
			html +=	"<div class=\"popup_box_in\">";
			html +=	"<div class=\"popup_sales_box\">";
			html += "<input type=\"hidden\" id=\"snm\" value=\"" + data.SALES_NUM + "\" />";
			html += "<input type=\"hidden\" id=\"sna\" value=\"" + data.LEAD_NAME + "\" />";
			html += "<input type=\"hidden\" id=\"ccnm\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
			html += "<input type=\"hidden\" id=\"clnm\" value=\"" + data.CLNT_NAME + "\" />";
			html +=	"<span class=\"boldname\">영업 : " + data.LEAD_NAME + "</span><span class=\"boldname\">담당자 : " + data.EMP_NAME + "</span><span class=\"prgrs\">진행단계 :" +  data.PRGRS_STS + "</span><br/>"; 
			html += "<span class=\"boldname\">고객사 : " + data.CLNT_CMPNY_NAME + "</span>";
			html +=	"</div>";
			html +=	"</div>";
		}
		
		$("#salesBox").html(html);
	}
	function drawPaging(salesPb) { 
		var html = "";
		
		html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
		if($("#page").val() == "1") {
			html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
		}
		
		for(var i = salesPb.startPcount; i <= salesPb.endPcount; i++) {
			if($("#page").val() == i) {
				html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
			} else {
				html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
			}
		}
		
		if($("#page").val() == salesPb.maxPcount) {
			html += "<div page=\"" + salesPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
		}
		html += "<div page=\"" + salesPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
		
		$(".pgn_area").html(html);
	}
	


/* 리드 팝업  */
 $("#leadPop").on("click", function() {
	 var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form id=\"popupLeadForm\">";
	 	html += 		"<input type=\"hidden\" id=\"lpage\" name=\"lpage\" value=\"1\" />";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">담당자</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"prgrS\" name=\"prgrS\">"
		html +=						"<option value=\"1\">진행중</option>";
		html +=						"<option value=\"2\">종료(영업기회전환)</option>";
		html +=						"<option value=\"3\">종료(영업기회실패)</option>";
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
		html +=					"<div class=\"cmn_btn\" id=\"leadBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\" id=\"leadBox\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\"></div>";
		html +=		"</div>"; 
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "리드 조회",
			contents : html,
			contentsEvent : function() {
				leadList();
				//페이징 
				$(".pgn_area").on("click", "div", function() {
					$("#lpage").val($(this).attr("lpage"));
					
					leadList();
				});
				// 검색버튼
				$("#leadBtn").on("click", function () {
					$("#lpage").val("1");
					
					leadList();
					
				});
				
				$("#searchTxt").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#lpage").val("1");
						
						leadList();
						return false;
					}
				});
				
				$("#leadBox").on("click", ".popup_lead_box ", function() {
					// 변수에 값 가져와서 넣어줌
					var lnm = $(this).children("#lnm").val();
					var lna = $(this).children("#lna").val();
					var ccnm = $(this).children("#ccnm").val();
					var clnm = $(this).children("#clnm").val();
					
					// 본문에 해당 아이디와 일치하는 곳에 값 넣어줌
					$("#lNum").attr("value", lnm);
					$("#lName").attr("value", lna);
					$("#ccName").attr("value", ccnm);
					$("#clName").attr("value", clnm);
					
					if($("#sName").val() != ""){ // 영업명이 비워져있지 않을때, 영업 선택했을 경우 동시 입력 방지
						$("#sName").val("");
					}
					
					closePopup();
				});
			},
			width : 600,
			height : 500,
			buttons : [ {
				name : "취소"
			}]
		});
			
	}); 
	/* 영업 조회 팝업 목록 함수 */
	function leadList() {
		var params = $("#popupLeadForm").serialize();
		
		$.ajax({
			type : "post",
			url : "leadPopAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				leadDrawList(res.leadList);
				drawlPaging(res.pb);
			},
			error : function(req) {
				console.log(req.responseText);
			}
		});
	}
	
	function leadDrawList(leadList) {
		var html = "";
		
		for(var data of leadList){
			
			html +=	"<div class=\"popup_box_in\">";
			html +=	"<div class=\"popup_lead_box\">";
			html += "<input type=\"hidden\" id=\"lnm\" value=\"" + data.LEAD_NUM + "\" />";
			html += "<input type=\"hidden\" id=\"lna\" value=\"" + data.LEAD_NAME + "\" />";
			html += "<input type=\"hidden\" id=\"ccnm\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
			html += "<input type=\"hidden\" id=\"clnm\" value=\"" + data.CLNT_NAME + "\" />";
			html +=	"<span class=\"boldname\">리드명 : " + data.LEAD_NAME + "</span><span class=\"prgrs\">진행단계 :" +  data.PRGRS_STS_NUM + "</span><br/>"; 
			html += "<span class=\"boldname\">고객사 / 고객 : " + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME  + "</span><br/>";
			html += "<span class=\"boldname\">담당자 : " + data.EMP_NAME + "</span><span class=\"boldname\">등록일 : " + data.RGSTRTN_DATE + "</span>"
			html +=	"</div>";
			html +=	"</div>";
		}
		
		$("#leadBox").html(html);
	}
	function drawlPaging(pb) { 
		var html = "";
		
		html += "<div lpage=\"1\" class=\"page_btn page_first\">first</div>";
		if($("#lpage").val() == "1") {
			html += "<div lpage=\"1\" class=\"page_btn page_prev\">prev</div>";
		} else {
			html += "<div lpage=\"" + ($("#lpage").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#lpage").val() == i) {
				html += "<div lpage=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
			} else {
				html += "<div lpage=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
			}
		}
		
		if($("#lpage").val() == pb.maxPcount) {
			html += "<div lpage=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
		} else {
			html += "<div lpage=\"" + ($("#lpage").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
		}
		html += "<div lpage=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
		
		$(".pgn_area").html(html);
	}
	
});

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
<form action="salesSchdl" id = "backForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="deptS" value="${param.deptS}" />
	<input type="hidden" name="usrsrchTxt" value="${param.usrsrchTxt}" />
	<input type="hidden" name="clndrDate" value="${param.clndrDate}"/>
</form>
<form action="salesSchdlCont" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="schdlnum" name="schdlnum"/>
	<input type="hidden" name="clndrDate" value="${param.clndrDate}"/>
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
			<div class="page_title_text">영업일정 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg"  id="listBtn"/> 
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<form action="fileUploadAjax" id="RegForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<input type="hidden" name="deptS" value="${param.deptS}" />
					<input type="hidden" name="usrsrchTxt" value="${param.usrsrchTxt}" />					
					<table>
						<colgroup>
							<col width="200" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
						</colgroup>
						
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="일정명 *" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" id="ssname" name="ssname"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="영업" /></td>
								<td colspan="5">
									<div class="imgP">
										<input type="text" class="txt imgName" id="sName" name="sName" />
										<input type="hidden" id="sNum" name="sNum"/>
										<img class="btnImg_in" id="salesPop" src="resources/images/sales/popup.png">	
									</div>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="리드" readonly="readonly"/></td>
								<td colspan="5">
									<div class="imgP">
										<input type="text" class="txt imgName" id="lName" name="lName" />
										<input type="hidden" id="lNum" name="lNum"/>
										<img class="btnImg_in" id="leadPop" src="resources/images/sales/popup.png">	
									</div>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" id="clName" name="clName"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" id="ccName" name="ccName" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동분류 *" readonly="readonly"/></td>
								<td colspan="5"><select class="txt_in" id="ssactvtyclsfy" name="ssactvtyclsfy">
										<optgroup>
											<option value="9">선택하세요</option>
											<option value="0">전화</option>
											<option value="1">메일</option>
											<option value="2">방문</option>
											<option value="3">기타</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="날짜 *" readonly="readonly"/></td>
								<td colspan="2"><input type="datetime-local" class="txt" id="sdt" name="sdt"/></td>
								<td>
									<div class="wave"> ~ </div>
								</td>
								<td colspan="2"><input type="datetime-local" class="txt" id="edt" name="edt"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동내용 *" readonly="readonly"/></td>
								<td colspan="5"><textarea class="ta_box" id="ssactvtycont" name="ssactvtycont"></textarea></td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<input type="file" id="att" name="att" onchange="uploadName(this)"/>
					<input type="hidden" id="schdlAttFile" name="schdlAttFile" />					
					<div class="rvn_txt"> 첨부파일  
						<img class="plus_btn aff_btn"  src="resources/images/sales/plus.png"/> 
					</div>
					<div class="cntrct_box_in">
						<input type="text" id="fileName" name="fileName" readonly="readonly">
					</div>
					</form>
					<!-- 끝 -->
				</div>
		
			<div class="board_bottom">
			</div>
		</div>
	</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>