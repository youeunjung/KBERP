<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 자유게시판 글수정</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.tltle_input_box{
	position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
}
.cont_input_box{
	position: relative;
    width: 100%;
    height: 400px;
    border: solid 1px #dadada; 
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
    resize: none;
}

.btn_type {
    font-weight: 80;
    display: block;
    width: 40px;
    font-size: 11px;
    font-weight: 150;
    text-align: center;
    cursor: pointer;
    box-sizing: border-box;
}
.btn_rgstrtn{
	display: inline-block;
	margin-left: 850px;
	color: #000000;
    border: solid 1px rgba(0,0,0,.08);
    font-weight: bold;
    background-color: #F2B705;
}
.cmn_btn{
	margin-left: 5px;
}
.cmn_btn_box{
	margin-left: 750px;
	
}
.page_title_text {
	margin-bottom: 29px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
$("#cancelBtn").on("click", function() {
	$("#backForm").submit();
});

$("#fileDelBtn").on("click", function() {
	$("#attName").remove();
	$(this).remove();
	$("#att").show();
});

$("#updateBtn").on("click", function () {
	
	 
     if(checkEmpty("#title")){
        alert("제목을 입력하세요.");
        $("#title").focus();
     }else if(checkEmpty("#con")){
        alert("내용을 입력하세요.");
        $("#cont").focus();
     }else{
      	var updateForm = $("#updateForm");
      	
      	updateForm.ajaxForm({
   		success : function(res) {
				// 물리파일명 보관
				if(res.fileName.length > 0) {
					$("#attFile").val(res.fileName[0]);
				}
				 			
		     	// 글 수정
		     	var params = $("#updateForm").serialize();
		     	
				$.ajax({
			        	 type : "post",
			        	 url : "boardAction/update",
			        	 dataType : "json",
			        	 data : params,
			        	 success : function(res) {
			        		 if(res.res == "success"){
			        			 $("#backForm").submit();
			        		 } else{
			        			 alert("수정중 문제가 발생하였습니다.");
			        		 }
			   			},
			   			
			     	 });
			}, 
			error : function(req) {
				console.log(req.responseText);
			} // error end
   	}); // ajaxForm end
   	
   	updateForm.submit(); // ajaxForm 실행
     
     }
 });
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
	
}
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
			<div class="page_title_text">임시게시판</div>
			
		<!-- 해당 내용에 작업을 진행하시오. -->
		</div>
		<div class="cont_area">

<form action="boardView" id="backForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="no" value="${param.no}">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}">
	<input type="hidden" name="searchTxt" value="${param.searchTxt}">
</form>
<form action="fileUploadAjax" id="updateForm" method="post"
	  enctype="multipart/form-data">
<input type="hidden" name="no" value="${param.no}">
<input type="text" id="title" name="title" class="tltle_input_box" placeholder="제목을 입력하세요" value="${param.title}">
<textarea rows="20" cols="60" id="cont" name="cont" class="cont_input_box" placeholder="내용을 입력하세요">${param.cont}</textarea>
첨부파일 :
<c:choose>
	<c:when test="${empty data.ATCHD_FILE}">
		<input type="file" name="att" /><br/>
		<input type="hidden" id="attFile" name="attFile" />
	</c:when>
	<c:otherwise>
		<c:set var="fileLength" value="${fn:length(data.ATCHD_FILE)}"></c:set>
		<c:set var="fileName" value="${fn:substring(data.ATCHD_FILE, 20, fileLength)}"></c:set>
		<span id="attName">${fileName}</span>
		<input type="button" value="첨부파일삭제" id="fileDelBtn" />
		<input type="hidden" id="attFile" name="attFile" value="${data.ATCHD_FILE}" />
		<input type="file" id="att" name="att" /><br/>
	</c:otherwise>
</c:choose>
<input type="hidden" id="attFile" name="attFile" /><br/>
<input type="hidden" id="writer" name="writer" value="${data.EMP_NUM}" />
<input type="hidden" id="admnstrtn" name="admnstrtn" value="${data.BOARD_ADMNSTRTN_NUM}">
	<div class="cmn_btn_box">
		<div class="cmn_btn" id="updateBtn">등록</div>	
		<div class="cmn_btn" id="cancelBtn">취소</div>		
	</div>
</form>
</div>
</div>

<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>