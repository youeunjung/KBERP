<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cardView</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.cmn_btn{
	margin-left:8px;
}
#prjt_cont{   
   width:894px;
   height: 70px;
   resize: none;
   margin-top: 5px;
   font-size: 10.5pt;
   padding: 5px 0px 0px 5px;
   text-align: left;
}
#prjt_rmrks{
   width:894px;
   height: 50px;
   resize: none;
   margin-top: 5px;
   text-align: left;
   padding: 5px 0px 0px 5px;
    outline: none;
   margin-bottom: 10px;
}
#prjt_rmrks:focus,#prjt_cont:focus{
	outline: none;
}
.prjt_btn_row{
   width: 900px;
   text-align: end;
   margin-top: 10px;
   margin-bottom: 10px;
}
.prjct_text{
 width: 894px;
 height: 30px;
 font-size: 14.6667px;
 margin-top: 5px;
 margin-bottom: -10px;
 font-weight : bold;
}
.prjct_list_text{
 width: 894px;
 height: 30px;
 font-size: 14.6667px; 
 font-weight : bold;
}
.popup_head{
   background-color: #f2f2f2;
}
#cont_top{
   font-size: 14.6667px;
   height: 60px;	
 
}
.fclt_use_rsrv_txt{
	font-weight : bold;
	
}
.fclt_use_rsrv_top{
	height: 30px;
}

#input_man_pwr_list{
      display:inline-block;
   width:100%;
   height:300px;
   border: 1px solid #444;
   overflow: auto;
   text-align: center;
   border-collapse: collapse;
   font-size: 14.6667px;
   border-top: none;
}
.prjct_name{
	width:130px;
	margin-left: -15px;
}
.cont_box{
	width:100%;
	height:50px;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});

	
	$("#updateBtn").on("click", function() {
		if(checkEmpty("#prjct_name")) {
			alert("프로젝트 이름을 입력하세요.")
			$("#prjct_name").focus();
		} else if(checkEmpty("#start_date")) {
			alert("시작일자를 입력하세요.")
			$("#start_date").focus();
		} else if(checkEmpty("#end_date")) {
			alert("종료일자를 입력하세요.")
			$("#end_date").focus();
		} else if(checkEmpty("#cont")) {
			alert("내용을 입력하세요.")
			$("#cont").focus();	
		} else {
			var updateForm = $("#updateForm");
			
			updateForm.ajaxForm({
				success : function(res) {

					// 글 저장
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "prjctMngAction/update", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res == "success") {
								$("#backForm").submit();
							} else {
								alert("작성 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
				},
				error : function(req) {
					console.log(req.responseText);
					
				}
			});
			updateForm.submit(); // ajaxForm 실행	
		}
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
			<div class="page_title_text">카드 관리 > 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
	<form action="prjctView" id="backForm" method="post">
	<input type="hidden" name="prjct_num" value="${param.prjct_num}" />
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>

	<form action="#" id="updateForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden"  name="page" value="${param.page}" />
	<input type="hidden" id="prjct_num" name="prjct_num" value="${param.prjct_num}"/>
			<!-- 여기부터 쓰면 됨 -->
       <div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
	            <div id="cont_top">
				<div class ="fclt_use_rsrv_top">
					<div class="fclt_use_rsrv_txt" style="float: left; width: 16%;">프로젝트 명 :</div>
					<div class="fclt_use_rsrv" style="float: left; width: 16%;"><input type="text" class="prjct_name" id="prjct_name" name="prjct_name" value="${data.PRJCT_NAME}"></div>
					<div class="fclt_use_rsrv_txt" style="float: left; width: 16%; margin-left: 10px;">프로젝트 시작일 :</div>
					 <div class="fclt_use_rsrv" style="float: left; width: 16%;"><input type="date"  name="start_date"   id="start_date" value="${data.START_DATE}"></div>
					<div class="fclt_use_rsrv_txt" style="float: left; width: 16%;">프로젝트 종료일 :</div>
					<div class="fclt_use_rsrv" style="float: left; width: 16%;"><input type="date" id="end_date" name="end_date" value="${data.END_DATE}"></div>					
				</div>

			</div>		
				<div id="cont_bottom">
				<br/>
					<div class="prjct_text">프로젝트 내용 :</div>
					<div><input type="text"  class="cont_box" name="cont"   id="cont" value="${data.CONT}"></div>
					<div class="prjct_text">비고 :</div>
					<div><input type="text" class="cont_box" name="rmrks"   id="rmrks" value="${data.RMRKS}"></div>
				</div>
			<div class="board_bottom">
				<<div class="cmn_btn" id="updateBtn">수정</div>
            <div class="cmn_btn" id="cancelBtn">취소</div>
			</div>
		</div>
		</form>
	</div>

	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>