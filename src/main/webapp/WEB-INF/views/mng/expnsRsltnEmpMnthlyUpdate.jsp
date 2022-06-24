<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 지출결의서 수정</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.expns_rsltn_dtl_view {
	border-collapse: collapse;
	font-size: 10.5pt;
	margin-bottom: 15px;
}

.expns_rsltn_dtl_view tbody td {
	border: 1px solid #DDDDDD;
	height: 40px;
}

.expns_rsltn_dtl_view td:nth-child(1) {
	text-align: center;
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

.expns_rsltn_dtl_view td:nth-child(2) {
	padding-left: 15px;
	display: table-cell;
	vertical-align: middle;
}

.btn_wrap {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 850px;
}

.atchd_file {
	display: inline-block;
	vertical-align: middle;
	width: 30px;
	height: 40px;
	background-image: url('resources/images/mng/dwnld_icon.png');
	background-position: center;
	background-repeat: no-repeat;
	background-size: 20px;
	cursor: pointer;
	position: relative;
}

.file_name {
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
}

.file_name:hover {
	color: #4B94F2;
	text-decoration: underline;
	cursor: pointer;
}
.board_table th {
	background-color: #F2F2F2;
}

.board_table tbody td {
	color: black;
	font-weight: normal;
}

.board_table .board_table_hover td {
	color: #222222;
	cursor: pointer;
}

.board_table .board_table_hover:hover {
	color: #4B94F2;
	font-weight: bold;
	text-decoration: underline;
}

.acnt_name_srch_table {
	border-collapse: collapse;
	font-size: 11pt;
	
}

.acnt_name_srch_table tr {
	height: 30px;
}

.acnt_name_srch_table td {
	text-align: left;
	padding: 5px 0px 5px 10px;
}

.acnt_name_srch_table input {
	width: 120px;
}


.acnt_name_srch_table {
	width: 325px;
}


</style>
<script type="text/javascript">


$(document).ready(function() {
	
	
	$("#srchBtn").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div class=\"acnt_name_srch_wrap\">";
		html += "<table class=\"acnt_name_srch_table\">";
		html += "<tbody>";
		html += "<tr>";
		html += "<td>계정명</td>";
		html += "<td><input type=\"text\" id=\"acntSrchTxt\"></td>";
		html += "<td><div class=\"cmn_btn\" id=\"acntSrchBtn\">검색</div></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
		html += "<div class=\"ctgr_list_wrap\">";
		html += "<div class=\"main_ctgr_wrap\">";
		html += "<div class=\"main_ctgr_name\">";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"130\">";
		html += "<col width=\"130\">";
		html += "<col width=\"130\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>계정 코드</th>";
		html += "<th>계정명</th>";
		html += "<th>적요</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"acntListTbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\" id=\"pgn_area\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 500,
			title : "계정명검색",
			contents : html,
			contentsEvent : function() {
				$("#sendSrchTxt").val("");
				
				reloadList();
				
				$("#pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					reloadList();
				});
				
				$("#acntSrchBtn").on("click", function() {
					$("#sendSrchTxt").val($("#acntSrchTxt").val());
					reloadList();
				});
				
				$("#acntSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#acntSrchBtn").click();
						
						return false;
					}
				});
				
				$("#acntListTbody").on("click", "#acntName", function() {
					console.log("click!");
					$("#acntCodeInput").attr("acntcode", $(this).attr("acntcode"));
					$("#acntCodeInput").val($(this).attr("name"));
					
					closePopup(1);
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup(1);
				}
			}
		});
	});
	
	$("#UpdateBtn").on("click", function() {
		
		
		if(checkEmpty("#acntCodeInput")) {
			alert("계정명을 입력하세요.")
			$("#acntCodeInput").focus();
		} else if(checkEmpty("#expns")) {
			alert("지출처를 입력하세요.")
			$("#expns").focus();
		} else if(checkEmpty("#amnt")) {
			alert("지출금액을 입력하세요.")
			$("#amnt").focus();
		} else if(checkEmpty("#date_hr")) {
			alert("지출일시를 입력하세요.")
			$("#date_hr").focus();
		} else if(checkEmpty("#rmrks")) {
			alert("비고를 입력하세요.")
			$("#rmrks").focus();
		} else {
			
			$("#sendAcntCode").val($("#acntCodeInput").attr("acntcode"));
			
			var updateForm = $("#updateForm");
			
			updateForm.ajaxForm({
				success : function(res) {
					// 물리파일명 보관
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);						
					}
					
					// 글 저장
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post", 
						url : "expnsRsltnAction/update", 
						dataType : "json", 
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
									$("#backForm").submit();
							} else {
								alert("수정 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
				},
				error : function(req) {
					console.log(req.responseText);
					console.log("ajaxForm 실패!");
					
				}
			});
			updateForm.submit(); // ajaxForm 실행	
		}
	});

	
	$("#CencleBtn").on("click", function() {

		history.back();
	});	
	
	
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}

