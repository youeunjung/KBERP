<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 보고서</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- 고객차트 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/rprt/clntRprt.css" />

<!-- 리드 팝업 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/lead/leadPopup.css" />

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src=" https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	getData();
	barList();
	
	if('${param.deptNum}' != '') {
		$("#deptNum").val('${param.deptNum}');
	}

		
	$("#tMonth").on("change", function() {
		$(".cmn_btn").click();
	});
	
	// 검색
	$(".cmn_btn").on("click", function() {
		
		reloadList();
		getData();
		barList();
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
	
	/*  내 영업 조회 */
	$("#salesCheck").on("click", function() {
				
		console.log("클릭됨");
		var checked = $("#salesCheck").is(':checked');
		
		if(checked) {
			$("#salesCheck").attr("value", 1);			
					reloadList();
					getData();
					barList();
		} else {
			$("#salesCheck").attr("value", 0);			
					reloadList();
					getData();
					barList();
		}
	});
}); // JQuery end

//신규고객 ajax
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clntRprtAjax",
		dataType : "json",
		data : params,
		success : function(ccAll) {
			var html = "";
		
				$.each(ccAll, function(month, data) {
				
				html += "<div class=\"sales_text\">";
				html += "<div class=\"sales_text_top\">";
				html += "<img class=\"img_rect\" alt=\"바\" src=\"resources/images/sales/rect.png\" />신규고객 (" + data.tMonth + ")";
				html += "</div>";
				html += "<div class=\"actvty_tLine1\"></div>";
				html += "<div class=\"cc_text_bot\">";
				html += "<div class=\"mhPos\">";
				html += "<div class=\"mhTxt\"></div>";
				html += "<div class=\"mhTxt\">전월</div>";
				html += "<div class=\"mhTxt\">당월</div>";
				html += "<div class=\"mhTxt\">평균(3개월)</div>";
				html += "<div class=\"mhTxt\">전체</div>";
				html += "</div>";
				html += "<span class=\"ccTxt cc\">고객사</span>";
				html += "<div class=\"chartData\">";
				html += "<span class=\"ccMonth ago\">" + data.CC_LAST + "</span>";	
				html += "<span class=\"ccMonth mon\">" + data.CC_THAT + "</span>";	
				html += "<span class=\"ccMonth mon\">" + data.CC_AVG + "</span>";	
				html += "<span class=\"ccMonth all\">" + data.CC_ALLCNT + "</span>";	
				html += "</div>";
				html += "<span class=\"ccTxt clnt\">고객</span>";
				html += "<div class=\"chartData\">";
				html +=	"<span class=\"ccMonth ago\">" + data.EC_LAST + "</span>";	
				html += "<span class=\"ccMonth mon\">" + data.EC_THAT + "</span>";	
				html += "<span class=\"ccMonth mon\">" + data.EC_AVG + "</span>";	
				html += "<span class=\"ccMonth all\">" + data.EC_ALLCNT + "</span>";	
				html += "</div>";
				html += "</div>";
				html += "</div>";
				});
			$(".new_sales_actvty1").html(html);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}	
