<!-- 
	계약 등록 : sales4CntrctReg
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
<title>계약 등록</title>
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
	padding: none;
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

tr:nth-last-child(1) {
	margin-top: 40px;
}

.page_cont_title_text {
	display: inline-block;
	vertical-align: top;
	width: 900px;
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

.txt2 {
	height: 33px;
	width: 90%;
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
.detailList tr td:nth-child(1) {
	text-align: center;
}

/* 상세정보 테이블 */
.detail_info_table tr:nth-child(1) td:nth-child(2) {
	border: none;
}

.detail_info_table tr td:nth-child(1) {
	text-align: center;
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
}

.mdhr_plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
	margin-right: 5px;
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

.plus_btn:hover, .drop_btn:hover, .up_btn:hover, .mdhr_plus_btn:hover {
	cursor: pointer;
}

hr { /* 구분선 */
	margin-bottom: 10px;
}

.bot_title {
	font-size: 11pt;
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

.nb {
	font-size: 14px;
	float: right;
}
/* 상단부분 hr 바텀 여백  */
.hr_bot {
	margin-bottom: 20px;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 45px;
	font-size: 10pt;
}

[href] {
	color: black;
	text-decoration: none;
}

.txt_area {
	width: 720px;
	height: 200px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	font-size: 9pt;
	text-indent: 10px;
	line-height: 25px;
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
	margin-left: 45px;
	margin-bottom: 5px;
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
/* 상품 접었다 폈다 */
.mdhr {
	width: 880px;
	margin-bottom: 10px;
	float: right;
}
/* 첨부자료 */
.spc {
	margin-bottom: 30px;
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

.btnImg_in {
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	margin-right: 5px;
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
.qBox { /* 스크롤때문에 div 박스 추가 */
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
.del:hover, .dtl:hover, .apply:hover {
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

/* 상품 드롭다운 수정 영역 */
.mdhr {
   margin-bottom: 10px;
   float: right;
} 
.drop_btn2 {
	display:inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 15px 15px;
	float: right;
	margin-top: 15px;
	margin-right: 5px;
}
/* 지난 견적서 */
pre{
	font-family: "맑은 고딕";
	margin-top: 3px;
}
.qtnBox {
	width: 830px;
	height: 60px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin: 5px;
	background-color: #F2F2F2;
}
.qtnBox:hover {
	cursor: pointer;
	outline: 2px solid #F2B705;
}
.plus_btn_top {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 10px;
	margin-top: 7.5px;
}
.plus_btn_top:hover {
	cursor: pointer;
}
/* 견적 상품  */
.mdBox {
	width: 800px;
	height: 35px;
	margin-left: 20px;
	line-height: 30px;
	border: 1px solid #D7D7D7;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.md_bx { /* 스크롤때문에 div 박스 추가 */
	width: 835x;
	height: 205px;
	margin-left: 70px;
	font-size: 12pt;
	overflow-y: auto;
}
.md_txt{
	font-size: 14px;
	font-weight: bold;
}
.md_hr{
	margin-left: 80px;
}
.md_title { 
	font-size: 14pt;
	height : 24px;
	line-height: 14px;
	margin-left: 850px;
	vertical-align: middle;
}
.md_plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 14px;
	height: 14px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 14px 14px;
	margin-left: 5px;
	cursor: pointer;
}
.txtOp_btn{
	margin-left: 600px;
}
.md_nm{
	display: inline-block;
	vertical-align: middle;
	width: 120px;
	font-weight: bold;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.md_intrst, .md_prd {
	display: inline-block;
	vertical-align: middle;
	width: 120px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.md_grd {
	display: inline-block;
	vertical-align: middle;
	width: 190px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.md_btn{
	margin-left : 100px;
}
.dtl, .apply, .gb{
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	color: gray;
	margin : 0px 5px; 
}
/* ******** 견적 끝 ******** */
#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
}
/* ********** 상품 팝업 ********** */
/* .popup_cont {
	font-size: 10.5pt;
	height: 290px;
} */

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
.popup_cc_box_left {
   display: inline-block;
   vertical-align: top;
   width: 50px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 480px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_box_in {
   width: 550px;
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 5px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/popup.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 15px;
}
.boldname{
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
/* .board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding-bottom: 5px;
} */
/* 대출한도, 이자율, 판매상태 */
.limit_amnt {
	margin-left: 25px;
	font-weight: bold;
	font-size: 12px;
}
.sales_sts {
	margin-left: 10px;
	font-weight: bold;
	color: #2E83F2;
}
.md01 {
	display: inline-block;
	width: 50px;
	text-align: center;
}
.md02 {
	display: inline-block;
	width: 200px;
	text-align: center;
}
.md03 {
	display: inline-block;
	width: 120px;
	text-align: center;
}
/* ********** 상품 팝업 끝 ********** */
.popup_box_md {
	height: 300px;
	padding-top: 8px;
}
.mdCont_table {
	display: table-cell;
	text-align: center;
}
.mdCont_table tr:nth-child(8) td:nth-child(2) {
    border: none;
}
.qtnDiv {
	width: 100%;
	height: 100%;
}
.PQ_title {
	position: relative;
	font-size: 11pt;
}
.drop_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.drop_btn_bot:hover {
	cursor: pointer;
}
.qtnBox {
    width: 830px;
    height: 60px;
    font-size: 10pt;
    border: 1px solid gray;
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
    border-bottom-left-radius: 12px;
    border-bottom-right-radius: 12px;
    margin: 5px;
    background-color: #F2F2F2;
}
pre {
	font-family: "맑은 고딕";
    margin-top: 3px;
}

/* 물결용 */
.wave {
	display: inline-block;
	vertical-align: top;
	width: 15px;
	height: 15px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 100px;
	line-height: 15px;
}
/* **** 저장 팝업 **** */
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
</style>
<script type="text/javascript">
$(document).ready(function() {
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
			buttons : [ {
				name : "확인",
				func : function() {
					$("#listForm").attr("action", "salesList");
					$("#listForm").submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			} ]
		});
	});
	
	// 견적 - 상세정보 - 첨부파일
	$(".att_btn").on("click", function() {
		$("#att").click();
	});
	
	// 저장 버튼
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#daoName")) {
			makeAlert("필수 정보 알림", popContOneLine("입금계좌 소유주명을 입력하세요."), function() {
				$("#daoName").focus();
			});
		} else if(!isNaN($("#daoName").val())) {
			makeAlert("알림", popContOneLine("입금계좌 소유주명은 한글 또는 영문으로 입력하세요."), function() {
				$("#daoName").val("");
				$("#daoName").focus();
			});
		} else if($("#dbNum").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("입금 은행명을 선택하세요."), function() {
				$("#dbNum").focus();
			});
		} else if(checkEmpty("#daNum")) {
			makeAlert("필수 정보 알림", popContOneLine("입금 계좌번호를 입력하세요."), function() {
				$("#daNum").focus();
			});
		} else if(isNaN($("#daNum").val())) {
			makeAlert("알림", popContOneLine("입금 계좌번호는 숫자만 입력 가능합니다."), function() {
				$("#daNum").val("");
				$("#daNum").focus();
			});
		} else if(checkEmpty("#payerName")) {
			makeAlert("필수 정보 알림", popContOneLine("납입자명을 입력하세요."), function() {
				$("#payerName").focus();
			});
		} else if(!isNaN($("#payerName").val())) {
			makeAlert("알림", popContOneLine("납입자명은 한글 또는 영문으로 입력하세요."), function() {
				$("#payerName").val("");
				$("#payerName").focus();
			});
		} else if(checkEmpty("#paNum")) {
			makeAlert("필수 정보 알림", popContOneLine("납입 계좌번호를 입력하세요."), function() {
				$("#paNum").focus();
			});
		} else if(isNaN($("#paNum").val())) {
			makeAlert("알림", popContOneLine("납입 계좌번호는 숫자만 입력 가능합니다."), function() {
				$("#paNum").val("");
				$("#paNum").focus();
			});
		} else {
			var html = "";
			
			html += "<div class=\"popup_cont2\">저장하시겠습니까?</div>";
			
			makePopup({
				depth : 1,
				bg : false,
				bgClose : false,
				title : "알림",
				withd : 400,
				height : 200,
				contents : html,
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "확인",
					func:function() {
						var html = "";
						
						html += "<div class=\"popup_cont2\">저장되었습니다.</div>";
						
						makePopup({
							depth : 2,
							bg : true,
							bgClose : false,
							width : 400,
							height : 200,
							title : "저장 완료",
							contents : html,
							buttons : {
								name : "확인",
								func:function() {
									
									var addForm = $("#addForm");
									
									addForm.ajaxForm({
										success : function(res) {
											if(res.fileName.length > 0) {
												$("#attFile").val(res.fileName[0]);
											}
											
											var params = $("#addForm").serialize();
											
											$.ajax({
												type : "post",
												url : "salesMng4ActionAjax/insert",
												dataType : "json",
												data : params,
												success : function(res) {
													if(res.res == "success") {
														$("#contForm").attr("action", "sales4CntrctCont");
														$("#contForm").submit();
													} else {
														makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
													}
												},
												error : function(request, status, error) {
													console.log(request.responseText);
												}
											});
										},
										error : function(req) {
											console.log(request.responseText);
										}
									});
									addForm.submit();
								}
							}
						});
						console.log("One!");
						closePopup();
					}
				}, {
					name : "취소"
				}]
			}); // makePopup depth 1 end
		} // else end
	});
	
	// 선택박스 초기값
	$("#loanCauseNum").val(${data.LOAN_CAUSE_NUM}).prop("selected", true);
	$("#loanHopeType").val(${data.LOAN_HOPE_TYPE}).prop("selected", true);
	$("#loanHopeTime").val(${data.LOAN_HOPE_TIME}).prop("selected", true);
	$("#expctdBsnsType").val(${data.EXPCTD_BSNS_TYPE}).prop("selected", true);
	
	$("#sgstnloanCauseNum").val(${data2.SGSTN_LOAN_CAUSE_NUM}).prop("selected", true);
	$("#sgstnloanType").val(${data2.SGSTN_LOAN_TYPE}).prop("selected", true);
	
	$("#mdType").val(${data3.MD_TYPE_NUM}).prop("selected", true);
	$("#prdmptn_psbl_check").val(${data3.MID_RDMPTN_PSBL_CHECK}).prop("selected", true);
	$("#srtx").val(${data3.SRTX}).prop("selected", true);
	$("#prncpl_pymnt").val(${data3.PRNCPL_PYMNT_MTHD_NUM}).prop("selected", true);
	$("#loanPrd").val(${data3.LOAN_PRD}).prop("selected", true);
	
	
	// 상품 아이콘 클릭 시
	$("#mdPop").on("click", function() {
		
		var html = "";
		
		html +="<div class=\"popup_title_mid\">                                                                   ";
		html +="<form action=\"#\" id=\"popupMdForm\">                                                                ";
		html +="	<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\">                                     ";
		html +="		<div class=\"ptm_left\">                                                                      ";
		html +="			<div class=\"ptm_left_top\">판매상태</div>		                                          ";
		html +="			<div class=\"ptm_left_bot\">상품코드</div>		                                          ";
		html +="		</div>                                                                                        ";
		html +="		<div class=\"ptm_mid\">                                                                       ";
		html +="			<div class=\"ptm_mid_top\">                                                               ";
		html +="				<select class=\"sel_size\">                                                           ";
		html +="					<option value=\"9\">선택안함</option>                                             ";
		html +="					<option value=\"0\">판매가능</option>                                             ";
		html +="					<option value=\"1\">판매중단</option>                                             ";
		html +="					<option value=\"2\">출시예정</option>                                             ";
		html +="				</select>                                                                             ";
		html +="			</div>		                                                                              ";
		html +="			<div class=\"ptm_mid_bot\">                                                               ";
		html +="				<input type=\"text\" placeholder=\"상품코드 입력\" class=\"text_size1\" />            ";
		html +="			</div>	                                                                                  ";
		html +="		</div>                                                                                        ";
		html +="		<div class=\"ptm_mid_right0\">                                                                ";
		html +="			<div class=\"ptm_right_bot\"></div>                                                       ";
		html +="			<div class=\"ptm_right_bot\">상품명</div>                                                 ";
		html +="		</div>                                                                                        ";
		html +="		<div class=\"ptm_mid_right\">                                                                 ";
		html +="			<div class=\"ptm_mid_right_top\"></div>                                                   ";
		html +="			<div class=\"ptm_mid_right_bot\">                                                         ";
		html +="				<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size2\" />    ";
		html +="			</div>                                                                                    ";
		html +="		</div>                                                                                        ";
		html +="		<div class=\"ptm_right\">                                                                     ";
		html +="			<div class=\"ptm_right_top\"></div>                                                       ";
		html +="			<div class=\"ptm_right_bot2\">                                                            ";
		html +="				<div class=\"cmn_btn\">검색</div>                                                     ";
		html +="			</div>                                                                                    ";
		html +="		</div>                                                                                        ";
		html +="	</form>                                                                                           ";
		html +="</div>                                                                                                ";
		html +="<div class=\"popup_box_md\"></div>                                                                      ";
		html +="<div class=\"board_bottom\">                                                                         ";
		html +="	<div class=\"pgn_area\"></div>                                                                    ";
		html +="</div>                                                                                                ";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 600,
			height : 500,
			title : "상품 조회",
			contents : html,
			contentsEvent : function() {
				
				drawMdList();
				
				$(".popup_box_md").on("click", ".popup_box_in", function() {
					var mdnum = $(this).children("#mdnum").val();
					document.getElementById("getMdNum").value = mdnum;
					document.getElementById("mdNum").value = mdnum;
					
					var params = $("#mdListForm").serialize();
					
					$.ajax({
						type : "post",
						url : "popupMdContAjax",
						dataType : "json",
						data : params,
						success : function(mdData) {
			                var html = "";
			                console.log(mdData);
			                
							$.each(mdData, function(index, data) {
								
								html += "<table class=\"mdCont_table\">                                                                                                                                              ";
								html += "	<tbody>                                                                                                                                                                  ";
								html += "		<tr>                                                                                                                                                                 ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"상품명 *\" readonly=\"readonly\"/>                                                                              ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td colspan=\"3\">                                                                                                                                               ";
								html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" value=\"" + data.MD_NAME + "\"/>	                                                 ";
								html += "			</td>                                                                                                                                                            ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">							                                                                                                                         ";
								html += "			<td padding=\"none\">                                                                                                                                            ";
								html += "				<input type=\"button\" class=\"btn\" value=\"상품 유형 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"md_type\" >									                                                             ";
								if(data.MD_TYPE_NUM == 0) {
									html += "					<option value=\"0\">개인 사업</option>                                                                                                                   ";
								}
								if(data.MD_TYPE_NUM == 1) {
									html += "					<option value=\"1\">법인 사업</option>                                                                                                                   ";
								}
								if(data.MD_TYPE_NUM == 2) {
									html += "					<option value=\"2\">공공 사업</option>                                                                                                                   ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>	                                                                                                                                                         ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"상품 등급 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"md_grade\">									                                                             ";
								if(data.MD_GRADE_NUM == 0) {
									html += "					<option value=\"0\">S</option>                                                                                                                           ";
								}
								if(data.MD_GRADE_NUM == 1) {
									html += "					<option value=\"1\">A</option>                                                                                                                           ";
								}
								if(data.MD_GRADE_NUM == 2) {
									html += "					<option value=\"2\">B</option>                                                                                                                           ";
								}
								if(data.MD_GRADE_NUM == 3) {
									html += "					<option value=\"3\">C</option>                                                                                                                           ";
								}
								if(data.MD_GRADE_NUM == 4) {
									html += "					<option value=\"4\">D</option>                                                                                                                           ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>							                                                                                                                                 ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"판매 상태 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"sales_sts\">									                                                             ";
								if(data.SALES_STS_NUM == 0) {
									html += "					<option value=\"0\">판매중</option>                                                                                                                      ";
								}					
								if(data.SALES_STS_NUM == 1) {
									html += "					<option value=\"1\">판매중단</option>                                                                                                                    ";
								}					
								if(data.SALES_STS_NUM == 2) {
									html += "					<option value=\"2\">출시예정</option>                                                                                                                    ";
								}					
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"한도 금액 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"limit_amnt\" value=\"" + data.LIMIT_AMNT + "\"/>		                         ";
								html += "			</td>			                                                                                                                                                 ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"판매 기간 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "				<td>                                                                                                                                                         ";
								html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_start_date\" value=\"" + data.SALES_START_DATE + "\"/>              ";
								html += "				</td>	                                                                                                                             ";
								html += "				<td>                                                                                                                                                         ";
								html += "					<div class=\"date_sign\">                                                                                                                                ";
								html += "						<span class=\"txt\">~</span>                                                                                                                         ";
								html += "					</div>                                                                                                                                                   ";
								html += "				</td>                                                                                                                                                        ";
								html += "				<td colspan=\"2\">                                                                                                                                           ";
								if(data.SALES_END_DATE == null){
									html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_end_date\" />                  ";
								} else {
									html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_end_date\" value=\"" + data.SALES_END_DATE + "\"/>                  ";
								}
								html += "				</td>                                                                                                                                 ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"이자율 *\" />                                                                                                   ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"intrst_rate\" value=\"" + data.INTRST_RATE + "\" />                           ";
								html += "			</td>				                                                                                                                                             ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"이자 납부 방식 *\" />                                                                                           ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"intrst_pymnt_mthd\">										                                                 ";
								if(data.INTRST_PYMNT_MTHD_NUM == 0) {
									html += "					<option value=\"0\">원금 균등</option>                                                                                                                   ";
								}
								if(data.INTRST_PYMNT_MTHD_NUM == 1) {
									html += "					<option value=\"1\">원리금 균등</option>                                                                                                                 ";
								}
								if(data.INTRST_PYMNT_MTHD_NUM == 2) {
									html += "					<option value=\"2\">만기 일시상환</option>                                                                                                               ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>                                                                                                                                                            ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"원금 납부 방식 *\" />                                                                                           ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"prncpl_pymnt_mthd\">								                                                         ";
								if(data.PRNCPL_PYMNT_MTHD_NUM == 0) {
									html += "					<option value=\"0\">원금 균등</option>                                                                                                                   ";
								}
								if(data.PRNCPL_PYMNT_MTHD_NUM == 1) {
									html += "					<option value=\"1\">원리금 균등</option>                                                                                                                 ";
								}
								if(data.PRNCPL_PYMNT_MTHD_NUM == 2) {
									html += "					<option value=\"2\">만기 일시상환</option>                                                                                                               ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"중도상환 가능 여부 *\" />                                                                                       ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"mid_prdmptn_psbl_check\">	                                                                                 ";
								if(data.MID_RDMPTN_PSBL_CHECK == 0) {
									html += "					<option value=\"0\">가능</option>                                                                                                                        ";
								}
								if(data.MID_RDMPTN_PSBL_CHECK == 1) {
									html += "					<option value=\"1\">불가능</option>                                                                                                                      ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>                                                                                                                                                            ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<input type=\"button\" class=\"btn\" value=\"대출 기간 *\" />                                                                                                ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td>                                                                                                                                                             ";
								html += "				<select class=\"txt\" disabled=\"disabled\" id=\"loan_prd\">		                                                                                         ";
								if(data.LOAN_PRD == 0) {
									html += "					<option value=\"0\">6개월</option>                                                                                                                       ";
								}
								if(data.LOAN_PRD == 1) {
									html += "					<option value=\"1\">1년</option>                                                                                                                         ";
								}
								if(data.LOAN_PRD == 2) {
									html += "					<option value=\"2\">3년</option>                                                                                                                         ";
								}
								if(data.LOAN_PRD == 3) {
									html += "					<option value=\"3\">5년</option>                                                                                                                         ";
								}
								html += "				</select>                                                                                                                                                    ";
								html += "			</td>                                                                                                                                                            ";
								html += "		</tr>                                                                                                                                                                ";
								html += "		<tr height=\"40\">                                                                                                                                                   ";
								html += "			<td rowspan=\"2\">                                                                                                                                               ";
								html += "				<input type=\"button\" class=\"btn\" value=\"상품 설명 \" readonly=\"readonly\"/>                                                                            ";
								html += "			</td>                                                                                                                                                            ";
								html += "			<td colspan=\"3\">                                                                                                                                               ";
								if(data.MD_DSCRPTN == null) {
									html += "				<textarea rows=\"100\" cols=\"50\" class=\"txt_area\" readonly=\"readonly\" disabled=\"disabled\" ></textarea>                             ";
								} else {
									html += "				<textarea rows=\"100\" cols=\"50\" class=\"txt_area\" readonly=\"readonly\" disabled=\"disabled\" >" + data.MD_DSCRPTN + "</textarea>                             ";
								}
								html += "			</td>                                                                                                                                                            ";
								html += "		</tr>                                                                                                                                                                ";
								html += "	</tbody>                                                                                                                                                                 ";
								html += "</table>                                                                                                                                                                    ";
								
								makePopup({
									depth : 2,
									bg : false,
									width : 1000,
									height : 650,
									title : "상품 상세보기",
									contents : html,
									buttons : [{
										name : "적용",
										func:function() {
											$("#prdmptn_psbl_check").val(data.MID_RDMPTN_PSBL_CHECK).prop("selected", this.selected);
											$("#intrst_pymnt").val(data.INTRST_PYMNT_MTHD_NUM).prop("selected", this.selected);
											$("#prncpl_pymnt").val(data.PRNCPL_PYMNT_MTHD_NUM).prop("selected", this.selected);
											$("#intrstRate").val(data.INTRST_RATE);
											$("#loanPrd").val(data.LOAN_PRD).prop("selected", this.selected);
											closePopup(2);
										}
									}, {
										name : "닫기"
									}]
								});
								
							});
							
							
						},
						error : function(req) {
							console.log(req.responseText);
						}
					});
					
				}); 
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));

					drawMdList();
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup();
				}
			}
		});
	}); // Md popup end
	
	reloadMdList();
	
	//상품목록 상세보기
	$(".md_bx").on("click", ".mdBox .dtl", function() {
		var no = $(this).children("#mdNo").val();
		document.getElementById("no").value = no;
		document.getElementById("mdNum").value = no;
		
		var params = $("#mdNumForm").serialize();
		
		$.ajax({
			type : "post",
			url : "popupMdContAjax",
			dataType : "json",
			data : params,
			success : function(mdData) {
                var html = "";
                console.log(mdData);
                
                
				$.each(mdData, function(index, data) {
					
					html += "<table class=\"mdCont_table\">                                                                                                                                              ";
					html += "	<tbody>                                                                                                                                                                  ";
					html += "		<tr>                                                                                                                                                                 ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"상품명 *\" readonly=\"readonly\"/>                                                                              ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td colspan=\"3\">                                                                                                                                               ";
					html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" value=\"" + data.MD_NAME + "\"/>	                                                 ";
					html += "			</td>                                                                                                                                                            ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">							                                                                                                                         ";
					html += "			<td padding=\"none\">                                                                                                                                            ";
					html += "				<input type=\"button\" class=\"btn\" value=\"상품 유형 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"md_type\" >									                                                             ";
					if(data.MD_TYPE_NUM == 0) {
						html += "					<option value=\"0\">개인 사업</option>                                                                                                                   ";
					}
					if(data.MD_TYPE_NUM == 1) {
						html += "					<option value=\"1\">법인 사업</option>                                                                                                                   ";
					}
					if(data.MD_TYPE_NUM == 2) {
						html += "					<option value=\"2\">공공 사업</option>                                                                                                                   ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>	                                                                                                                                                         ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"상품 등급 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"md_grade\">									                                                             ";
					if(data.MD_GRADE_NUM == 0) {
						html += "					<option value=\"0\">S</option>                                                                                                                           ";
					}
					if(data.MD_GRADE_NUM == 1) {
						html += "					<option value=\"1\">A</option>                                                                                                                           ";
					}
					if(data.MD_GRADE_NUM == 2) {
						html += "					<option value=\"2\">B</option>                                                                                                                           ";
					}
					if(data.MD_GRADE_NUM == 3) {
						html += "					<option value=\"3\">C</option>                                                                                                                           ";
					}
					if(data.MD_GRADE_NUM == 4) {
						html += "					<option value=\"4\">D</option>                                                                                                                           ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>							                                                                                                                                 ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"판매 상태 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"sales_sts\">									                                                             ";
					if(data.SALES_STS_NUM == 0) {
						html += "					<option value=\"0\">판매중</option>                                                                                                                      ";
					}					
					if(data.SALES_STS_NUM == 1) {
						html += "					<option value=\"1\">판매중단</option>                                                                                                                    ";
					}					
					if(data.SALES_STS_NUM == 2) {
						html += "					<option value=\"2\">출시예정</option>                                                                                                                    ";
					}					
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"한도 금액 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"limit_amnt\" value=\"" + data.LIMIT_AMNT + "\"/>		                         ";
					html += "			</td>			                                                                                                                                                 ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"판매 기간 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "				<td>                                                                                                                                                         ";
					html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_start_date\" value=\"" + data.SALES_START_DATE + "\"/>              ";
					html += "				</td>	                                                                                                                             ";
					html += "				<td>                                                                                                                                                         ";
					html += "					<div class=\"date_sign\">                                                                                                                                ";
					html += "						<span class=\"txt\">~</span>                                                                                                                         ";
					html += "					</div>                                                                                                                                                   ";
					html += "				</td>                                                                                                                                                        ";
					html += "				<td colspan=\"2\">                                                                                                                                           ";
					if(data.SALES_END_DATE == null){
						html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_end_date\" />                  ";
					} else {
						html += "					<input type=\"date\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"sales_end_date\" value=\"" + data.SALES_END_DATE + "\"/>                  ";
					}
					html += "				</td>                                                                                                                                 ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"이자율 *\" />                                                                                                   ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"text\" class=\"txt\" readonly=\"readonly\" disabled=\"disabled\" id=\"intrst_rate\" value=\"" + data.INTRST_RATE + "\" />                           ";
					html += "			</td>				                                                                                                                                             ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"이자 납부 방식 *\" />                                                                                           ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"intrst_pymnt_mthd\">										                                                 ";
					if(data.INTRST_PYMNT_MTHD_NUM == 0) {
						html += "					<option value=\"0\">원금 균등</option>                                                                                                                   ";
					}
					if(data.INTRST_PYMNT_MTHD_NUM == 1) {
						html += "					<option value=\"1\">원리금 균등</option>                                                                                                                 ";
					}
					if(data.INTRST_PYMNT_MTHD_NUM == 2) {
						html += "					<option value=\"2\">만기 일시상환</option>                                                                                                               ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>                                                                                                                                                            ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"원금 납부 방식 *\" />                                                                                           ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"prncpl_pymnt_mthd\">								                                                         ";
					if(data.PRNCPL_PYMNT_MTHD_NUM == 0) {
						html += "					<option value=\"0\">원금 균등</option>                                                                                                                   ";
					}
					if(data.PRNCPL_PYMNT_MTHD_NUM == 1) {
						html += "					<option value=\"1\">원리금 균등</option>                                                                                                                 ";
					}
					if(data.PRNCPL_PYMNT_MTHD_NUM == 2) {
						html += "					<option value=\"2\">만기 일시상환</option>                                                                                                               ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"중도상환 가능 여부 *\" />                                                                                       ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"mid_prdmptn_psbl_check\">	                                                                                 ";
					if(data.MID_RDMPTN_PSBL_CHECK == 0) {
						html += "					<option value=\"0\">가능</option>                                                                                                                        ";
					}
					if(data.MID_RDMPTN_PSBL_CHECK == 1) {
						html += "					<option value=\"1\">불가능</option>                                                                                                                      ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>                                                                                                                                                            ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<input type=\"button\" class=\"btn\" value=\"대출 기간 *\" />                                                                                                ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td>                                                                                                                                                             ";
					html += "				<select class=\"txt\" disabled=\"disabled\" id=\"loan_prd\">		                                                                                         ";
					if(data.LOAN_PRD == 0) {
						html += "					<option value=\"0\">6개월</option>                                                                                                                       ";
					}
					if(data.LOAN_PRD == 1) {
						html += "					<option value=\"1\">1년</option>                                                                                                                         ";
					}
					if(data.LOAN_PRD == 2) {
						html += "					<option value=\"2\">3년</option>                                                                                                                         ";
					}
					if(data.LOAN_PRD == 3) {
						html += "					<option value=\"3\">5년</option>                                                                                                                         ";
					}
					html += "				</select>                                                                                                                                                    ";
					html += "			</td>                                                                                                                                                            ";
					html += "		</tr>                                                                                                                                                                ";
					html += "		<tr height=\"40\">                                                                                                                                                   ";
					html += "			<td rowspan=\"2\">                                                                                                                                               ";
					html += "				<input type=\"button\" class=\"btn\" value=\"상품 설명 \" readonly=\"readonly\"/>                                                                            ";
					html += "			</td>                                                                                                                                                            ";
					html += "			<td colspan=\"3\">                                                                                                                                               ";
					if(data.MD_DSCRPTN == null) {
						html += "				<textarea rows=\"100\" cols=\"50\" class=\"txt_area\" readonly=\"readonly\" disabled=\"disabled\" ></textarea>                             ";
					} else {
						html += "				<textarea rows=\"100\" cols=\"50\" class=\"txt_area\" readonly=\"readonly\" disabled=\"disabled\" >" + data.MD_DSCRPTN + "</textarea>                             ";
					}
					html += "			</td>                                                                                                                                                            ";
					html += "		</tr>                                                                                                                                                                ";
					html += "	</tbody>                                                                                                                                                                 ";
					html += "</table>                                                                                                                                                                    ";
					
					makePopup({
						depth : 1,
						bg : false,
						width : 1000,
						height : 650,
						title : "상품 상세보기",
						contents : html,
						buttons : [{
							name : "적용",
							func:function() {
								$("#mdType").val(data.MD_TYPE_NUM).prop("selected", this.selected);
								$("#prdmptn_psbl_check").val(data.MID_RDMPTN_PSBL_CHECK).prop("selected", this.selected);
								$("#intrst_pymnt").val(data.INTRST_PYMNT_MTHD_NUM).prop("selected", this.selected);
								$("#prncpl_pymnt").val(data.PRNCPL_PYMNT_MTHD_NUM).prop("selected", this.selected);
								$("#intrstRate").val(data.INTRST_RATE);
								$("#loanPrd").val(data.LOAN_PRD).prop("selected", this.selected);
								closePopup();
							}
						}, {
							name : "닫기"
						}]
					});
					
				});
				
				
			},
			error : function(req) {
				console.log(req.responseText);
			}
		});
		
	});
	
	
	$(".salesCont").hide();
	$(".sgstnCont").hide();
	$(".qtnCont").hide();
	
	// 영업기회 탭 접기펼치기
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
	
	// 제안 탭 접기펼치기
	$("#sgstn_btn").on("click", "#sgstnContBtn_h", function() {
		$(".sgstnCont").hide();
		html = "<div class=\"up_btn\" id=\"sgstnContBtn_s\"></div>";
		$("#sgstn_btn").html(html);
	});
	
	$("#sgstn_btn").on("click", "#sgstnContBtn_s", function() {
		$(".sgstnCont").show();
		html = "<div class=\"drop_btn\" id=\"sgstnContBtn_h\"></div>";
		$("#sgstn_btn").html(html);
	});
	// 견적 탭 접기펼치기
	$("#qtn_btn").on("click", "#qtnContBtn_h", function() {
		$(".qtnCont").hide();
		html = "<div class=\"up_btn\" id=\"qtnContBtn_s\"></div>";
		$("#qtn_btn").html(html);
	});
	$("#qtn_btn").on("click", "#qtnContBtn_s", function() {
		$(".qtnCont").show();
		html = "<div class=\"drop_btn\" id=\"qtnContBtn_h\"></div>";
		$("#qtn_btn").html(html);
	});
	
	$(".qtnDiv").hide();
 	
	var loanAmntE = "${data3.LOAN_AMNT}";
	
 	//대출금액
	var loanAmnt = loanAmntE.split(',').join("");
	//대출기간
	var loanPrd
	if(${data3.LOAN_PRD eq 0} == 0) {
		loanPrd = 6;
	} else if(${data3.LOAN_PRD eq 0} == 1) {
		loanPrd = 12;
	} else if(${data3.LOAN_PRD eq 0} == 2) {
		loanPrd = 36;
	} else if(${data3.LOAN_PRD eq 0} == 3) {
		loanPrd = 60;
	}
	//이자율
	var intrstRate = ${data3.INTRST_RATE} * 0.01;
	//이자율(월)
	var mIntrstRate = (intrstRate / 12);
	
	//월 납부액
	if(${data3.PRNCPL_PYMNT_MTHD_NUM} == 0 ) { // 원금 균등 상환
		$("#monthPymntAmnt").val(Math.round(loanAmnt / loanPrd));
		$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
	}
	if(${data3.PRNCPL_PYMNT_MTHD_NUM} == 1 ) { // 원리금 균등 상환
		var temp1 = Math.pow(1 + mIntrstRate, loanPrd) - 1;
		var temp2 = loanAmnt * mIntrstRate * Math.pow(1 + mIntrstRate, loanPrd);
		$("#monthPymntAmnt").val(Math.round(temp2 / temp1));
		$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
	}
	if(${data3.PRNCPL_PYMNT_MTHD_NUM} == 2 ) { // 만기 일시 상환
		$("#monthPymntAmnt").val("0");
		$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
	
	}
	
// 	계약 종료일
	var today = new Date();
	if(${param.loanPrd eq 0}) {
		today.setMonth(today.getMonth() + 6)
		document.getElementById("cntrctEdt").value = today.getFullYear() + lpad(today.getMonth() + 1, 2, 0) + lpad(today.getDate(), 2, 0);
	} else if(${param.loanPrd eq 1}) {
		today.setMonth(today.getMonth() + 12)
		document.getElementById("cntrctEdt").value = today.getFullYear() + lpad(today.getMonth() + 1, 2, 0) + lpad(today.getDate(), 2, 0);
	} else if(${param.loanPrd eq 2}) {
		today.setMonth(today.getMonth() + 36)
		document.getElementById("cntrctEdt").value = today.getFullYear() + lpad(today.getMonth() + 1, 2, 0) + lpad(today.getDate(), 2, 0);
	} else if(${param.loanPrd eq 3}) {
		today.setMonth(today.getMonth() + 60)
		document.getElementById("cntrctEdt").value = today.getFullYear() + lpad(today.getMonth() + 1, 2, 0) + lpad(today.getDate(), 2, 0);
	}
	
}); // JS end

/* **************************************** 상품 팝업 **************************************** */
function drawMdList() {
	var params = $("#popupMdForm").serialize();
	
	$.ajax({
		type : "post",
		url : "popupMdListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawList(list) {
	
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"popup_box_in\">                                                                                ";
		html += "	<input type=\"hidden\" id=\"mdnm\" value=\"" + data.MD_NAME + "\" />                                       ";
		html += "	<input type=\"hidden\" id=\"mdnum\" value=\"" + data.MD_NUM + "\" />                                       ";
		html += "	<input type=\"hidden\" id=\"ir\" value=\"" + data.INTRST_RATE + "\" />                                       ";
		html += "	<input type=\"hidden\" id=\"la\" value=\"" + data.LIMIT_AMNT + "\" />                                       ";
		html += "	<div class=\"popup_cc_box_left\">                                                                        ";
		html += "		<span class=\"company\"></span>                                                                      ";
		html += "	</div>                                                                                                   ";
		html += "	<div class=\"popup_cc_box_right\"><div class=\"md01\">" + data.MD_NUM + "</div>";
		html += "<span class=\"boldname\"><div class=\"md02\">" + data.MD_NAME + "</div></span>";
		html += "		<span class=\"limit_amnt\"><div class=\"md03\">" + data.MD_GRADE + "등급 / " + data.INTRST_RATE + "%</div></span>              ";
		html += "		<span class=\"sales_sts\">" + data.SALES_STS + "</span>                                          ";
		html += "	</div>                                                                                                   ";
		html += "</div>                                                                                                      ";
	}

	$(".popup_box_md").html(html);
	
	
	
	
}


function drawPaging(pb) {
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
	
	$(".pgn_area").html(html);

}
/* ************************************** 상품 팝업 END ************************************** */

// *************** 상품 목록 Ajax *************** 
function reloadMdList() {
	var params = $("#mdListForm").serialize();
	
	$.ajax({
		type : "post",
		url : "qtnMdListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			qtnMdList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

// 상품 목록 html
function qtnMdList(list) {
	
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"mdBox\">";
		html += "	<div class=\"md_nm\">" + data.MD_NAME + "</div>";
		html += "	<div class=\"md_intrst\">이자율: " + data.INTRST_RATE + "%</div>";
		html += "	<div class=\"md_grd\">한도금액: " + data.LIMIT_AMNT + "</div>";
		html += "	<div class=\"md_prd\">대출기간: " + data.LOAN_PRD + "</div>	";	
		html += "	<span class=\"md_btn\">";
		html += "		<span class=\"dtl\" id=\"dtl\">상세보기<input type=\"hidden\" id=\"mdNo\" name=\"mdNo\" value=\"" + data.MD_NUM + "\" /></span>";
		html += "	</span>";
		html += "</div>";
	}

	$(".md_bx").html(html);
}
// *************** 상품 목록 끝


function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}

</script>
</head>
<body>
<form action="#" id="mdNumForm" method="post" >
	<input type="hidden" id="no" name="no" /> <!-- 상품 번호 -->
</form>
<form action="#" id="mdListForm" method="post">
 <input type="hidden" name="ccn"  value="${lead.CLNT_CMPNY_NUM}" /> <!-- 고객사 등급 번호 -->
 <input type="hidden" id="getMdNum" name="no" /> <!-- 상품 번호 -->
</form>
	<form action="#" id="listForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
	</form>
	<form action="#" id="contForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
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
			<div class="page_title_text">영업관리 - 계약 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" /> 
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
					<!-- 시작 -->
					<div class="bot_title">
						<h3>영업기회<span id="sales_btn"><div class="up_btn" id="salesContBtn_s"></div></span></h3>
					</div>
					<div class="salesCont">
					<!-- 영업기회 -->
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
								<tr height="40">
									<td>
										<input type="button" class="btn" value="담당자 *" readonly="readonly" />
									</td>
									<td colspan="3" value="${data.MNGR_EMP_NUM}">
										<input type="text" class="txt2" id="mngrName" name="mngrName" value="${data.EMP_NAME}" readonly="readonly" />
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
										<select class="txt" id="expctdBsnsType" name="expctdBsnsType" disabled="disabled">
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
								<a href="resources/upload/${data.ATT_FILE_NAME}" download="${salesFileName}">${salesFileName}</a>
							</div> 
						</div>
						<!-- 끝 -->
					</div>
					<hr class="hr_bot" color="#4B94F2" width="925px">
					
						<!-- ******************* 제안 시작 ******************* -->

						<div class="bot_title">
							<h3>제안<span id="sgstn_btn"><div class="up_btn" id="sgstnContBtn_s"></div></span></h3>
						</div>
						<div class="sgstnCont">
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
										<input type="button" class="btn" value="대출 원인*" readonly="readonly" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum" disabled="disabled">
											<option value="0">사업확장</option>
											<option value="1">제품개발</option>
											<option value="2">토지매매</option>
											<option value="3">기타</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 규모*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" value="${data2.SGSTN_LOAN_SCALE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType" disabled="disabled">
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
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" value="${data2.SGSTN_LOAN_TIME}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" value="${data2.SGSTN_RDMPTN_TIME}" readonly="readonly" />
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
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" value="${data2.SGSTN_TOTAL_AMNT}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" value="${data2.SGSTN_DEBT_AMNT}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" value="${data2.SGSTN_AVG_RVN_AMNT}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" value="${data2.SGSTN_EMP_COUNT}" readonly="readonly" />
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
										<input type="button" class="btn" value="상세내용*" readonly="readonly" />
									</td>
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont" readonly="readonly">${data2.DTL_CONT}</textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" value="${data2.RMRKS}" readonly="readonly" />
									</td>
								</tr>
								<tr height="10"></tr>
							</tbody>
						</table>
						<!-- 첨부자료  -->
						<c:set var="dtlSFileLength" value="${fn:length(data2.ATT_FILE_NAME)}"></c:set>
						<c:set var="dtlSFileName" value="${fn:substring(data2.ATT_FILE_NAME, 20, dtlSFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부파일
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data2.ATT_FILE_NAME}"  download="${dtlSFileName}">${dtlSFileName}</a>
							</div>
						</div>
					</div>
<!-- *************************************** 견적 시작 *************************************** -->			
	<hr class="hr_bot" color="#4B94F2" width="925px">
	<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id= "mdNum" name="mdNum" /> <!-- 영업기회에서 가져온 영업번호 -->
					<div class="bot_title">
						<h3>견적<span id="qtn_btn"><div class="up_btn" id="qtnContBtn_s"></div></span></h3>
					</div>
					<div class="qtnCont">
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
								<td><input type="button" class="btn" value="견적명*" readonly="readonly" /></td>
								<td colspan="3"><input type="text" class="txt" id="qtnName" name="qtnName" value="${data3.QTN_NAME}" readonly="readonly" /></td>		
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="상품유형" readonly="readonly" /></td>
								<td colspan="3">
									<select class="txt" id="mdType" name="mdType" disabled="disabled">
										<option value="0">개인사업</option>
								 		<option value="1">법인사업</option>
								 		<option value="2">공공사업</option>
									</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="견적일*" readonly="readonly" /></td>
									<td colspan="3"><input type="date" class="txt" id="qtnDate" name="qtnDate" value="${data3.QTN_DATE}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출금액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="LoanAmnt" name="LoanAmnt" value="${data3.LOAN_AMNT}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="공급가액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="splyPrice" name="sqlyPrice" value="${data3.SPLY_PRICE}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="세액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="taxAmnt" name="taxAmnt" value="${data3.TAX_AMNT}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="합계액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="sumAmnt" name="sumAmnt" value="${data3.TOTAL}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="중도상환가능여부" readonly="readonly" /></td>
									<td>
										<select class="txt" id="prdmptn_psbl_check" name="prdmptnPsbl"  disabled="disabled">
											<option value="0">가능</option>
											<option value="1">불가능</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="부가세*" readonly="readonly" /></td>
									<td>
										<select class="txt" id="srtx" name="srtx" onchange="test(this);" disabled="disabled">
										 	<option value="0">미포함</option>
							 				<option value="1">포함</option>
							 				<option value="2">면세</option>
										</select>
									</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대출기간" readonly="readonly" /></td>
								<td>
									<select class="txt" id="loanPrd" name="loanPrd" disabled="disabled">
										<option value="0">6개월</option>
										<option value="1">1년</option>
										<option value="2">3년</option>
										<option value="3">5년</option>
									</select>	
								</td>
								
								<td><input type="button" class="btn" value="원금상환방식" readonly="readonly" /></td>
								<td colspan="2">
									<select class="txt" id="prncpl_pymnt" name="prncplPymnt" disabled="disabled">
										<option value="0">원금 균등 상환</option>
										<option value="1">원리금 균등 상환</option>
										<option value="2">만기 일시 상환</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자율(%)" /></td>
								<td><input type="text" class="txt" id="intrstRate" name="intrstRate" value="${data3.INTRST_RATE}" readonly="readonly" /></td>
								<td><input type="button" class="btn" value="납부일" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" id="pymntDate" name="pymntDate" value="${data3.PYMNT_DATE}" readonly="readonly" placeholder="매달    일" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="비고" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="rmks" name="rmksCont" value="${data3.RMKS}" readonly="readonly" /></td>
							</tr>							
						</tbody>
					</table>
					<!-- 첨부자료  -->
						<c:set var="qtnSFileLength" value="${fn:length(data3.ATT_FILE_NAME)}"></c:set>
						<c:set var="qtnSFileName" value="${fn:substring(data3.ATT_FILE_NAME, 20, qtnSFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부파일
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data3.ATT_FILE_NAME}" download="${qtnSFileName}">${qtnSFileName}</a>
							</div>
						</div>
				
					<!-- ********* 견적 끝 ********* -->					
			</div>		
<!-- ************************************************ 계약 시작 ************************************************ -->
				<hr class="hr_bot" color="#4B94F2" width="925px">
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id="cntrctEdt" name="cntrctEdt" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id= "mdNum" name="mdNum" />
					<div class="bot_title"><h3>계약<div class="drop_btn"></div></h3></div>
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사" /></td>
									<td><input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" /></td>
									<td><input type="button" class="btn" value="고객" /></td>
									<td><input type="text" class="txt"  value="${data.CLNT_NAME}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="입금계좌 소유주명*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="daoName" name="daoName" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="입금 은행명*" /></td>
									<td><select class="txt" id="dbNum" name="dbNum">
											<optgroup>
												<option value="9">선택하세요</option>
												<option value="0">카카오뱅크</option>
												<option value="1">국민은행</option>
												<option value="2">농협은행</option>
												<option value="3">신한은행</option>
												<option value="4">기업은행</option>
											</optgroup>
										</select></td>
									<td><input type="button" class="btn" value="입금 계좌번호*" /></td>
									<td><input type="text" class="txt" id="daNum" name="daNum" placeholder="'-'을 뺴고 입력해주세요" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="납입자명*" /></td>
									<td><input type="text" class="txt" id="payerName" name="payerName" /></td>
									<td><input type="button" class="btn" value="납입 계좌번호*" /></td>
									<td><input type="text" class="txt" id="paNum" name="paNum" placeholder="'-'을 뺴고 입력해주세요"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="월 납부액" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="monthPymntAmnt" name="monthPymntAmnt" readonly="readonly" /></td>
								<td><input type="button" class="btn" value="월 이자액" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="monthIntrstAmnt" name="monthIntrstAmnt" readonly="readonly" /></td>
							</tr>
						</tbody>
					</table>
					
					<!-- 첨부자료 -->
					<input type=file id="att" name="att" onchange="uploadName(this)" />
					<input type="hidden" id="attFile" name="attFile" />
					<div class="spc">
						<div class="adc_txt">
							첨부자료
							<img class="plus_btn att_btn" src="resources/images/sales/plus.png" />
						</div>
						<div class="cntrct_box_in">
							<input type="text" id="fileName" readonly="readonly" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- cont_wrap end -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>