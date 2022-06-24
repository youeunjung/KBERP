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
<title>카카오뱅크 ERP - 고객</title>
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
	margin: 20px auto;
}
table {
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4) {
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3) {
	text-align: center;
}
.btn {
	width : 90px;
	height: 40px;
}
.btn {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
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
.imgPos {
	position: relative;
}
.plus_btn:hover {
	cursor: pointer;
}
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	font-size: 10pt;
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
	display: none;
}
#fileName {
	border: hidden;
	outline: none;
}
.btnImg_in {
    position: absolute;
    left: 691px;
    top: 4px;
    width: 25px;
    cursor: pointer;
}
.imgName {
	padding-right: 30px;
}
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
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 목록
	$("#listBtn").on("click", function() {
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "알림",
			contents : popContTwoLine("나가면 저장되지않습니다.<br/>나가시겠습니까?"),
			buttons : [{
				name : "나가기",
				func:function() {
					$("#listForm").attr("action", "clntList");
					$("#listForm").submit();
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
		
	});
	
	// (팝업)고객사
	$("#ccPop").on("click", function() {
		var html = "";
		
	 	html += "<form action=\"#\" id=\"popupForm\">";
		html += " <div class=\"popup_title_mid\">                                                   ";
	 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += " <div class=\"ptm_left\">                                                          ";
		html += " 	<div class=\"ptm_left_top\">고객사명</div>		                              ";
		html += " 	<div class=\"ptm_left_bot\">고객사분류</div>		                              ";
		html += " </div>                                                                          ";
		html += " <div class=\"ptm_mid\">                                                           ";
		html += " 	<div class=\"ptm_mid_top\">                                                     ";
		html += " 		<input type=\"text\"  class=\"text_size2\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"검색어를 입력해주세요\" /> ";
		html += " 	</div>		                                                                  ";
		html += " 	<div class=\"ptm_mid_bot\">                                                     ";
		html += " 		<select class=\"sel_size\" name=\"searchType\">                                                 ";
		html += " 			<option value=\"9\">선택안함</option>                                             ";
		html += " 			<option value=\"0\">거래고객사</option>                                           ";
		html += " 			<option value=\"1\">파트너사</option>                                             ";
		html += " 			<option value=\"2\">해지고객사</option>                                           ";
		html += " 			<option value=\"3\">정지고객사</option>                                           ";
		html += " 			<option value=\"4\">외국고객사</option>                                           ";
		html += " 			<option value=\"5\">기타</option>                                                 ";
		html += " 		</select>                                                                 ";
		html += " 	</div>	                                                                      ";
		html += " </div>                                                                          ";
		html += " <div class=\"cmn_btn popCmnBtn\">검색</div>                                           ";
		html += " </div>";
		html += "</form>";
		html +=	"<div class=\"popup_box_cc\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		makePopup({
			depth : 1,
			bg : false,
			width : 600,
			height : 524,
			title : "고객사 조회",
			contents : html,
			contentsEvent : function() {
				
				drawCcList();
				
				$("#searchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						$(".popCmnBtn").click(); 
						return false; // event를 실행하지 않겠다.
					}
				});
				
				$(".popCmnBtn").on("click", function() {
					$("#page").val("1");
					drawCcList();
				});
				
				$(".popup_box_cc").on("click", ".popup_cc_box_in", function() {
					var cnn = $(this).children("#cnn").val(); 
					var ccn = $(this).children("#ccn").val(); 
					document.getElementById("ccName").value = cnn;
					document.getElementById("ccNum").value = ccn;
					closePopup();
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					drawCcList();
				});
				
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup();
				}
			}
		});
	});	

	// (팝업)담당자
	$("#mngPop").on("click", function() {
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
		html += "<option value=\"6\">영업1팀</option>";
		html += "<option value=\"7\">영업2팀</option>";
		html += "<option value=\"8\">영업3팀</option>";
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
					$("#mngEmp").val(mng);
					$("#mngNum").val(mge);
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
					closePopup();
				}
			}
		});
		
	});

	// 파일업로드
	$(".aff_btn").on("click", function() {
		$("#att").click();
	});
	
	// 등록
	$("#addBtn").on("click", function() {
		if(checkEmpty("#cName")) {
			makeAlert("필수 정보 입력", popContOneLine("고객을 입력하세요"), function() {
				$("#cName").focus();
			});
		} else if(checkEmpty("#ccName")) {
			makeAlert("필수 정보 입력", popContOneLine("고객사를 입력하세요"), function() {
				$("#ccName").focus();
			});
		} else if(checkEmpty("#mbl")) {
			makeAlert("필수 정보 입력", popContOneLine("휴대폰번호를 입력하세요"), function() {
				$("#mbl").focus();
			});
		}  else if(isNaN($("#mbl").val())) {
			makeAlert("알림", popContOneLine("휴대폰 번호는 숫자만 입력가능합니다."), function() {
				$("#mbl").val("");
				$("#mbl").focus();
			});
		} else {
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : popContOneLine("저장하시겠습니까?"),
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "저장",
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
									url : "clntMngAjax/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#cn").val(res.seq);
											
											$("#listForm").attr("action", "clntCont");
											$("#listForm").submit();
										} else {
											makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
										}
									},
									error : function(request, status, error) {
										console.log(request.responseText);
									}
								}); // ajax End
								
							},
							error : function(req) {
								console.log(req.responseText);
							}
						}); // ajaxForm End
						
						addForm.submit();
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
				
		}
	});
});

