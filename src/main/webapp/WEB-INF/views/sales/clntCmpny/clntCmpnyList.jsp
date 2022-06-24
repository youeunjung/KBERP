<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>카카오뱅크 ERP - 고객사</title>
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
.sts {
	display: inline-block;
	width: 100%;
	height: 30px;
	text-align: center;
	margin-top: 10px;
}
.sts_list {
	display: inline-block;
	vertical-align: middle;
	width: 110px;
	margin: 0 5px;
	padding: 8px 5px;
	font-size: 9pt;
	text-align: center;
	background-color: #f2f2f2;
	border-radius: 5px;
	border: none;
}
.sts_list_on {
	display: inline-block;
	vertical-align: middle;
	width: 110px;
	margin: 0 5px;
	padding: 8px 5px;
	font-size: 9pt;
	text-align: center;
	background-color: #F2B705;
	border-radius: 5px;
	border: none;
}
.tLine{
	background-color: #4B94F2;
	width: 927px;
	height: 3px;
	margin: 10px auto;
}
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px;
}
.srch_table tr {
	height: 50px;
}
.srch_table tr:nth-child(3) {
	height: 45px;
	border-top: 0.5px solid #d7d7d7;
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
.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
.SearchResult {
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
.list_table {
	border-collapse: collapse;
	background-color: #FFF;
	width: 100%;
	font-size: 9pt;
	text-align: left;
	table-layout: fixed;
}
.list_table thead th {
	font-weight: bold;
}
.list_table th, .list_table td  {
	height: auto;
	overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.list_table thead tr:nth-child(1) {
	border-top: 2px solid gray;
}
.list_table thead tr:nth-child(3) {
	border-bottom: 2px solid gray;
}
.list_table tbody tr:nth-child(3) {
	border-bottom: 1px solid gray;
}
.list_table thead tr:nth-child(1) th:nth-child(1), .list_table tbody tr:nth-child(1) td:nth-child(1) {
	text-align: center;
}
.list_table tbody tr:nth-child(2) td:nth-child(2) {
	font-weight: bold;
	font-size: 10pt;
}
.list_table tbody tr:nth-child(2) td:nth-child(2):hover {
	color: #4b94f2;
	cursor: pointer;
	font-size: 10pt;
	text-decoration: underline;
}
.deal_cnt{
	padding-left: 15px;
}
.sales_psbl_btn {
	display: inline-block;
	vertical-align: top;
	padding: 0px 10px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #4b94f2;
	border-radius: 2px;
	color: #f2f2f2;
	cursor: pointer;
}
.sales_psbl_btn:active {
	background-color: #2e83f2;
}
.cont_table {
	width: 927px;
	height: 244px;
}
.actionForm {
	width: 100%;
	height: 100%;
}
.sts_list:hover {
	font-weight: bold;
	cursor: pointer;
	background-color: #F2B705;
}
.sts_list:active {
   background-color: #F2CB05;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 고객사 분류
	if('${param.clntCmpnyClsfyNum}' != '') {
		$("#clntCmpnyClsfyNum").val('${param.clntCmpnyClsfyNum}');
	} else {
		$("#oldClntCmpnyClsfyNum").val("9");
	}
	
	// 검색분류
	if('${param.searchType}' != '') {
		$("#searchType").val('${param.searchType}');
	} else {
		$("#oldSearchType").val("0");
	}
	
	// 고객사
	reloadList();
	
	// 검색상단
	$(".sts").on("click", ".sts_list", function() {
		if($(this).attr("num") != "9") {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
			$(this).removeClass();
			$(this).addClass("sts_list_on");	
		} else {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
		}
		
		$("#page").val("1");
		$("#clntCmpnyClsfyNum").val($(this).attr("num"));
		$("#oldClntCmpnyClsfyNum").val($(this).attr("num"));
		$("#listSort").val("9");
		
		if($("#searchTxt").val() != "") { // 검색어 txt가 비어있지 않으면 초기화
			var txt = document.getElementById("searchTxt");
			txt.value = "";
			var oldtxt = document.getElementById("oldSearchTxt");
			oldtxt.value = "";
			
		}
		
		reloadList();
		
	});
	
	// 페이지
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		$("#clntCmpnyClsfyNum").val($("#oldClntCmpnyClsfyNum").val());
		$("#searchType").val($("#oldSearchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		reloadList();
	});
	
	// 등록
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyReg");
		$("#actionForm").submit();
	});
	
	// 검색어
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click(); 
			return false;
		}
	});
	
	// 검색
	$("#searchBtn").on("click", function() {
		var clsfyNum = $("#clntCmpnyClsfyNum").val();
		if($("#searchType").val() == 1){
			if(isNaN($("#searchTxt").val())) {
				makeAlert("알림", popContOneLine("고객사번호 검색시 숫자만 입력해주세요(CC01 -> 01)"), function() {
					$("#searchTxt").val("");
					$("#searchTxt").focus();
				});
			} else {
				if(clsfyNum != "9") {
					$(".sts").children(".sts_list_on").attr("class", "sts_list");
					$("#sts" + clsfyNum + "").removeClass();
					$("#sts" + clsfyNum + "").addClass("sts_list_on");
				} else {
					$(".sts").children(".sts_list_on").attr("class", "sts_list");
				}
				
				$("#page").val("1");
				$("#oldClntCmpnyClsfyNum").val($("#clntCmpnyClsfyNum").val());
				$("#oldSearchType").val($("#searchType").val());
				$("#oldSearchTxt").val($("#searchTxt").val());
				reloadList();
			}
		} else {
			if(clsfyNum != "9") {
				$(".sts").children(".sts_list_on").attr("class", "sts_list");
				$("#sts" + clsfyNum + "").removeClass();
				$("#sts" + clsfyNum + "").addClass("sts_list_on");
			} else {
				$(".sts").children(".sts_list_on").attr("class", "sts_list");
			}
			
			$("#page").val("1");
			$("#oldClntCmpnyClsfyNum").val($("#clntCmpnyClsfyNum").val());
			$("#oldSearchType").val($("#searchType").val());
			$("#oldSearchTxt").val($("#searchTxt").val());
			reloadList();
		}
	});
	
	/// 정렬
	$("#sortBtn").on("click", function() {
		reloadList();
	});
	
});

