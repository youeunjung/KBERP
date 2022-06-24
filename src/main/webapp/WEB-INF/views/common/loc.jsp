<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP</title>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#locationForm").submit();
});
</script>
</head>
<body>
<form action="board" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="21" />
	<input type="hidden" id="menuNum" name="menuNum" value="1" />
	<input type="hidden" id="menuType" name="menuType" value="B" />
</form>
</body>
</html>