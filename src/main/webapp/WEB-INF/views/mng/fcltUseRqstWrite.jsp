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
	width: 900px;
	font-size: 11pt;
}
/* 개인 작업 영역 */
#my_fclt_rsrv_row{
	width: 946px;
	font-size: 11pt;
	text-align: end;
	margin-bottom: 10px;
}
#my_fclt_rsrv_btn{
	padding: 5px;
}
.page_srch_area{
	text-align: left;
}
#calendar{
	display: inline-block;
	vertical-align: top;
	width: 500px;
	height: 200px;
	margin: 0px 40px;
}
#fclt_list{
	display:inline-block;
	font-size: 12pt;
	width: 551px;
	height: 600px;
	border: 1px solid #DDD;
	overflow: auto;
	vertical-align: top;
}
.fclt_row{
	margin:10px 20px;
}
.fclt_name{
	display:inline-block;
	border: 1px solid #444;
	width: 350px;
	height: 25px;
	text-align: center;
}
.fclt_place{
	display:inline-block;
	border: 1px solid #444;	
	width: 250px;
	height:25px;
	text-align: center;
}
.srch_sel{
	min-width:0px;
	width: 86px;
}

#cont_top{
	width:1400px;
}
#cont_bottom{
	margin:30px 0px 100px 0px;
	width: 553px;
	height: 200px;
	border: 1px solid #DDD;
}
.cmn_btn_mr{
	font-weight: bold;
	margin: 8px 0 0 16px;
	padding: 5px 36px;
}
.rsrv_time:active{
	background-color: #F2B705;
}

.srch_text_wrap input{
	margin-bottom: 4px;
}
#fclt_list_head{
	background-color: #f2f2f2;
}
#fcltyNamePlace{
	font-weight: bold;
	color: black;
}
#listBtn{
	margin-left: 1048px;
    margin-top: 10px;
    width: 70px;
}
</style>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>


<!-- Fullcalendar Script -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	if('${param.fSearchGbn}' != "") {
		$("#fSearchGbn").val(${param.fSearchGbn});
		reloadList();
	}else {
		$("#fSearchGbn").val("0");
	}
	
	$("#fSearchBtn").on("click",function(){	
		$("#page").val("1");
		
		$("#fOldSearchGbn").val($("#fSearchGbn").val());
		$("#fOldSearchTxt").val($("#fSearchTxt").val());
		
		reloadList();
		
	});
	
	$("#fSearchTxt").on("keypress", function(event){
		if(event.keyCode == 13) {	
			$("#fSearchBtn").click();
			
			return false;
		}
	});
	
	$("#fcltyListBody").on("click",".board_table_hover",function(){
		$("#no").val($(this).attr("no"));
		$("#fcltyName").val($(this).attr("fcltyName"));
		$("#fcltyPlace").val($(this).attr("fcltyPlace"));
		
		$("#actionForm").attr("action","fcltUseRqstTimeWrite");
		$("#actionForm").submit();

	});	
	
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","fcltUseRqst");
		$("#actionForm").submit();
	});
	
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
	    	  //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
	    	  //alert('Current view: ' + view.name);
	    	  reloadList();
	    	  $("#rsvtnDate").val(date.format('YYYY-MM-DD'));
	      }
	});

});

function reloadList() { //목록 조회용
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "fcltUseRqstCalListAjax",
		dataType : "json",
		data : params,
		success : function(res){ 
			console.log(res);
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
		html += "<td class=\"board_table_hover\" fcltyPlace=\"" + data.PLACE + "\" no=\"" + data.FCLTY_NUM + "\" fcltyName=\"" + data.FCLTY_NAME + "\">" + data.FCLTY_NAME + "</td>";
		html += "<td>" + data.PLACE + "</td>";
	}
	$("#fcltyListBody").html(html);
	
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
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">시설물 사용 신청</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div id = "cont_top">
			<div id = calendar>
					<div id="fullCalendarArea"></div>
				</div>
				<div id="fclt_list">
					<table class="board_table">
						<colgroup>
							<col width="150"/>
							<col width="400"/>
						</colgroup>
						<thead id="fclt_list_head">
							<tr>
								<th id="fclt_list_title">시설물 목록</th>
								<th colspan="2">
						<form action="#" id="actionForm" method="post">
							<input type="hidden" id="top" name="top" value="${param.top}" />
							<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
							<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
							
							<input type="hidden" id="page"	name="page" value="${param.page}" />
							<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
							
							<!-- 시설물예약시 예약가능한 시설물 목록의 검색어유지 -->							
							<input type="hidden" id="fOldSearchGbn" value="${param.fSearchGbn}"/>
							<input type="hidden" id="fOldSearchTxt" value="${param.fSearchTxt}"/>
							
							<!-- 시설물번호, 이름, 예약일 -->
							<input type="hidden" id="no" name="no" value="${param.no}"/>
							<input type="hidden" id="rsvtnDate" name="rsvtnDate" value="${param.rsvtnDate}"/>
							<input type="hidden" id="fcltyName" name="fcltyName" value="${param.fcltyName}" />
							<input type="hidden" id="fcltyPlace" name="fcltyPlace" value="${param.fcltyPlace}" />
									<select class="srch_sel" id="fSearchGbn" name="fSearchGbn">
										<option value = "0">시설물명</option>
										<option value = "1">위치</option>
									</select>
									<div class="srch_text_wrap">
										<input type="text" id="fSearchTxt" name="fSearchTxt" value="${param.fSearchTxt}"/>
									</div>
									<div class="cmn_btn_ml" id="fSearchBtn">검색</div>
						</form>
								</th>
							</tr>
							
						</thead>
							<tr id="fcltyNamePlace">
								<td>시설물명</td>
								<td>시설물 위치</td>
							</tr>
						<tbody id="fcltyListBody">
						</tbody>
					</table>
				</div>
				
			</div>
					<div class="cmn_btn_ml" id="listBtn">목록으로</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>