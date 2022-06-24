<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 지출결의서관리 사원별 월별 목록</title>
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
	display : inline-block;
	vertical-align: top;
	text-align: right;
	display: inline-block;
}

.mnthly_slct {
	display: inline-block;
	vertical-align: top;
	height: 27px;
}

.emp_name{
	font-size: 11pt;
	font-weight: bold;
	margin-bottom: 10px;
	display: inline-block;
	vertical-align: top;
}

.date_expense_rsltn_wrap {
	width: 100%;
	height: 500px;
}

.total {
	border-collapse:  collapse;
	font-size: 15px;
	margin: 20px 0 20px;
	overflow: scroll
}

.total td {
	border: 1px solid #DDDDDD;
}

.total td:nth-child(1) {
	background-color: #F2F2F2;
	height: 50px;
	font-weight: bold;
	text-align: center;
}

.total td:nth-child(2) {
	text-align: center;
}

.btn_wrap {
	width: 100%;
	text-align: right;
	padding-bottom: 20px;
}

.board_table tbody td {
	color: black;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	
	$("#pgn_area").on("click", "div", function() {
		$("#page2").val($(this).attr("page"));
		reloadList();
	});
	
	$("#listTbody").on("click", "#chitNum", function() {
		$("#sendChitNum").val($(this).attr("chitnum"));
		
		$("#actionForm").attr("action", "expnsRsltnadmnstrEmpMnthly");
		$("#actionForm").submit();
	});
	
	$("#previousBtn").on("click", function() {
		$("#actionForm").attr("action", "expnsRsltnadmnstr");
		$("#actionForm").submit();
		
		
	});
	
	$("#mnthly_slct").on("change", function() {
		$("#mon").val($("#mnthly_slct").val());
		$("#searchMonth").val(null);
		$("#searchTxt").val(null);
		$("#page").val("1");
		
		// 목록 조회
		reloadList();
	});
	
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", // 전송 형태
		url : "expnsRsltnadmnstrEmpMnthlyListAjax", // 통신 주소
		dataType : "json", // 받을 데이터 형태
		data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
		success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
			drawSum(res.data);
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
		html += "<td>" + data.EXPNS_DATE + "</td>";
		html += "<td class=\"board_table_hover\" id=\"chitNum\" chitnum=\"" + data.CHIT_NUM + "\">" + data.CHIT_NUM + "</td>";
		html += "<td>" + data.EXPNS_TYPE + "</td>";
		html += "<td>" + data.AMNT + " 원</td>";
		html += "<td>" + data.EXPNS + "</td>";
		html += "<td>" + data.ACNT_NAME + "</td>";
		html += "</tr>"
	}
	
	$("#listTbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#page2").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page2").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page2").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#page2").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page2").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$("#pgn_area").html(html);
	
}

function drawSum(data) {
	var html = "";
	
	html += "<tr>";
	html += "<td>개인 지출 합계</td>";
	if(data != null) {
		if(data.IND) {
			html += "<td>" + data.IND + " 원</td>";
		} else {
			html += "<td>0 원</td>";
		}
	} else {
		html += "<td> 0원</td>";
	}
	html += "</tr>";
	
	html += "<tr>";
	html += "<td>법인 지출 합계</td>";
	if((data != null) ? data.CRP : undefined) {
		html += "<td>" + data.CRP + " 원</td>";
	} else {
		html += "<td>0 원</td>";
	}
	html += "</tr>";
	html += "<tr>";
	html += "<td>총 합계</td>";
	if((data != null) ? data.TOTAL : undefined) {
		html += "<td>" + data.TOTAL + " 원</td>";
	} else {
		html += "<td> 0원</td>";
	}
	html += "</tr>";
	
	$("#totalTbody").html(html);
	
}

</script>
</head>
<body>

	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="empNum" name="empNum" value="${param.empNum}">
		<input type="hidden" id="empName" name="empName" value="${param.empName}">
		<input type="hidden" id="sendChitNum" name="sendChitNum">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="page2" name="page2" value="${page2}" />
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
			<div class="page_title_text">지출결의서관리 사원별 월별 목록</div>
			<div class="mnthly_slct_wrap">
				<input type="month" class="mnthly_slct" id="mnthly_slct" value="${param.mon}" />
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
				<div class="emp_name">
					<div>사원명 : ${param.empName}</div>
				</div>
				<div>
					<table class="board_table">
						<colgroup>
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="150">
						</colgroup>
						<thead>
							<tr>
								<th>지출일</th>
								<th>전표번호</th>
								<th>유형</th>
								<th>금액</th>
								<th>지출처</th>
								<th>계정명</th>
							</tr>
						</thead>
						<tbody id="listTbody">
						</tbody>
					</table>
					
					<div class="board_bottom">
						<div class="pgn_area" id="pgn_area">
						</div>
					</div>
					
					<table class="total">
						<colgroup>
							<col width="200">
							<col width="700">
						</colgroup>
						<tbody id="totalTbody">
						</tbody>
					</table>
					<div class="btn_wrap">
					<div class="cmn_btn" id="previousBtn">전체 목록</div>
					</div>
				</div>
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>