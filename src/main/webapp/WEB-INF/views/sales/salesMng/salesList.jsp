<!-- 
	영업기회 목록
 -->
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업관리</title>
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
/* ------- 영업기회 진행단계 선택박스 --------  */
.stageM { /* 영업기회별 단계 박스 */
	width: 927px;
	height: 35px;
	display: block;
}

.stage { /* 영업기회 이름  */
	width: 135px;
	margin: 0px 20px;
	padding: 8px 5px;
	background-color: #F2F2F2;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	font-size: 10pt;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
}
.stage_on { /* 영업기회 이름  */
	width: 135px;
	margin: 0px 20px;
	padding: 8px 5px;
	background-color: #F2B705;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	font-size: 10pt;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
}

.stage:hover {
	font-weight: bold;
	background-color: #F2B705;
	cursor: pointer;
}

.stage:active {
	background-color: #F2CB05;
}

.tLine {
	background-color: #4B94F2;
	width: 927px;
	height: 3px;
	margin: 10px auto;
}
/********** srch_table **********/
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px;
}

.srch_table tr {
	height: 40px;
}

.srch_table tr:nth-child(6) {
	height: 41.5px;
	border-top: 1.5px solid #d7d7d7;
}

.asc_btn {
	width: 30px;
	height: 25px;
}

.asc_btn:hover {
	cursor: pointer;
}

select {
	height: 23px;
	width: 150px;
	font-size: 12px;
}

.srch_name {
	margin: 0px 10px 0px 20px;
	font-weight: bold;
}

.srch_name_noMgn {
	margin: 0px 0px;
	font-weight: bold;
}

.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
/* 직원검색 */
.findEmp_box {
	background-color: white;
	border: 1px solid #858585;
	height: 22px;
	width: 147px;
	border-radius: 1px;
	text-align: right;
	outline: none;
}

.findEmp_box:hover {
	cursor: pointer;
}

.userIcon {
	height: 15px;
	margin-top: 3px;
	margin-right: 5px;
}

/*---------  영업기회 검색결과 : n건 --------- */
.SearchResult { /* 영업기회 검색결과 */
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
/*---------- 영업기회 박스 ------------  */
.salesOpportunityName { /* 영업기회명 */
	width: 695px;
	height: 25px;
	line-height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
}

.salesOpportunityName:hover { /* 영업기회명-hover */
	color: #2E83F2;
	cursor: pointer;
}

.salesOpportunity { /* 영업기회박스 */
	width: 925px;
	height: 140px;
	border: 1px solid #F2F2F2;
	display: block;
	background-color: #F2F2F2;
	margin-bottom: 10px;
}

.lastSalesOpportunity {
	margin-bottom: 40px;
}

.sledding { /* 진행상태 */
	width: 130px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	text-align: center;
	line-height: 25px;
	color: #2E83F2;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
	border: 1px solid #2E83F2;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 30px;
}

.cliimg { /* 고객사 이미지 */
	display: inline-block;
	width: 20px;
	height: 25px;
	background-image: url("resources/images/sales/client.png");
	background-size: 100%;
	background-repeat: no-repeat;
	margin: 13px 0px 13px 35px;
}

.client { /* 고객사/고객  */
	width: 200px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	padding-left: 3px;
	display: inline-block;
	vertical-align: top;
}

.fs { /* 예상매출액 */
	width: 250px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}

.pic { /* 담당자 */
	width: 150px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}
/* ------ 영업기회 파이프라인 테이블 ------ */
table {
	font-size: 10pt;
	text-align: center;
	border: none;
	margin-left: 110px;
}

.colNum1 {
	width: 200px;
	background-color: #fff;
	border: none;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

/* .colNum1 {
	background: linear-gradient(90deg, #FFE65A, #FFE150);
} */

/* .colNum1:active {
	font-weight: bold;
	color: #4B94F2;
	cursor: pointer;
}  */

/* .colNum1:hover {
	font-weight: bold;
	cursor: pointer;
} */


.stick1, .stick2, .stick3, .stick4, .stick5, .stick6 { /* 막대기 color */
	width: 38px;
	border: none;
	background-color: #fff;
}

.a {
	width: 38px;
	border: none;
	background-color: #F2F2F2;
}
.boldSts {
	background-color: #fff;
}
.boldSts_on {
	background-color: #FFE150;
}
/* 팝업 */
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
.ptm_left_top, .ptm_left_bot  {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
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
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
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
/* 팝업 내용 */
.popup_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
}
.popup_mng_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_cc_box_in {
   width: 550px;
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 5px;
}
.popup_mng_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}

.popup_mng_box_in:hover, .popup_cc_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/client.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	font-weight: bold;
	font-size : 12px;
}
.boldMngName{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
.popCmnBtn {
	margin-top: 35px;
	margin-left: 200px;
}
.popMngBtn {
	margin-top: 5px;
	margin-left: 25px;
}
.popup_box_mng {
	height: 297px;
	padding-top: 8px;
}
.popup_box_cc {
	height: 322px;
	padding-top: 8px;
}
#mngName {
	border: none;
	outline: none;
	font-size: 11pt;
	width: 118px;
	cursor: default;
	padding-bottom: 0px;
}

