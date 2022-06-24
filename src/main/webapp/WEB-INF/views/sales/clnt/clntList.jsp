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
.srch_table tr:nth-child(2) {
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
.list_table thead tr:nth-child(2) {
	border-bottom: 2px solid gray;
}
.list_table tbody tr:nth-child(2), .list_table tbody td:nth-child(1)  {
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
.deal{
	height: 40px;
}
.deal_cnt{
	position:relative;
	top: -15px;
	right: -5px;
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
	height: 328px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 검색구분
	if('${param.searchType}' != '') {
		$("#searchType").val("${param.searchType}");
	} else {
		$("#oldSearchType").val("0");
	}
	
	// 목록
	reloadList();
	
	// 페이지
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		$("#listSort").val("9");
		$("#searchType").val($("#oldSearchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		reloadList();
	});
	
	// 등록
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "clntReg");
		$("#actionForm").submit();
	});
	
	// 검색어
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click(); 
			return false; // event를 실행하지 않겠다.
		}
	});
	
	// 검색
	$("#searchBtn").on("click", function() {
		if($("#searchType").val() == 2) {
			if(isNaN($("#searchTxt").val())) {
				makeAlert("경고", popContOneLine("고객번호 검색시 숫자만 입력해주세요(CL01 -> 01)"), function() {
					$("#searchTxt").val("");
					$("#searchTxt").focus();
				});
			} else {
				$("#page").val("1");
				$("#oldSearchType").val($("#searchType").val());
				$("#oldSearchTxt").val($("#searchTxt").val());
				reloadList();
			}
		} else {
			$("#page").val("1");
			$("#oldSearchType").val($("#searchType").val());
			$("#oldSearchTxt").val($("#searchTxt").val());
			reloadList();
		}
	});
	
	// 정렬
	$("#sortBtn").on("click", function() {
		reloadList();
	});
	
});

// 고객 목록 Ajax
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clntListAjax",
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

// 검색 개수 html
function drawSearchCnt(listCnt) {
	var html = "";
	
	html += "<h3>"; 
	html += "고객 (검색결과: " + listCnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);
}

// 목록 html
function drawList(list) {
	var html = "";
		
	html += "<colgroup>";
	html += "<col width=\"70\">";		
	html += "<col width=\"90\">";		
	html += "<col width=\"150\">";		
	html += "<col width=\"150\">";		
	html += "</colgroup>";	
	html += "<thead>";	
	html += "<tr>";		
	html += "<th rowspan=\"2\">글번호</th>";			
	html += "<th>고객번호</th>";			
	html += "<th>부서 / 직책</th>";			
	html += "<th>이메일</th>";			
	html += "</tr>";		
	html += "<tr>";		
	html += "<th>고객사명</th>";			
	html += "<th>고객명</th>";			
	html += "<th>휴대폰 번호</th>";			
	html += "</tr>";		
	html += "</thead>";
	
 	for(var data of list) {
 		html += "<tbody>";
		html += "<tr>";
		html += "<td rowspan=\"3\">" + data.RNUM + "</td>";
		html += "<td>CL" + data.CLNT_NUM + "</td>";
		html += "<td>" + data.DEPT + " / " + data.DUTY + "</td>";
		html += "<td>" + data.EMAIL + "</td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.CLNT_CMPNY_NAME + "</td>";
		html += "<td cn=\"" + data.CLNT_NUM + "\">" + data.CLNT_NAME + "</td>";
		html += "<td>" + data.MBL + "</td>";
		html += "</tr>";
		html += "</tbody>";
	}
	
	$(".list_table").html(html);
	
	// 상세보기
	$(".list_table tbody").on("click", "tr:nth-child(2) td:nth-child(2)", function() {
		$("#cn").val($(this).attr("cn"));

		$("#actionForm").attr("action", "clntCont");
		$("#actionForm").submit();
	});

}

// 페이징
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
				<div class="page_title_text">고객 목록</div>
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
		<input type="hidden" id="cn" name="cn" />
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
				<div class="bodyWrap">
					<table class="srch_table">
						<colgroup>
							<col width="90" />
							<col width="60" />
							<col width="40" />
							<col width="60" />
							<col width="60" />
							<col width="60" />
							<col width="60" />
							<col width="60" />
							<col width="0" />
							<col width="55" />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<span class="srch_name">검색어</span>
								</td>
								<td>
									<select id="searchType" name="searchType">
										<option value="0">고객명</option>
										<option value="1">고객사명</option>
										<option value="2">고객번호</option>
									</select>
								</td>
								<td colspan="3">
									<input type="text" class="srch_msg" placeholder="검색어를 입력해주세요." id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
								</td>
								<td colspan="5">
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
										<option value="0">고객명</option>
										<option value="1">고객사명</option>
									</select>
								</td>
								<td>
									<img class="asc_btn cmn_btn" alt="정렬버튼" src="resources/images/sales/asc.png" id="sortBtn" />
								</td>
								<td colspan="7"></td>
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
				</div> <!-- bodyWrap end -->
			</div> <!-- cont_area end -->
		</div> <!--cont_wrap end -->
	</form>		
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>