<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 내부비용관리 신규</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */

/* 계정명 검색 팝업 css */
.popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
	background-color: #ffffff;
}

.acnt_name_srch_table input:focus {
	outline-color: #F2CB05;
}

.acnt_name_srch_wrap {
	padding-bottom: 5px;
	border-bottom: 1px solid #DDDDDD;
}

.acnt_name_srch_table {
	border-collapse: collapse;
	font-size: 11pt;
	margin-left: 35px;
}

.acnt_name_srch_table tr {
	height: 30px;
}

.acnt_name_srch_table td {
	width: 60px;
	padding: 5px 0px 5px 10px;
	font-weight: bold;
}

.acnt_name_srch_table input {
	width: 130px;
	height: 20px;
}

.ctgr_list_wrap {
	padding: 10px 40px 0px;
	font-size: 11pt;
}

.main_ctgr_wrap {
	display: inline-block;
	vertical-align: top;
	width: 276px;
	height: 360px;
	font-weight: bold;
}

.board_table th {
	background-color: #F2F2F2;
}
/* 팝업 css 끝 */


/* 개인 작업 영역 */
.intrnl_cost_admnstrtn_new {
	font-size: 10.5pt;
	width: 815px;
	border-collapse: collapse;
	border-bottom: 1px solid #DDDDDD;
}

.intrnl_cost_admnstrtn_new td {
	height: 40px;
}

.intrnl_cost_admnstrtn_new td:nth-child(odd) {
	width: 125px;
	font-weight: bold;
	text-align: center;
}

.intrnl_cost_admnstrtn_new td:nth-child(3) {
	text-align: right;
	padding-right: 20px;
	width: 60px;
}

.intrnl_cost_admnstrtn_new td:nth-child(5) {
	text-align: right;
	padding-right: 20px;
	width: 60px;
}

.intrnl_cost_admnstrtn_new td:nth-child(even) {
	width: 75px;
}

.input {
	width: 700px;
	height: 20px;
	padding: 0px 5px;
}

.input_short {
	width: 167px;
	height: 20px;
	padding: 0px 5px;
}

.acnt_code_input {
	width: 120px;
	height: 20px;
	vertical-align: middle;
}

.acnt_code_date {
	height: 22px;
	vertical-align: middle;
}

.cmn_btn_ml {
	vertical-align: middle;	
}

.btn_wrap {
	text-align: right;
	margin: 10px 80px 0px 0px;
}

input:focus {
	outline-color: #F2CB05;
}

.cmn_btn {
	vertical-align: middle;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	
	$("#srchBtn").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div class=\"acnt_name_srch_wrap\">";
		html += "<table class=\"acnt_name_srch_table\">";
		html += "<tbody>";
		html += "<tr>";
		html += "<td>계정명</td>";
		html += "<td><input type=\"text\" id=\"acntSrchTxt\"></td>";
		html += "<td><div class=\"cmn_btn\" id=\"acntSrchBtn\">검색</div></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
		html += "<div class=\"ctgr_list_wrap\">";
		html += "<div class=\"main_ctgr_wrap\">";
		html += "<div class=\"main_ctgr_name\">";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"130\">";
		html += "<col width=\"130\">";
		html += "<col width=\"130\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>계정 코드</th>";
		html += "<th>계정명</th>";
		html += "<th>적요</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"acntListTbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\" id=\"pgn_area\">";
		html += "</div>";
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
			title : "계정명검색",
			contents : html,
			contentsEvent : function() {
				$("#sendSrchTxt").val("");
				
				reloadList();
				
				$("#pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					reloadList();
				});
				
				$("#acntSrchBtn").on("click", function() {
					$("#sendSrchTxt").val($("#acntSrchTxt").val());
					reloadList();
				});
				
				$("#acntSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#acntSrchBtn").click();
						
						return false;
					}
				});
				
				$("#acntListTbody").on("click", "#acntName", function() {
					console.log("click!");
					$("#acntCodeInput").attr("acntcode", $(this).attr("acntcode"));
					$("#acntCodeInput").val($(this).attr("name"));
					
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
	
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});
	});
	
	$("#acntCodeInput").on("click", function() {
		$("#srchBtn").click();
	});
	
	
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#spendDate")) {
			makeAlert("알림", "지출일자를 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#spendDate").focus();
			});
		} else if(checkEmpty("#acntCodeInput")) {
			makeAlert("알림", "계정명을 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#acntCodeInput").focus();				
			});
		} else if(checkEmpty("#expns")) {
			makeAlert("알림", "거래처를 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#expns").focus();
			});
		} else if(checkEmpty("#item")) {
			makeAlert("알림", "품목명을 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#item").focus();
			});
		} else if(checkEmpty("#qunty")) {
			makeAlert("수량을 입력하세요. (수량 파악 어려우면 '1' 입력)");
			$("#popup1Btn1").on("click", function() {
				$("#qunty").focus();
			});
		} else if(checkEmpty("#unitPrice")) {
			makeAlert("알림", "단가를 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#unitPrice").focus();
			});
		} else if(checkEmpty("#bsnsmnNum")) {
			makeAlert("알림", "사업자번호를 입력하세요.");
			$("#popup1Btn1").on("click", function() {
				$("#bsnsmnNum").focus();
			});
		} else {
			
			$("#sendAcntCode").val($("#acntCodeInput").attr("acntcode"));
			
			var writeForm = $("#writeForm");
			
			writeForm.ajaxForm({
				success : function(res) {
					// 물리파일명 보관
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);						
					}
					
					// 글 저장
					var params = $("#writeForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "intrnlCostMngAction/insert", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res == "success") {
								if($("#backCheck").val() == "0") {
									$("#backForm").submit();									
								} else {
									$("#backForm").attr("action", "intrnlCostMngMnthlyList");
									$("#backForm").submit();
								}
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
					console.log("ajaxForm 실패!");
					
				}
			});
			writeForm.submit(); // ajaxForm 실행	
		}
	});
	
	$("#unitPrice").on("change", function() {
		$("#splyPrice").val($("#unitPrice").val() * $("#qunty").val());
		$("#srtx").val($("#splyPrice").val() * 0.1);
		$("#amnt").val($("#splyPrice").val() * 1 + $("#srtx").val() * 1);
	});
	
	$("#qunty").on("change", function() {
		$("#splyPrice").val($("#unitPrice").val() * $("#qunty").val());
		$("#srtx").val($("#splyPrice").val() * 0.1);
		$("#amnt").val($("#splyPrice").val() * 1 + $("#srtx").val() * 1);
	});
	
	$("#cancleBtn").on("click", function() {
		history.back();
	});
	
	$("#spendDate").on("change", function() {
		$("#mon").val($("#spendDate").val().substr(0, 7));
		console.log($("#mon").val());
	});
	
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}