/* ******** 견적 ******** */
.qtn_txt {
	height: 33px;
	width: 885px;
	padding: 0 5px;
	font-size: 14px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #000;
	background-color: #F2F2F2;
	text-align: center;
	font-weight: bold;
	margin-left: 40px;
}

.qtn_title_name, .title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-bottom: 30px;
	margin-left: 40px;
	width: 900px;
}
.title_name {
	margin-top: 30px;
}
.qtn_box_in {
	width: 885px;
	height: 150px;
	border: 1px solid #000;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.past_ngtn {
	margin-left: 40px;
	font-size: 11pt;
	font-weight: bold;
	color: black;
	text-align: center;
}
.cc_box_in {
	display: inline-block;
	vertical-align: top;
	width: 480px;
	height: 70px;
	padding-left: 20px;
	white-space: pre;
	font-size: 14px;
	padding-top: 5px;
	padding-bottom: 5px;
	line-height: 20px;
}
.cc_box_in:hover {
	cursor: pointer;
	color: #2E83F2;
}
.cc_box_right {
	display: inline-block;
	vertical-align: top;
	width: 365px;
	height: 70px;
	padding-right: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.right_box {
	width: 200px;
	height: 50px;
	margin: 10px auto;
	font-size: 14px;
	text-align: right;
}
.hands{
	display: inline-block;
	vertical-align: middle;
	width: 48px;
	height: 48px;
	background-image: url("resources/images/sales/hands.png");
	background-size: 48px 48px;
	margin-right: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 검색 유지
		if('${param.prgrsStage1}' != '' || '${param.prgrsStage2}' != '' || '${param.searchGbn}' != '') {
			$("#prgrsStage1").val('${param.prgrsStage1}');
			$("#prgrsStage2").val('${param.prgrsStage2}');
			$("#searchGbn").val('${param.searchGbn}');
		} else {
			$("#oldPrgrsStage1").val("0");
			$("#oldPrgrsStage2").val("0");
			$("#oldSearchGbn").val("0");
		}
		
		if('${param.listSort}' != '') {
			$("#listSort").val('${param.listSort}');
		} else {
			$("#oldListSort").val("0");
		}
		
		if('${param.mngName}' != '') {
			$("#mngName").val('${param.mngName}');
		}
	
	// 목록 조회
	reloadList();
	
	// 검색 버튼
	$("#searchBtn").on("click", function() {
		if($("#searchGbn").val() == 2) {
			if(isNaN($("#searchTxt").val())) {
				makeAlert("경고", "영업번호 검색시 숫자만 입력해주세요", function() {
					$("#searchTxt").val("");
					$("#searchTxt").focus();
				});
			} else {
				$("#page").val("1");
				
				$("#oldPrgrsStage1").val($("#prgrsStage1").val());
				$("#oldPrgrsStage2").val($("#prgrsStage2").val());
				$("#oldMngName").val($("#mngName").val());
				$("#oldSearchGbn").val($("#searchGbn").val());
				$("#oldSearchTxt").val($("#searchTxt").val());
				$("#oldListSort").val($("#listSort").val());
				
				reloadList();
			}
		} else {
			$("#page").val("1");
			
			$("#oldPrgrsStage1").val($("#prgrsStage1").val());
			$("#oldPrgrsStage2").val($("#prgrsStage2").val());
			$("#oldMngName").val($("#mngName").val());
			$("#oldSearchGbn").val($("#searchGbn").val());
			$("#oldSearchTxt").val($("#searchTxt").val());
			$("#oldListSort").val($("#listSort").val());
			
			reloadList();
		} 
	})
	
	
	// 정렬 버튼
	$("#sortBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldPrgrsStage1").val($("#prgrsStage1").val());
		$("#oldPrgrsStage2").val($("#prgrsStage2").val());
		$("#oldMngName").val($("#mngName").val());
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	
	
	// 검색 엔터 처리
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			
			return false; // event 실행 않도록.
		}
	});
	
	/* 담당자 검색칸에 엔터처리 */
	$("#mngName").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			
			return false;
		}
	});
	
	// 상세보기
	$(".salesWrap").on("click", ".salesOpportunityName", function() {
		$("#salesNum").val($(this).attr("salesNum")); // 영업번호 가져오기
		$("#qtnNum").val($(this).attr("qtnNum")); // 견적번호 가져오기
		
		$("#oldPrgrsStage1").val($("#prgrsStage1").val());
		$("#oldPrgrsStage2").val($("#prgrsStage2").val());
		$("#oldMngName").val($("#mngName").val());
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldListSort").val($("#listSort").val());
		
		if($(this).children("#test").val() == "영업기회") {
			$("#actionForm").attr("action", "sales1SalesChncCont"); // 영업기회 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "제안") {
			$("#actionForm").attr("action", "sales2SgstnCont"); // 제안 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "견적") {
			$("#actionForm").attr("action", "sales3QtnCont"); // 견적 상세보기로 이동.
			$("#actionForm").submit();
		}  else if($(this).children("#test").val() == "계약") {
			$("#actionForm").attr("action", "sales4CntrctCont"); // 계약 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "종료(성공)") {
			$("#actionForm").attr("action", "sales4CntrctCont"); // 계약 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "종료(실패)") {
			$("#actionForm").attr("action", "sales4CntrctCont");
			$("#actionForm").submit();
		} 
		
	});
	
	/* 담당자 팝업 */
	$("#mngBtn").on("click", function() {
		
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += "<form action=\"#\" id=\"popupMngForm\">";
	 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += "<div class=\"ptm_left\">";
		html += "<div class=\"ptm_left_top\">팀분류</div>";		
		html += "<div class=\"ptm_left_bot\">사원분류</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html += "<div class=\"ptm_mid_top\">";
		html += "<select class=\"sel_size\" name=\"deptS\">";
		html += "<option value=\"6\">영업부</option>";
		html += "<option value=\"7\">영업1팀</option>";
		html += "<option value=\"8\">영업2팀</option>";
		html += "</select>";
		html += "</div>";
		html += "<div class=\"ptm_mid_bot\">";
		html += "<select class=\"sel_size\" name=\"empS\">";
		html += "<option value=\"0\">사원번호</option>";
		html += "<option value=\"1\">사원명</option>";
		html += "</select>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html += "<div class=\"ptm_mid_right_top\"></div>";
		html += "<div class=\"ptm_mid_right_bot\">";
		html += "<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" id=\"searchT\" name=\"searchT\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_right\">";
		html += "<div class=\"ptm_right_top\"></div>";
		html += "<div class=\"ptm_right_bot\">";
		html += "<div class=\"cmn_btn\" id=\"meBtn\">검색</div>";
		html += "</div>";
		html += "</div>";
		html += "</form>";
		html += "</div>";
		html +=	"<div class=\"popup_box_mng\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		
		
		makePopup({
			depth : 1,
			bg : false,
			width : 600,
			height : 500,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				drawMngList();
				
				$(".popup_box_mng").on("click", ".popup_mng_box_in", function() {
					var mng = $(this).children("#mng").val();
					var mge = $(this).children("#mge").val();
					document.getElementById("mngName").value = mng;
					document.getElementById("mngNum").value = mge;
					closePopup();
				});
				
				$("#meBtn").on("click", function () {
					$("#page").val("1");
					
					drawMngList();
					
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#meBtn").click();
						
						return false;
					}
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));

					drawMngList();
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
	
	// 페이징
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		
		$("#oldPrgrsStage1").val($("#prgrsStage1").val());
		$("#oldPrgrsStage2").val($("#prgrsStage2").val());
		$("#oldMngName").val($("#mngName").val());
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	
	
	/* 검색 상단 단계 버튼 클릭시 */
	$(".stageM").on("click", ".stage", function() {
		if($(this).attr("num") != "9") {
			$(".stageM").children(".stage_on").attr("class", "stage");
			$(this).removeClass();
			$(this).addClass("stage_on");	
		} else {
			$(".stageM").children(".stage_on").attr("class", "stage");
		}
		
		$("#page").val("1");
		
		$("#prgrsStage1").val($(this).attr("num"));
		$("#prgrsStage2").val($(this).attr("num"));
		$("#searchGbn").val("0");
		$("#listSort").val("0");
		
		$("#startDate").val('${startDate}');
		
		if($("#searchTxt").val() != "" || $("#mngName").val() != "") { // 검색어 txt가 비어있지 않으면 초기화
			var txt = document.getElementById("searchTxt");
			var mngTxt = document.getElementById("mngName");
			
			txt.value = "";
			mngTxt.value = "";
		}
		
		reloadList();
		
	});
	
	/* 검색 어제버튼 클릭 */
	$("#yesterday").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 1);
		var yesterday = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(yesterday);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 오늘버튼 */
	$("#today").on("click", function() {
		var a = new Date();
		var today = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(today);
		$("#endDate").val(today);
	});
	/* 검색 일주일전 버튼 */
	$("#aWeekAgo").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 7);
		var aWeekAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(aWeekAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 1개월전 버튼 */
	$("#oneMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 1);
		var oneMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(oneMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 3개월전 버튼 */
	$("#threeMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 3);
		var threeMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(threeMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	

});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "salesListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
			drawRsltCnt(res.RsltCnt);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawRsltCnt(RsltCnt) {
	var html = "";
	
	html += "<h3>";
	html += "영업관리 (검색결과: " + RsltCnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);
}


function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"salesOpportunity\">";
		html += "<div class=\"sledding\">" + data.PRGRS_STS + "</div>";
		html += "<div class=\"salesOpportunityName\" salesNum = \"" + data.SALES_NUM + "\" qtnNum=\"" + data.QTN_NUM + "\">" + data.LEAD_NAME + "<input type=\"hidden\" id=\"test\" value=\"" + data.PRGRS_STS2 + "\" /></div>";
		html += "<table cellspacing=\"0\">";
		html += "<colgroup>";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";			
		html += "<col width=\"120\">";						
		html += "</colgroup>";
		html += "<tbody>";
		
		/* 현재 단계 굵게 표시 */

		html += "<tr height=\"10\">";
		if(data.PRGRS_STS2 == "영업기회") {
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\"><b>영업기회</b></td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">제안</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">견적</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">계약</td>";
		}
		if(data.PRGRS_STS2 == "제안") {
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">영업기회</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\"><b>제안</b></td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">견적</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">계약</td>";
		}
		if(data.PRGRS_STS2 == "견적") {
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">영업기회</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">제안</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\"><b>견적</b></td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\">계약</td>";
		}
		if(data.PRGRS_STS2 == "계약") {
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">영업기회</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">제안</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\">견적</td>";
			html += "<td class=\"a\"></td>";
			html += "<td class=\"colNum1 boldSts_on\" rowspan=\"3\"><b>계약</b></td>";
		}
		html += "</tr>";
		html += "<tr height=\"10\">";
		if(data.PRGRS_STS2 == "영업기회") {
			html += "<td class=\"stick1\"></td>";
			html += "<td class=\"stick2\"></td>";
			html += "<td class=\"stick3\"></td>";
		}
		if(data.PRGRS_STS2 == "제안") {
			html += "<td class=\"stick1\" style=\"background-color:#FFE150;\"></td>";
			html += "<td class=\"stick2\"></td>";
			html += "<td class=\"stick3\"></td>";
		}
		if(data.PRGRS_STS2 == "견적") {
			html += "<td class=\"stick1\" style=\"background-color:#FFE150;\"></td>";
			html += "<td class=\"stick2\" style=\"background-color:#FFE150;\"></td>";
			html += "<td class=\"stick3\"></td>";
		}
		if(data.PRGRS_STS2 == "계약") {
			html += "<td class=\"stick1\" style=\"background-color:#FFE150;\"></td>";
			html += "<td class=\"stick2\" style=\"background-color:#FFE150;\"></td>";
			html += "<td class=\"stick3\" style=\"background-color:#FFE150;\"></td>";
		}
		html += "</tr>";
		html += "<tr height=\"10\">";
		html += "<td class=\"a\"></td>";
		html += "<td class=\"a\"></td>";
		html += "<td class=\"a\"></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"cliimg\"></div>";
		html += "<div class=\"client\">" + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME + "</div>";
		if(data.EXPCTN_LOAN_SCALE == null) {
			html += "<div class=\"fs\">예상매출 : 0원</div>";
		} else {
			html += "<div class=\"fs\">예상매출 : " + data.EXPCTN_LOAN_SCALE + "원</div>";
		}
		html += "<div class=\"pic\">담당자 : " + data.EMP_NAME + "</div>";
		html += "<div class=\"pic\">영업번호 : " + data.SALES_NUM + "</div>";
		html += "<br>";
		html += "</div>";
	}
	$(".salesWrap").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	<!-- 현재페이지 굵게 표시 : _on -->
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i +"\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i +"\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	
	html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);
}

