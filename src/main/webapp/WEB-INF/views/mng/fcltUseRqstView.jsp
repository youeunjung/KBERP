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
.fclt_use_rsrv:focus{
	outline: none;
}
.int:focus{
	outline: none;
}
#fclt_use_rsrv_wrap{
	width:900px;
	font-size: 10.5pt;
}

.cmn_btn_ml{
	margin-top: 10px;
}
#cncl_rqst{
	margin-left: 590px;
}
#use_prps:focus{
	outline: none;
}
#use_prps{
	width:755px;
	height: 230px;
	resize: none;
	font-size: 10.5pt;
	padding: 5px 0px 0px 5px;
}
.int{
	width: 200px;
	height: 20px;
	font-size: 10.5pt;
	text-align: center;
}
#rmrks{
	margin-left: 20px;
}
.fclt_use_rsrv_row{
	margin-top: 10px;
	width:900px;
}
.fclt_use_rsrv{
	display : inline-block;
	width: 160px;
	height: 20px;
	font-size: 10.5pt;
	text-align: center;
	margin-right: 3px;
	font-weight: bold;
}

.fclt_use_rsrv_txt{
	display : inline-block;
	width: 85px;
}
#use_prps_text{
	margin-bottom: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","fcltUseRqst");
		$("#actionForm").submit();
	});
	
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : true,
			title : "예약취소",
			contents : "예약을 취소하시겠습니까?",
			buttons : [{
				name : "예약취소",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "fcltRqstAction/delete",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#actionForm").attr("action","fcltUseRqst");
								$("#actionForm").submit();
							}else{
								alert("취소 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
						}
					});	
				}
			}, {
				name : "닫기"
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
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">시설물 예약 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
</form>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div id="fclt_use_rsrv_wrap">
			<div id="cont_top">
				<div class ="fclt_use_rsrv_row">
					<div class="fclt_use_rsrv_txt">시설물 명 :</div>
					<div class="fclt_use_rsrv">${data.FCLTY_NAME}</div>
					<div class="fclt_use_rsrv_txt">시설물 위치 :</div>
					<div class="fclt_use_rsrv">${data.PLACE}</div>
					<div class="fclt_use_rsrv_txt">사용날짜 :</div>
					<div class="fclt_use_rsrv">${data.RSVTN_DATE}</div>					
				</div>
				<div class ="fclt_use_rsrv_row">
					<div class="fclt_use_rsrv_txt">사용 시간대 :</div>
					<div class="fclt_use_rsrv">${data.START_TIME} ~ ${data.END_TIME}</div>
					<div class="fclt_use_rsrv_txt">사용 인원 :</div>
					<div class="fclt_use_rsrv">${data.USE_NUM_OF_PL}</div>
					<div class="fclt_use_rsrv_txt">예약 현황 :</div>
					<div class="fclt_use_rsrv">${data.STS_NUM}</div>
				</div>
			</div>		
				<div id="cont_bottom">
				<br/>
					<div id="use_prps_text">사용 목적/용도 :</div>
					<textarea cols="100" rows="100" id = "use_prps" readonly="readonly">${data.USE_USE}
					</textarea>
				</div>
				<div id="cncl_rqst">
					<div class = "cmn_btn_ml" id="listBtn">목록으로</div>
					<div class="cmn_btn_ml" id="btn2Btn">예약취소</div>
				</div>
			</div>
			
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>