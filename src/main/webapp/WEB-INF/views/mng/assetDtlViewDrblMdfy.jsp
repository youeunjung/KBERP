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

#mngrName{
	width:100px;
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
	
	$("#mngrName").on("click", function() {
		$("#srchEmp").click();
	});
	
	$("#cnclBtn").on("click", function(){
		$("#cnclForm").submit();
	});
	
$("#srchEmp").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div class=\"name_srch_wrap\">";
		html += "<table class=\"name_srch_table\">";
		html += "<tbody>";
		html += "<tr>";
		html += "<td>사원명</td>";
		html += "<td><input type=\"text\" id=\"empSrchTxt\"></td>";
		html += "<td><div class=\"cmn_btn\" id=\"empSrchBtn\">검색</div></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"130\">";
		html += "<col width=\"130\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>사원 코드</th>";
		html += "<th>사원명</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"empListTbody\">";
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
			width : 400,
			height : 500,
			title : "사원검색",
			contents : html,
			contentsEvent : function() {
				$("#sendSrchTxt").val("");
				
				reloadList();
				
				$("#pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					reloadList();
				});
				
				$("#empSrchBtn").on("click", function() {
					$("#sendSrchTxt").val($("#empSrchTxt").val());
					reloadList();
				});
				
				$("#empSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#empSrchBtn").click();
						
						return false;
					}
				});
				$("#empListTbody").on("click", "#empName", function() {
					$("#mngrName").val($(this).attr("mngrName"));
					$("#mngrNum").val($(this).attr("mngrNum"));
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
	
	$("#mdfyBtn").on("click", function() {
		if(checkEmpty("#mngrNum")) {
			alert("담당자를 선택하세요.");
			$("#mngrNum").focus();
		} else
		
			var mdfyForm = $("#mdfyForm");
			
			mdfyForm.ajaxForm({
				success : function(res) {
					// 글 수정
					var params = $("#mdfyForm").serialize();
					
					$.ajax({
						type : "post", 
						url : "assetAction/update", 
						dataType : "json",
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
								$("#cnclForm").submit();
							} else {
								alert("수정중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText); 
						}
					});
				},

			error : function(req) {
				console.log(req.responseText); 
			} // error end
		}); // ajaxForm End
			
		mdfyForm.submit(); // ajaxForm 실행
	});
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else { 
		return false;
	}
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
	
	$("#pgn_area").html(html);
	
}

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.EMP_NUM + "</td>";
		html += "<td class=\"board_table_hover\" id=\"empName\" mngrNum=\"" + data.EMP_NUM + "\" mngrName=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
		html += "</tr>";
	}
	
	$("#empListTbody").html(html);
}

function reloadList() {
	var params = $("#mngmntEmpSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngmntEmpSrchAjax", 
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


</script>
</head>
<body>
<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="assetDtlViewDrbl" id="cnclForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="num" value="${param.num}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>

<form action="#" id="mngmntEmpSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
			<input type="hidden" id="page" name="page" value="1">
</form>
<form action="#" id="mdfyForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
<div class="cont_wrap">
	<input type="hidden" name="num" value="${param.num}" />
	<input type="hidden" name="mngrNum" id="mngrNum" value="${data.MNGR_NUM}"/>
		<div class="page_title_bar">
			<div class="page_title_text">자산 내용수정</div>
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
							<td>
								<input type="text" class="mngrName" id="mngrName"  readonly="readonly" value="${data.EMP_NAME}">
							</td>
							<td>			
								<input class="cmn_btn" type="button" id="srchEmp" value="검색">
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
						<input type="text" id="rmrks" name="rmrks"  value="${data.RMRKS}" />
			<div class="board_bottom">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				<input class="cmn_btn" type="button" value="취소" id="cnclBtn"/>
			</div>
		</div>
	</div>
	</form>

</body>
</html>