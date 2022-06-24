<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	LocalDateTime version = LocalDateTime.now() ;	
	request.setAttribute("version", version);		//캐시 처리
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- mdList css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/md/mdList.css?version=${version}" />

<!-- common_sales javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<!-- md javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/md/md.js?version=${version}"></script>

<!-- mdList javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/md/mdList.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//old_ 의 값, 검색 데이터가 있으면 검색된 데이터로, 검색 데이터가 없으면 기본값으로 하는 함수  
	keepSrchData();

	
	//목록 조회
	reloadList();  
	
	//엔터키 눌렀을 때 폼 자동 실행되지 않고 지정으로 실행되도록 하는 함수
	noAutoEnter();
	
	
	//상단 박스
	clickBoxFunc();
	
	
	//검색 테이블
	changeCheckBoxSts(); /* 판매상태 체크박스 체크 처리 함수 */
	
	dateChoiceFunc(); 	/* 검색-기간 [오늘] [어제].. 버튼 클릭시 해당 날짜를 출력하는 함수 */

	goSrch(); 			/* 검색 */
	
	goSort()			/* 정렬 */
	
	//상세보기
	goDetailView();
	
	//페이징
	pagingProcess()
	
	//작성
	goRegView();
	
}); //documentReady end
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
			<div class="page_title_text">상품관리 목록</div>
		</div>
		
	<!-- 해당 내용에 작업을 진행하시오. -->
	<form action="#" id="actionForm" method="post">
		<!-- 검색 데이터 유지용 -->
		<input type="hidden" id="old_md_grade" 			value="${param.md_grade}" />
		<input type="hidden" id="old_sales_stsA" 		value="${param.sales_stsA}" />
		<input type="hidden" id="old_sales_sts0"	  	value="${param.sales_sts0}" />
		<input type="hidden" id="old_sales_sts1"	   	value="${param.sales_sts1}" />
		<input type="hidden" id="old_sales_sts2"	   	value="${param.sales_sts2}" />
		<input type="hidden" id="old_sales_start_date" 	value="${param.sales_start_date}" />
		<input type="hidden" id="old_sales_end_date" 	value="${param.sales_end_date}" />
		<input type="hidden" id="old_srch_gbn" 			value="${param.srch_gbn}" />
		<input type="hidden" id="old_srch_txt" 			value="${param.srch_txt}" />
		<input type="hidden" id="old_sort_gbn" 			value="${param.sort_gbn}" />
	
		<input type="hidden" name="no" 	 id="no">   							<!-- 글번호 -->
		<input type="hidden" name="page" id="page" value="${page}"> 			<!-- 페이지 -->
		<input type="hidden" name="top" 		   value="${params.top}"> 		<!-- top정보 -->
		<input type="hidden" name="menuNum" 	   value="${params.menuNum}"> 	<!-- 메뉴정보 -->
		<input type="hidden" name="menuType" 	   value="${params.menuType}"> 	<!-- 메뉴정보 -->
		<input type="hidden" name="sales_sts" id="sales_sts"> 	                <!-- 판매상태 -->
	
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
					<!-- sts : 상품현황 -->
					<div class="sts">
						<div class="sts_list" id="sts_listA">전체 : 건</div>
						<div class="sts_list" id="sts_list0">판매중 : 235건</div>
						<div class="sts_list" id="sts_list1">판매중단 : 15건</div>
						<div class="sts_list" id="sts_list2">출시예정 : 2건</div>
					</div>
					<div class="tLine"></div>
					<!-- class="sts" end -->
	
					<!-- srch_table -->
					<table class="srch_table">
	
						<colgroup>
							<col width="80" />
							<col width="60" />
							<col width="40" />
							<col width="60" />
							<col width="60" />
							<col width="90" />
							<col width="60" />
							<col width="30" />
							<col width="10" />
							<col width="55" />
						</colgroup>
						<tbody>
							<!-- col=10 -->
							<tr>
								<td>
									<span class="srch_name">상품 등급</span>				
								</td>
								<td colspan="9">																						
									<select name="md_grade" id="md_grade">															<!-- 보낼값1 -->
										<option value="-1" selected>선택안함</option>
										<option value="0">S 등급</option>
										<option value="1">A 등급</option>
										<option value="2">B 등급</option>
										<option value="3">C 등급</option>
										<option value="4">D 등급</option>
										<option value="5">E 등급</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">판매 상태</span>												<!-- 보낼값2 -->
								</td>
								<td colspan="9">
									<label><input type="checkbox"  name="sales_stsA" id="sales_stsA" class="sales_sts" value="-1" checked="checked" /><span id="totalCnt">전체 : 252건</span></label> 	
									&nbsp;
									<label><input type="checkbox"  name="sales_sts0" id="sales_sts0" class="sales_sts" value="0" /><span  id="onSaleCnt">판매중 : 235건</span></label> 
									&nbsp;
									<label><input type="checkbox"  name="sales_sts1" id="sales_sts1" class="sales_sts" value="1" /><span  id="offSaleCnt">판매중단 : 235건</span></label> 
									&nbsp;
									<label><input type="checkbox"  name="sales_sts2" id="sales_sts2" class="sales_sts" value="2" /><span  id="rlsExpctdCnt">출시예정 : 2건</span></label>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">기간</span>
								</td>
								<td>
									<select>
										<option selected="selected">판매기간 시작일</option>
									</select>
								</td>
								<td colspan="8">
									<input type="button" id="yesterday_btn" value="어제" />
									<input type="button" id="today_btn" value="오늘" />
									<input type="button" id="weekAgo_btn" value="일주일 전" />
									<input type="button" id="monthAgo_btn" value="1개월 전" />
									<input type="button" id="threeMonthAgo_btn" value="3개월 전" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td colspan="4">
									<input type="date" id="sales_start_date" name="sales_start_date" />															<!-- 보낼값3 -->
									~
									<input type="date" id="sales_end_date" name="sales_end_date"/>																<!-- 보낼값4 -->
								</td>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">검색어</span>
								</td>
								<td>
									<select name="srch_gbn" id="srch_gbn">																				<!-- 보낼값5 -->
										<option value="-1" selected>선택안함</option>
										<option value="0">상품명</option>
										<option value="1">상품번호</option>
									</select>
								</td>
								
								<td colspan="4">
									<input type="text" class="srch_msg" name="srch_txt" id="srch_txt" placeholder="검색 조건을 선택한 후 입력해주세요." />			<!-- 보낼값6 -->
								</td>
								<td>
									<span class="cmn_btn" id="srch_btn">검색</span>
								</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">정렬</span>
								</td>
								<td>
									<select name="sort_gbn" id="sort_gbn">
										<option selected="selected" value="0">선택안함</option>										<!-- 보낼값7 -->
										<option value="1">등록일</option>										<!-- 보낼값7 -->
										<option value="2" >상품이름</option>
										<option value="3">상품등급</option>
										<option value="4">대출한도금액</option>
									</select>
								</td>
								<td>
									<img class="asc_btn cmn_btn" id="sort_btn" alt="정렬버튼" src="resources/images/sales/asc.png" />
								</td>
								<td colspan="7"></td>
							</tr>
						</tbody>
					</table>
					<div class="SearchResult"><h3 id="SearchResult">상품 (검색결과: 390건)</h3></div>
					
					
					<!-- list_table -->
					<table class="list_table">
						<!-- col=4 -->
						<colgroup>
							<col width="70">
							<col width="100">
							<col width="290">
							<col width="80">
						</colgroup>
						<thead>
							<tr>
								<th rowspan="3" class="md_num">글번호</th>
								<th>상품번호</th>
								<th>등급</th>
								<th></th>
							</tr>
							<tr>
								<th>이자율</th>
								<th>상품명</th>
								<th>판매상태</th>
							</tr>
							<tr>
								<th>대출 한도 금액</th>
								<th>판매 기간</th>
								<th></th>
							</tr>
						</thead>
						<!-- ajax data appand  -->
						<tbody id="appand_path"><tbody>
					</table>
				</div>	<!-- class="bodyWrap" end -->
			</div> 	<!-- class="body" end -->
		</div>	<!-- class="cont_area" end  -->
	</form>
		
			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area"></div>
				<div class="cmn_btn_ml" id="cmn_btn_ml">글쓰기</div>
			</div>
	</div>	<!-- class="cont_wrap" end -->
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>