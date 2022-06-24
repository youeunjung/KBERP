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

.board_table{
	text-align: center;
}

.container {
	display: inline-block;
	font-size: 14px;
	margin-left: 20px;
	line-height: 3.5;
	
}

#dcmnt_num	{
	height: 25px;
	font-size: 14px;
	margin-right: 150px;
	
}

#form_name {
	height: 25px;
	font-size: 14px;
	margin-right: 60px;
	
}

#dcmnt_tlte {
	height: 25px;
	font-size: 14px;
	margin-right: 84px;
	width: 240px;
}

#complete {
	height: 25px;
	font-size: 14px;
}



.srch {
	height: 25px;
	width: 30px;
	position: relative;
	top:20px;
	left: 15px;
	z-index: 10;
}

.srch_2 {
 	display: inline-block;
 	border: 1px solid #000;
 	font-size: 14px;
 	background-color: #f2cb05;
 	height: 35px;
 	width: 70px;
 	text-align: right;
 	line-height: 2.5;
 	position: relative;
 	top: 10px;
 	right: 30px;
 	
 
}


.content_table {
	border-collapse: collapse;
	width: 900px;
	height: 400px;
	font-size: 12px;
	margin-top: 40px;
	
}

.content_table tbody tr {
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
	text-align: center;
}

.board_bottom {
	margin-top:10px;
}

.cont_area {
	background-color: #b7b7b7;
}



/* 개인 작업 영역 */

</style>
<script type="text/javascript">
/* $(document).ready(function() {
	
	reloadList();
		
}); */


$(document).ready(function() {
	
	reloadList();
	
	$(".pgn_area").on("click", "div", function(){
		
		$("#page").val($(this).attr("page"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		reloadList();
	});
	
	$("tbody").on("click", "tr", function() {
		
		$("#no").val($(this).attr("no"));
		$("#title").val($(this).attr("title"));
		
		
		$("#actionForm").attr("action","aprvlTmpltBoxAdd");
		$("#actionForm").submit();
	})
		
});


function reloadList() { // 목록 조회용 + 페이징 조회용
	  var params = $("#actionForm").serialize();
  
  $.ajax({
 	 type : "post",
 	 url : "aprvlListAjax",
 	 dataType : "json",
 	 data : params,
 	 success : function(res) {
 		 	console.log(res);
 		 	console.log("옴?");
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
	
	for(var data of list){
		
		let time = data.DRAFT_DATE;
		
		html += "<tr no=\"" + data.APRVL_NUM + "\">";
		html += "<td>" + data.APRVL_NUM + "</td>";		
		html += "<td>" + data.TITLE + "</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.DEPT_NAME + "</td>";
		html += "<td>" + new Date(time).getFullYear()+'-'+(new Date(time).getMonth()+1)+'-'+ new Date(time).getDate() + "</td>";
		time = data.STS_CHNG_DATE;
		html += "<td>" + new Date(time).getFullYear()+'-'+(new Date(time).getMonth()+1)+'-'+ new Date(time).getDate() + "</td>";
		  if(data.APRVL_STS == "0") {
		     	 html += "<td>결재진행중</td>"           ;
		      } else if(data.APRVL_STS == "1") {
		     	 html += "<td style=\"color:#4B94F2;\">결재완료</td>"           ;
		      } else if(data.APRVL_STS == "2") {
		     	 html += "<td style=\"color:#ff6f60;\">결재반려</td>"           ;
		      } else {
		    	  html += "<td> - </td>"           ;
		      }
		
		html += "<td class=\"view\">" + "..." + "</td>";
	}
	$("tbody").html(html);
	
	
	
}

function drawPaging(pb) {
	var html = "";
	
	html +="<div page=\"1\"class=\"page_btn page_first\">first</div>";
	
	if($("#page").val() == "1"){
	html +="<div page=\"1\"class=\"page_btn page_prev\">prev</div>";
	} else{
	html +="<div page=\"" + ($("#page").val() * 1 - 1) + "\"class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i ){
			html += "<div page=\"" + i +"\" class=\"page_btn_on\">" + i + "</div>";
			
		} else{
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i +"</div>";
		}
	}
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount +"\" class=\"page_btn page_next\">next</div>";
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
			<div class="page_title_text">결재함</div>
			<!-- 검색영역 선택적 사항 -->
		<div class="page_srch_area">
			<form action="#" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					<input type="hidden" id="no" name="no"/>
					<input type="hidden" id="page" name="page" value="${page}"/>
					<input type="hidden" id="title" name="title" value="${lists.TITLE}"/>
					<select id="searchGbn" name="searchGbn">
						<option value="0">결재번호</option>
						<option value="1">제목</option>
					</select>
				
				<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
				<div class="cmn_btn_ml" id="searchBtn">검색</div>
			</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			
				
			</div>                                                                                     
			<table class="content_table">
				<thead>
					<tr>
						<th>결재번호</th>						
						<th>문서제목</th>
						<th>기안자</th>
						<th>기안부서</th>
						<th>기안일</th>
						<th>결재일</th>
						<th>결재상태</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<%-- <c:forEach var="data" items="${list}">
						<tr no="${data.APRVL_NUM}">
							<td>"${data.APRVL_NUM}"</td>
							<td></td>
							<td>"${data.TITLE}"</td>
							<td>"${data.EMP_NAME}"</td>
							<td>"${data.DEPT_NAME}"</td>
							<td>"${data.DRAFT_DATE}"</td>
						
						</tr>
						</c:forEach> --%>
					
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area"></div>
			</div>
		
		</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>


</body>
</html>