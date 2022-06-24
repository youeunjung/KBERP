<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산 상세보기</title>
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
.sixth_row td:nth-child(1), .rmrks{
	margin-left: 20px;
}

.rmrks{
	margin-top:50px;
}

.sixth_row td:nth-child(odd){
	font-weight: bold;
 }
 
 .sixth_row td{
 	display: inline-block;
 	width: 120px;
 	margin-top: 20px;
 }

#rmrks{
	margin-left: 20px;
	width: 870px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "assetList");
		$("#actionForm").submit();
	});
	
	$("#mdfyBtn").on("click", function(){
		$("#actionForm").attr("action", "assetDtlViewDrblMdfy");
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
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>자산명</th>";
		html += "<th>사용시작일</th>";
		html += "<th>사용종료일</th>";	
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"useHstryList\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\" id=\"pgn_area\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 450,
			height : 600,
			title : "사용내역",
			contents : html,
			contentsEvent : function() {
						reloadList();
				
				
				$("#pgn_area").on("click", "div", function() {
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
			url : "assetUseHstryAjax", 
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
			html += "<td>" + data.START_DATE + "</td>";
			if(data.END_DATE == null)
			html +="<td>사용중<td>"
			else
			html += "<td>" + data.END_DATE + "</td>";
			html += "</tr>";
		}
		
		$("#useHstryList").html(html);
	}
	
	function drawPaging(pb) {
		var html = "";
		
		html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
		if($("#page").val() == "1") {
			html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#page").val() == i) {
				html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
			} else {
				html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
			}
		}
		
		if($("#page").val() == pb.maxPcount) {
			html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
		} else {
			html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
		}
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
		
		$(".pgn_area").html(html);

	}

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
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>

<form action="#" id="hstryForm" method="post">
	<input type="hidden" name="num" value="${param.num}"/>
	<input type="hidden" id="page" name="page" value="1"/>
	
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자산 상세보기</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산코드</td>
							<td>
								${data.ASSET_NUM}
							</td>
							<td>자산명</td>
							<td >
								${data.ASSET_NAME}
							</td>
							<td>자산유형</td>
							<td>
								지속성
							</td>
						</tr>
						<tr class="sixth_row">
							<td>취득일</td>
							<td>
								${data.ACQRMNT_DATE}	
							</td>
							<td>담당자</td>
							<td >
								${data.EMP_NAME}
							</td>
							
							<td>현재 사용자</td>
							<td>
							<c:if test="${data.USERNAME == null}">
								없음
							</c:if>
							<c:if test="${data.USERNAME!= null}">
								${data.USERNAME}
							</c:if>
							</td>
						</tr>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<input type="text" id="rmrks" readonly="readonly" value="${data.RMRKS}" />
			<div class="board_bottom">
				<input class="cmn_btn" type="button" value="사용내역" id="useHstry"/>
				<c:if test="${sAthrtyNum==0}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==1}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==6}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<c:if test="${sAthrtyNum==7}">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				</c:if>
				<input class="cmn_btn" type="button" value="목록으로" id="listBtn"/>
			</div>
		</div>
	</div>

</body>
</html>