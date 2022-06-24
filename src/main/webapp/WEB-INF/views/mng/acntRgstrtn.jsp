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
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.acnt_name_srch_table input:focus {
	outline-color: #F2CB05;
}

.acnt_name_srch_wrap {
	padding-bottom: 15px;
	border-bottom: 1px solid #DDDDDD;
}

.acnt_name_srch_table {
	border-collapse: collapse;
	font-size: 11pt;
	margin-left : 250px;
}

.acnt_name_srch_table tr {
	height: 30px;
}

.acnt_name_srch_table td:nth-child(1) {
	width: 50%;
	text-align: center;
	padding: 5px 0px 5px 10px;
}

.acnt_name_srch_table td:nth-child(2) {
	width: 50%;
	text-align: left;
	padding: 5px 0px 5px 10px;
}

.acnt_name_srch_table input {
	width: 120px;
}

.rmrks {
	margin-top: 5px;
}

.acnt_name_srch_table {
	width: 400px;
}

.ctgr_list_wrap {
	padding: 10px 40px 0px;
	width: 900;
	height: 390px;
	font-size: 11pt;
}

.main_ctgr_wrap {
	padding: 10px;
	display: inline-block;
	vertical-align: top;
	width: 345px;
	height: 360px;
	font-weight: bold;
}

.sub_ctgr_wrap {
	padding: 10px 50px;
	display: inline-block;
	vertical-align: top;
	width: 345px;
	height: 360px;
	font-weight: bold;
}

.board_table th  {
	background-color: #F2F2F2;
}
.sub_board_table th  {
	background-color: #F2F2F2;
}

.sub_board_table {
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}

.sub_board_table thead tr {
	border-top: 2px solid #222222;
	border-bottom: 1px solid #d7d7d7;
	height: 40px;
	font-size: 11pt;
}

.sub_board_table tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 40px;
	text-align: center;
	color: #7b7b7b;
	font-size: 10.5pt;
}

.sub_board_table .board_cont_left {
	text-align: left;
}

.sub_board_table .sub_board_table_hover {
	color: #222222;
	font-weight: bold;
	cursor: pointer;
}

.sub_board_table .sub_board_table_hover:hover {
	color: #4B94F2;
	text-decoration: underline;
}


.ctgrd_code_list {
	padding-bottom: 40px;
}
.ctgr_code_list {
	padding-bottom: 10px;
}

.jyjk1 .jyjk2 .jyjk3 .jyjk4{
min-width : 150px;
}
.rmrks{
min-width : 600px;
}
.btn_wrap {
	width: 100%;
	text-align: right;
}

