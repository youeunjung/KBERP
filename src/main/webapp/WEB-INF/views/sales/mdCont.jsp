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
<title>상품 상세보기</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- mdCont css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/md/mdCont.css?version=${version}" />

<!-- common_sales javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<!-- mdCont javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/md/mdCont.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//DB에서 저장되어있는 데이터 가져와서 넣어주기
	$('#md_type').val(${data.MD_TYPE_NUM}).prop("selected", true);
	$('#md_grade').val(${data.MD_GRADE_NUM}).prop("selected", true);
	$('#sales_sts').val(${data.SALES_STS_NUM}).prop("selected", true);
	$('#mid_prdmptn_psbl_check').val(${data.MID_RDMPTN_PSBL_CHECK}).prop("selected", true);
	$('#loan_prd').val(${data.LOAN_PRD}).prop("selected", true);
	
	
	// 파일 데이터가 있다면 View에 출력
	var uploadFileName = "${fileData.ATT_FILE_NAME}";
	if(uploadFileName != "") {
		$('#fileName').val(uploadFileName.substring(20));
		$("#attCnt").text("(1)");
	} else {
		$("#attCnt").text("(0)");
	}

	
	//목록으로 버튼 클릭시, mdList로 이동
	goMdList();
	
	//수정 버튼 클릭시, mdUpdate로 이동
	updateMdData();
	
	//삭제 버튼 클릭시, mdActionAjax/delete를 통해 성공시 mdList
	deleteMdData();
	
});

// 파일 다운로드 함수 
function fileDownLoad(){
	var fileName =  "${fileData.ATT_FILE_NAME}";
	location.href = "mdFileDown?fileName="+fileName;
}



</script>
</head>
<body>
<!--============== action Form ==================-->
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	
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
			<div class="page_title_text">상품관리 상세보기</div>
			<div class="imgPos">
				<c:if test="${data.EMP_NUM eq params.sEmpNum}">
					<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
					<img alt="수정버튼" src="resources/images/sales/pencil.png"  class="btnImg" id="updateBtn"/>
				</c:if>
				<img alt="목록버튼" src="resources/images/sales/list.png"    class="btnImg" id="listBtn"/>
			</div>
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<table>
						<colgroup>
							<col width="200" />
							<col width="265" />
							<col width="200" />
							<col width="265" />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<input type="button" class="btn" value="상품명 *" readonly="readonly"/>
								</td>
								<td colspan="3">
									<input type="text" class="txt" readonly="readonly" disabled="disabled" value="${data.MD_NAME}"/>	 <!-- 받을 값 1 -->
								</td> 
							</tr>
							<tr height="40">							
								<td padding="none">
									<input type="button" class="btn" value="상품 유형 *" />
								</td>
								<td> 
									<select class="txt" disabled="disabled" id="md_type" >										<!-- 받을 값 2 -->
										<option value="-1">선택 하세요</option>
										<option value="0">개인 사업</option>
										<option value="1">법인 사업</option>
										<option value="2">공공 사업</option>
									</select>
								</td>	
								<td>
									<input type="button" class="btn" value="상품 등급 *" />
								</td>
								<td>
									<select class="txt" disabled="disabled" id="md_grade">										<!-- 받을 값 3 -->
										<option value="-1">선택 하세요</option>
										<option value="0">S</option>
										<option value="1">A</option>
										<option value="2">B</option>
										<option value="3">C</option>
										<option value="4">D</option>
									</select>
								</td>							
							</tr>
							<tr height="40">
								<td>
									<input type="button" class="btn" value="판매 상태 *" />
								</td>
								<td>
									<select class="txt" disabled="disabled" id="sales_sts">											<!-- 받을 값 4 -->
										<option value="-1">선택 하세요</option>
										<option value="0">판매중</option>
										<option value="1">판매중단</option>
										<option value="2">출시예정</option>
									</select>
								</td>
								<td>
									<input type="button" class="btn" value="한도 금액 *" />
								</td>
								<td>
									<input type="text" class="txt" readonly="readonly" disabled="disabled" id="limit_amnt" value="${data.LIMIT_AMNT}"/>		<!-- 받을 값 5 -->
								</td>			
							</tr>
							<tr height="40">
								<td>
									<input type="button" class="btn" value="판매 기간 *" />
								</td>
									<td>
										<input type="date" class="txt" readonly="readonly" disabled="disabled" id="sales_start_date" value="${data.SALES_START_DATE}"/> <!-- 받을 값 6 -->
									</td>		
									<td>
										<div class="date_sign">
											<span class="txt">~</span>
										</div>
									</td>
									<td colspan="2">
										<input type="date" class="txt" readonly="readonly" disabled="disabled" id="sales_end_date" value="${data.SALES_END_DATE}"/> <!-- 받을 값 7 -->
									</td>
							</tr>
							<tr height="40">
								<td>
									<input type="button" class="btn" value="중도상환 가능 여부 *" />
								</td>
								<td>
									<select class="txt" disabled="disabled" id="mid_prdmptn_psbl_check">		<!-- 받을 값 11 -->
										<option value="-1">선택 하세요</option>
										<option value="0">가능</option>
										<option value="1">불가능</option>
									</select>
								</td>
								<td>
									<input type="button" class="btn" value="대출 기간 *" />
								</td>
								<td>
									<select class="txt" disabled="disabled" id="loan_prd">		<!-- 받을 값 12 -->
										<option value="-1">선택 하세요</option>
										<option value="0">6개월</option>
										<option value="1">1년</option>
										<option value="2">3년</option>
										<option value="3">5년</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td>
									<input type="button" class="btn" value="이자율 *" />
								</td>
								<td>
									<input type="text" class="txt" readonly="readonly" disabled="disabled" id="intrst_rate" value="${data.INTRST_RATE}" /> <!-- 받을 값 8 -->
								</td>				
								
							</tr>
							<tr height="40">
								<td rowspan="2">
									<input type="button" class="btn" value="상품 설명 " readonly="readonly"/>
								</td>
								<td colspan="3">
									<textarea rows="100" cols="50" class="txt_area" readonly="readonly" disabled="disabled" >${data.MD_DSCRPTN}</textarea> <!-- 받을 값 13 -->
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 끝 -->
					<!-- 첨부자료 부분 -->
					<div class="rvn_txt"> 첨부자료 <span id=attCnt>(0)</span>
						<input type=file name='file1' style='display: none;'> 
					</div>
					<div class="cntrct_box_in">
						<input type="text" id="fileName" name="fileName" readonly="readonly" onclick="fileDownLoad()" />
					</div> 
				</div>
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>