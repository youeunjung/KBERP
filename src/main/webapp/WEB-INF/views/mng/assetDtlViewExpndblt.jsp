<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산 상세보기</title>
<c:import url="/header"></c:import>
<style type="text/css">

.cmn_btn{
	border: none;
	margin-left: 10px;
}
.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}
.sixth_row td:nth-child(1), .rmrks{
	margin-left: 20px;
}

.rmrks{
	margin-top:50px;
}

.sixth_row td:nth-child(odd){
	font-weight: bold;
 }
 
 .sixth_row td{
 	display: inline-block;
 	width: 120px;
 	margin-top: 20px;
 }

#rmrks{
	margin-left: 20px;
	width: 870px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "assetList");
		$("#actionForm").submit();
	});
	
	$("#mdfyBtn").on("click", function(){
		$("#actionForm").attr("action", "assetDtlViewExpndbltMdfy");
		$("#actionForm").submit();
	});
});


</script>
</head>
<body>
<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="num" value="${param.num}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자산 상세보기</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산코드</td>
							<td>
								${data.ASSET_NUM}
							</td>
							<td>자산명</td>
							<td >
								${data.ASSET_NAME}
							</td>
							<td>자산유형</td>
							<td>
								소모성
							</td>
						</tr>
						<tr class="sixth_row">
							<td>취득일</td>
							<td>
								${data.ACQRMNT_DATE}	
							</td>
							<td>담당자</td>
							<td >
								${data.EMP_NAME}
							</td>
							<td>수량</td>
							<td>
								${data.QUNTY}
								<c:if test="${data.QUNTY_DVSN_NUM==0}">
									ea
								</c:if>
								<c:if test="${data.QUNTY_DVSN_NUM==1}">
									set
								</c:if>
								<c:if test="${data.QUNTY_DVSN_NUM==2}">
									box
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<input type="text" id="rmrks" name="rmrks" readonly="readonly" value="${data.RMRKS}" />
			<div class="board_bottom">
				<c:if test="${sAthrtyNum==0}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==1}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==6}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==7}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<input class="cmn_btn" type="button" value="목록으로" id="listBtn"/>
			</div>
		</div>
	</div>

</body>
</html>