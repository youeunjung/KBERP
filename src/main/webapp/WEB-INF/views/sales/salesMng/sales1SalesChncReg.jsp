<!-- 
	영업기회 등록 : sales1SalesChncReg
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
<title>영업기회 등록</title>
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
/* 담당자 팝업 끝 */

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
}

.btnImg_in {
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
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

#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
	text-indent: 12px;
    line-height: 40px;
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
/* 끝 */
</style>
<script type="text/javascript">
$(document).ready(function() {
	console.log("${ln.EMP_NUM}"); 
	
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
				func:function() {
					$("#listForm").attr("action", "salesList");
					$("#listForm").submit();
						console.log("One!");
						closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	// 저장 버튼
	$("#saveBtn").on("click", function() {
		if($("#loanCauseNum").val() == 9) {
			makeAlert("필수 항목 알림", popContOneLine("대출원인을 선택하세요."), function() {
				$("#loanCauseNum").focus();
			});
		} else if(isNaN($("#expctnLoanScale").val())) {
			makeAlert("알림", popContOneLine("예상 대출 규모는 숫자만 입력 가능합니다."), function() {
				$("#expctnLoanScale").val("");
				$("#expctnLoanScale").focus();
			});
		} else if($("#loanHopeType").val() == 9) {
			makeAlert("필수 항목 알림", popContOneLine("대출 희망 유형을 입력하세요."), function() {
				$("#loanHopeType").focus();
			});
		} else if($("#loanHopeTime").val() == 9) {
			makeAlert("필수 항목 알림", popContOneLine("대출 희망 시기를 입력하세요."), function() {
				$("#loanHopeTime").focus();
			});
		} else if($("#expctdBsnsType").val() == 9) {
			makeAlert("필수 항목 알림", popContOneLine("예정 사업 형태를 입력하세요."), function() {
				$("#expctdBsnsType").focus();
			});
		} else {
			var html = "";
			
			html += "<div class=\"popup_cont2\">저장하시겠습니까?</div>";
			
			makePopup({
				depth : 1,
				bg : false,
				bgClose : false,
				title : "알림",
				width : 400,
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
											// 물리파일명 보관
											if(res.fileName.length > 0) {
												$("#attFile").val(res.fileName[0]);
											}
											
											// 글 수정
											var params = $("#addForm").serialize();
											
											$.ajax({
												type : "post",
												url : "salesMng1ActionAjax/insert",
												dataType : "json",
												data : params,
												success : function(res) {
													if(res.res == "success") {
														$("#salesNum").val(res.seq); // 영업기회 등록 후 영업기회 상세보기로 이동할 때 필요.
														
														$("#listForm").attr("action", "sales1SalesChncCont");
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
											console.log(req.responseText);
										}
									}); // ajaxForm end
									addForm.submit();
									
								}
							}
						}); // makePopup depth2 end
						closePopup();
					}
				}, {
					name : "취소"
				}]
			}); // makePopup depth1 end
		} // else end
	});
	
	$(".att_btn").on("click", function() {
		$("#att").click();
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
		<input type="hidden" name="salesNum" id="salesNum" />
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
			<div class="page_title_text">영업관리 - 영업기회 등록</div>
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
					<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" name="top" value="${param.top}" />
						<input type="hidden" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" name="menuType" value="${param.menuType}" />

						<div class="bot_title">
							<h3>
								영업기회
							</h3>
						</div>
						<hr class="hr_bot" color="white" width="925px">
						<div class="page_cont_title_text">기본정보</div>
						<input type="hidden" name="leadNum" value="${param.leadNum}" />	
						<input type="hidden" name="lcn" value="${ln.CLNT_NAME}" />
						<input type="hidden" name="lccn" value="${ln.CLNT_CMPNY_NAME}" />
						<input type="hidden" name="llnum" value="${ln.LEAD_NUM}" />
						<input type="hidden" name="llname" value="${ln.LEAD_NAME}" />
						<input type="hidden" name="len" value="${ln.EMP_NUM}" />
						<input type="hidden" name="lren" value="${ln.RGSTRTN_EMP_NUM}" />
						<input type="hidden" name="lpsNum" value="${ln.PRGRS_STS_NUM}" />
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
										<input type="text" class="txt" readonly="readonly" value="${ln.LEAD_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${ln.CLNT_CMPNY_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${ln.CLNT_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사 등급" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${ln.GRADE_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="영업시작일*" />
									</td>
									<td colspan="3">
										<input type="date" class="txt" readonly="readonly" value="${tday}" />
									</td>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="담당자 *" readonly="readonly" />
									</td>
									<td colspan="3">
										<input type="text" class="txt2" id="mngrName" name="mngrName" value="${ln.EMP_NAME}" />
										<input type="hidden" id="mngrNum" name="mngrNum" />
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
										<select class="txt" id="loanCauseNum" name="loanCauseNum" required>
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
										<input type="button" class="btn" value="예상 대출 규모" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctnLoanScale" name="expctnLoanScale" placeholder="예상 대출 규모 금액을 입력하세요."/>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeType" name="loanHopeType" required>
											<optgroup>
												<option value="9">선택하세요</option>
												<option value="0">장기대출</option>
												<option value="1">단기대출</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 시기*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeTime" name="loanHopeTime" required>
											<optgroup>
												<option value="9">선택하세요</option>
												<option value="0">근시일 내</option>
												<option value="1">3개월 이후</option>
												<option value="2">6개월 이후</option>
												<option value="3">1년 이후</option>
											</optgroup>
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
										<input type="text" class="txt" id="expctdBsnsName" name="expctdBsnsName" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예정 사업 형태*" />
									</td>
									<td colspan="3">
										<select class="txt" id="expctdBsnsType" name="expctdBsnsType" required>
											<optgroup>
												<option value="9">선택하세요</option>
												<option value="0">민수 사업</option>
												<option value="1">관공 사업</option>
												<option value="2">기타</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmks" name="rmks" />
									</td>
								</tr>
							</tbody>
						</table>
						<br /> <br />
						<!-- 첨부자료  -->
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