<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 내부비용관리 상세보기</title>
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

.expns_rsltn_dtl_view td:nth-child(odd) {
	text-align: center;
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

.expns_rsltn_dtl_view td:nth-child(even) {
	padding-left: 15px;
	display: table-cell;
	vertical-align: middle;
}

.btn_wrap {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 900px;
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
	
	$("#previousBtn").on("click", function() {
		$("#actionForm").attr("action", "intrnlCostMngMnthlyList");
		$("#actionForm").submit();
	});
	
	$("#previousBtn2").on("click", function() {
		$("#top2").val("34");
		$("#menuNum2").val("39");
		$("#menuType2").val("M");
		
		$("#actionForm").attr("action", "chitMng");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "intrnlCostMngUpdate");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : false,
			title : "삭제",
			contents : "해당 내부비용관리 전표를 삭제하시겠습니까?",
			buttons : [{
				name : "삭제",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "intrnlCostMngAction/delete",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#page2").val("1");
								$("#page").val("1");
								$("#actionForm").attr("action", "intrnlCostMngMnthlyList");
								$("#actionForm").submit();
							} else {
								alert("삭제 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
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
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="sendChitNum" name="sendChitNum" value="${param.sendChitNum}">
		
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
			<div class="page_title_text">내부비용관리 상세보기</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="expns_rsltn_dtl_view">
				<colgroup>
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
				</colgroup>
				<tbody>
					<tr>
						<td>작성자</td>
						<td colspan="5">${data.EMP_NAME}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="5">${data.DATE_RGS}</td>
					</tr>
					<tr>
						<td>지출일자</td>
						<td colspan="5">${data.DATE_D}</td>
					</tr>
					<tr>
						<td>전표번호</td>
						<td colspan="5">${data.CHIT_NUM}</td>
					</tr>
					<tr>
						<td>계정명</td>
						<td colspan="5">${data.ACNT_NAME}</td>
					</tr>
					<tr>
						<td>거래처</td>
						<td colspan="5">${data.CRSPNDNT}</td>
					</tr>
					<tr>
						<td>품목명</td>
						<td>${data.ITEM}</td>
						<td>수량</td>
						<c:choose>
							<c:when test="${data.QUNTY != null}">
								<td>${data.QUNTY}</td>								
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>
						</c:choose>
						<td>단가</td>
						<td><fmt:formatNumber value="${data.UNIT_PRICE}" pattern="###,###,###,###"/> 원</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="5"><fmt:formatNumber value="${data.SPLY_PRICE}" pattern="###,###,###,###"/> 원</td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="5"><fmt:formatNumber value="${data.SRTX}" pattern="###,###,###,###"/> 원</td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td colspan="5">${data.BSNSMN_NUM}</td>
					</tr>
					<tr>
						<td>합계</td>
						<td colspan="5"><b><fmt:formatNumber value="${data.AMNT}" pattern="###,###,###,###"/> 원</b></td>
					</tr>
					<tr>
						<td>비고</td>
						<c:choose>
							<c:when test="${data.RMRKS != null}">
								<td colspan="5">${data.RMRKS}</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">-</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="5">
							<c:choose>
								<c:when test="${!empty data.ATT_FILE}">
									<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
									<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
									<div class="atchd_file"></div>
									<a href="resources/upload/${data.ATT_FILE}" class="file_name" download="${fileName}">${fileName}</a>
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="btn_wrap">
				<c:if test="${empty param.back}">				
					<div class="cmn_btn" id="previousBtn">목록</div>
					<div class="cmn_btn_ml" id="updateBtn">수정</div>
					<div class="cmn_btn_ml" id="deleteBtn">삭제</div>
				</c:if>
				<c:if test="${!empty param.back}">
					<div class="cmn_btn" id="previousBtn2">돌아가기</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>