/* 담당자 팝업 Ajax */
function drawMngList() {
	var params = $("#popupMngForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawMngCont(res.mngList);
			drawMngPaging(res.mngPb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawMngCont(mngList) {
	var html = "";
	
	for(var data of mngList) {
		html +=	"<div class=\"popup_mng_box_in\" id=\"mlb\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"mngIcon\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_mng_box_right\">";
		html +=	 data.EMP_NUM + " " + "<span class=\"boldMngName\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";                                                                      
	}                                                                                                     
	                      
	$(".popup_box_mng").html(html);
	
}

function drawMngPaging(mngPb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = mngPb.startPcount; i <= mngPb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == mngPb.maxPcount) {
		html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

} 
 
</script>
</head>
<body>
<!-- 검색 데이터 유지용 -->
<input type="hidden" id="oldPrgrsStage1" value="${param.prgrsStage1}" />
<input type="hidden" id="oldPrgrsStage2" value="${param.prgrsStage2}" />
<input type="hidden" id="oldMngName" value="${param.mngName}" />
<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
<input type="hidden" id="oldListSort" value="${param.listSort}" />

	
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" id="salesNum" name="salesNum" /> <!-- 상세보기 갈 때 필요 -->
		<input type="hidden" id="qtnNum" name="qtnNum" /> <!-- 상세보기 갈 때 필요 -->
		
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">영업관리 목록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>

		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
					<div class="stageM">
						<div class="stage" num="9" >전체 : ${allCnt}건</div>
						<div class="stage" num="1" >영업기회 : ${stage0}건</div>
						<div class="stage" num="2" >제안 : ${stage1}건</div>
						<div class="stage" num="3" >견적 : ${stage2}건</div>
						<div class="stage" num="4" >계약 : ${stage3}건</div>
					</div>
					<div class="tLine"></div>
					<table class="srch_table">

						<colgroup>
							<col width="100" />
							<col width="180" />
							<col width="70" />
							<col width="270" />
							<col width="190" />

						</colgroup>
						<tbody>
							<!-- col=5 -->
							<tr>
								<td>
									<span class="srch_name">담당자</span>
								</td>
								<td colspan="2">
									<div class="findEmp_box">
										<input type="text" id="mngName" name="mngName" />
										<input type="hidden" id="mngNum" />
										<img class="userIcon" src="resources/images/sales/usericon.png" id="mngBtn">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">진행 단계</span>
								</td>
								<td>
									<select id="prgrsStage1" name="prgrsStage1">
										<option value="9">선택안함</option>
										<option value="1">영업기회</option>
										<option value="2">제안</option>
										<option value="3">견적</option>
										<option value="4">계약</option>
									</select>
								</td>

								<td>
									<span class="srch_name_noMgn">완료 여부</span>
								</td>
								<td colspan="2">
									<select id="prgrsStage2" name="prgrsStage2">
										<option value="9">선택안함</option>
										<option value="7">진행중</option>
										<option value="5">종료(성공)</option>
										<option value="6">종료(실패)</option>
									</select>
								</td>
							</tr>

							<tr>
								<td>
									<span class="srch_name">기간</span>
								</td>
								<td>
									<select>
										<option selected="selected">영업기회등록일</option>
									</select>
								</td>
								<td colspan="3">
									<input type="button" id="yesterday" value="어제" />
									<input type="button" id="today" value="오늘" />
									<input type="button" id="aWeekAgo" value="일주일 전" />
									<input type="button" id="oneMonthAgo" value="1개월 전" />
									<input type="button" id="threeMonthAgo" value="3개월 전" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td colspan="3">
									<input type="date" id="startDate" name="startDate" value="${startDate}" style="font-family : 맑은 고딕;" />
									~
									<input type="date" id="endDate" name="endDate" value="${endDate}" style="font-family : 맑은 고딕;" />
								</td>

							</tr>
							<tr>
								<td>
									<span class="srch_name">검색어</span>
								</td>
								<td>
									<select id="searchGbn" name="searchGbn">
										<option value="0">고객사명</option>
										<option value="1">영업명</option>
										<option value="2">영업번호</option>
									</select>
								</td>
								<td colspan="2">
									<input type="text" class="srch_msg" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="검색 조건을 선택한 후 입력해주세요." />
								</td>
								<td>
									<span class="cmn_btn" id="searchBtn">검색</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">정렬</span>
								</td>
								<td>
									<select id="listSort" name="listSort">
										<option value="9">선택안함</option>
										<option value="0">영업명</option>
										<option value="1">고객사명</option>
										<option value="2">예상매출</option>
										<option value="3">시작일</option>
									</select>
								</td>
								<td>
									<img class="asc_btn cmn_btn" alt="정렬버튼" src="resources/images/sales/asc.png" id="sortBtn" />
								</td>
								<td colspan="3"></td>
							</tr>
						</tbody>
					</table>
					<div class="SearchResult"></div>
					<div class="salesWrap"></div>
					<div class="body_bottom">
						<div class="board_bottom">
							<div class="pgn_area"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- cont_area end -->
	</div>
</form>
	<!-- cont_wrap end -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>