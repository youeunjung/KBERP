<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cmn_btn {
	display: inline-block;
	vertical-align: top;
	padding: 0px 10px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2B705;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
}

.scmn_btn {
	display: inline-block;
	vertical-align: top;
	padding: 0px 3px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 8pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2B705;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
}

.scmn_btn2 {
	display: inline-block;
	vertical-align: top;
	padding: 0px 3px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 8pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2B705;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
}
.contbox{
	width: 800px;
	height: 1000px;
    padding: 29px 29px 0;
    border: 1px solid #dadada; 
    border-radius: 6px;
}

.contbox_head{
	width : 800px;
	height : 106px;
	position: relative;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #dadada;

}
.board_ctgry{
	font-size: 13px;
	color: #2E83F2;
}
.title_text{
	font-weight: 400;
    font-size: 26px;
}
.wrtr_info{
	width: 800px;
	height: 36px;
	
}
.board_wrt{
	display: inline-block;
	vertical-align: top;
	margin-right: 6px;
    font-size: 13px;
    font-weight: 700;
    
}
.emp_rank{
	display: inline-block;
	vertical-align: top;
    margin-right: 6px;
    font-size: 13px;
    color: #676767;
}
.date_info{
	display: inline-block;
	font-size: 12px;
    line-height: 13px;
    color: #979797;
}
.date_info2{
	font-size: 12px;
    line-height: 13px;
    color: #979797;
}
.board_cont{
	width: 800px;
	height: 878px;
	font-size: 12px;
}
.cmnt_tab{
	width: 800px;
	height: 23px;
	text-size-adjust: none;
    font-weight: 400;
}
.cmnt_area{
	width: 777px;
	height: 163px;
}
.cmnt_input_box{
	position: relative;
    width: 100%;
    height: 40px;
    border: solid 1px #dadada; 
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
    resize: none;
    margin-top: 10px;
}
.del_button_area{
	margin-top :  100px;
	margin-left : 588px;
}
.dcmnt_area{
	display: inline-block;
	position: relative;
    width: 100%;
    height: 60px;
    border: solid 1px #dadada; 
    /* padding: 10px 110px 10px 14px; */
    background: #fff;
    box-sizing: border-box;
    /* vertical-align: top; */
    resize: none;
    margin-top: 10px;
    font-size: 13px;
    text-align: left;
    
}
.dwnld{
	display:inline-block;
	margin-left: 550px;
	cursor: pointer;
	width: 50px;
}
.dcmnt{
	display:inline-block;
	cursor: pointer; 
	width: 50px;
	
}
.dcmnt_area_txt{
	display:inline-block;
	font-size: 13px;	
	line-height: 60px;
	vertical-align: top;
}

