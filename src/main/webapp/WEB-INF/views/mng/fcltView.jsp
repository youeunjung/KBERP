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

.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}

/* 개인 작업 영역 */
.page_srch_area{
	margin-left : 400px; 
}
#file_preview{
	width: 350px;
	height: 350px;
	margin-left: 90px;
	vertical-align:top;
	display:inline-block;
}
#file_preview img{
	min-height: 350px;
	min-width : 350px;
	max-width:350px;
	max-height: 350px;
}
#fclty_input_area{
	display: inline-block;
	margin-top: 70px;
	margin-left: 50px;
	line-height: 25px;
}
#atchmn_row{
	display: inline-block;
}
#file_name{
	display:inline-block;
	width: 235px; 
	padding: 10px 0px;
}
.fclty_input_text{
	display:inline-block;
	width: 115px;
}
.fclty_input{
	display: inline-block;
	font-weight: bold;
}
.fclty_input_row{
	margin-bottom: 5px;
}
.button_row{
	float: right;
}
.board_table{
	margin-top: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	//시설물예약 리스트 조회
	reloadList();
	
	$("#fSearchTxt").on("keypress", function(event){
		if(event.keyCode == 13) {	
			$("#searchBtn").click();
			
			return false;
		}
	});
	
	$("#searchBtn").on("click",function(){	
		$("#page").val("1");
		
		$("#fOldSearchTxt").val($("#fSearchTxt").val());
		
		reloadList();
		
	});
	
	$(".pgn_area").on("click","div",function(){
		$("#page").val($(this).attr("page"));
		
		$("#fSearchTxt").val($("#fOldSearchTxt").val());
		reloadList();
	});
	
	$("#listBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#backForm").attr("action","fcltList");
		$("#backForm").submit();
	});

	$("#updateBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action","fcltUpdate");
		$("#actionForm").submit();
	});
	
	$("#btn2Btn").on("click", function() {
		makePopup({
			width : 400,
			height : 200,
			bg : true,
			bgClose : true,
			title : "시설물 삭제",
			contents : "시설물을 삭제하시겠습니까?",
			buttons : [{
				name : "시설물 삭제",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "fcltAction/delete",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#backForm").attr("action","fcltList");
								$("#backForm").submit();
							}else{
								alert("삭제 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
						}
					});	
				}
			}, {
				name : "닫기"
			}]
		});
	});
	
}); 

function reloadList() { //목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "fcltViewListAjax",
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
}
function drawList(list){
	var html = "";
	
	for(var data of list){
		html += "<tr>";
		html += "<td>" + data.RSVTN_NUM + "</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.RSVTN_DATE + "</td>";
		html += "<td>" + data.START_TIME +" ~ "+data.END_TIME + "</td>";
		html += "<td>" + data.USE_USE + "</td>";
		html += "<td>" + data.USE_NUM_OF_PL + "</td>";
		html += "<td>" + data.STS_NUM + "</td>";
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
			<div class="page_title_text">시설물 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div id="file_preview">
					 <img src="resources/${data.ATT_PCTR}">
				</div>
					<div id="fclty_input_area">
						<div class="fclty_input_row">
							<div class="fclty_input_text">코드 : </div>
							<div class="fclty_input">${data.FCLTY_NUM}</div>
						</div>
						<div class="fclty_input_row">	
							<div class="fclty_input_text">시설물 명 : </div>
							<div class="fclty_input">${data.FCLTY_NAME}</div>
						</div>
						<div class="fclty_input_row">	
							<div class="fclty_input_text">위치 : </div>
							<div class="fclty_input">${data.PLACE}</div>
						</div>
						<div class="fclty_input_row">
							<div class="fclty_input_text">시설물 등록사원 : </div>
							<div class="fclty_input">${data.EMP_NAME}</div>				
						</div>
						<div class="fclty_input_row">
							<div class="fclty_input_text">시설물 등록일 : </div>
							<div class="fclty_input">${data.RGSTRTN_DATE}</div>				
						</div>
						<div class="fclty_input_row">
						<div class="fclty_input_row">
							<div class="fclty_input_text">관리자 : </div>
							<div class="fclty_input">${data.MNG_EMP}</div>				
						</div>
							<div class="fclty_input_text">수용인원 : </div>
							<div class="fclty_input">${data.ACPT_NUM_OF_PL}</div>
						</div>
						
					</div>
					
<form action="fcltList" id="backForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
</form>
					
<div class="page_srch_area">
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="top" name="top" value="${param.top}" />
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
		<input type="hidden" id="page" name="page" value="1" />
		<input type="hidden" id="no" name="no" value="${param.no}" />
		<input type="hidden" id="fOldSearchTxt" value="${param.fSearchTxt}"/>
		<select class="srch_sel" id="fSearchGbn" name="fSearchGbn">
			<option value="0">신청자명</option>
		</select>
		<div class="srch_text_wrap">
			<input type="text" id="fSearchTxt" name="fSearchTxt"/>
		</div>
		<div class="cmn_btn_ml" id="searchBtn">검색</div>
	</form>
</div>
				<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="100"/>
					<col width="150"/>
					<col width="150"/>
					<col width="150"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>예약코드</th>
						<th>신청자</th>
						<th>희망 이용 일시</th>
						<th>희망 이용 시간</th>
						<th>이용목적</th>
						<th>예약인원</th>
						<th>예약현황</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				
				<div class="cmn_btn_ml" id="listBtn">목록으로</div>
				<c:if test="${sDeptNum eq 5}">
					<div class="cmn_btn_ml" id="updateBtn">수정</div>
					<div class="cmn_btn_ml" id="btn2Btn">삭제</div>
				</c:if>
			</div>
				</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>