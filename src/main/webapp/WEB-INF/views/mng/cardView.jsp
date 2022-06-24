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
.popup_bg {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	background-color: #444444;
	opacity: 0.7;
	z-index: 50;
}

.popup {
	display: inline-block;
	width: 650px;
	height: 300px;
	box-shadow: 0px 0px 4px 0px #b7b7b7;
	position: absolute;
	top: calc(50% - 300px);
	left: calc(50% - 300px);
	z-index: 100;
	background-color: #f4f4f4;
	border-radius: 2px;
	line-height: 45px;
    font-size:10.5pt;
}

.popup_title {
	height: 40px;
	line-height: 40px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 10px;
	background-color: #f2cb05;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.popup_cont {
	width: calc(100% - 20px);
	height: calc(100% - 100px);
	padding: 10px;
	/* 표준 폰트 크기 */
	/* font-size: 10.5pt; */
	 background-color: #fff;
}

.popup_btn_area {
	width: 100%;
	height: 35px;
	text-align: right;
	padding-top: 5px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
/* 개인 작업 영역 */
.cmn_btn{
	margin-left:8px;
}
.int_list{
   width: 180px;
   height: 30px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.popup_table {
   text-align: center;
   border-collapse: collapse;
}
.popup_table td {
   border-top: 1px solid #222222;
}
.check{
	width: 189px;
   height: 40px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.use_issue_cont{
	text-align:left;
	margin-left: 25px;
}
.card_sep_cont{
	text-align:left;
	margin-left: 25px;
}
.card_co_cont{
	text-align:left;

	margin-left: 25px;
}
.card_code_cont,.card_name_cont,.use_name_cont{
	margin-left: 25px;
	margin-right: 25px;
}
.del_cont{
	width:485px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","cardList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action","cardUpdate");
		$("#actionForm").submit();
	});
	$("#useAddBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action","cardUseWrite");
		$("#actionForm").submit();
	});
$("#useHstry").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"100\">";
		html += "<col width=\"150\">";
		html += "<col width=\"150\">";
		html += "<col width=\"150\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>소유자</th>";
		html += "<th>사용시작일</th>";
		html += "<th>사용종료일</th>";	
		html += "<th>비고</th>";	
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"useHstryList\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 600,
			height : 600,
			title : "사용내역",
			contents : html,
			contentsEvent : function() {
						reloadList();
				
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					reloadList();
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
	function reloadList() {
	var params = $("#hstryForm").serialize();
	
	$.ajax({
		type : "post",
		url : "cardUseHstryAjax", 
		dataType : "json",
		data : params, 
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
				},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}
});
function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.USE_START_DT + "</td>";
		if(data.USE_END_DT == null)
		html +="<td>사용중<td>";
		else
		html += "<td>" + data.USE_END_DT + "</td>";
		if(data.RMRKS == null)
		html +="<td><td>";
		else
		html += "<td>" + data.RMRKS + "</td>";
		html += "</tr>";
	}
	
	$("#useHstryList").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$(".pgn_area").html(html);
	
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
			<div class="page_title_text">카드 관리 > 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
	<form action="#" id="hstryForm" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<input type="hidden" name="mng_num" value="${param.mng_num}" />
		<input type="hidden" id="page" name=page value=1> 
	</form>

	<form action="cardList" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden"  name="page" value="${param.page}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id ="no" name="no" value="${param.no}" />
	<input type="hidden" id ="mng_num" name="mng_num" value="${param.mng_num}" />
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
               <col width="110"/>
               <col width="220"/>
               <col width="110"/>
               <col width="220"/>
            </colgroup>
      <tbody>
     	 <tr>
            <td> 관리 번호 </td>
            <td>${data.MNG_NUM}</td>   
            <td> </td>
            <td></td>
        </tr>
      	<tr>
            <td> 카드 번호 </td>
               <td>${data.CARD_NUM}</td>   
            <td> 카드구분 </td>
            <c:set var="name" value="${data.CARD_DVSN}" />
           <c:choose>
           <c:when test="${name eq '0'}">
           <td>신용</td>
    	   </c:when>
    	   <c:when test="${name eq '1'}">
           <td>체크</td>
    	</c:when>
           </c:choose>
        </tr>
         <tr>
            <td> 카드명 </td>
               <td>${data.CARD_NAME}</td>
            <td> 카드사 </td>
               <td>${data.CARD_CMPNY_NAME}</td>
         </tr>
         <tr>
            <td> 카드명의 </td>
               <td>${data.NAME}</td>
            <td> 사용자 </td>
               <td>${data.EMP_NAME}</td>

         </tr>
         <tr>
            <td> 발급일자 </td>
            <td class = "use_date_cont">${data.ISSUE_DT}</td>
            <td> 종료일자 </td>
            <td class = "use_date_cont">${data.END_DT}</td>
         </tr>
         <tr>
            <td> 사용시작일자 </td>
            <td class = "use_date_cont">${data.USE_START_DT}</td>
            <td> 사용종료일자 </td>
            <td class = "use_date_cont">${data.USE_END_DT}</td>
         </tr>
         <c:if test="${data.DSCRD_DT != null}">
 		<tr>
            <td> 폐기일자 </td>
            <td class = "del_cont">${data.DSCRD_DT}</td>
         </tr>
         </c:if>
         <tr>
         <td>비고</td>
         <td>${data.RMRKS}</td>
         </tr>
         </tbody>
			</table>
			<div class="board_bottom">
				<div class="cmn_btn" id="listBtn">목록으로</div>
				<div class="cmn_btn" id="useHstry">카드소유내역</div>
				<c:set var="today" value="Date()" />
				<c:if test="${data.USE_START_DT == null || data.USE_END_DT <= today}">
				<div class="cmn_btn" id="useAddBtn">카드소유등록</div>
				</c:if>
				<div class="cmn_btn" id="updateBtn">수정</div>
			</div>
		</div>
		</form>
	</div>

	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>