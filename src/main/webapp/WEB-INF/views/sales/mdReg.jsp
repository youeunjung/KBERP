<%@page import="java.time.LocalDateTime"%>
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
<title>상품 등록</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- mdReg css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/md/mdReg.css?version=${version}" />

<!-- common_sales javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<!-- md javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/md/md.js?version=${version}"></script>

<!-- mdReg javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/md/mdReg.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//목록으로 버튼(#listBtn) 클릭시, mdList(#actionForm)로 이동 하는 함수
	goMdList();
	
	// 저장 버튼(#saveBtn) 클릭시, 필수항목 체크 후 mdActionAjax/insert 로 이동 
	// insert 성공시 mdList로 이동하는 함수
	insertMdData();
	
	/* 파일업로드(+) 클릭시 */
	$(".aff_btn").on("click", function() {
		$("#att").click();
	});

});

//첨부자료 수정 시 사용되는 함수
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
<!--============== back Form ==================-->
<form action="mdList" id="actionForm" method="post">
	<!-- 메뉴 데이터 유지용 -->
	<input type="hidden" name="top" 		   value="${params.top}"> 		<!-- top정보 -->
	<input type="hidden" name="menuNum" 	   value="${params.menuNum}"> 	<!-- 메뉴정보 -->
	<input type="hidden" name="menuType" 	   value="${params.menuType}"> 	<!-- 메뉴정보 -->

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
</form>
	
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
			<div class="page_title_text">상품 등록</div>
				<div class="imgPos"> 					
				<img class="btnImg" alt="저장버튼" src="resources/images/sales/save.png"  id="saveBtn"/>
				<img class="btnImg" alt="목록버튼" src="resources/images/sales/list.png"  id="listBtn" />
			</div>
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->	
			<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
					<!--============= write Form ==============-->
					
					
					<form action="fileUploadAjax" id="writeForm" method="post" enctype="multipart/form-data">
						<table>
							<colgroup>
								<col width="200" />
								<col width="265" />
								<col width="200" />
								<col width="265" />
							</colgroup>
							<tbody>
								<tr>
									<td><input type="button" class="btn" value="상품명 *" readonly="readonly"/></td> 
									<td colspan="3"><input type="text" class="txt" name="md_name" id="md_name"/></td>					<!-- MD_NAME 으로 / 보낼값 1 -->
								</tr>
								<tr height="40">							
									<td padding="none"><input type="button" class="btn" value="상품 유형 *" /></td>	
									<td>
										<select class="txt" name="md_type" id="md_type">													<!-- MD_TYPE_NUM으로 / 보낼값 2 -->
											<optgroup>
												<option value="-1" selected>선택 하세요</option>
												<option value="0">개인 사업</option>
												<option value="1">법인 사업</option>
												<option value="2">공공 사업</option>
											</optgroup>
										</select>
									</td>	
									<td><input type="button" class="btn" value="상품 등급 *" /></td>
									<td>
										<select class="txt" name="md_grade" id="md_grade">												<!-- MD_GRADE_NUM으로 / 보낼값 3 -->
											<option value="-1" selected>선택 하세요</option>
											<option value="0">S 등급</option>
											<option value="1">A 등급</option>
											<option value="2">B 등급</option>
											<option value="3">C 등급</option>
											<option value="4">D 등급</option>
											<option value="5">E 등급</option>
										</select>
									</td>							
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="판매 상태 *" /></td>				
									<td>
										<select class="txt" name="sales_sts" id="sales_sts">												<!-- SALES_STS_NUM으로 / 보낼값 4 -->
											<option value="-1" selected>선택 하세요</option>
											<option value="0">판매중</option>
											<option value="1">판매중단</option>
											<option value="2">출시예정</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="한도 금액 *" /></td>
									<td><input type="text" class="txt" name="limit_amnt" id="limit_amnt"/></td>								<!-- LIMIT_AMNT 으로 / 보낼값 5  -->
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="판매 기간 *" /></td>
										<td><input type="date" class="txt" name="sales_start_date" id="sales_start_date"/></td> 					<!-- SALES_START_DATE 으로 / 보낼값 6  -->
										<td>
											<div class="date_sign">
												<span class="txt">~</span>
											</div>
										</td>
										<td colspan="2"><input type="date" class="txt" name="sales_end_date" id="sales_end_date"/></td>			<!-- SALES_END_DATE 으로 / 보낼값 7  -->
								</tr>
								
								<tr height="40">
									<td><input type="button" class="btn" value="중도상환 가능 여부 *" /></td>
									<td>
										<select class="txt" name="mid_prdmptn_psbl_check" id="mid_prdmptn_psbl_check"> 									<!-- MID_RDMPTN_PSBL_CHECK 으로 / 보낼값 11 --> 
											<option value="-1">선택 하세요</option>
											<option value="0">가능</option>
											<option value="1">불가능</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="대출 기간 *" /></td>
									<td>
										<select class="txt" name="loan_prd" id="loan_prd"> 												<!-- LOAN_PRD 으로 / 보낼값 12  -->
											<option value="-1">선택 하세요</option>
											<option value="0">6개월</option>
											<option value="1">1년</option>
											<option value="2">3년</option>
											<option value="3">5년</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="이자율 *"  /></td>
									<td><input type="text" class="txt" name="intrst_rate" id="intrst_rate"/></td>				 			<!-- INTRST_RATE 으로 / 보낼값 8  -->
								</tr>
								<tr height="40">
									<td rowspan="2"><input type="button" class="btn" value="상품 설명 " readonly="readonly"/></td> 
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" name="md_dscrptn" id="md_dscrptn"></textarea> 		<!-- MD_DSCRPTN 으로 / 보낼값 13  -->
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- 첨부 파일 -->
						<input type="file" id="att" name="att" onchange="uploadName(this)" />
						<input type="hidden" id="attFile" name="attFile" />
						<div class="rvn_txt"> 첨부파일
							<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" />
						</div>
						<div class="cntrct_box_in">
							<input type="text" id="fileName" name="fileName" readonly="readonly" />
						</div>
					</form>
				</div>
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>