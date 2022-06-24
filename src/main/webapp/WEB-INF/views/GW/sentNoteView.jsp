<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sentNoteView</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.note {
	display: inline-block;
	vertical-align : top;
	width: 900px;
	height: 500px;
	border: 1px solid #000;
}

.title {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 50px;
	text-indent: 35px;
	line-height: 50px;
	background-image: url('resources/images/GW/note.png');
	background-size: 18px 18px;
	background-repeat: no-repeat;
	background-position: 10px 16px;
	font-size: 17px;
	font-weight: bold;
}

.title_bar {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 3px;
	background-color: #4B94F2;
}

.guide {
	display: table-cell;
	vertical-align: middle;
	width: 900px;
	height: 50px;
	background-color: #F2CB05;
	font-size: 12px;
	text-align: center;
	/*padding-left: 10px;*/
}

.cont {
	border-top: 1px solid black;
}

.rcpnt {
	display: inline-block;
	vertical-align: top;
	width: 440px;
	height: 50px;
	text-align: left;
	line-height: 50px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 10px;
}

.sent_time {
	display: inline-block;
	width: 440px;
	height: 50px;
	font-size: 12px;
	font-weight: bold;
	line-height: 50px;
	text-align: right;
	margin-right: 10px;
}

.write {
	resize: none;
	width: 895px;
	height: 235px;
}

.sent_atchmnt {
	display: inline-block;
	width: 440px;
	height: 50px;
	text-align: left;
	line-height: 50px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 10px;
}

.note_bottom {
	text-align: right;
	margin-top: 20px;
	margin-right: 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "sentNoteBox");
		$("#actionForm").submit();
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
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">보낸쪽지</div>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="top" name="top" value="${param.top}" />
				<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
				<input type="hidden" name="no" value="${param.no}" />
			</form>
			${data.NOTE_NUM}
			<input type="hidden" id="delcheck" name="delcheck" value="${data.DEL_CHECK}" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="note">
				<div class="title">보낸쪽지
					<div class="title_bar"></div>
				</div>
				<div class="guide">※ 받은 쪽지와 보낸 쪽지 모두 30일 이후에 자동 삭제됩니다.<br/>
								  (단, 30일이 지난 쪽지라도 사용자가 열어보지 않으면 삭제되지 않습니다.)
				</div>
				<div class="cont">
					<div class="rcpnt">받는사람 : ${data.EMP_NAME}</div>
					<div class="sent_time">보낸시간 : ${data.WRTNG_DATE}</div>
				</div>
				<textarea class="write" readonly = "readonly">${data.NOTE_CNT}</textarea>
				<div class="sent_atchmnt">
					<c:if test="${!empty data.ATT_FILE}">
						<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
						<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
						보낸파일 : <a href="resources/images/GW/upload/${data.ATT_FILE}" download="${fileName}">${fileName}</a><br/>
					</c:if>
					<c:if test="${empty data.ATT_FILE}">
						보낸파일 : 없음
					</c:if>
				</div>
				<div class="note_bottom">
					<div class="cmn_btn_ml" id="listBtn">목록으로</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>