<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 고객센터</title>
<!-- 헤더추가 -->
<c:import url="/cHeader"></c:import>
<style type="text/css">
.cont_wrap {
	width: 1200px;
	margin: auto;
}

.logo_erp_text {
    font-family: 나눔스퀘어OTF;
    right: 10px;
}

.top_menu, .top_menu_on {
	width: 170px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- top -->
	<body>
	<!-- top & left -->
	<c:import url="/cTop">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
	<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">안내글</div>
			<!-- 검색영역 선택적 사항 -->
		
		<div class="page_srch_area">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="top" value="${param.top}">
			<input type="hidden" name="menuNum" value="${param.menuNum}">
			<input type="hidden" name="menuType" value="${param.menuType}">
			<input type="hidden" id="no" name="no"/>
			<input type="hidden" id="page" name="page" value="${page}"/>
		
			<select class="srch_sel" name="searchGbn" id="searchGbn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select>
			<div class="srch_text_wrap">
				<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
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
					<col width="150"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area"></div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/cBottom"></c:import>
</body>
</html>