/* 차트에 데이터 가져오기 */
function getData() {
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "clntRprtDataAjax",
		dataType : "json",
		data: params,
		success : function(res) {
			clntMakeChart(res.list);
		},
		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
//신규고객 ajax
function barList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clntRprtAjax",
		dataType : "json",
		data : params,
		success : function(ccAll) {
			var html = "";
			
			$.each(ccAll, function(dept, data) {
				html += "<table id=\"datatable\">";
		        html += "<thead>";
		        html += "<tr>";
		        html += "<th></th>";
		        html += "<th>고객사</th>";
		        html += "<th>고객</th>";
		        html += "</tr>";
		        html += "</thead>";
		        html += "<tbody>";
		        html += "<tr>";
		        html += "<th>영업부</th>";
		        html += "<td>" + data.CC_DEPTCNT + "</td>";
		        html += "<td>" + data.EC_CNT + "</td>";
		        html += "</tr>";
		        html += "<tr>";
		        html += "<th>영업1팀</th>";
		        html += "<td>" + data.CC_DEPTCNT1 + "</td>";
		        html += "<td>" + data.EC_CNT1 + "</td>";
		        html += "</tr>";
		        html += "<tr>";
		        html += "<th>영업2팀</th>";
		        html += "<td>" + data.CC_DEPTCNT2 + "</td>";
		        html += "<td>" + data.EC_CNT2 + "</td>";
		        html += "</tr>";
		        html += "</tbody>";
	    		html += "</table>";	
			});
			$("#bar-chart").html(html);
			
			//영업부서 차트
			$('#bar-chart').highcharts({
			    data: {
			        table: 'datatable'
			    },
				chart: {
					type: 'column',
				},
				title: {
					text: ''
				},
			    yAxis: {
			        title: {
			            text: ''
			        }
			    },
				legend: {
					enabled: true
				},
			    xAxis: {
			        type: 'category'
			    },
			    tooltip: {
			    },
		        credits: { //워터마크 숨김
		            enabled: false
		        },
			    plotOptions: {
			        column: {
			           borderRadius: 5,
			           borderWidth: 0
			         },
			         series: {
			        	 dataLabels: {
			        		 enabled: false,
				        	 formatter: function() {
				        		if(this.y > 0) {
				        			return this.y;
				        		}
				        	}
			        	 }
			         }
			    },
		        colors: ["#F2B705", "#F2CB05"],
		        series: [{
		        	pointWidth: 50 // 고객사 bar 너비 지정
		        }, {
		        	pointWidth: 50 // 고객 bar 너비 지정
		        }]
			});
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}	
//고객등급 ajax
function clntMakeChart(list) {
	console.log(list);
	//고객등급 차트
	$('#pie-chart').highcharts({
		chart: {
			type: 'pie',
			zoomType: 'x'
		},
		title: {
			text: ''
		},
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
		        	formatter: function() {
			        	if(this.y > 0) {
			        		return this.percentage.toFixed(1) + "%(" + this.y + "명)";
			        	}
			       	}
	            },
	            showInLegend: true
	        }
	    },
	    legend: {
	          enabled: true,
	          labelFormatter: function() {
	              if(this.y > 0) {
	                 
	                 return this.name;
	              }  
	          }
	    },
		colors: ['#FF6384', '#ffd950', '#02bc77', '#28c3d7','#4169e1'],
	        series : [{
    		name: '고객사',
    		data : list
    	}],
        credits: {
            enabled: false
        }
	});
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
</script>
</head>
<body>
<input type="hidden" id="olddeptNum" value="${param.deptNum}" />
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />

	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">고객 차트</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
					<!-- 검색창 -->
					<table class="srch_table">
						<colgroup>
							<col width="84" />
							<col width="154" />
							<col width="100" />
							<col width="186" />
							<col width="110" />
							<col width="200" />
							<col width="97" />
						</colgroup>
						<tbody>
							<!-- col=4 -->
							<tr>
								<td>
									<span class="srch_name">월별</span>
								</td>
								<td colspan="4">
									<input type="month" class="tMonth" id="tMonth" name="tMonth" value="${tMonth}"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">부서</span>
								</td>
								<td>
									<select id="deptNum" name="deptNum">
										<option value="0">영업부</option>
										<option value="1">영업1팀</option>
										<option value="2">영업2팀</option>										
									</select>
								</td>
								<td>
									<span class="srch_name">담당자</span>
								</td>
								<td>
									<div class="findEmp_box">
										<input type="text" maxlength="20" class="findEmp_box2" id="mngEmp" name="mngEmp" value ="${param.mngEmp}" style="border:0 solid black" />
										<input type="hidden" id="mngNum" name="mngNum" />
										<span><img alt="담당자이미지" class="userIcon" src="resources/images/sales/usericon.png"> </span>
									</div>								
								</td>
								<td>
									<span class="srch_name">내영업 조회</span>
									<input type="hidden" name="sEmpNum" value="${sEmpNum}">
									<input type="hidden" name="sEmpName" value="${sEmpName}">
									<input type="hidden" name="sDeptName" value="${sDeptName}">
								</td>
								<td>
									<input type="checkbox" id="salesCheck" name="salesCheck"/>
								</td>
								<td>
									<span class="cmn_btn">검색</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="cont_right">
						<div class="new_sales_actvty1">
						</div>
					<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />부서
							</div>
							<div class="actvty_tLine2"></div>
						</div>
						<div class="sales_text_bot2">
							<div class="pie-bot">
								<div id="bar-chart"></div>
							</div>							
						</div>
					</div>
				</div>
				<div class="cont_left">
					<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />고객사 등급
							</div>
							<div class="actvty_tLine1"></div>
						</div>
						<div class="sales_text_bot">
							<div class="pie-bot">
								<input type="hidden" name="clntsize" value="5" />
								<div id="pie-chart"></div>
							</div>	
						</div>
					</div> 
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