<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 보고서</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- highcharts Script -->
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
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
.new_sales_actvty {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 260px;
	margin-bottom: 30px; 
}
.sales_text_bot {
	width: 430px;
	height: 200px;
	margin-top: 10px;
	font-size: 11pt;
}
.sales_md_rvn_list {
	width: 430px;
	height: 179px;
	margin-top: 10px;
	font-size: 11pt;
}
.cont_left {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-right: 33.5px;	
}
.cont_right {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-left: 33.5px;	
}
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 50px 0;
}
.srch_table tr {
	height: 40px;
}
.srch_table td {
	padding: 10px 2px;
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
.findEmp_box {
	background-color: white;
	border : 1px solid #858585;
	height: 22px;
	width: 160px;
	border-radius : 1px;
	text-align: right;
}
.findEmp_box:hover {
	cursor: pointer;
}
.findEmp_box:active {
	background-color : white;
	outline : 1.5px solid #222222;
}
.userIcon{
	height: 15px;
	margin-top: 3px;
	margin-right : 5px;
}
.sales_text, .img_rect {
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	font-weight: bold;
	color: #7b7b7b;
}
.sales_text {
	width: 100%;
}
.sales_text_top {
	display: inline-block;
}
.actvty_tLine1 {
	background-color: #4B94F2;
	width: 100%;
	height: 2px;
}
.img_rect {
	width: 12px;
	height: 12px;
	padding-top: 4px;
	margin-right: 10px;
	margin-left: 10px;
}
.mdRvnList {
	width: 430px;
	height: 20px;
	position: relative;
	overflow-y: auto;
}
.mfs {
	font-size: 10pt;
	color: #808080;
}
.mRvn {
    position: absolute;
    left: 62%;
}
.md_sum_rvn {
	width: 430px;
	height: 20px;
	border-top: 1px solid #D3D3D3;
	position: relative;
}
i[class^=stt_]:after {
    content: '';
    display: block;
    clear: both;
    vertical-align: middle;
    background: url(https://app.crm.co.kr/res/images/all/status_con.png) no-repeat;
    background-position: 0 0;
    width: 20px;
    height: 20px;
    margin: 0 auto;
}
.stt_building:after {
    background-position: 0 -40px !important;
}
.stt_user:after {
    background-position: -20px -40px !important;
}
.stt_userlock:after {
    background-position: -40px -40px !important;
}
.left {
	float: left;
}
.right {
	float: right;
}
.coms {
    border: 1px solid #e1e6eb;
    width: 48%;
    display: inline-block;
    height: 150px;
    padding-top: 1.5%;
    border-radius: 5px;
    color: #fff;
    margin-top: 5px;
}
.com {
    border: 1px solid #e1e6eb;
    width: 48%;
    display: inline-block;
    height: 150px;
    padding-top: 1.5%;
    border-radius: 5px;
    color: #fff;
    margin-left: 5.5px; 
    margin-top: 5px;
}
div.cusbox {
    height: 60px;
    margin: 15px 0;
    color: #b3323e;
    text-align: center;
}    
div.combox {
    height: 60px;
    margin: 15px 0;
    color: #d46872;  
    text-align: center;
}
div.comsbox {
    height: 60px;
    margin: 15px 0;
    color: #fe9546;
    text-align: center;
}
.cus p {
    padding: 0 !important;
    width: 80%;
    height: 25px;
    margin: 0 auto;
    background: #b3323e;
    color: #fff;
    line-height: 25px;
    text-align: center;
}
.com p {
    padding: 0 !important;
    width: 80%;
    height: 25px;
    margin: 0 auto;
    background: #d46872;
    color: #fff;
    line-height: 25px;
    text-align: center;
}
.coms p {
    padding: 0 !important;
    width: 80%;
    height: 25px;
    margin: 0 auto;
    background: #fe9546;
    color: #fff;
    line-height: 25px;
    text-align: center;
}
.btnImg_in {
    position: absolute;
    left: 175px;
    top: 2px;
    width: 18px;
    cursor: pointer;
}
.imgName {
	padding-right: 30px;
	height: 17px;
	outline: none;
}
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
    margin: -10px 0px 0px -10px;
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
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
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
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
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
.popup_box_left {
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
}
.popup_mng_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_cc_box_in {
   width: 550px;
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 5px;
}
.popup_mng_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_mng_box_in:hover, .popup_cc_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/client.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	font-weight: bold;
	font-size : 12px;
}
.boldMngName{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
.popCmnBtn {
	margin-top: 35px;
	margin-left: 200px;
}
.popMngBtn {
	margin-top: 5px;
	margin-left: 25px;
}
.popup_box_mng {
	height: 297px;
	padding-top: 8px;
}
.popup_box_cc {
	height: 322px;
	padding-top: 8px;
}
.imgPos {
	position: relative;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	getData();
	reloadSalesMdRvnList();
	reloadNewSalesList();
	
	// (팝업)담당자
	$("#mngPop").on("click", function() {
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += "<form action=\"#\" id=\"popupMngForm\">";
	 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += "<div class=\"ptm_left\">";
		html += "<div class=\"ptm_left_top\">팀분류</div>";		
		html += "<div class=\"ptm_left_bot\">사원분류</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html += "<div class=\"ptm_mid_top\">";
		html += "<select class=\"sel_size\" name=\"deptS\">";
		html += "<option value=\"6\">영업1팀</option>";
		html += "<option value=\"7\">영업2팀</option>";
		html += "<option value=\"8\">영업3팀</option>";
		html += "</select>";
		html += "</div>";
		html += "<div class=\"ptm_mid_bot\">";
		html += "<select class=\"sel_size\" name=\"empS\">";
		html += "<option value=\"0\">사원번호</option>";
		html += "<option value=\"1\">사원명</option>";
		html += "</select>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html += "<div class=\"ptm_mid_right_top\"></div>";
		html += "<div class=\"ptm_mid_right_bot\">";
		html += "<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" id=\"searchT\" name=\"searchT\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_right\">";
		html += "<div class=\"ptm_right_top\"></div>";
		html += "<div class=\"ptm_right_bot\">";
		html += "<div class=\"cmn_btn\" id=\"meBtn\">검색</div>";
		html += "</div>";
		html += "</div>";
		html += "</form>";
		html += "</div>";
		html +=	"<div class=\"popup_box_mng\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		makePopup({
			depth : 1,
			bg : false,
			width : 600,
			height : 500,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				drawMngList();
				
				$(".popup_box_mng").on("click", ".popup_mng_box_in", function() {
					var mng = $(this).children("#mng").val();
					var mge = $(this).children("#mge").val();
					document.getElementById("mngEmp").value = mng;
					document.getElementById("mngNum").value = mge;
					closePopup();
				});
				
				$("#meBtn").on("click", function () {
					$("#page").val("1");
					drawMngList();
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#meBtn").click();
						return false;
					}
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					drawMngList();
				});
				
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup();
				}
			}
		});
		
	});
	
	$(".cmn_btn").on("click", function() {
		getData();
		reloadNewSalesList();
	});
	
});

