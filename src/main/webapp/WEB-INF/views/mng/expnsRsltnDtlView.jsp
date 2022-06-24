<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출결의서 상세보기</title>
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
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 300,
			height : 150,
			title : "삭제",
			contents : "삭제하시겠습니까?",
			buttons : [{
				name : "삭제",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
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
	<div class="right_area">
		<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">지출결의서 상세보기</div>
				<!-- 검색영역 선택적 사항 -->
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
							<td>2022-01-27</td>
						</tr>
						<tr>
							<td>전표번호</td>
							<td>000000001234</td>
						</tr>
						<tr>
							<td>계정명</td>
							<td>출장비</td>
						</tr>
						<tr>
							<td>지출처</td>
							<td>코레일</td>
						</tr>
						<tr>
							<td>지출금액</td>
							<td>100,000원</td>
						</tr>
						<tr>
							<td>지출일시</td>
							<td>2022-01-27</td>
						</tr>
						<tr>
							<td>지출유형</td>
							<td>개인카드</td>
						</tr>
						<tr>
							<td>비고</td>
							<td></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
								<div class="atchd_file"></div>
								<div class="file_name">영수증.jpg</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="btn_wrap">
					<div class="cmn_btn">목록</div>
					<div class="cmn_btn_ml">수정</div>
					<div class="cmn_btn_ml" id="btn1Btn">삭제</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>