.bjy{
max-width : 150px;
height : 21px;
}
.req{
margin-left : auto;
margin-right : auto;
}
.subpgn_area {
	display: inline-block;
	min-width: 300px;
	text-align:center;
	height: 30px;
	position: absolute;
	left: calc(50% - 150px);
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();

	
	$("#new_btn").on("click", function() {
		if($("#no").val() == ""){
		makeAlert("알림", "대분류를 지정해주세요.");
		}else{
			var html = ""
		
		html += "<div class=\"popup_cont\">";
		html += "<table class = \"req\">";
		html += "<colgroup>";
		html += "<col width = \"160px\" />";
		html += "<col width = \"160px\" />";
		html += "</colgroup>";
		html += "<tbody>";
		html += "<tr height = \"60px\" >";
		html += "<td>대분류 계정명</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" value=\"" + $(".jyjk1").val() +"\"readonly = \"readonly\"/>";
		html += "</select></span></td>";
		html += "</tr>";
		html += "<tr height = \"60px\" >";
		html += "<td>소분류 계정명</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" id =\"sub_name\" />";
		html += "</select></span></td>";
		html += "</tr>";
		html += "<tr height = \"60px\" >";
		html += "<td>적 요</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" id =\"abs\" /></span></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
			makePopup({
			bg : true,
			bgClose : true,
			width : 450,
			height : 350,
			title : "계정코드 등록",
			contents : html,
			buttons : [{
				name : "등록",
				func:function() {
					console.log("등록");
					
					$("#writeno").val($("#no").val());
					$("#writesubno").val($("#sub_no").val());
					$("#writesubname").val($("#sub_name").val());
					$("#writeabs").val($("#abs").val());
					
					if(checkEmpty("#sub_name")) {
						alert("소분류 계정명을 입력하세요.")
						$("#sub_name").focus();
					} else if(checkEmpty("#abs")) {
						alert("적요를 입력하세요.")
						$("#abs").focus();
					} else{
						var writeForm = $("#writeForm");
						
						writeForm.ajaxForm({
							success : function(res){
								
								//글 저장
								var params =$("#writeForm").serialize();
								
								$.ajax({
									type : "post", 
									url : "acntRgstrtnAction/insert", 
									dataType : "json", 
									data : params, 
									success : function(res){ 
										if(res.res == "success"){
											$("#actionForm").attr("action", "acntRgstrtn");
											$("#actionForm").submit();
										}else{
											alert("작성중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error){ 
										console.log(request.responseText);
							}
							});// ajax end
							},//success end
							error : function(req){
								console.log(req.responseText);
							}//error end
						});// ajaxForm end
					 writeForm.submit(); //ajaxForm 실행
						closePopup();
					}
					
				}
			}, {
				name : "취소"
			}]
		});
			
		}
	});
	
	$("#update_btn").on("click", function() {
		if($(".jyjk1").val() == "" ||$(".jyjk1").val() == null){
		makeAlert("알림", "대분류를 지정해주세요.");
		}
		else if($(".jyjk2").val() == "" ||$(".jyjk2").val() == null){
		makeAlert("알림", "수정할 소분류를 지정해주세요.");
		}else{
			var html = ""
		
		html += "<div class=\"popup_cont\">";
		html += "<table class = \"req\">";
		html += "<colgroup>";
		html += "<col width = \"160px\" />";
		html += "<col width = \"160px\" />";
		html += "</colgroup>";
		html += "<tbody>";
		html += "<tr height = \"60px\" >";
		html += "<td>대분류 계정명</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" value=\"" + $(".jyjk1").val() +"\"readonly = \"readonly\"/>";
		html += "</select></span></td>";
		html += "</tr>";
		html += "<tr height = \"60px\" >";
		html += "<td>소분류 계정명</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" id =\"update_sub_name\" value=\"" + $(".jyjk3").val() +"\"/>";
		html += "</select></span></td>";
		html += "</tr>";
		html += "<tr height = \"60px\" >";
		html += "<td>적 요</td>";
		html += "<td><span class = \"box\">";
		html += "<input type = \"text\" class = \"bjy\" id =\"update_abs\" value=\"" + $(".jyjk4").val() +"\"/></span></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
			makePopup({
			bg : true,
			bgClose : true,
			width : 450,
			height : 350,
			title : "계정코드 수정",
			contents : html,
			buttons : [{
				name : "수정",
				func:function() {
					console.log("수정");
					
					$("#updatesubname").val($("#update_sub_name").val());
					$("#updateabs").val($("#update_abs").val());
					
					if(checkEmpty("#update_sub_name")) {
						alert("소분류 계정명을 입력하세요.")
						$("#update_sub_name").focus();
					} else if(checkEmpty("#update_abs")) {
						alert("적요를 입력하세요.")
						$("#update_abs").focus();
					} else{
						var updateForm = $("#updateForm");
						
						updateForm.ajaxForm({
							success : function(res){
								
								//글 저장
								var params =$("#updateForm").serialize();
								
								$.ajax({
									type : "post", 
									url : "acntRgstrtnAction/update", 
									dataType : "json", 
									data : params, 
									success : function(res){ 
										if(res.res == "success"){
											$("#actionForm").attr("action", "acntRgstrtn");
											$("#actionForm").submit();
										}else{
											alert("수정중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error){ 
										console.log(request.responseText);
							}
							});// ajax end
							},//success end
							error : function(req){
								console.log(req.responseText);
							}//error end
						});// ajaxForm end
					 updateForm.submit(); //ajaxForm 실행
						closePopup();
					}
					
				}
			}, {
				name : "취소"
			}]
		});
			
		}
	});
	$("#delete_btn").on("click", function() {
		if($(".jyjk1").val() == "" ||$(".jyjk1").val() == null){
		makeAlert("알림", "대분류를 지정해주세요.");
		}
		else if($(".jyjk2").val() == "" ||$(".jyjk2").val() == null){
		makeAlert("알림", "삭제할 소분류를 지정해주세요.");
		}else{
			var html = ""
		
		html += "<div class=\"popup_cont\">";
		html += "<table class = \"req\">";
		html += "<colgroup>";
		html += "<col width = \"160px\" />";
		html += "</colgroup>";
		html += "<tbody>";
		html += "<tr height = \"60px\" >";
		html += "<td>정말 삭제하시겠습니까?</td>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
			makePopup({
			bg : true,
			bgClose : true,
			width : 450,
			height : 250,
			title : "계정코드 삭제",
			contents : html,
			buttons : [{
				name : "삭제",
				func:function() {
					
						var deleteForm = $("#deleteForm");
						
						deleteForm.ajaxForm({
							success : function(res){
								
								//글 저장
								var params =$("#deleteForm").serialize();
								
								$.ajax({
									type : "post", 
									url : "acntRgstrtnAction/delete", 
									dataType : "json", 
									data : params, 
									success : function(res){ 
										if(res.res == "success"){
											$("#actionForm").attr("action", "acntRgstrtn");
											$("#actionForm").submit();
										}else{
											alert("삭제중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error){ 
										console.log(request.responseText);
							}
							});// ajax end
							},//success end
							error : function(req){
								console.log(req.responseText);
							}//error end
						});// ajaxForm end
					 deleteForm.submit(); //ajaxForm 실행
						closePopup();		
				}
			}, {
				name : "취소"
			}]
		});
			
		}
	});

	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 500,
			height : 400,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});	
	});
	
	$(".board_table").on("click",".board_table_hover",function(){
		$("#no").val($(this).attr("no"));
		$("#update_no").val($(this).attr("no"));
		$("#delete_no").val($(this).attr("no"));
		$(".jyjk1").val($(this).attr("tit"));
		$(".jyjk2").val($(this).attr(""));
		$(".jyjk3").val($(this).attr(""));
		$(".jyjk4").val($(this).attr(""));
		
		reloadList();
	});
	
	$(".sub_board_table").on("click",".sub_board_table_hover",function(){
		$("#updatesub_no").val($(this).attr("sub_no"));
		$("#deletesub_no").val($(this).attr("sub_no"));
		$(".jyjk2").val($(this).attr("sub_no"));
		$(".jyjk3").val($(this).attr("tit"));
		$(".jyjk4").val($(this).attr("abs"));
		
		reloadList();
	});
	$("#pgn_area").on("click", "div", function() {
		$("#mainPage").val($(this).attr("mainPage"));
		reloadList();
	});
	
	$("#subpgn_area").on("click", "div", function() {
		$("#subPage").val($(this).attr("subPage"));
		reloadList();
	});
	
	
	
	
function reloadList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post", 
			url : "acntMainAjax", 
			dataType : "json",
			data : params,
			success : function(res){ 
				console.log(res);
				drawList(res.list);
				drawPaging(res.pb);		
			},
			error : function(request, status, error){ 
				console.log(request.responseText);
	}
	});
	$.ajax({
			type : "post", 
			url : "acntSubAjax", 
			dataType : "json", 
			data : params, 
			success : function(res){ 
				console.log(res);
				drawsubList(res.sublist);
				drawsubPaging(res.subpb);
				drawsubMaxCnt(res.submaxcnt);
			},
			error : function(request, status, error){ 
				console.log(request.responseText);
	}
	});
		

		
	}
	
	
	function drawList(list){
		var html ="";
		
		for(var data of list){
			
			html += "<tr>";
			html += "<td>" + data.SUB_CTGR_ACNT_CODE +"</td>";
			html += "<td no=\"" + data.SUB_CTGR_ACNT_CODE + "\" class=\"board_table_hover\" tit=\""+ data.ACNT_NAME +"\">" + data.ACNT_NAME +"</td>";
			html +="</tr>";
			
		}
		$("#main").html(html);
	}
	
	
	
