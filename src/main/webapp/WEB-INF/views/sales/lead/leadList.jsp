<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- 리드 리스트 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/lead/leadList.css" />

<!-- 팝업 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/lead/leadPopup.css" />

<script type="text/javascript">
$(document).ready(function() {

	if('${param.psNum}' != '' || '${param.srchType}' != '') {
		$("#psNum").val('${param.psNum}');
		$("#srchType").val('${param.srchType}');
	} else {
		$("#oldPsNum").val("0");
		$("#oldSrchType").val("0");
	}
	
	if('${param.listSort}' != '') {
		$("#listSort").val('${param.listSort}');
	} else {
		$("#oldListSort").val("0");
	}
	reloadList();
	
	// 검색버튼
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldPsNum").val($("#psNum").val());
		$("#oldSrchType").val($("#srchType").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldMngEmp").val($("#mngEmp").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	// 정렬버튼
	$("#soltBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldPsNum").val($("#psNum").val());
		$("#oldSrchType").val($("#srchType").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		$("#oldMngEmp").val($("#mngEmp").val());
		$("#oldListSort").val($("#listSort").val());
		
		reloadList();
	});
	//리드 상세보기
	$(".list_table").on("click", ".leadName", function() {
		$("#leadNum").val($(this).attr("leadNum"));
		
		$("#psNum").val($("#oldPsNum").val());
		$("#srchType").val($("#oldSrchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		$("#mngEmp").val($("#oldMngEmp").val());
		$("#listSort").val($("#oldListSort").val());
		
		$("#actionForm").attr("action", "leadCont");
		$("#actionForm").submit();
	});

	// 리드목록 페이징
	$(".pgn_area").on("click", "div", function() {
		
		$("#page").val($(this).attr("page"));
		
		$("#psNum").val($("#oldPsNum").val());
 		$("#srchType").val($("#oldSrchType").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		$("#mngEmp").val($("#oldMngEmp").val()); 
		$("#listSort").val($("#oldListSort").val());
		
		console.log(oldPsNum);
		
		reloadList();
	});
	
	//진행상태 색표시 
	$(".sts").on("click", ".sts_list", function() {
		if($(this).attr("num") != "0") {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
			$(this).removeClass();
			$(this).addClass("sts_list_on");	
		} else {
			$(".sts").children(".sts_list_on").attr("class", "sts_list");
		}
		
		$("#page").val("1");
		
		$("#psNum").val($(this).attr("num"));
		$("#oldPsNum").val($(this).attr("num"));
		$("#srchType").val("0"); // 진행상태버튼 클릭시 검색어 초기화
		$("#listSort").val("0"); // 진행상태버튼 클릭시 정렬 초기화

		$("[name='sales_sts']").prop("checked", false);	
		$("#sales_sts").prop("checked", true);
		
		$("#startDate").val('${startDate}');
		
 		if($("#searchTxt").val() != "" || $("mngEmp").val != "") { // 담당자, 검색어 txt가 비어있지 않으면 초기화
			var txt = document.getElementById("searchTxt");
			var mngrTxt = document.getElementById("mngEmp");
			
			txt.value = "";
			mngrTxt.value = "";
			
		} 
		reloadList();		
	});
	
	/* 검색 어제버튼 클릭 */
	$("#yesterday").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 1);
		var yesterday = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(yesterday);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(yesterday);
	});
	/* 검색 오늘버튼 */
	$("#today").on("click", function() {
		var a = new Date();
		var today = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(today);
		$("#endDate").val(today);
	});
	/* 검색 일주일전 버튼 */
	$("#aWeekAgo").on("click", function() {
		var a = new Date();
		a.setDate(a.getDate() - 7);
		var aWeekAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(aWeekAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 1개월전 버튼 */
	$("#oneMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 1);
		var oneMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(oneMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	/* 검색 3개월전 버튼 */
	$("#threeMonthAgo").on("click", function() {
		var a = new Date();
		a.setMonth(a.getMonth() - 3);
		var threeMonthAgo = a.getFullYear() + "-" + lpad(a.getMonth() + 1, 2, 0) + "-" + lpad(a.getDate(), 2, 0);
		$("#startDate").val(threeMonthAgo);
		var b = new Date();
		var today = b.getFullYear() + "-" + lpad((b.getMonth() + 1), 2, 0) + "-" + lpad(b.getDate(), 2, 0);
		$("#endDate").val(today);
	});
	
	// 리드등록
	$("#writeBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadReg")
		$("#actionForm").submit();
	});

/* 담당자 팝업  */
	$(".userIcon").on("click", function() {
 		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form action = \"#\" id=\"popupMngrForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
		html +=						"<option value=\"6\">영업부</option>";
		html +=						"<option value=\"7\">영업1팀</option>";
		html +=						"<option value=\"8\">영업2팀</option>";
		html +=					"</select>";
		html +=				"</div>";		
		html +=				"<div class=\"ptm_mid_bot\">";
		html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
		html +=						"<option value=\"0\">사원번호</option>";
		html +=						"<option value=\"1\">사원명</option>";
		html +=					"</select>";
		html +=				"</div>";	
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid_right\">";
		html +=				"<div class=\"ptm_mid_right_top\"></div>";
		html +=				"<div class=\"ptm_mid_right_bot\">";
		html +=					"<input type=\"text\" id=\"searchT\" name=\"searchT\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn\" id=\"mngrBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=		"<div class=\"popup_box\" id=\"mngrBox\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\" id=\"mngrpb\"></div>";
		html +=		"</div>"; 
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				mngrList();
				
				$("#mngrBox").on("click", ".popup_box_in", function() {
					var mng = $(this).children("#mng").val();
					var mge = $(this).children("#mge").val();
					document.getElementById("mngEmp").value = mng;
					document.getElementById("mngNum").value = mge;
					closePopup();
				});
				
				$()
				//페이징 
				$("#mngrpb").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					mngrList();
				});
				// 검색버튼
				$("#mngrBtn").on("click", function () {
					$("#page").val("1");
					
					mngrList();	
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#mngrBtn").click();
						
						return false;
					}
				});
			},
			width : 600,
			height : 500,
			buttons : {
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
}); 
/* 리드 리스트 */
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "leadListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawTotal(res.cnt);
			drawList(res.list);
			drawPaging(res.pb, ".pgn_area");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}

//리드 리스트
function drawList(list) {
	var html = "";
	
	html += "<colgroup>";
	html += "<col width=\"70\">";
	html += "<col width=\"100\">";
	html += "<col width=\"290\">";
	html += "<col width=\"80\">";
	html += "</colgroup>";
	html += "<thead>";
	html += "<tr>";
	html += "<th rowspan=\"3\">글번호</th>";
	html += "<th>리드번호</th>";
	html += "<th>고객사명 / 고객명</th>";
	html += "<th></th>";
	html += "</tr>";
	html += "<tr>";
	html += "<th>담당자</th>";
	html += "<th>리드명</th>";
	html += "<th>가능 여부</th>";
	html += "</tr>";
	html += "<tr>";
	html += "<th>진행상태</th>";
	html += "<th>등록일</th>";
	html += "<th></th>";
	html += "</tr>";
	html += "</thead>";
		
	for(var data of list) {
		html += "<tbody>";
		html += "<tr>";
		html += "<td rowspan=\"3\">" + data.LEAD_NUM + "</td>";
		html += "<td> LD" + data.LEAD_NUM + "</td>";
		html += "<td>" + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td class=\"leadName\" leadNum=\"" + data.LEAD_NUM + "\">" + data.LEAD_NAME + "</td>";
		html += "<td><span class=\"sales_psbl_btn\">" + data.PSBL_CHECK + "%</span></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.PSNUM + "</td>";		
		html += "<td>" + data.RGSTRTN_DATE + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "</tbody>";
	}
		
	$(".list_table").html(html);
}
/****************** 담당자 조회 팝업 *********************/
function mngrList() {
	var params = $("#popupMngrForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngrListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			mngrDrawList(res.list);
			drawPaging(res.pb, "#mngrpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}
function mngrDrawList(list) {
	var html = "";
	
	for(var data of list) {
		
		html +=	"<div class=\"popup_box_in\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	 data.EMP_NUM + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";	
	}
	
	$("#mngrBox").html(html);
	
}
/****************** 담당자 조회 팝업 끝 *********************/
function drawTotal(cnt) {
	var html = "";
	
	html += "<h3>";
	html += "리드 (검색결과: " + cnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);

}
function drawPaging(pb, sel) {
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
	
	$(sel).html(html);
}

/* 가능여부 체크박스 */
function checkOnly(chk) {
	var obj = document.getElementsByName("sales_sts");
	for(var i = 0; i<obj.length; i++) {
		if(obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}
</script>
</head>
<body>
<!-- 검색 데이터 유지용  -->
<input type="hidden" id="oldPsNum" value="${param.psNum}" />
<input type="hidden" id="oldSrchType" value="${param.srchType}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
<input type="hidden" id="oldMngEmp" value="${param.mngEmp}" />
<input type="hidden" id="oldListSort" value="${param.listSort}" />
<!-- 데이터유지 끝 -->
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" id="leadNum" name="leadNum" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	
	<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">리드 목록</div>
			</div>
			<!-- page_title_bar end -->
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
					<!-- 검색영역 -->
					<div class="bodyWrap">
						<!-- sts : 상품현황 -->
						<div class="sts">
							<div class="sts_list" num="0">전체 : ${listCnt}건</div>
							<div class="sts_list" num="1">진행중 : ${ongoingCnt}건</div>
							<div class="sts_list" num="2">영업기회 전환 : ${rcgntnCnt}건</div>
							<div class="sts_list" num="3">실패 : ${failCnt}건</div>
						</div>
						<div class="tLine"></div>
						<!-- class="sts" end -->

						<!-- srch_table -->
						<table class="srch_table">
							<colgroup>
								<col width="80" />
								<col width="60" />
								<col width="40" />
								<col width="60" />
								<col width="60" />
								<col width="90" />
								<col width="60" />
								<col width="30" />
								<col width="10" />
								<col width="55" />
							</colgroup>
							<tbody>						
								<tr>
									<td>
										<span class="srch_name">가능 여부</span>
									</td>
									<td colspan="9">
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="0" checked="checked" onclick="checkOnly(this)" />전체</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="1" onclick="checkOnly(this)" />0% ~ 20%</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="2" onclick="checkOnly(this)" />21% ~ 40%</label> 
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="3" onclick="checkOnly(this)" />41% ~ 60%</label>
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="4" onclick="checkOnly(this)" />61% ~ 80%</label>
										&nbsp;
										<label><input type="checkbox" id ="sales_sts" name="sales_sts" value="5" onclick="checkOnly(this)" />81% ~ 100%</label>
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">진행 상태</span>
									</td>
									<td>
										<select id="psNum" name="psNum">
											<option value="0">선택안함</option>
											<option value="1">진행중</option>
											<option value="2">종료(영업기회 전환)</option>
											<option value="3">종료(영업기회 실패)</option>
										</select>
									</td>
									<td>
										<span class="srch_name_noMgn">담당자</span>
									</td>
									<td colspan="7">
										<div class="findEmp_box">
											<input type="text" maxlength="20" class="findEmp_box2" id="mngEmp" name="mngEmp" style="border:0 solid black" />
											<input type="hidden" id="mngNum" name="mngNum" />
											<span><img alt="담당자이미지" class="userIcon" src="resources/images/sales/usericon.png"> </span>
										</div>										
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">기간</span>
									</td>
									<td>
										<select>
											<option>리드등록일</option>
										</select>
									</td>
									<td colspan="8">
										<input type="button" id="yesterday" value="어제" />
										<input type="button" id="today" value="오늘" />
										<input type="button" id="aWeekAgo" value="일주일 전" />
										<input type="button" id="oneMonthAgo" value="1개월 전" />
										<input type="button" id="threeMonthAgo" value="3개월 전" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td colspan="8">
										<input type="date" id="startDate" name="startDate" value="${startDate}" style="font-family : 맑은 고딕;" />
										~
										<input type="date" id="endDate" name="endDate" value="${endDate}" style="font-family : 맑은 고딕;" />
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">검색어</span>
									</td>
									<td>
										<select id="srchType" name="srchType">
											<option value="0">선택안함</option>
											<option value="1">리드명</option>
											<option value="2">고객사명</option>
											<option value="3">고객명</option>
											<option value="4">리드번호</option>
										</select>
									</td>
									<td colspan="4">
										<input type="text" class="srch_msg" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="검색 조건을 선택한 후 입력해주세요." />
									</td>
									<td>
										<span class="cmn_btn" id="searchBtn">검색</span>
									</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">정렬</span>
									</td>
									<td>
										<select id="listSort" name="listSort">
											<option value="0">선택안함</option>
											<option value="1">등록일</option>
											<option value="2">리드명</option>
											<option value="3">고객사명</option>
										</select>
									</td>
									<td>
										<img class="asc_btn cmn_btn" id="soltBtn" alt="정렬버튼" src="resources/images/sales/asc.png" />
									</td>
									<td colspan="7"></td>
								</tr>
							</tbody>
						</table>
					<div class="SearchResult"></div>

				<!-- list_table -->
					<table class="list_table"></table>
					<div class="body_bottom">
					<div class="board_bottom">
						<div class="pgn_area"></div>
						<div class="cmn_btn" id="writeBtn"> 등록</div>								
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>