<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산대여 등록</title>
<c:import url="/header"></c:import>
<style type="text/css">

#assetName{
	width:130px;
}
#assetNum, #useEmpName{
	margin-top: 5px;
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
	margin-left: 20px;
	width: 870px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#cnclBtn").on("click", function(){
		$("#actionForm").attr("action", "assetRntl");
		$("#actionForm").submit();
	});
	

	$("#assetNum").on("click", function() {
		$("#srchAsset").click();
	});

	$("#useEmpName").on("click", function() {
		$("#srchEmp").click();
	});
	
	
	$("#rgstrtnBtn").on("click", function() {
		if(checkEmpty("#assetNum")) {
			alert("자산코드를 입력하세요.");
			$("#assetNum").focus();
		} else if(checkEmpty("#useEmpName")) {
			alert("사용자를 선택하세요.");
			$("#useEmpName").focus();
		} else if(checkEmpty("#startDt")) {
			alert("시작일 선택하세요.");
			$("#startDt").focus();
		} else if(checkEmpty("#rmrks")) {
			alert("비고를 입력하세요.");
			$("#rmrks").focus();
		} else {
			var rgstrtnForm = $("#rgstrtnForm");
			
			rgstrtnForm.ajaxForm({
				success : function(res) {
					// 글 저장
					var params = $("#rgstrtnForm").serialize();
					$.ajax({
						type : "post", 
						url : "assetAction/insertRntl", 
						dataType : "json",
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
								$("#actionForm").attr("action","assetRntl");
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
	});// Rgstrtn end
	
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
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>부서명</th>";
		html += "<th>직급</th>";
		html += "<th>사원명</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"empAllListTbody\">";
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
			height : 450,
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
				$("#empAllListTbody").on("click", "#empName", function() {
					$("#useEmpNum").val($(this).attr("useEmpNum"));
					$("#useEmpName").val($(this).attr("useEmpName"));
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
	});	//srchEmp
	
$("#srchAsset").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div class=\"Asset_srch_wrap\">";
		html += "<table class=\"Asset_srch_table\">";
		html += "<tbody>";
		html += "<tr>";
		html += "<td>자산명</td>";
		html += "<td><input type=\"text\" id=\"assetSrchTxt\"></td>";
		html += "<td><div class=\"cmn_btn\" id=\"assetSrchBtn\">검색</div></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>자산번호</th>";
		html += "<th>자산명</th>";
		html += "<th>비고</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"assetListTbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\" id=\"pgn_area1\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 350,
			height : 450,
			title : "자산검색",
			contents : html,
			contentsEvent : function() {
				$("#sendSrchTxt1").val("");
				
				reloadList1();
				
				$("#pgn_area1").on("click", "div", function() {
					$("#assetSrchForm #page").val($(this).attr("page"));
					reloadList1();
				});
				
				$("#assetSrchBtn").on("click", function() {
					
					$("#assetSrchForm #page").val("1");
					$("#sendSrchTxt1").val($("#assetSrchTxt").val());
					reloadList1();
				});
				
				$("#assetSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#assetSrchBtn").click();
						
						return false;
					}
				});
		
				$("#assetListTbody").on("click", "#useAssetName", function() {
					$("#assetNum").val($(this).attr("assetNum"));
					$("#assetName").val($(this).attr("assetName"));
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
	});	//srchAsset
});

function reloadList() {
	var params = $("#allEmpSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "allEmpSrchAjax", 
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
}// 사원검색

function reloadList1() {
	var params = $("#assetSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "assetSrchAjax", 
		dataType : "json",
		data : params, 
		success : function(res) {
			drawList1(res.list);
			drawPaging1(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
} // 자산검색

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
	
} // 사원 페이징

function drawPaging1(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#assetSrchForm #page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#assetSrchForm #page").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#assetSrchForm #page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#assetSrchForm #page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#assetSrchForm #page").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$("#pgn_area1").html(html);
	
} // 자산 페이징

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.DEPT_NAME + "</td>";
		html += "<td>" + data.RANK_NAME + "</td>";
		html += "<td class=\"board_table_hover\" id=\"empName\" useEmpNum=\"" + data.EMP_NUM + "\" useEmpName=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
		html += "</tr>";
	}
	
	$("#empAllListTbody").html(html);
} // 사원 목록

function drawList1(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.ASSET_NUM + "</td>";
		html += "<td class=\"board_table_hover\" id=\"useAssetName\" assetNum=\"" + data.ASSET_NUM + "\" assetName=\"" + data.ASSET_NAME + "\">" + data.ASSET_NAME + "</td>";
		if(data.RMRKS == null)
		html += "<td><td>"
		else
		html += "<td>" + data.RMRKS + "</td>";
		html += "</tr>";
	}
	
	$("#assetListTbody").html(html);
} // 자산 목록

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
		<form action="#" id="allEmpSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
			<input type="hidden" id="page" name="page" value="1">
		</form>
		<form action="#" id="assetSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt1" name="sendSrchTxt1">
			<input type="hidden" id="page" name="page" value="1">
		</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자산대여 등록</div>
		</div>
			<form action="#" id="rgstrtnForm" method="post" >
			<input type="hidden" id="useEmpNum" name="useEmpNum"/>
			
				<div class="cont_area">
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산코드</td>
							<td>
								<input style=width:80px; type="text" id="assetNum" name="assetNum" readonly="readonly" />
								<input class="cmn_btn" type="button" id="srchAsset" value="검색">
							</td>
							<td>자산명</td>
							<td>
								<input style=width:80px; type="text" id="assetName" name="assetName" readonly="readonly" />
							</td>
							<td>사용자</td>
							<td>
								<input style=width:120px; type="text" id="useEmpName" name="useEmpName" readonly="readonly" />
								<input class="cmn_btn" type="button" id="srchEmp" value="검색">
							</td>
						</tr>
						<tr class="sixth_row">
							<td>사용시작일</td>
							<td >
								<input type="date" id="startDt" name="startDt" />
							</td>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<input type="text" id="rmrks" name="rmrks" />
			<div class="board_bottom">
				<input class="cmn_btn" type="button" id="rgstrtnBtn" value="등록">
				<input class="cmn_btn" type="button" value="취소" id="cnclBtn"/>
			</div>
		</div>
			</form>
	</div>

</body>
</html>