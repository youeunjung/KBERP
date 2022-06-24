<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	switch("${res}") {
	case "expnsRsltnGo" :
		$("#actionForm").attr("action", "expnsRsltnadmnstrEmpMnthly");
		$("#actionForm").submit();
		break;
	case "intrnlCostGo" :
		$("#actionForm").attr("action", "intrnlCostMngDtlView");
		$("#actionForm").submit();
		break;
	case "cntrctGo"	:
		$("#actionForm").attr("action", "cntrctDtlView");
		$("#actionForm").submit();
		break;
	case "failed" :
		alert("작업 중 문제가 발생했습니다.");
		makeAlert("오류", "작업 중 문제가 발생했습니다.");
		history.back();
	}

});
</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}">
		<input type="hidden" id="sendChitNum" name="sendChitNum" value="${param.sendChitNum}">
		<input type="hidden" name="top" value="${top}">
		<input type="hidden" name="menuNum" value="${menuNum}">
		<input type="hidden" name="menuType" value="${menuType}">
		<input type="hidden" name="back" value="back">
	</form>
</body>
</html>