// 차트 데이터
function getData() {
	var params =  $("#getForm").serialize();
	$.ajax({
		type : "post",
		url : "salesRvnAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			salesRvnChart(res.rvn);
		},
		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 당월 매출 실적 차트
function salesRvnChart(list) {
	console.table(list);
	
	for(var i = 0 ; i < list.length ; i++) {
		var d = new Array();
		
		d.push(list[i].data * 1);
		list[i].data = d;
	}
	
	$('#sales_rvn_chart').highcharts({
		chart : {
			type : 'column'
		},
		title : {
			text : ''
		},
		xAxis : {
			categories: ['매출']
		},
		yAxis : {
		    lineWidth: 2,
			title : false,
			labels : {
			    format: '{value:,0f}'
			}
		},
		plotOptions: {
		    column: {
		        dataLabels: {
		            enabled: true,
		            crop: false
		        }
		    }
		},
		series: list
	});
}

function reloadSalesMdRvnList() {
	var params =  $("#getForm").serialize();
	
	$.ajax({
		type : "post",
		url : "saleMdRvnAjax",
		dataType : "json",
		data : params,
		success : function(res)	{
			drawSalesMdRvnList(res.mdRvnList);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawSalesMdRvnList(list) {
	var html = "";
	
	for(var data of list){
		html += "<div class=\"mdRvnList\"><span class=\"mfs\">" + data.NAME + "</span><span class=\"mfs mRvn\">" + data.RVN + "</span></div>";
	}
	
	$(".sales_md_rvn_list").html(html);
}

function reloadNewSalesList() {
	var params =  $("#getForm").serialize();
	$.ajax({
		type : "post",
		url : "newSalesRegAjax",
		dataType : "json",
		data : params,
		success : function(res)	{
			drawNewSalesCont(res.ccCnt, res.ldCnt);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawNewSalesCont(ccCnt, ldCnt) {
	var html = "";

	html += "<div class=\"com\">                                          ";
	html += "<div class=\"combox\">                                       ";
	html += "	<i class=\"stt_user\"></i>                                ";
	html += "	<strong class=\"ng-binding\">" + ccCnt + "</strong>            ";
	html += "</div>                                                     ";
	html += "<p>고객</p>                                                ";
	html += "</div>                                                     ";
	html += "<div class=\"coms right\">                                   ";
	html += "	<div class=\"comsbox\">                                   ";
	html += "		<i class=\"stt_userlock\"></i>                        ";
	html += "		<strong class=\"ng-binding\">" + ldCnt + "</strong>        ";
	html += "	</div>                                                  ";
	html += "	<p>잠재고객</p>                                         ";
	html += "</div>		                                                ";
	
	$(".newSalesCont").html(html);
}

//(팝업)담당자 ajax
function drawMngList() {
	var params = $("#popupMngForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawMngCont(res.mngList);
			drawMngPaging(res.mngPb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

// (팝업)담당자 목록
function drawMngCont(mngList) {
	var html = "";
	
	for(var data of mngList) {
		html +=	"<div class=\"popup_mng_box_in\" id=\"mlb\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"mngIcon\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_mng_box_right\">";
		html +=	 data.EMP_NUM + " " + "<span class=\"boldMngName\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";                                                                      
	}                                                                                                     
	                      
	$(".popup_box_mng").html(html);
	
}

// (팝업)담당자 페이징
function drawMngPaging(mngPb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = mngPb.startPcount; i <= mngPb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == mngPb.maxPcount) {
		html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

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
			<div class="page_title_text">종합차트</div>
			<!-- 검색영역 선택적 사항 -->
		<!-- 	<div class="page_srch_area">
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
			<div class="body">
				<div class="bodyWrap">
					<!-- 검색창 -->
					<form action="#" id="getForm" method="post">
					<table class="srch_table">
						<colgroup>
							<col width="100" />
							<col width="100" />
							<col width="25" />
							<col width="100" />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<span class="srch_name">팀분류</span>
								</td>
								<td colspan="3">
									<select name="teamClsfi">
										<option value="9">전체</option>
										<option value="7">영업1팀</option>
										<option value="8">영업2팀</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">담당자</span>
								</td>
								<td colspan="3">
									<div class="imgPos">
										<input type="text" class="txt imgName" id="mngEmp" name="mngEmp" />
										<input type="hidden"id="mngNum" name="mngNum" />
										<img class="btnImg_in" id="mngPop" alt="팝업" src="resources/images/sales/usericon.png">
									</div>						
								</td>
								<td>
									<span class="cmn_btn">검색</span>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
					<div class="cont_left">
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 매출 실적(상품별)
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_md_rvn_list"></div>
							<div class="md_sum_rvn"><span class="mfs" style="color: #B22222;">합계</span><span class="mfs mRvn" style="color: #B22222;">${sumRvn}</span></div>
						</div>
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />신규 영업 활동
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot">
								<div class="newSalesCont"></div>
							</div>
						</div>
					</div>
					<div class="cont_right">
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 매출 실적 차트
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot" id="sales_rvn_chart"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 페이징 영역 -->
			<!-- <div class="board_bottom">
				<div class="pgn_area">
					<div class="page_btn page_first">first</div>
					<div class="page_btn page_prev">prev</div>
					<div class="page_btn_on">1</div>
					<div class="page_btn">2</div>
					<div class="page_btn">3</div>
					<div class="page_btn">4</div>
					<div class="page_btn">5</div>
					<div class="page_btn page_next">next</div>
					<div class="page_btn page_last">last</div>
				</div>
				<div class="cmn_btn_ml">글쓰기</div>
				<div class="cmn_btn_ml" id="alertBtn">알림</div>
				<div class="cmn_btn_ml" id="btn1Btn">버튼1개</div>
				<div class="cmn_btn_ml" id="btn2Btn">버튼2개</div>
			</div> -->
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>