function reloadList() {
	var params = $("#acntSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "expnsRsltnacntSrchAjax", 
		dataType : "json",
		data : params, 
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.ACNT_CODE + "</td>";
		html += "<td class=\"board_table_hover\" id=\"acntName\" acntcode=\"" + data.ACNT_CODE + "\" name=\"" + data.ACNT_NAME + "\">" + data.ACNT_NAME + "</td>";
		if(data.ABSTRCT != null) {
			html += "<td>" + data.ABSTRCT + "</td>";			
		} else {
			html += "<td>-</td>";
		}
		html += "</tr>";
	}
	
	$("#acntListTbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$("#pgn_area").html(html);
	
}


</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
		<input type="hidden" id="sendChitNum" name="sendChitNum" value="${param.sendChitNum}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="mnthly_slct" name="mnthly_slct" value="${param.mnthly_slct}">
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="top" name="top" value="${param.top}">
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}">
</form>

<form action="#" id="acntSrchForm" method="post">
		<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
		<input type="hidden" id="page" name="page" value="1">
</form>

	<form action="expnsRsltnEmpMnthly" id="backForm" method="post">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" name="sendChitNum" value="${param.sendChitNum}">
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
			<div class="page_title_text">지출결의서 수정</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<form action="fileUploadAjax" id="updateForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="sendAcntCode" name="sendAcntCode">
		<input type="hidden" name="sendChitNum" value="${param.sendChitNum}">
			<table class="expns_rsltn_dtl_view">
				<colgroup>
					<col width="150" />
					<col width="700" />
				</colgroup>
				<tbody class = "listTbody" id = "listTbody">
				<tr>
		<td>계정명</td>
		<td><input type= "text" id = "acntCodeInput" name= "acntCodeInput" readonly="readonly" value="${data.ACNT_NAME}" acntcode="${data.ACNT_NUM}" ><div class= "cmn_btn_ml" id = "srchBtn">계정명 검색</div></td>
		</tr>
		<tr>
		<td>지출처</td>
		<td><input type="text" id = "expns" name ="expns" value="${data.EXPNS}"></td>
		</tr>
		<tr>
		<td>지출금액</td>
		<td><input type="text" id ="amnt" name = "amnt" value ="${data.AMNT}"></td>
		</tr>
		<tr>
		<td>지출일시</td>
		<td><input type="date" id ="date_hr" name ="date_hr" value="${data.DATE_D}"></td>
		</tr>
		<tr>
		<td>지출유형</td>
		<td><select id = "expns_type" name="expns_type" value="${data.EXPNS_TYPE}">
		<option value ="법인">법인</option>
		<option value ="개인">개인</option>
		</select></td>
		</tr>
		<tr>
		<td>비고</td>
		<td><input type="text" id = "rmrks" name="rmrks" value="${data.RMRKS}"></td>
		</tr>
		<tr>
		<td>첨부파일</td>
		<td>
		<c:choose>
			<c:when test ="${empty data.ATT_FILE}">
				<input type ="file" name="att"/><br/>
				<input type ="hidden" id="attFile" name="attFile"/>
			</c:when>
			<c:otherwise>
				<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
				<c:set var="fileName" value ="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
					<span id="attName">${fileName}</span>
					<input type="button" value="첨부파일삭제" id ="fileDelBtn"/>
					<input type ="hidden" id="attFile" name="attFile" value ="${data.ATT_FILE}"/>
					<input type ="file" id ="att" name="att"/><br/>
			</c:otherwise>
		</c:choose>
		</td>
		</tr>
				</tbody>
			</table>
		</form>

			<div class="btn_wrap">	
					<div class="cmn_btn_ml" id="UpdateBtn">수정</div>		
					<div class="cmn_btn_ml" id="CencleBtn">취소</div>			
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>