// 고객사 목록 ajax
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clntCmpnyListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawSearchCnt(res.listCnt);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
	
}

// 고객사 목록 개수
function drawSearchCnt(listCnt) {
	var html = "";
	html += "<h3>"; 
	html += "고객사 (검색결과: " + listCnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);
	
}

// 고객사 목록
function drawList(list) {
	var html = "";
	
	html += "<colgroup>";
 	html += "<col width=\"80\">";		
	html += "<col width=\"130\">";		
	html += "<col width=\"250\">";		
	html += "<col width=\"80\">";
	html += "</colgroup>";	
	html += "<thead>";	
	html += "<tr>";		
	html += "<th rowspan=\"3\">글번호</th>";			
	html += "<th>고객사번호</th>";			
	html += "<th>고객사 등급</th>";			
	html += "<th></th>";			
	html += "</tr>";		
	html += "<tr>";		
	html += "<th>고객사 분류</th>";			
	html += "<th>고객사명</th>";			
	html += "<th>거래횟수</th>";			
	html += "</tr>";		
	html += "<tr>";		
	html += "<th>매출</th>";			
	html += "<th>주소</th>";			
	html += "<th></th>";			
	html += "</tr>";		
	html += "</thead>";
	
 	for(var data of list) {
 		html += "<tbody>";
		html += "<tr>";
		html += "<td rowspan=\"3\">" + data.RNUM + "</td>";
		html += "<td>CC" + data.CLNT_CMPNY_NUM + "</td>";
		html += "<td>" + data.GRADE_NAME + "등급</td>";
		html += "<td rowspan=\"3\">";
		html += "<span class=\"deal_cnt\">" + data.CNT + "건</span>";
		html += "</td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.CLNT_CMPNY_CLSFY_NAME + "</td>";
		html += "<td ccn=\"" + data.CLNT_CMPNY_NUM + "\">" + data.CLNT_CMPNY_NAME + "</td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.RVN + "</td>";
		html += "<td>" + data.ADRS + "</td>";
		html += "</tr>";
		html += "</tbody>";
	}
 	
	$(".list_table").html(html);
	
	// 상세보기
	$(".list_table tbody").on("click", "tr:nth-child(2) td:nth-child(2)", function() {
		$("#ccn").val($(this).attr("ccn"));
		
		$("#actionForm").attr("action", "clntCmpnyCont");
		$("#actionForm").submit();
	});
	
}

