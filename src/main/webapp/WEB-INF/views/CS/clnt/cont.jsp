<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용</title>
<!-- 헤더추가 -->
<c:import url="/cHeader"></c:import>
<style type="text/css">
.main_area {
	width: 900px;
	padding: 20px;
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
$(function(){
    $('.menu>li').mouseover(function(){
        $(this).children('.sub').stop().slideDown();
    }).mouseout(function(){
        $('.sub').stop().slideUp();
    });
 });
</script>
</head>
<body>
	<!-- top -->
	<c:import url="/cTop">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
	</c:import>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">통합정보</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="no" name="no" />
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NAME}" />
					<input type="hidden" id="top" name="top" value="${param.top}"/>
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
					<input type="hidden" id="menuName" name="menuName" value="${param.menuName}"/>
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
						<select class="srch_sel" id="searchGbn" name="searchGbn">
							<option value="0">제목</option>
							<option value="1">작성자</option>
							<option value="2">작성일</option>
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
					<col width="50"/>
					<col width="150"/>
					<col width="450"/>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area"></div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/cBottom"></c:import>
</body>
</html>