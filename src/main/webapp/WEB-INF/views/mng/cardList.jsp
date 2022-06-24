<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cardList</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.popup_bg {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	background-color: #444444;
	opacity: 0.7;
	z-index: 50;
}

.popup {
	display: inline-block;
	width: 650px;
	height: 300px;
	box-shadow: 0px 0px 4px 0px #b7b7b7;
	position: absolute;
	top: calc(50% - 300px);
	left: calc(50% - 300px);
	z-index: 100;
	background-color: #f4f4f4;
	border-radius: 2px;
	line-height: 45px;
    font-size:10.5pt;
}

.popup_title {
	height: 40px;
	line-height: 40px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 10px;
	background-color: #f2cb05;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.popup_cont {
	width: calc(100% - 20px);
	height: calc(100% - 100px);
	padding: 10px;
	/* 표준 폰트 크기 */
	/* font-size: 10.5pt; */
	 background-color: #fff;
}

.popup_btn_area {
	width: 100%;
	height: 35px;
	text-align: right;
	padding-top: 5px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
/* 개인 작업 영역 */
.cmn_btn{
	margin-left:8px;
}
.int_list{
   width: 180px;
   height: 30px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.popup_table {
   text-align: center;
   border-collapse: collapse;
}
.popup_table td {
   border-top: 1px solid #222222;
}
.check{
	width: 189px;
   height: 40px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.use_date_cont{
	text-align:left;
	margin-left: 25px;
}
.card_sep_cont{
	text-align:left;
	height:23px;
	margin-left: 25px;
}
.card_co_cont{
	text-align:left;
	height:23px;
	margin-left: 25px;
}
.card_code_cont,.card_name_cont,.use_name_cont{
	margin-left: 25px;
	margin-right: 25px;
}
.del_cont{
	width:485px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	reloadList();

	
	//카드번호 클릭 이벤트
	$("tbody").on("click",".board_table_hover", function() {
		$("#no").val($(this).attr("no"));
		$("#mng_num").val($(this).attr("mng_num"));
		
		$("#actionForm").attr("action", "cardView");
		$("#actionForm").submit();
	});
	$("#addBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action","cardWrite");
		$("#actionForm").submit();
	});
	
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13) {	
			$("#searchBtn").click();
			
			return false;
		}
	});
	$("#searchBtn").on("click",function(){	
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		
		reloadList();
		
	});
	
	$(".pgn_area").on("click","div",function(){
		$("#page").val($(this).attr("page"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		reloadList();
	});
	

});
function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", // 전송 형태
		url : "cardListAjax", // 통신 주소
		dataType : "json", // 받을 데이터 형태
		data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
		success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) { // 문제 발생 시 실행 함수
			console.log(request.responseText); // 결과 텍스트
		}
	});
}


function drawList(list) {
	var html = "";
	
	for(var data of list) {
		//html += "<tr no=\"" + data.CARD_NUM + "\">";
		html += "<tr>";
		html += "<td class=\"board_table_hover\" id=\"clickCard\" mng_num=\"" + data.MNG_NUM +  "\" no=\"" + data.CARD_NUM +  "\">" + data.CARD_NUM + "</td>";
		html += "<td>" + data.CARD_NAME + "</td>";
		if(data.USE_START_DT!=null)
			html += "<td>" + data.EMP_NAME + "</td>";
		 else
	            html += "<td></td>";
		if(data.USE_START_DT!=null)
			html += "<td>" + data.USE_START_DT +"</td><td>~</td>";
        else
        	html += "<td></td>";
        if(data.USE_END_DT!=null)
    			html += "<td>" + data.USE_END_DT+"</td>";   
        else
            	html += "<td></td>";
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
			<div class="page_title_text">카드 관리</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">

		<form action="#" id="actionForm" method="post">
	      	<input type="hidden" id="gbn" name="gbn"/>
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
			<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
			<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}"/>
			<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}"/>
			<input type="hidden" id="no" name="no"/>
			<input type="hidden" id="mng_num" name="mng_num"/>
			<input type="hidden" id="page" name="page" value="${page}" />
				<select class="srch_sel" name="searchGbn">
					<option value="0">카드번호</option>
					<option value="1">카드명</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
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
					<col width="100"/>
					<col width="400"/>
					<col width="150"/>
					<col width="120"/>
					<col width="10"/>
					<col width="120"/>
				</colgroup>
				<thead>
					<tr>
						<th>카드번호</th>
						<th>카드명</th>
						<th>카드소유자</th>
						<th colspan=3>카드소유기간</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				<div class="cmn_btn" id="addBtn">신규</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>