<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 지출결의서관리 목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.srch_month {
	display: inline-block;
	vertical-align: top;
	height: 27px;
}

.mnthly_slct:focus {
	outline: 2px solid #F2CB05;
}

.board_table tbody td {
	color: black;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 목록 조회
	reloadList();
	
	
	$("#srchText").on("keypress", function(event) {
		if(event.keyCode == 13) {
			
			$("#searchBtn").click();
			
			return false;
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#searchTxt").val($("#srchText").val());
		$("#searchMonth").val($("#srchMonth").val());
		reloadList();
	});
	
	$("#pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	
	$("tbody").on("click", "#empName", function() {
		$("#empNum").val($(this).attr("empNum"));
		$("#empName").val($(this).attr("empName"));
		$("#mon").val($(this).attr("mon"));
		
		$("#actionForm").attr("action", "expnsRsltnadmnstrEmpMnthlyList");
		$("#actionForm").submit();
		
	});
	
	$("#srchMonth").on("change", function() {
		$("#searchMonth").val($("#srchMonth").val());
		$("#page").val("1");
		reloadList();
	});
	
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", // 전송 형태
		url : "expnsRsltnadmnstrAjax", // 통신 주소
		dataType : "json", // 받을 데이터 형태
		data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
		success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) { // 문제 발생 시 실행 함수
			console.log(request.responseText); // 결과 텍스트
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr>";
		html += "<td>" + data.DATE_MON + "</td>";
		html += "<td class=\"board_table_hover\" id=\"empName\" mon=\"" + data.DATE_MON + "\" empNum=\"" + data.EMP_NUM + "\" empName=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
		html += "<td>";
		if(data.IND != null) {
			html += data.IND;
		} else {
			html += "0";
		}
		html += " 원</td>";
		html += "<td>";
		if(data.CRP != null) {
			html += data.CRP;
		} else {
			html += "0";
		}
		html += " 원</td>";
		html += "<td>" + data.TOTAL + " 원</td>";
		html += "</tr>";
	}
	
	$("tbody").html(html);
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
		<input type="hidden" id="empNum" name="empNum">
		<input type="hidden" id="empName" name="empName">
		<input type="hidden" id="mon" name="mon">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
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
				<div class="page_title_text">지출결의서관리 목록</div>
				<div class="page_srch_area">
					<input type="month" class="srch_month" id="srchMonth" value="${param.searchMonth}">
					
					<div class="srch_text_wrap">
						<input type="text" placeholder="사원명" id="srchText"/ value="${param.searchTxt}">
					</div>
					<div class="cmn_btn_ml" id="searchBtn">검색</div>
				</div>
			</div>
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
				<div>
					<table class="board_table">
						<colgroup>
							<col width="180">
							<col width="180">
							<col width="180">
							<col width="180">
							<col width="180">
						</colgroup>
						<thead>
							<tr>
								<th>귀속연월</th>
								<th>사원명</th>
								<th>개인 지출 합계</th>
								<th>법인 지출 합계</th>
								<th>총 합계</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="board_bottom">
						<div class="pgn_area" id="pgn_area">
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>