.cmnt_btn_area{
	margin-top: 10px;
	margin-left:690px;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "board");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		
		$("#actionForm").attr("action", "boardUpdate");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
	        	 type : "post",
	        	 url : "boardAction/delete",
	        	 dataType : "json",
	        	 data : params,
	        	 success : function(res) {
	        		 if(res.res == "success"){
	        			 $("#locationForm").attr("action", "board");
	        			 $("#locationForm").submit();
	        		 } else{
	        			 alert("삭제중 문제가 발생하였습니다.");
	        		 }
	   			},
	   			error : function(request, status, error) {
	   				console.log(request.responseText);
	   			}
	     	 });
		}	
	});
	
	
	$("#writeBtn").on("click", function() {
		
		if(checkEmpty("#cmnt_cont")) {
			alert("댓글을 입력해 주세요.");
			$("#cmnt_cont").focus();
		
		} else {
			var params = $("#cmntForm").serialize();
			
			$.ajax({
	        	 type : "post",
	        	 url : "cmntAction/insert",
	        	 dataType : "json",
	        	 data : params,
	        	 success : function(res) {
	        		 if(res.res == "success"){	        			       	
	        			 reloadList();
	        			 $("#cmnt_cont").val("");
	        		 } else{
	        			 alert("문제가 발생하였습니다.");
	        		 }
	   			},
	   			error : function(request, status, error) {
	   				console.log(request.responseText);
	   			}
	     	 });
		}
		
		
	});

	
	$("tbody").on("click", "#deleteBtn2", function () {
		
		
			if(confirm("삭제하시겠습니까?")) {
				
				var tr = $(this).parent().parent();
				
				$("#cmntNo").val(tr.attr("no"));
				
				var params = $("#cmntForm").serialize();
				
				$.ajax({
		        	 type : "post",
		        	 url : "cmntAction/delete",
		        	 dataType : "json",
		        	 data : params,
		        	 success : function(res) {
		        		 if(res.res == "success"){
		        			 reloadList();
		        		 } else{
		        			 alert("삭제중 문제가 발생하였습니다.");
		        		 }
		   			},
		   			error : function(request, status, error) {
		   				console.log(request.responseText);
		   			}
		     	 });
			}	
		
		

		
	});
	
	
	function reloadList() { // 목록 조회용 
		  var params = $("#actionForm").serialize();
	    
	    $.ajax({
	   	 type : "post",
	   	 url : "cmntAjax",
	   	 dataType : "json",
	   	 data : params,
	   	 success : function(res) {
	   		 	console.log(res);
	   		 	drawList(res.list);
				},
				error : function(request, status, error) {
					console.log(request.responseText);
				}
	    });
		
	}
	
	function drawList(list) {		
		var html = "";
		
		for(var data of list){
			html += "<tr no=\"" + data.CMNT_NUM + "\">";
			html += "<td class=\"board_wrt\">" + data.EMP_NAME + "</td>";
			html += "<td class=\"date_info2\">"+ data.WRTNG_DATE + "</td>";
			html += "<td>";
			html += "<div class=\"scmn_btn\" id=\"deleteBtn2\">삭제</div>";
			html += "</td>";
			html += "<tr>";
			html += "<td colspan=\"3\">" + data.CMNT_CONT + "</td>";
		}
		$("tbody").html(html);
	}
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
			<!-- 선택적 사항 -->
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="top" name="top" value="${param.top}" />
				<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
				<input type="hidden" name="no" value="${param.no}" />
				<input type="hidden" name="page" value="${param.page}" />
				<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
				<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
				<input type="hidden" name="title" value="${data.BOARD_TITLE}" />
				<input type="hidden" name="cont" value="${data.BOARD_CONT}" />
				<input type="hidden" id="admnstrtn" name="admnstrtn" value="${data.BOARD_ADMNSTRTN_NUM}">
			</form>
			번호 : ${data.WRTNG_NUM} <br/>
			제목 : ${data.BOARD_TITLE}<br/>
			작성일 : ${data.BOARD_WRTNG_DATE}<br/>
			<input type="hidden" id="delcheck" name="delcheck" value="${data.DEL_CHECK}">
			
		
			<!-- 첨부파일 존재시  -->
			<c:if test="${!empty data.ATCHD_FILE}">
			<div class="dcmnt_area">
	
			<img src="resources/images/GW/document_icon.png" class="dcmnt"> 
			<span class="dcmnt_area_txt">첨부파일sample.exe</span>
			<img src="resources/images/GW/download_icon.png" class="dwnld">
			</div>
			<!-- c:set ==> 변수선언 -->
			<!-- el에서 fn:length ==> 문자열의 길이나 배열의 크기를 가져옴 -->
			<c:set var="fileLength" value="${fn:length(data.ATCHD_FILE)}"></c:set>
			<c:set var="fileName" value="${fn:substring(data.ATCHD_FILE, 20, fileLength)}"></c:set>
			<!-- a 속성 중 download : 파일을 다운로드하게 한다. 만약 값이 존재하면 파일명을 값으로 변경하여 다운
									확장자 없이 이름이 올 경우 자동으로 파일의 확장자를 붙여줌 
			-->
			첨부파일 : <a href="resources/upload/${data.ATCHD_FILE}" download="${fileName}">
			${fileName}</a><br/>
			</c:if>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="contbox">
		<div class="contbox_head">
		<div class="board_ctgry">자유게시판 >
		</div>
		<h3 class="title_text">
		
			${data.BOARD_TITLE}
			
		</h3>
		<div class="wrtr_info">
			<div class="board_wrt">
				${data.EMP_NAME}
			</div>
			<!-- <div class="emp_rank">대리</div> 직급넣을때 씀 -->
				<div class="date_info">
					<span class="date">
						${data.BOARD_WRTNG_DATE}
					</span>
					<span class="count">조회
					${data.BOARD_HITS}
					</span>
				</div>							
		</div>
		<div class="board_cont">

${data.BOARD_CONT}


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

			<div class="cmnt_tab"><h3>댓글</h3></div>
			<form action="#" id="cmntForm" method="post">		
			<div class="cmnt_area">		
			<table class="cmnt_table">
				<colgroup>
					<col width="50"/>
					<col width="100"/>
					<col width="200"/>
					</colgroup>
				<thead>
					<tr>
					
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr>
					<th colspan="3"></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<input type="hidden" id="cmntNo" name="cmntNo" />
			<input type="hidden" name="no" value="${param.no}" />
			<input type="hidden" id="writer" name="writer" value="${sEmpNum}"/>
			<textarea rows="10" cols="5" id= "cmnt_cont" name = "cmnt_cont" class="cmnt_input_box" placeholder="댓글을 입력하세요"></textarea>
			<br/>
			<div class="cmnt_btn_area">
				<div class="scmn_btn2" id="writeBtn">댓글 등록</div>
			</div>
				<div class="del_button_area">
				<div class="cmn_btn" id="listBtn">목록</div>
				<c:if test="${data.EMP_NAME eq sEmpName}">
				<div class="cmn_btn" id="updateBtn">수정</div>
				<div class="cmn_btn" id="deleteBtn">삭제</div>
				</c:if>
			</div>	
			</div>
			</form>	
			
		</div>
		</div>
		</div>
</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>