// 고객사 페이징
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
</script>
</head>
<body>
<input type="hidden" id="oldClntCmpnyClsfyNum" value="${param.clntCmpnyClsfyNum}" />
<input type="hidden" id="oldSearchType" value="${param.searchType}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
<!-- top & left -->
<c:import url="/topLeft">
	<c:param name="top">${param.top}</c:param>
	<c:param name="menuNum">${param.menuNum}</c:param>
	<%-- board로 이동하는 경우 B 나머지는 M --%>
	<c:param name="menuType">${param.menuType}</c:param>
</c:import>
<form action="#" id="actionForm" method="post">
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">고객사 목록</div>
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
			<input type="hidden" id="ccn" name="ccn" />
			<input type="hidden" id="page" name="page" value="${page}" />
			<input type="hidden" name="top" value="${param.top}" />
			<input type="hidden" name="menuNum" value="${param.menuNum}" />
			<input type="hidden" name="menuType" value="${param.menuType}" />
			<div class="bodyWrap">
				<div class="sts">
					<div class="sts_list" id="sts9" num="9">전체: ${AllCnt}건</div>
					<div class="sts_list" id="sts0" num="0">거래고객사: ${CntrctCnt}건</div>
					<div class="sts_list" id="sts1" num="1">파트너사: ${PartnerCnt}건</div>
					<div class="sts_list" id="sts2" num="2">해지고객사: ${TmnCnt}건</div>
					<div class="sts_list" id="sts3" num="3">정지고객사: ${SspsCnt}건</div>
					<div class="sts_list" id="sts4" num="4">외국파트너사: ${ForeignCnt}건</div>
					<div class="sts_list" id="sts5" num="5">기타: ${EtcCnt}건</div>
				</div>
				<div class="tLine"></div>
				<table class="srch_table">
					<colgroup>
						<col width="130" />
						<col width="130" />
						<col width="320" />
						<col width="220" />
					</colgroup>
					<tbody>
						<tr>
							<td><span class="srch_name">고객사분류</span></td>
							<td><select id="clntCmpnyClsfyNum" name="clntCmpnyClsfyNum">
									<option value="9">전체</option>
									<option value="0">거래고객사</option>
									<option value="1">파트너사</option>
									<option value="2">해지고객사</option>
									<option value="3">정지고객사</option>
									<option value="4">외국파트너사</option>
									<option value="5">기타</option>
							</select></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><span class="srch_name">검색어</span></td>
							<td><select id="searchType" name="searchType">
									<option value="0">고객사명</option>
									<option value="1">고객사번호</option>
							</select></td>
							<td><input type="text" class="srch_msg" placeholder="검색어를 입력해주세요." id="searchTxt" name="searchTxt" value="${param.searchTxt}" /></td>
							<td><span class="cmn_btn" id="searchBtn">검색</span></td>
						</tr>
						<tr>
							<td><span class="srch_name">정렬</span></td>
							<td><select id="listSort" name="listSort">
									<option value="9">선택안함</option>
									<option value="0">매출</option>
									<option value="1">고객사명</option>
							</select></td>
							<td>
								<img class="asc_btn cmn_btn" alt="정렬버튼" src="resources/images/sales/asc.png" id="sortBtn" />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="SearchResult"></div>
				<div class="cont_table">
					<table class="list_table"></table>
				</div>
				<div class="body_bottom">
					<div class="board_bottom">
						<div class="pgn_area"></div>
						<div class="cmn_btn" id="addBtn">등록</div>
					</div>
				</div>
			</div>
		</div> 
	</div>
</form>		
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>