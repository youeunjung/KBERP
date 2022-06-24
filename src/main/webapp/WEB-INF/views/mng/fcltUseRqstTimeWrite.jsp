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
	font-size:10.5pt;
	width: 900px;
}
/* 개인 작업 영역 */
#fclt_use_rsrv_wrap{
	width:900px;
	font-size: 10.5pt;
}

.cmn_btn_ml{
	margin-top: 10px;
}
#cncl_rqst{
	margin-left: 503px;
}
input:focus{
	outline-color: #F2CB05;
}
#use_prps{
	width:755px;
	height: 230px;
	resize: none;
	font-size: 10.5pt;
	padding: 5px 0px 0px 5px;
	outline-color: #F2CB05;
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
	font-size: 10.5pt;
	text-align: center;
	margin-right: 3px;
	font-weight: bold;
}

.fclt_use_rsrv_txt{
	display : inline-block;
	width: 85px;
	margin-top: 5px;
}
#use_prps_text{
	margin-bottom: 5px;
}
#timeSelBtn{
	margin: 0;
    padding: 0;
    width: 162px;
    height: 30px;
    font-size: 13px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#cncl").on("click",function(){
		$("#actionForm").attr("action","fcltUseRqst");
		$("#actionForm").submit();
	}); 
	
	$("#dateSel").on("click",function(){
		$("#actionForm").attr("action","fcltUseRqstWrite");
		$("#actionForm").submit();
	});
	
	
	$("#timeSel").on("click", function() {
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div>";
		html += "<div>";
		html += "<div>";
		html += "<table class=\"board_table\">";
		html += "<thead>";
		html += "<tr>";
		html += "<th>예약 시간대 선택</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"timeListbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 500,
			title : "예약 시간대 선택",
			contents : html,
			contentsEvent : function() {
				
				reloadList();
				
				$("#timeListbody").on("click", "#fcltyTime", function() {
					
					$("input[name='fcltyTimeNum']").val($(this).attr("fcltyTimeNum"));
					
					var html="";
					
					html += $(this).attr("startTime") + " - ";
					html += $(this).attr("endTime");
					$("#timeSel").val(html);
					
					closePopup(1);
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup(1);
				}
			}
		});
	});
	
	$("#rqst").on("click",function(){
		if(checkEmpty("#timeSel")){
			makeAlert("확인","예약 시간대를 선택하세요.");
			$("#timeSel").focus();
		}else if(checkEmpty("#useNumOfPl")){
			makeAlert("확인","사용 인원을 입력하세요");
			$("#useNumOfPl").focus();
		}else if(checkEmpty("#use_prps")){
			makeAlert("확인","사용목적을 입력하세요");
			$("#use_prps").focus();
		}else{
			var writeForm = $("#writeForm");
			
			writeForm.ajaxForm({
				success : function(res){
					console.log(res);
					// 글 저장
					var params = $("#writeForm").serialize();
					
					$.ajax({
						type : "post",
						url : "fcltRqstAction/insert",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#actionForm").attr("action","fcltUseRqst");
								$("#actionForm").submit();
							}else{
								alert("작성 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
							
						}
					});
				},
				error : function(req) {
					console.log(request.responseText);
				} // error end
			}); //ajaxform end
			writeForm.submit(); //ajaxForm 실행
		};
	});
});

function checkEmpty(sel){
	if($.trim($(sel).val()) ==""){
		return true;
	}else{
		return false;
	}
}
function reloadList() { //목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "timeSelAjax",
		dataType : "json",
		data : params,
		success : function(res){ 
			console.log(res);
			drawList(res.list);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
}
function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td class=\"board_table_hover\" id=\"fcltyTime\" fcltyTimeNum =\"" + data.TIME_DVSN_NUM + "\" startTime = \"" + data.START_TIME+ "\" endTime = \"" + data.END_TIME + "\" >" + data.START_TIME+ " - " + data.END_TIME +"</td>";
		html += "</tr>";
	}
	
	$("#timeListbody").html(html);
}

</script>
</head>
<body>

<form action="#" id="actionForm" method="post">
		<input type="hidden" id="top" name="top" value="${param.top}" />
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
		
		<!-- 시설물예약목록의 검색, 페이지 유지 -->
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="page"	name="page" value="${param.page}" />
		
		<!-- 시설물예약시 예약가능한 시설물 목록의 검색어유지 -->							
		<input type="hidden" id="fSearchGbn" name ="fSearchGbn" value="${param.fSearchGbn}"/>
		<input type="hidden" id="fSearchTxt" name="fSearchTxt" value="${param.fSearchTxt}"/>
		
		<!-- 캘린더 date값, 시설물명, 시설물번호  -->
		<input type="hidden" id="rsvtnDate" name="rsvtnDate" value="${param.rsvtnDate}"/>
		<input type="hidden" id="fcltyName" name="fcltyName" value="${param.fcltyName}" />
		<input type="hidden" id="no" name="no" value="${param.no}"/> <!-- 시설물번호 -->
		<input type="hidden" id="fcltyTimeNum" name="fcltyTimeNum" value="${param.fcltyTimeNum}"/>
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
			<div class="page_title_text">시설물 사용 신청</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		
<form action="#" id="writeForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="rsvtnDate" name="rsvtnDate" value="${param.rsvtnDate}"/>
	<input type="hidden" id="fcltyName" name="fcltyName" value="${param.fcltyName}" />
	<input type="hidden" id="no" name="no" value="${param.no}"/> <!-- 시설물번호 -->
	<input type="hidden" id="fcltyTimeNum" name="fcltyTimeNum" value="${param.fcltyTimeNum}"/>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div id="cont_top">
				<div class ="fclt_use_rsrv_row">
					<div class="fclt_use_rsrv_txt">시설물 명 :</div>
					<div class="fclt_use_rsrv">${param.fcltyName}</div>
					<div class="fclt_use_rsrv_txt">시설물 위치 :</div>
					<div class="fclt_use_rsrv">${param.fcltyPlace}</div>
					<div class="fclt_use_rsrv_txt">사용날짜 :</div>
					<div class="fclt_use_rsrv">${param.rsvtnDate}</div>
				</div>
				<div class ="fclt_use_rsrv_row">
					<div class="fclt_use_rsrv_txt">사용 시간대 :</div>
					<input type="text" class="fclt_use_rsrv" id="timeSel" readonly="readonly">
					<div class="fclt_use_rsrv_txt">사용 인원 :</div>
					<input type="text" class="fclt_use_rsrv" id="useNumOfPl" name="useNumOfPl" placeholder="숫자만 입력해주세요">
				</div>
			</div>		
				<div id="cont_bottom">
				<br/>
					<div id="use_prps_text">사용 목적/용도 :</div>
					<textarea cols="100" rows="100" id = "use_prps" name="useUse"></textarea>
				</div>
			<div id="cncl_rqst">
				<div class = "cmn_btn_ml" id="dateSel">뒤로가기</div>
				<div class = "cmn_btn_ml" id="cncl">목록으로</div>
				<div class = "cmn_btn_ml" id="rqst">신청하기</div>
			</div>
		</div>
</form>		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>