// (팝업)고객사 ajax
function drawCcList() {
	var params = $("#popupForm").serialize();
	
	$.ajax({
		type : "post",
		url : "popupCcListAjax",
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

// (팝업)고객사 목록
function drawList(list) {
	var html = "";

	for(var data of list) {                                                                               
		html += "<div class=\"popup_cc_box_in\" id=\"box\">                                                               ";
		html += "<input type=\"hidden\" id=\"cnn\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"ccn\" value=\"" + data.CLNT_CMPNY_NUM + "\" />";
		html += "<div class=\"popup_box_left\">                                                          ";
		html += "	<span class=\"company\"></span>                                                         ";
		html += "</div>                                                                                   ";
		html += "<span class=\"popup_cc_box_right\">                                                        ";
		html += "	<span class=\"boldname\">" + data.CLNT_CMPNY_NAME + " / " +  data.CLNT_CMPNY_CLSFY_NAME + " / " + data.GRADE_NAME + "</span><br/>                 ";
		html += "	<span class=\"adrs_name\">" + data.ADRS + "</span><br/>                                              ";
		html += "	<span class=\"clntCmpny_dt\">" + data.RGSTRTN_DATE + "</span>                                  ";
		html += "</span>                                                                                  ";
		html += "</div>                                                                           ";
	}                                                                                                     
	                      
	$(".popup_box_cc").html(html);
	
}

// (팝업)고객사 페이징
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

// (팝업)담당자 ajax
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

// (팝업)담당자 목록
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

// (팝업)담당자 페이징
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

// 파일명
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
<form action="#" id="listForm" method="post">
	<input type="hidden" name="cn" id="cn" />
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
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
			<div class="page_title_text">고객 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="등록버튼" src="resources/images/sales/save.png" class="btnImg" id="addBtn" />
			<!-- 검색영역 선택적 사항 -->
			<!-- <div class="page_srch_area">
				<select class="srch_sel">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" />
				</div>
				<div class="cmn_btn_ml">검색</div>
			</div> -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" name="top" value="${param.top}" />
					<input type="hidden" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" name="menuType" value="${param.menuType}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" id="cName" name="cName" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="ccName" name="ccName" readonly="readonly" />
										<input type="hidden" id="ccNum" name="ccNum" />
										<img class="btnImg_in" id="ccPop" alt="팝업" src="resources/images/sales/popup.png">
									</div>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="부서" /></td>
								<td><input type="text" class="txt" id="dept" name="dept" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="직책" /></td>
								<td><input type="text" class="txt" id="duty" name="duty" /></td>								
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="휴대폰 번호*" /></td>
								<td><input type="text" class="txt" id="mbl" name="mbl" placeholder="'-' 를 포함하지 않은 숫자만 입력해주세요." /></td>																
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="메일" /></td>
								<td><input type="text" class="txt" id="email" name="email" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="담당자 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="mngEmp" name="mngEmp" readonly="readonly" />
										<input type="hidden"id="mngNum" name="mngNum" />
										<img class="btnImg_in" id="mngPop" alt="팝업" src="resources/images/sales/usericon.png">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<input type="file" id="att" name="att" onchange="uploadName(this)" />
					<input type="hidden" id="attFile" name="attFile" />
					<div class="rvn_txt"> 첨부파일
						<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" />
					</div>
					<div class="cntrct_box_in">
						<input type="text" id="fileName" name="fileName" readonly="readonly" />
					</div>
				</form>	
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>