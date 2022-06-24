<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투입관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	$("tbody").on("click",".board_table_hover", function() {
		$("#no").val($(this).attr("no"));
		$("#prjct_num").val($(this).attr("prjct_num"));
		
		$("#actionForm").attr("action", "prjctView");
		$("#actionForm").submit();
	});
	
	$(".pgn_area").on("click","div",function(){
		$("#page").val($(this).attr("page"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		reloadList();
	});
	
	$("#addBtn").on("click", function() {

		$("#actionForm").attr("action", "prjctWrite");
		$("#actionForm").submit();
});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", // 전송 형태
		url : "prjctMngListAjax", // 통신 주소
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
		html += "<tr>";
		html += "<td>" + data.PRJCT_NUM 	+ "</td>";
		html += "<td class=\"board_table_hover\" id=\"clickPrjct\" prjct_num=\"" + data.PRJCT_NUM +  "\" no=\"" + data.PRJCT_NUM +  "\">" + data.PRJCT_NAME + "</td>";
		html += "<td>" + data.EMP_NAME 		+ "</td>";
		html += "<td>" + data.START_DATE 	+ "</td><td>~</td>";
		html += "<td>" + data.END_DATE 		+ "</td>";
		if(data.RMRKS!=null)
		html += "<td>" + data.RMRKS 		+ "</td>";
		 else
         	html += "<td></td>";
		
	}
	console.log(html);
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
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
			<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
			<input type="hidden" id="no" name="no"/>
			<input type="hidden" id="prjct_num" name="prjct_num"/>
			<input type="hidden" id="page" name="page" value="${page}" />
		</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<table class="board_table"> 
         <colgroup>
               <col width="100"/>
               <col width="100"/>
               <col width="100"/>
               <col width="100"/>
               <col width="10"/>
               <col width="100"/>
               <col width="100"/>
	     </colgroup>
         <thead>
            <tr>
                  <th>프로젝트 번호</th>
                  <th>프로젝트 명</th>
                  <th>담당자</th>
                  <th>시작 일자</th>
                  <th></th>
                  <th>종료 일자</th>
                  <th>비고</th>
            </tr>
         </thead>
         	<tbody>
            </tbody>
         </table>
         
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				<div class="cmn_btn_ml" id="addBtn">프로젝트추가</div>
		   </div>
		   
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>