function drawPaging(pb) {
		var html = "";
		
		html += "<div class=\"page_btn page_first\" mainPage=\"1\">first</div>";
		
		if($("#mainPage").val() == "1") {
			html += "<div class=\"page_btn page_prev\" mainPage=1>prev</div>";
		} else {
			html += "<div class=\"page_btn page_prev\" mainPage=\"" + ($("#mainPage").val() * 1 - 1) + "\">prev</div>";		
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#mainPage").val() == i) {
				html += "<div class=\"page_btn_on\" mainPage=\"" + i + "\">" + i + "</div>";
			} else {
				html += "<div class=\"page_btn\" mainPage=\"" + i + "\">" + i + "</div>";
			}
		}
		
		if($("#mainPage").val() == pb.maxPcount) {
			html += "<div class=\"page_btn page_next\" mainPage=\"" + pb.maxPcount + "\">next</div>";		
		} else {
			html += "<div class=\"page_btn page_next\" mainPage=\"" + ($("#mainPage").val() * 1 + 1) + "\">next</div>";				
		}
		
		html += "<div class=\"page_btn page_last\" mainPage=\"" + pb.maxPcount + "\">last</div>";
		
		$("#pgn_area").html(html);
		
	}
	
function drawsubList(sublist){
	var html ="";
	
	if($("#no").val() != "" ){
	for(var data of sublist){
		
		html += "<tr>";
		html += "<td>" + data.SUB_CTGR_ACNT_CODE +"</td>";
		html += "<td sub_no=\"" + data.SUB_CTGR_ACNT_CODE + "\" class=\"sub_board_table_hover\" tit=\""+ data.ACNT_NAME +"\"abs=\""+data.ABSTRCT +"\">" + data.ACNT_NAME +"</td>";
		html +="</tr>";
	}
	}
	$("#sub").html(html);
}
function drawsubPaging(subpb) {
	var html = "";
	
	if($("#no").val() != ""){
		
	
	html += "<div class=\"page_btn page_first\" subPage=\"1\">first</div>";
	
	if($("#subPage").val() == "1") {
		html += "<div class=\"page_btn page_prev\" subPage=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" subPage=\"" + ($("#subPage").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = subpb.startPcount; i <= subpb.endPcount; i++) {
		if($("#subPage").val() == i) {
			html += "<div class=\"page_btn_on\" subPage=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" subPage=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#subPage").val() == subpb.maxPcount) {
		html += "<div class=\"page_btn page_next\" subPage=\"" + subpb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" subPage=\"" + ($("#subPage").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" subPage=\"" + subpb.maxPcount + "\">last</div>";
	
	}
	$("#subpgn_area").html(html);
	
}
function drawsubMaxCnt(submaxcnt){
	
	if($("#no").val() != ""){
		$("#sub_no").val(submaxcnt);
	}
}


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
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">계정 등록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
<form action="#" id="writeForm" method="post">
	<input type="hidden" id = "writeno" name="no" value=""/>
	<input type="hidden" id = "writesubno"name="sub_no" value=""/>
	<input type="hidden" name="empNum" value="${sEmpNum}"/>
	<input type="hidden" id = "writesubname" name="sub_name" value=""/>
	<input type="hidden" id ="writeabs" name="abs" value=""/>
	<input type="hidden" name="top" value="${param.top}">
	<input type="hidden" name="menuNum" value="${param.menuNum}">
	<input type="hidden" name="menuType" value="${param.menuType}">
</form>
<form action="#" id="updateForm" method="post">
	<input type="hidden" id = "updatesubname" name="updatesubname" value=""/>
	<input type="hidden" id ="updateabs" name="updateabs" value=""/>
	<input type = "hidden" id = "update_no" name ="update_no" value=""/>
	<input type = "hidden" id = "updatesub_no" name="updatesub_no" value=""/>
	<input type="hidden" name="top" value="${param.top}">
	<input type="hidden" name="menuNum" value="${param.menuNum}">
	<input type="hidden" name="menuType" value="${param.menuType}">

</form>
<form action="#" id="deleteForm" method="post">
	<input type = "hidden" id = "delete_no" name ="delete_no" value=""/>
	<input type = "hidden" id = "deletesub_no" name="deletesub_no" value=""/>
	<input type="hidden" name="top" value="${param.top}">
	<input type="hidden" name="menuNum" value="${param.menuNum}">
	<input type="hidden" name="menuType" value="${param.menuType}">
</form>
<form action="#" id = "actionForm" method="post">
	<input type = "hidden" id="no" name ="no" value=""/>
	<input type = "hidden" id="sub_no" name ="sub_no" value=""/>
	<input type = "hidden" id="mainPage" name ="mainPage" value ="1"/>
	<input type = "hidden" id="subPage" name ="subPage" value ="1"/>
	<input type="hidden" name="top" value="${param.top}">
	<input type="hidden" name="menuNum" value="${param.menuNum}">
	<input type="hidden" name="menuType" value="${param.menuType}">
	
			<div class="acnt_name_srch_wrap">
				<table class="acnt_name_srch_table">
					<tbody>
						<tr>
							<td>대분류 계정명</td>
							<td><input type="text" class ="jyjk1" readonly="readonly" value =""></td>
						</tr>
						<tr>
							<td>계정 코드</td>
							<td><input type="text" class ="jyjk2" readonly="readonly"></td>
						</tr>
						<tr>
							<td>계정 명</td>
							<td><input type="text" class ="jyjk3" readonly="readonly"></td>
						</tr>
						<tr>
							<td>적 요</td>
								<td><input type="text" class ="jyjk4" readonly="readonly"></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<div class="cmn_btn" id ="update_btn">수정</div>
					<div class="cmn_btn_ml" id = "delete_btn">삭제</div>
				</div>
			</div>
			<div class="ctgr_list_wrap">
				<div class="main_ctgr_wrap">
					<div class="main_ctgr_name">
						<div class="ctgrd_code_list">대분류 계정 코드 목록
						</div>
						
						<table class="board_table">
							<colgroup>
								<col width="100">
								<col width="100">
								
							</colgroup>
							<thead>
								<tr>
									<th>계정 코드</th>
									<th>계정명</th>
								
								</tr>
							</thead>
							<tbody class="main" id ="main">	
							</tbody>
						</table>
						<div class="board_bottom">
								<div class="pgn_area" id="pgn_area">
						</div>
						</div>
						
					
					</div>
				</div>
				<div class="sub_ctgr_wrap">
					<div class="sub_ctgr_name">
							<div class="ctgr_code_list">소분류 계정 코드 목록
								<div class="btn_wrap">			
									<div class="cmn_btn" id ="new_btn">신규</div>
								</div>
							</div>
							<table class="sub_board_table">
								<colgroup>
									<col width="100">
									<col width="100">
								</colgroup>
								<thead>
									<tr>
										<th>계정 코드</th>
										<th>계정명</th>
									</tr>
								</thead>
								<tbody class="sub" id ="sub">
								</tbody>
							</table>
							<div class="board_bottom">
								<div class="subpgn_area" id="subpgn_area">
							</div>
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