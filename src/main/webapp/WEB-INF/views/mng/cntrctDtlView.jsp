<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 영업매출 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

.expns_rsltn_dtl_view {
	border-collapse: collapse;
	font-size: 10.5pt;
	margin-bottom: 15px;
}

.expns_rsltn_dtl_view tbody td {
	border: 1px solid #DDDDDD;
	height: 40px;
}

.expns_rsltn_dtl_view td:nth-child(1) {
	text-align: center;
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

.expns_rsltn_dtl_view td:nth-child(2) {
	padding-left: 15px;
	display: table-cell;
	vertical-align: middle;
}

.btn_wrap {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 850px;
}

.atchd_file {
	display: inline-block;
	vertical-align: middle;
	width: 30px;
	height: 40px;
	background-image: url('resources/images/mng/dwnld_icon.png');
	background-position: center;
	background-repeat: no-repeat;
	background-size: 20px;
	cursor: pointer;
	position: relative;
}

.file_name {
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
}

.file_name:hover {
	color: #4B94F2;
	text-decoration: underline;
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#previousBtn2").on("click", function() {
		$("#top2").val("34");
		$("#menuNum2").val("39");
		$("#menuType2").val("M");
		
		$("#actionForm").attr("action", "chitMng")
		$("#actionForm").submit();
	});
	
});
</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="empNum" name="empNum" value="${param.empNum}">
		<input type="hidden" id="empName" name="empName" value="${param.empName}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}"> 
		
		<input type="hidden" id="top2" name="top" value="${param.top}">
		<input type="hidden" id="menuNum2" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType2" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">영업매출 상세보기</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="expns_rsltn_dtl_view">
				<colgroup>
					<col width="150" />
					<col width="700" />
				</colgroup>
				<tbody>
					<tr>
						<td>계약번호</td>
						<td>${data.CNTRCT_NUM}</td>
					</tr>
					<tr>
						<td>영업번호</td>
						<td>${data.SALES_NUM}</td>
					</tr>
					<tr>
						<td>담당사원</td>
						<td>${data.EMP_NAME}</td>
					</tr>
					<tr>
						<td>계약일</td>
						<td>${data.CNTRCT_DATE}</td>
					</tr>
					<tr>
						<td>계약시작일</td>
						<td>${data.CNTRCT_START_DATE}</td>
					</tr>
					<tr>
						<td>계약종료일</td>
						<td>${data.CNTRCT_END_DATE}</td>
					</tr>
					<tr>
						<td>입금은행</td>
						<td>${data.BANK_NAME}</td>
					</tr>
					<tr>
						<td>입금계좌번호</td>
						<td>${data.DPST_ACNT_NUM}</td>
					</tr>
					<tr>
						<td>입금거래소유주명</td>
						<td>${data.DPST_TRSC_OWNER_NAME}</td>
					</tr>
					<tr>
						<td>납입계좌번호</td>
						<td>${data.PYMT_ACNT_NUM}</td>
					</tr>
					<tr>
						<td>납입자명</td>
						<td>${data.PAYER_NAME}</td>
					</tr>
					<tr>
						<td>갱신예정일</td>
						<td>${data.RNWL_EXPCTD_DATE}</td>
					</tr>
					<tr>
						<td>전환일</td>
						<td>${data.PRCD_DATE}</td>
					</tr>
					<tr>
						<td>월납부액</td>
						<td>${data.MONTH_PYMNT_AMNT}원</td>
					</tr>
					<tr>
						<td>월이자액</td>
						<td>${data.MONTH_INTRST_AMNT}원</td>
					</tr>
				</tbody>
			</table>

			<div class="btn_wrap">
				<div class="cmn_btn" id="previousBtn2">돌아가기</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>