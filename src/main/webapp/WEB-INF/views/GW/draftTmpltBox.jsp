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
/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
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
			<div class="page_title_text">기안함</div>
			<!-- 검색영역 선택적 사항 -->
		
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="top" name="top" value="${param.top}"/>
			<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
			<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
			<input type="hidden" id="no" name="no" value="${data.TMPLT_NUM}">
		</form>
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="400"/>
					<col width="150"/>
				</colgroup>
				<thead>
					<tr>
						<th>서식번호</th>
						<th>서식명</th>
						<th>구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${list}">
					<tr no="${data.TMPLT_NUM}">
						<td>${data.TMPLT_NUM}</td>
						<td class="board_table_hover board_cont_left">${data.TMPLT_NAME}</td>
						<td>${data.TMPLT_DVSN_NAME}</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
		
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	<script>
		$(document).ready(function(){
			$("tbody").on("click", "tr", function(){
				$("#no").val($(this).attr("no"));
				
				$("#actionForm").attr("action","draftTmpltBoxWrite");
				$("#actionForm").submit();
			});
			
			
		});
		
		
	</script>
</body>
</html>