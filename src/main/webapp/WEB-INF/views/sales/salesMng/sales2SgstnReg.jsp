<!-- 
	제안 등록 : sales2SgstnReg
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
<title>제안 등록</title>
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
.cont_body {
	display: block;
	width: 1013px;
	height: 1013px;
	margin: auto;
}

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
	font-size: 10pt
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
	margin-left: 40px;
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

#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
}
[href] {
	color: black;
	text-decoration: none;
}
.salesCont {
	width: 927px;
	height: 1138px;
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
	
	// 제안 - 상세정보 - 첨부파일
	$(".att_btn").on("click", function() {
		$("#att").click();
	});
	
	// 저장 버튼
	$("#saveBtn").on("click", function() {
		if($("#sgstnloanCauseNum").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("대출 원인을 입력하세요."), function() {
				$("#sgstnloanCauseNum").focus();
			});
		} else if(checkEmpty("#sgstnLoanScale")) {
			makeAlert("필수 정보 알림", popContOneLine("대출 규모를 입력하세요."), function() {
				$("#sgstnLoanScale").focus();
			});
		} else if(isNaN($("#sgstnLoanScale").val())) {
			makeAlert("알림", popContOneLine("대출 규모는 숫자만 입력 가능합니다."), function() {
				$("#sgstnLoanScale").val("");
				$("#sgstnLoanScale").focus();
			});
		} else if($("#sgstnloanType").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("대출 유형을 선택하세요."), function() {
				$("#sgstnloanType").focus();
			});
		} else if(checkEmpty("#sgstnloanTime")) {
			makeAlert("필수 정보 알림", popContOneLine("대출 시기를 선택하세요."), function() {
				$("#sgstnloanTime").focus();
			});
		} else if(checkEmpty("#sgstnRdmptnTime")) {
			makeAlert("필수 정보 알림", popContOneLine("상환 시기를 선택하세요."), function() {
				$("#sgstnRdmptnTime").focus();
			});
		} else if($("#sgstnloanTime").val() > $("#sgstnRdmptnTime").val()) {
			makeAlert("알림", popContOneLine("상환 시기는 대출 시기보다 빠를 수 없습니다."), function() {
				$("#sgstnRdmptnTime").focus();
			});
		} else if(checkEmpty("#sgstnTotalAmnt")) {
			makeAlert("필수 정보 알림", popContOneLine("자산 총액을 입력하세요."), function() {
				$("#sgstnTotalAmnt").focus();
			});
		} else if(isNaN($("#sgstnTotalAmnt").val())) {
			makeAlert("알림", popContOneLine("자산 총액은 숫자만 입력 가능합니다."), function() {
				$("#sgstnTotalAmnt").val("");
				$("#sgstnTotalAmnt").focus();
			});
		} else if(checkEmpty("#sgstnDebtAmnt")) {
			makeAlert("필수 정보 알림", popContOneLine("부채액을 입력하세요."), function() {
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
			makeAlert("필수 정보 알림", popContOneLine("상세내용을 입력하세요."), function() {
				$("#dtlCont").focus();
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
												url : "salesMng2ActionAjax/insert",
												dataType : "json",
												data : params,
												success : function(res) {
													if(res.res == "success") {
														$("#listForm").attr("action", "sales2SgstnCont");
														$("#listForm").submit();
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
			});
		} // else end
	});
	
	// 선택박스 초기값
	$("#loanCauseNum").val(${loan.LOAN_CAUSE_NUM}).prop("selected", true);
	$("#loanHopeType").val(${loan.LOAN_HOPE_TYPE}).prop("selected", true);
	$("#loanHopeTime").val(${loan.LOAN_HOPE_TIME}).prop("selected", true);
	$("#expctdBsnsType").val(${bsns.EXPCTD_BSNS_TYPE}).prop("selected", true);	
	
	
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
	
}); // JS end

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
	<form action="#" id="listForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" name="salesNum" value="${param.salesNum}" />
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
			<div class="page_title_text">영업관리 - 제안 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" /> <img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
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
										<input type="text" class="txt" readonly="readonly" value="${lead.LEAD_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.CLNT_CMPNY_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.CLNT_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사 등급" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.GRADE_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="영업시작일*" />
									</td>
									<td colspan="3">
										<input type="date" class="txt" readonly="readonly" value="${lead.START_DATE}" />
									</td>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="담당자 *" readonly="readonly" />
									</td>
									<td colspan="3" value="${lead.MNGR_EMP_NUM}">
										<input type="text" class="txt2" id="mngrName" name="mngrName" value="${lead.EMP_NAME}" readonly="readonly" />
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
										<input type="text" class="txt" id="expctnLoanScale" name="expctnLoanScale" value="${loan.EXPCTN_LOAN_SCALE}" readonly="readonly" />
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
										<input type="text" class="txt" id="expctdBsnsName" name="expctdBsnsName" value="${bsns.EXPCTD_BSNS_NAME}" readonly="readonly" />
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
										<input type="text" class="rmks" id="rmks" name="rmks" value="${bsns.RMKS}" readonly="readonly" />
									</td>
								</tr>
							</tbody>
						</table>
						<br /> <br />
						<!-- 첨부자료  -->
						<c:set var="salesFileLength" value="${fn:length(bsns.ATT_FILE_NAME)}"></c:set>
						<c:set var="salesFileName" value="${fn:substring(bsns.ATT_FILE_NAME, 20, salesFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부파일
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${bsns.ATT_FILE_NAME}"  download="${salesFileName}">${salesFileName}</a>
							</div>
						</div>
					</div>
						<!-- 끝 -->
					<hr class="hr_bot" color="#4B94F2" width="925px">
					<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
						<!-- ******************* 제안 시작 ******************* -->

						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" name="top" value="${param.top}" />
						<input type="hidden" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" name="menuType" value="${param.menuType}" />
						<input type="hidden" id="salesNum" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->

						<div class="bot_title">
							<h3>
								제안
							</h3>
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
										<input type="button" class="btn" value="대출 원인*" readonly="readonly" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum" required>
											<optgroup>
												<option value="9">선택하세요</option>
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
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" placeholder="대출 규모 금액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType" required>
											<optgroup>
												<option value="9">선택 하세요</option>
												<option value="0">장기 대출</option>
												<option value="1">단기 대출</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" required />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" required />
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
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" required placeholder="자산 총액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" required placeholder="부채액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" placeholder="ex. 매출액(2021년기준) , 매출액(최근 3개월 기준)" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" placeholder="사원수를 입력하세요." />
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
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont" placeholder="상세 내용 입력란입니다."></textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" />
									</td>
								</tr>
								<tr height="10"></tr>
							</tbody>
						</table>
						<!-- 첨부자료  -->
						<input type=file id="att" name="att" onchange="uploadName(this)">
						<input type="hidden" id="attFile" name="attFile" />
						<div class="spc">
							<div class="adc_txt">
								첨부자료 <img class="plus_btn att_btn" src="resources/images/sales/plus.png" />
							</div>
							<div class="cntrct_box_in">
								<input type="text" id="fileName" readonly="readonly" />
							</div>
						</div>
					</form>
					<!-- 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- cont_wrap end -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>