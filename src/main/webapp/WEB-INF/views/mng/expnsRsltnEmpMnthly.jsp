<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 지출결의서 상세보기</title>
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
	$("#backBtn").on("click", function() {
		$("#actionForm").attr("action", "expnsRsltnEmpMnthlyList");
		$("#actionForm").submit();
		
	});	
	
	$("#updateBtn").on("click", function() {
	
		$("#actionForm").attr("action", "expnsRsltnEmpMnthlyUpdate");
		$("#actionForm").submit();
	});	
	
	$("#deleteBtn").on("click", function() {
		
		var html = ""
			
			html += "<div class=\"popup_cont\">";
			html += "<table class = \"req\">";
			html += "<colgroup>";
			html += "<col width = \"160px\" />";
			html += "</colgroup>";
			html += "<tbody>";
			html += "<tr height = \"60px\" >";
			html += "<td>정말 삭제하시겠습니까?</td>";
			html += "</tbody>";
			html += "</table>";
			html += "</div>";
				makePopup({
				bg : true,
				bgClose : true,
				width : 450,
				height : 250,
				title : "지출결의서 삭제",
				contents : html,
				buttons : [{
					name : "삭제",
					func:function() {
						
							var actionForm = $("#actionForm");
							
							actionForm.ajaxForm({
								success : function(res){
									
									//글 저장
									var params =$("#actionForm").serialize();
									
									$.ajax({
										type : "post", 
										url : "expnsRsltnAction/delete", 
										dataType : "json", 
										data : params, 
										success : function(res){ 
											if(res.res == "success"){
												$("#backForm").attr("action", "expnsRsltnEmpMnthlyList");
												$("#backForm").submit();						
											}else{
												alert("삭제중 문제가 발생하였습니다.");
											}
										},
										error : function(request, status, error){ 
											console.log(request.responseText);
								}
								});// ajax end
								},//success end
								error : function(req){
									console.log(req.responseText);
								}//error end
							});// ajaxForm end
						actionForm.submit(); //ajaxForm 실행
							closePopup();		
					}
				}, {
					name : "취소"
				}]
			});
	
	});	
	
	
});


</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
		<input type="hidden" id="sendChitNum" name="sendChitNum" value="${param.sendChitNum}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="mnthly_slct" name="mnthly_slct" value="${param.mnthly_slct}">
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="top" name="top" value="${param.top}">
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}">
</form>

	<form action="expnsRsltnEmpMnthlyList" id="backForm" method="post">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
	</form>


<form action="expnsRsltnEmpMnthlyList" id="backForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="mnthly_slct" name="mnthly_slct" value="${param.mnthly_slct}">
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="top" name="top" value="${param.top}">
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">지출결의서 상세보기</div>
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
						<td>작성일자</td>
						<td>${data.RGS_DATE}</td>
					</tr>
					<tr>
						<td>전표번호</td>
						<td>${data.CHIT_NUM}</td>
					</tr>
					<tr>
						<td acntcode = "${data.ACNT_NUM}">계정명</td>
						<td>${data.ACNT_NAME}</td>
					</tr>
					<tr>
						<td>지출처</td>
						<td>${data.EXPNS}</td>
					</tr>
					<tr>
						<td>지출금액</td>
						<td>${data.AMNT}원</td>
					</tr>
					<tr>
						<td>지출일시</td>
						<td>${data.DATE_D}</td>
					</tr>
					<tr>
						<td>지출유형</td>
						<td>${data.EXPNS_TYPE}</td>
					</tr>
					<tr>
						<td>비고</td>
						<td>
							<c:choose>
								<c:when test="${data.RMRKS eq null}">-</c:when>
								<c:otherwise>${data.RMRKS}</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<c:choose>
								<c:when test="${data.ATT_FILE eq null}">-</c:when>
								<c:otherwise>
									<div class="atchd_file"></div>
									<div class="file_name">${data.ATT_FILE}</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="btn_wrap">	
					<div class="cmn_btn_ml" id="backBtn">돌아가기</div>	
					<div class="cmn_btn_ml" id="updateBtn">수정</div>		
					<div class="cmn_btn_ml" id="deleteBtn">삭제</div>		
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>