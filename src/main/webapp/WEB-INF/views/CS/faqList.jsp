<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type = "text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
td:nth-child(3) {
	text-align: left;
	color: #222222;
	font-weight: bold;
	cursor: pointer;
}
td:nth-child(3):hover {
	color: #4B94F2;
	text-decoration: underline;
}
</style>
<script type = "text/javascript">
$(document).ready(function() {
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	} else {
		$("#oldSearchGbn").val("0");
	}
	
	//목록조회
	reloadList();
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
				
			return false;
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		
		// 목록 조회
		reloadList();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action", "faqdt");
		$("#actionForm").submit();
		
	});
	
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		reloadList();
	});
	
	
	$("#writeBtn").on("click", function() {
		$("#actionForm").attr("action", "faqAdd");
		$("#actionForm").submit();
	});	
	
});
function reloadList() { // 목록 조회용 + 페이징 조회용
	var params =  $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "faqListAjax", 
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
	
	for(var data of list) {
		html += "<tr no=\"" + data.FAQ_NUM + "\">";
		html += "<td>" + data.FAQ_NUM + "</td>";
		html += "<td>" + data.CTGRY_NAME + "</td>";
		html += "<td>" + data.WRTNG_TITLE + "</td>";
		html += "<td>" + data.EMP_NAME+ "</td>";
		html += "<td>" + data.WRTNG_DATE + "</td>";
		html+="<td>" + data.FAQ_HITS +"</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
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
	
	$("#pgn_area").html(html);
}
</script>
</head>
<body>
<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
	<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">FAQ</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="no" name="no" />
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="top" name="top" value="${param.top}"/>
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
						<select class="srch_sel" id="searchGbn" name="searchGbn">
							<option value="0">제목</option>
							<option value="1">작성자</option>
						</select>
						<div class="srch_text_wrap">
							<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
						</div>
						<div class="cmn_btn_ml" id="searchBtn">검색</div>
				</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="50"/>
					<col width="125"/>
					<col width="460"/>
					<col width="90"/>
					<col width="90"/>
					<col width="50"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area"></div>
				<div class="cmn_btn_ml" id="writeBtn">글쓰기</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>