function reloadList() {
	var params = $("#acntSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "acntSrchAjax", 
		dataType : "json",
		data : params, 
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td>" + data.ACNT_CODE + "</td>";
		html += "<td class=\"board_table_hover\" id=\"acntName\" acntcode=\"" + data.ACNT_CODE + "\" name=\"" + data.ACNT_NAME + "\">" + data.ACNT_NAME + "</td>";
		if(data.ABSTRCT != null) {
			html += "<td>" + data.ABSTRCT + "</td>";			
		} else {
			html += "<td>-</td>";
		}
		html += "</tr>";
	}
	
	$("#acntListTbody").html(html);
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
	
	<form action="#" id="acntSrchForm" method="post">
		<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
		<input type="hidden" id="page" name="page" value="1">
	</form>
	
	<form action="intrnlCostMng" id="backForm" method="post">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="backCheck" value="${param.backCheck}">
	</form>
	
	<form action="fileUploadAjax" id="writeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="empNum" value="${sEmpNum}">
		<input type="hidden" id="sendAcntCode" name="sendAcntCode">
		<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">내부비용관리 신규</div>
			</div>
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr>
							<td>지출일자</td>
							<td colspan="5"><input type="date" class="acnt_code_date" id="spendDate" name="spendDate" max="9999-12-31">
							</td>
						</tr>
						<tr>
							<td>계정명</td>
							<td colspan="5">
								<input type="text" class="acnt_code_input" readonly="readonly" id="acntCodeInput" >
								<div class="cmn_btn" id="srchBtn">계정명 검색</div>
							</td>
						</tr>
						<tr>
							<td>거래처</td>
							<td colspan="5"><input type="text" class="input" id="expns" name="expns"></td>
						</tr>
						<tr>
							<td>품목명</td>
							<td><input type="text" class="input_short" id="item" name="item"></td>
							<td>수량</td>
							<td><input type="number" class="input_short" id="qunty" name="qunty" value="1" placeholder="숫자 입력"></td>
							<td>단가</td>
							<td><input type="number" class="input_short" id="unitPrice" name="unitPrice" placeholder="숫자 입력"></td>
						</tr>
						<tr>
							<td>공급가액</td>
							<td colspan="5"><input type="number" class="input" placeholder="수량*단가 자동출력" readonly="readonly" id="splyPrice" name="splyPrice"></td>
						</tr>
						<tr>
							<td>부가세</td>
							<td colspan="5"><input type="number" class="input"
								placeholder="공급가액*10% 자동출력" readonly="readonly" id="srtx" name="srtx"></td>
						</tr>
						<tr>
							<td>사업자번호</td>
							<td colspan="5"><input type="number" class="input" id="bsnsmnNum" name="bsnsmnNum" placeholder="숫자 입력"></td>
						</tr>
						<tr>
							<td>합계</td>
							<td colspan="5"><input type="number" class="input" placeholder="공급가액+공급가액*10% 자동출력" readonly="readonly" id="amnt" name="amnt"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td colspan="5"><input type="text" class="input" id="rmrks" name="rmrks"></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="5">
								<input type="file" name="att">
								<input type="hidden" id="attFile" name="attFile">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<div class="cmn_btn" id="addBtn">등록</div>
					<div class="cmn_btn_ml" id="cancleBtn">취소</div>
				</div>
			</div>
		</div>
	</form>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>