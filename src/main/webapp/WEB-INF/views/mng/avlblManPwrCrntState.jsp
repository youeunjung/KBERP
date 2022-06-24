<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />

<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1100px;
	
}
/* 개인 작업 영역 */
#calendar{
	display:inline-block;
	width: 500px;
	height: 500px;
	font-size: 11pt;
	vertical-align: top;
}
#emp_box{
	font-size:11pt;
	display:inline-block;
	width: 500px;
	height:597px;
	border: 1px solid #DDD;
	line-height: 40px;
	overflow:auto;
	background-color: #fff;
	text-align: center;
	margin-left: 25px;
	
}
.title{
	display: inline-block;
}
#titleLine{
	background-color: #F2F2F2;
}
</style>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>


<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
var data = [
		
        {
            title: 'All Day Event',
            start: '2019-01-01',
            color : 'yellow', // 기타 옵션들
			textColor : 'black',
          },
          {
            title: 'Long Event',
            start: '2019-01-07',
            end: '2019-01-10'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-09T16:00:00'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-16T16:00:00'
          },
          
        ];
		
	
	$("#fullCalendarArea").fullCalendar({
		header: {
	        left: 'prev,next today',
	        center: 'title',
	      },
	      locale: "ko",
	      height: 600,
	      events: data,
	      selectable: true,
	      unselectAuto: false,
		  selectAllow: function (selectInfo) {
			    return selectInfo.end.diff(selectInfo.start, 'days') == 1;
		  },
	      dayClick: function(date, js, view) { // 일자 클릭
	    	  console.log(date.format('YYYY-MM-DD'));
	    	  $("input[name='selectDate']").val(date.format('YYYY-MM-DD'));
	    	  $("#selectDateView").text($("#selectDate").val()); 
	    	  reloadList();
	    	  
	      }
	});
	
});
function reloadList() { //목록 조회용
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "avlblMnpwrAjax",
		dataType : "json",
		data : params,
		success : function(res){ 
			console.log(res);			
			$("#empCnt").text(res.cnt); 
			drawList(res.list);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		html += "<tr>";
		html += "<td>" + data.DEPT_NAME + "</td>";
		html += "<td>" + data.RANK_NAME + "</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "</tr>";
	}
	$("#empTbody").html(html);
	
}

function cnt(cnt){
	
	
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
	<!-- 내용영역 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
		
	<input type="hidden" id="selectDate" name="selectDate" value="${param.selectDate}"/>
</form>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">가용인력 현황</div>
			<!-- 검색영역 선택적 사항 -->
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div id = calendar>
					<div id="fullCalendarArea"></div>
				</div>
			<div id="emp_box">
			<div id="titleLine"> 
				<div class="title" id = "selectDateView"></div>
				투입 가능 인력 :
				<div class="title" id = "empCnt"></div>명
			</div>
				<table class="board_table">
					<colgroup>
						<col width="150"/>
						<col width="150"/>
						<col width="150"/>
					</colgroup>
				<thead>
					<tr>
						<th>부서명</th>
						<th>직급</th>
						<th>사원명</th>
					</tr>
				</thead>	
				<tbody id="empTbody">
				</tbody>
				
				</table>
			</div>
			
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>