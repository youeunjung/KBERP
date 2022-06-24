<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인관리 상세보기</title>
<c:import url="/header"></c:import>
<style type="text/css">

.cmn_btn{
	border: none;
	margin-left: 10px;
}
.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}
.fclty_aprvl_mng_cont div:nth-child(1), .fclty_aprvl_mng_cont div:nth-child(3){
 	display:inline-block;
	width: 120px;
	font-weight: bold;
 }
 
 .fclty_aprvl_mng_cont div:nth-child(2), .fclty_aprvl_mng_cont div:nth-child(4){
 	display: inline-block;
 	width: 120px;
 }
 
 .fclty_aprvl_mng_cont:nth-child(4) {
 	margin-top: 40px;
 }
 
 
.fclty_aprvl_mng_cont{
	margin-bottom: 10px;
} 

#fclty_img{
	border: 1px solid black;
	vertical-align:top;
	display:inline-block;
	margin-left: 20px;
	width: 250px;
	height: 250px;
}



#fclty_aprvl_mng_area{
	display: inline-block;
	margin-top: 50px;
	margin-left: 50px;
}

.use {
	margin-left: 20px;
	color: black;
	font-size: 16pt;
}

#use_cont{
	margin-left: 20px;
	width: 900px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#cnclBtn").on("click", function(){
		$("#actionForm").attr("action", "aprvlMng");
		$("#actionForm").submit();
	});
	
	$("#aprvl_btn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : true,
			title : "승인",
			contents : "승인하시겠습니까?",
			buttons : [{
				name : "승인",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "aprvlMngAction/aprvl",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#actionForm").attr("action","aprvlMng");
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
	
	$("#reject_btn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : true,
			title : "승인불가",
			contents : "거절하시겠습니까?",
			buttons : [{
				name : "거절",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "aprvlMngAction/reject",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#actionForm").attr("action","aprvlMng");
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
<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="num" value="${param.num}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">승인관리 상세보기</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div id="fclty_img"><img src ="resources/images/mng/building.png"/></div>
					<div id="fclty_aprvl_mng_area">
						<div class="fclty_aprvl_mng_cont">
							<div>예약 코드 :</div>
							<div>${data.RSVTN_NUM}</div>	
						</div>
						<div class="fclty_aprvl_mng_cont">
							<div>시설물 명 :</div>
							<div>${data.FCLTY_NAME}</div>
							<div>시설물 코드 :</div>
							<div>${data.FCLTY_NUM}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">	
							<div>신청자 명 : </div>
							<div>${data.EMP_NAME}</div>
							<div>예약 인원 :</div>
							<div>${data.USE_NUM_OF_PL}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">	
							<div>사용 날짜 :</div>
							<div>${data.RSVTN_DATE}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">
							<div>사용 시간 :</div>
							<div>${data.START_TIME} ~ ${data.END_TIME}</div>				
						</div>
	<input type="hidden" id="stsNum" name="stsNum" value="${data.STS_NUM}">	
	<input type="hidden" id="stsNum" name="stsNum" value="${data.PRCS_DATE}">	
						
					</div>
						<div class="use"><b>사용 용도</b></div>
						<input type="text" id="use_cont" readonly="readonly" value="${data.USE_USE}" />
			<div class="board_bottom">
			 <c:choose>

      <c:when test="${sAthrtyNum==2}">
          <input class="cmn_btn" type="button" value="목록으로" id="cnclBtn"/>
      </c:when>
      <c:otherwise>
			<input class="cmn_btn" type="button" id="aprvl_btn" value="승인">
			<input class="cmn_btn" type="button" id="reject_btn" value="승인불가">
			<input class="cmn_btn" type="button" value="목록으로" id="cnclBtn"/>
      </c:otherwise> 
 </c:choose>
				</div>
		</div>
	</div>

</body>
</html>