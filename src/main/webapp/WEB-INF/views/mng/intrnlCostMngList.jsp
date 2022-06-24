<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 내부비용관리 목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.mnthly_slct_wrap {
	width: calc(100% - 400px);
	display: inline-block;
	vertical-align: top;
	text-align: right;
}

.mnthly_slct {
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

.srch_year {
	width: 120px;
	height: 30px;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	
	
	drawOption();
	reloadList();
	
	$("#srchYear").on("change", function() {
		$("#page").val("1");
		$("#year").val($("#srchYear").val());
		reloadList();
	});
	
	$("tbody").on("click", "#clickMon", function() {
		$("#mon").val($(this).attr("mon"));
		$("#actionForm").attr("action", "intrnlCostMngMnthlyList")
		$("#actionForm").submit();
	});
	
	$("#pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "intrnlCostMngAdd");		
		$("#actionForm").submit();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "intrnlCostMngAjax",
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
		html += "<td class=\"board_table_hover\" id=\"clickMon\" mon=\"" + data.DATE_MON +  "\">" + data.DATE_MON + "</td>";
		html += "<td>" + data.AMNT_SUM + " 원</td>";
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

function drawOption() {
	var now = new Date();
	var nyear = now.getFullYear();
	
	for(var sy = 2010; sy <= nyear; sy++) {
		$("#srchYear").append("<option value=\"" + sy + "\">" + sy + "년</option>");
	}
	
	if("${param.year}" != "") {
		$("#srchYear").val("${param.year}");
		$("#year").val("${param.year}");
		
	} else {
		$("#srchYear").val(nyear);
		$("#year").val(nyear);
		
	}
	
}

</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="year" name="year">
		<input type="hidden" id="mon" name="mon">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" name ="backCheck" value="0">
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
			<div class="page_title_text">내부비용관리 목록</div>
			<div class="mnthly_slct_wrap">
				<select id="srchYear" class="srch_year" name="srchYear"></select>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="450">
					<col width="450">
				</colgroup>
				<thead>
					<tr>
						<th>전표귀속연월</th>
						<th>총 합계</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area">
				</div>
				<div class="cmn_btn" id="addBtn">신규</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>