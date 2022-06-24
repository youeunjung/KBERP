<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산등록</title>
<c:import url="/header"></c:import>
<style type="text/css">

#srchEmp{
	height: 25px;
	font-size: 10pt;
	margin-top : 2px;
}

#assetName{
	width:130px;
	margin-top: 5px;
}
.mngrName{
	width:130px;
	margin-top:5px;
}
#mngrtd{
	margin-left:60px;
}
#qunty{
	width:50px;
}

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
	width: 80px;
 }
 
 .sixth_row td:nth-child(3){
 margin-left:30px;
 
 }
 
 
 .sixth_row td:nth-child(even){
 	margin-right:20px;
 }
 
 .sixth_row td{
 	display: inline-block;
 	margin-top: 20px;
 }
 


#rmrks{
	margin-left: 10px;
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
		$("#actionForm").attr("action", "assetList");
		$("#actionForm").submit();
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
					$("#page").val("1");
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
	
	$("#rgstrtnBtn").on("click", function() {
		if(checkEmpty("#assetName")) {
			alert("자산명을 입력하세요.");
			$("#assetName").focus();
		} else if(checkEmpty("#qunty")) {
			alert("수량을 입력하세요.");
			$("#qunty").focus();
		}  else if(checkEmpty("#acqrmntDt")) {
			alert("취득일을 선택하세요.");
			$("#acqrmntDt").focus();
		} else if(checkEmpty("#mngrNum")) {
			alert("담당자를 선택하세요.");
			$("#mngrNum").focus();
		} else {
			var rgstrtnForm = $("#rgstrtnForm");
			
			rgstrtnForm.ajaxForm({
				success : function(res) {
					// 글 저장
					var params = $("#rgstrtnForm").serialize();
					
					$.ajax({
						type : "post", 
						url : "assetAction/insert", 
						dataType : "json",
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
								$("#actionForm").attr("action","assetList");
								$("#actionForm").submit();
							} else {
								alert("작성중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText); 
						}
					});
				}, // success end
				error : function(req) {
					console.log(request.responseText); 
				} //error end
			});
			
			rgstrtnForm.submit(); // ajaxForm 실행
			
		} // else end
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
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자산등록</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			
			<form action="#" id="mngmntEmpSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
			<input type="hidden" id="page" name="page" value="1">
			</form>
			<form action="#" id="rgstrtnForm" method="post" >
			<input type="hidden" name="writer" value="${sEmpNum}" />
			<input type="hidden" name="mngrNum" id="mngrNum"/>
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
			<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
			
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산명</td>
							<td>
								<input type="text" id="assetName" name="assetName" />
							</td>
							<td>자산유형</td>
							<td>
								<select id="assetType" name="assetType">
									<option value="0">지속성</option>
									<option value="1">소모성</option>
								</select>
							</td>
							<td class="qunty">수량</td>
							<td>
								<input type="text" id="qunty" name="qunty" />
								<select id="quntyDvsnNum" name="quntyDvsnNum">
									<option value="0">ea</option>
									<option value="1">set</option>
									<option value="2">box</option>
								</select>			
							</td>
						</tr>
						<tr class="sixth_row">
							<td>취득일</td>
							<td>
							<input type="date" id="acqrmntDt" name="acqrmntDt" />	
							</td>
							<td id="mngrtd">담당자</td>
							<td>
							<input type="text" class="mngrName" id="mngrName"  readonly="readonly">			
							<input class="cmn_btn" type="button" id="srchEmp" value="검색">
							</td>
						</tr>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<div id="rmrks">
						<input type="text" id="rmrks" name="rmrks" />
						</div>
			<div class="board_bottom">
				<input class="cmn_btn" type="button" id="rgstrtnBtn" value="등록">
				<input class="cmn_btn" type="button" value="취소" id="cnclBtn"/>
			</div>
			</form>
		</div>
	</div>

</body>
</html>