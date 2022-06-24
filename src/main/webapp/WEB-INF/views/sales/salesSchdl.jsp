<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 영업일정</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 캘린더 스크립트 추가 -->
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css"
	href="resources/script/fullcalendar/fullcalendar.css" />
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>
<!-- Fullcalendar Script -->
<script type="text/javascript"
	src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript"
	src="resources/script/fullcalendar/locale-all.js"></script>
<!-- 캘린더 스크립트 추가 끝 -->
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
	margin: 40px auto;
}
/* 개인 작업 영역 */
.sc_title {
	width: 925px;
	height: 48px;
	border: 1px solid #000;
	background-color: #F2F2F2;
	font-size: 16px;
	font-weight: bold;
	line-height: 48px;
}

.bg {
	margin-top: 9px;
}

.sc_title_bot {
	width: 927px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 25px;
}

.sc_content {
	width: 927px;
	height: 400px;
}

.calendar {
	display: inline-block;
	vertical-align: top;
	width: 600px;
	height: 398px;
	border: 1px solid #000;
}

.content_bot {
	width: 600px;
	height: 30px;
	font-size: 15px;
	line-height: 30px;
	text-align: center;
	margin-left: 45px;
}

.calendar_text {
	display: inline-block;
	vertical-align: top;
	width: 317px;
	height: 320px;
	margin-left: 7px;
	overflow-y: auto;
	overflow-x: hidden;
}

.calendar_cont_text {
	display: inline-block;
	vertical-align: top;
	width: 317px;
	height: 270px;
	margin-left: 7px;
	/* overflow-y : auto; */
}

.lead_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #FFC107;
	border-radius: 3px;
}

.so_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #4B94F2;
	border-radius: 3px;
}

.pers_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #66BB6A;
	border-radius: 3px;
}

.lead_cal_big {
	width: 30px;
	height: 30px;
	background-color: #FFC107;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}

.sales_cal_big {
	width: 30px;
	height: 30px;
	background-color: #4B94F2;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}

.nrml_cal_big {
	width: 30px;
	height: 30px;
	background-color: #66BB6A;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}

.lead_cal_big:hover {
	cursor: pointer;
}

.marg {
	margin-left: 30px;
	margin-right: 120px;
}

.boxsize {
	width: 158px;
	height: 25px;
	outline: none;
}

.textsize {
	width: 150px;
	height: 19px;
	outline: none;
}

.cal_text_top {
	width: 317px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	line-height: 30px;
	border: none;
	padding: 0px 0px;
	margin-left: 7px;
	background-color: #BDBDBD;
	background-image: url(resources/images/sales/today.png);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 0px center;
}

.cal_text1 {
	width: 317px;
	height: 82px;
	line-height: 15px;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}

.newcalsize {
	width: 48px;
	height: 48px;
	float: right;
}

.newcalsize:hover {
	cursor: pointer;
}

.text_left {
	display: inline-block;
	vertical-align: top;
	width: 82px;
	height: 82px;
}

.text_right {
	display: inline-block;
	vertical-align: top;
	width: 227px;
	height: 82px;
	white-space: pre;
	font-size: 12px;
}

.text_right:hover {
	cursor: pointer;
}

.userseach {
	position: relative;
	display: inline-block;
	vertical-align: middle;
	width: 260px;
	height: 32px;
	line-height: 32px;
}

#usrsrchTxt {
	width: 170px;
}

.userseach:hover {
	cursor: pointer;
}

.userIcon2 {
	width: 20px;
	height: 20px;
}
/* 풀캘린더 관련 속성 */
#fullCalendarArea {
	font-size: 11pt;
}
/* 팝업 속성 시작 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
}

.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}

.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}

.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}

.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}

.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}

.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 240px;
	height: 70px;
}

.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 240px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}

.text_size {
	width: 230px;
	height: 19px;
	outline: none;
}

.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}

.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}

.ptm_right_bot {
	width: 94px;
	height: 32px;
	margin-top: 5px;
	text-align: center;
}
/* 팝업 내용 */
.popup_cc_box_left {
	display: inline-block;
	vertical-align: top;
	width: 120px;
	height: 50px;
}

.popup_cc_box_right {
	display: inline-block;
	width: 400px;
	height: 50px;
	font-size: 14px;
	line-height: 50px;
}

.popup_box_in {
	width: calc(100% - 4px);
	height: 50px;
	border: 2px solid #d7d7d7;
	border-radius: 3px;
	background-color: #F2F2F2;
	margin-bottom: 5px;
}

.popup_box_in:hover {
	cursor: pointer;
	border: 2px solid #2E83F2;
}

.company {
	display: inline-block;
	width: 42px;
	height: 25px;
	background-image: url("resources/images/sales/usericon.png");
	background-size: 42px 25px;
	margin-top: 13px;
	margin-left: 45px;
}

.boldname {
	margin-left: 30px;
	font-weight: bold;
}

.mg_wid {
	margin-left: 50px;
}
/* 팝업 내용 배경색 */
.pc_back {
	background-color: #fff;
}

/* 팝업 페이징 */
.board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding-bottom: 5px;
}
/* 팝업 속성  */

