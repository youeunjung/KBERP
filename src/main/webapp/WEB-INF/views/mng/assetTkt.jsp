<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP 승인관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">

.cmn_btn{
	border: none;
}

#searchTxt {
	height : 21px;
	margin-right: 5px;
	margin-top: 2px;
}
#searchGbn {
	height : 27px;
	margin-right: 5px;
	margin-top: 2px;
}

 tbody td:nth-child(2):hover {
 	text-decoration: underline;
 	cursor: pointer;
 }

th {
	font-size: 11pt;
}

.cont_wrap {
	width: 900px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	if('${param.searchGbn}' != '') { // 넘어오는 값을 확인해서 비어있지 않다면 검색구분을 유지
		$("#searchGbn").val('${param.searchGbn}');
	} else {
		$("#searchGbn").val("0");
	}
	
	reloadList();
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13) {	
			$("#searchBtn").click();
			
			return false;
		}
	});
	
	$("#searchBtn").on("click", function() { 
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		reloadList();
	});

	$("tbody").on("click", "#click", function() {
		$("#num").val($(this).attr("num"));
		$("#tktnum").val($(this).attr("tktnum"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action", "assetTktDtlView");
		$("#actionForm").submit();	
	});
	
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		
		
		reloadList();
	});	
	
	$("#rgstrtnBtn").on("click", function() {
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action", "assetTktRgstrtn");
		$("#actionForm").submit();
});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", 
		url : "assetTktAjax", 
		dataType : "json",
		data : params, 
		success : function(res) { 
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
				},
		error : function(result, status, error) {
			console.log(result.responseText);

		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr>";
		html += "<td>" + data.ASSET_NUM + "</td>";
		html += "<td id=\"click\" tktnum=\""+ data.TKT_NUM +"\" num=\""+ data.ASSET_NUM +"\">" + data.ASSET_NAME + "</td>";
		if(data.QUNTY_DVSN_NUM == 0 )
			html += "<td>" + data.QUNTY +"ea</td>";
		else if(data.QUNTY_DVSN_NUM == 1)
			html += "<td>" + data.QUNTY +"set</td>";
		else
			html += "<td>" + data.QUNTY +"box</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.TKT_DATE + "</td>";
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
	
	$(".pgn_area").html(html);

}


</script>
</head>
<body>
		<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}"/>
		<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}"/>
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
			<div class="page_title_text">자산목록</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					<input type="hidden" id="page" name="page" value="${page}"/>
					<input type="hidden" id="num" name="num"/>
					<input type="hidden" id="tktnum" name="tktnum"/>
					
					<select id="searchGbn" name="searchGbn">
						<option value="0">자산명</option>
						<option value="1">사용자명</option>
					</select>
						<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
						<input class="cmn_btn" type="button" value="검색" id="searchBtn"/>
						
									
				</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="200"/>
					<col width="200"/>
					<col width="200"/>
					<col width="200"/>
					
				</colgroup>
				<thead>
					<tr>
						<th>자산번호</th>
						<th>자산명</th>
						<th>수량</th>
						<th>사용자</th>
						<th>반출일</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div>
			<div class="board_bottom">
				<div class="pgn_area"></div>
				<c:if test="${sAthrtyNum==0}">
				<input class="cmn_btn" type="button" value="등록" id="rgstrtnBtn"/>
				</c:if>
				<c:if test="${sAthrtyNum==1}">
				<input class="cmn_btn" type="button" value="등록" id="rgstrtnBtn"/>
				</c:if>
				<c:if test="${sAthrtyNum==6}">
				<input class="cmn_btn" type="button" value="등록" id="rgstrtnBtn"/>
				</c:if>
				<c:if test="${sAthrtyNum==7}">
				<input class="cmn_btn" type="button" value="등록" id="rgstrtnBtn"/>
				</c:if>
			</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>