/* 캘린더 오늘 목록 Ajax */
.cal_cont {
	display: inline-block;
	vertical-align: top;
	width: 317px;
	height: 370px;
}

.btnImg_in {
	position: absolute;
	left: 195px;
	top: 5px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#ctt {
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	if('${param.usrsrchTxt}' != ''){
		$("#usrsrchTxt").val('${param.usrsrchTxt}');
		$("#deptS").val(${param.deptS});
	}
	
	drawDayCalc();
	
	/* 엔터 입력 시  */
	$("#usrsrchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click(); 
			
			return false;
		}
	});
	
	/* 검색버튼 누를 시  */
	$("#searchBtn").on("click", function() {
		
		
 		//기존 이벤트 제거
 		$("#fullCalendarArea").fullCalendar("removeEventSources");
		
		$(".cal_cont").hide();

		
		drawDayCalc();
	});
	
	/* 목록 그리기용  */
	function drawList(list) {
		var html = "";
		
		
		for(var data of list){
			html +=	"<div class=\"cal_text1\">";
			html += "<input type=\"hidden\" id=\"schln\"  value=\"" + data.SCHDL_NUM +"\"/>";
			html += "<div class=\"text_left\">";
			if(!data.LEAD_NUM == ""){
				html +=	"<div class=\"lead_cal_big\"></div>";			
			} else if(!data.SALES_NUM == ""){				
				html +=	"<div class=\"sales_cal_big\"></div>";
			} else {				
				html +=	"<div class=\"nrml_cal_big\"></div>";
			}
			html +=	"</div>";
			html +=	"<div class=\"text_right\"><br/>" + data.START_DATE_HR + " ~ " + data.END_DATE_HR + "<br/>" + data.SCHDL_NAME + "<br/>" + data.EMP_NAME + " / " + data.RANK_NAME + "</div>";
			html += "</div>";
			html += "</div>";
		}
		
		$(".calendar_text").html(html);
	} 
	
	
	/* 영업 일정 상세보기로 이동 */
	$(".calendar_text").on("click", ".cal_text1", function() {
		var tempSnum = $(this).children("#schln").val();
		$("#schdlnum").attr("value", tempSnum);
		
		
		var sdf = new Date($("#fullCalendarArea").fullCalendar("getDate"));
  		var dt = sdf.getFullYear() + "-" + lpad((sdf.getMonth() + 1), 2, 0);
  		
  		$("#clndrDate").attr("value", dt);
		
		$("#actionForm").attr("action", "salesSchdlCont");
		$("#actionForm").submit();
		
	});
	
	/* 담당자 팝업 그리기 */
	/* 담당자 팝업  */
	$(".userIcon").on("click", function() {
 		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form id=\"popupForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
		html +=						"<option value=\"6\">영업부</option>";
		html +=						"<option value=\"7\">영업1팀</option>";
		html +=						"<option value=\"8\">영업2팀</option>";
		html +=					"</select>";
		html +=				"</div>";		
		html +=				"<div class=\"ptm_mid_bot\">";
		html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
		html +=						"<option value=\"0\">사원번호</option>";
		html +=						"<option value=\"1\">사원명</option>";
		html +=					"</select>";
		html +=				"</div>";	
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid_right\">";
		html +=				"<div class=\"ptm_mid_right_top\"></div>";
		html +=				"<div class=\"ptm_mid_right_bot\">";
		html +=					"<input type=\"text\" id=\"searchT\" name=\"searchT\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn\" id=\"meBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\" id=\"mepb\"></div>";
		html +=		"</div>"; 
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				meList();
				//페이징 
				$("#mepb").on("click", "div", function() {
					$("#Page").val($(this).attr("page"));
					
					meList();
				});
				// 검색버튼
				$("#meBtn").on("click", function () {
					$("#page").val("1");
					
					meList();
					
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#page").val("1");
						
						meList();
						return false;
					}
				});
				
				$(".popup_box").on("click", ".popup_box_in", function() {
					var mgrNum = $(this).children("#mnum").val();
					$("#usrsrchTxt").attr("value", mgrNum);
					
					closePopup();
					console.log(mgrNum);
				 	
			 }); 
				
			},
			width : 600,
			height : 500,
			buttons : [ {
				name : "취소"
			}]
		});
	});
 
	/* 담당자 조회 팝업 */
	function meList() {
		var params = $("#popupForm").serialize();
		
		$.ajax({
			type : "post",
			url : "mgrListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawList2(res.mgrList);
				drawPaging(res.pb, "#mepb");
			},
			error : function(req) {
				console.log(req.responseText);
			}
		});
		
	}
	
  	function drawList2(mgrList) {
		var html = "";
			
		for(var data of mgrList) {
			html +=	"<div class=\"popup_box_in\">";
			html += "<input type=\"hidden\" id=\"mnum\" value=\"" + data.EMP_NAME + "\" />"; 
			html +=	"<div class=\"popup_cc_box_left\">";
			html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
			html +=	"</div>";
			html +=	"<div class=\"popup_cc_box_right\">";
			html +=	 data.EMP_NUM + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
			html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
			html +=	"</div>";
			html +=	"</div>";
		}
		
		$(".popup_box").html(html);
		
	} 
	
  	
	 
	
	function drawPaging(pb, sel) {
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
		
		$(sel).html(html);
	}
	
	// 달력에서 이후 버튼 누를 시
	$("body").on("click", ".fc-next-button", function() {

		//기존 이벤트 제거
  		$("#fullCalendarArea").fullCalendar("removeEventSources");
  		$("#fullCalendarArea").fullCalendar("refetchEvents");
  		
  		var sdf = new Date($("#fullCalendarArea").fullCalendar("getDate"));
  		var dt = sdf.getFullYear() + "-" + lpad((sdf.getMonth() + 1), 2, 0);
  		
  		$("#clndrDate").attr("value", dt);
  		
		drawDayCalc();
	});
	
	
	// 달력에서 이전 버튼 누를 시
	$("body").on("click", ".fc-prev-button", function() {
		
		//기존 이벤트 제거
  		$("#fullCalendarArea").fullCalendar("removeEventSources");
  		$("#fullCalendarArea").fullCalendar("refetchEvents");

  		var sdf = new Date($("#fullCalendarArea").fullCalendar("getDate"));
  		var dt = sdf.getFullYear() + "-" + lpad((sdf.getMonth() + 1) , 2, 0);
  		
  		$("#clndrDate").attr("value", dt);
  		
		drawDayCalc();
	});
	
	$("#fullCalendarArea").fullCalendar({
		header: {
			left: '',
			center: 'prev, title, next',
			right: ''
		},
		locale: "ko",
		editable: false,
		height: 400,
		defaultDate: $("#clndrDate").val(),
		titleForamt: function() {
			return date.date.year + "년" + (date.date.month + 1) + "월";
		},
		dayClick: function(date, js, view) { // 일자 클릭
		  	  
			var tdv = date.format();
			$("#ctt").attr("value", "      " + tdv);
			
			
			$(".cal_cont").show();
			$("#ctt").show();
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "salesDaySchdlAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					drawList(res.list);
				},
				error : function(req) {
					console.log(req.responseText);
				}
			});
		}
	      
	});
	
	function drawDayCalc(slist) {
		if($("#clndrDate").val() == null || $("#clndrDate").val() == ""){
			var sdf = new Date();
	  		var dt = sdf.getFullYear() + "-" + lpad((sdf.getMonth() + 1) , 2, 0);
	  		
	  		$("#clndrDate").attr("value", dt);
	  			
		}
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "salesSchdlAjax",
			dataType : "json",
			data : params,
			success : function(res){						
					
					//신규이벤트 추가
					$("#fullCalendarArea").fullCalendar("addEventSource", res.slist);
					$("#fullCalendarArea").fullCalendar("refetchEvents");
					
			},
			error : function(req) {
				console.log(req.responseText);
			}
		});
	}
	
	/* 캘린더 이벤트 관련 끝 */
	
	
	$("#regBtn").on("click", function() {
		
		$("#actionForm").attr("action", "salesSchdlReg");
		$("#actionForm").submit();
	});
	
	/* 검색 밑 등록 버튼 관련 이벤트 끝 */
	
});
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
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="top" value="${param.top}" /> 
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" /> 
		<input type="hidden" id="schdlnum" name="schdlnum" value="${param.schdlnum}" />
		<c:choose>
			<c:when test="${param.clndrDate ne ''}">
				<input type="hidden" id="clndrDate" name="clndrDate" value="${param.clndrDate}" /> 
			</c:when>
			<c:otherwise>
				<input type="hidden" id="clndrDate" name="clndrDate" />
			</c:otherwise>
		</c:choose>
		<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">영업일정</div>
				<!-- 검색영역 선택적 사항 -->
				<!-- 해당 내용에 작업을 진행하시오. -->
				<div class="cont_area">
					<!-- 여기부터 쓰면 됨 -->
					<div class="body">
						<div class="bodyWrap">
							<div class="sc_title">
								<span class="marg"> 팀분류
								<select class="boxsize"id="deptS" name="deptS">
										<option value="6">영업부</option>
										<option value="7">영업1팀</option>
										<option value="8">영업2팀</option>
								</select>
								</span> <span class="userseach"> 담당자<input type="text"
									class="txt imgName" id="usrsrchTxt" name="usrsrchTxt" /> <img
									class="btnImg_in userIcon"
									src="resources/images/sales/usericon.png" />
								</span>
								<div class="cmn_btn bg" id="searchBtn">검색</div>
							</div>
							<div class="sc_title_bot">
								<img alt="일정등록" src="resources/images/sales/newcal.png"
									class="newcalsize" id="regBtn" />
							</div>
							<div class="sc_content">
								<div class="calendar">
									<div id="fullCalendarArea"></div>
								</div>
								<div class="cal_cont">
									<input type="text" class="cal_text_top" id="ctt" name="ctt"
										readonly="readonly" />
									<div class="calendar_text"></div>
								</div>
							</div>
						</div>
						<div class="content_bot">
							<div class="lead_cal"></div>
							리드
							<div class="so_cal"></div>
							영업
							<div class="pers_cal"></div>
							개인
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