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
.use_name{
    margin-top: 4px;
    margin-left: 61px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#listBtn").on("click",function(){
		$("#backForm").submit();
	});
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#issue_dt")) {
			alert("발급일자를 입력하세요.")
			$("#issue_dt").focus();
		} else if(checkEmpty("#end_dt")) {
			alert("종료일자를 입력하세요.")
			$("#end_dt").focus();
		} else if(checkEmpty("#card_code")) {
			alert("카드번호를 입력하세요.")
			$("#card_code").focus();
		} else if(checkEmpty("#end_dt")) {
			alert("카드명을 입력하세요.")
			$("#card_name").focus();
		} else if(checkEmpty("#end_dt")) {
			alert("카드명의를 입력하세요.")
			$("#use_name").focus();
		} else {
			var writeForm = $("#WriteForm");
			
			writeForm.ajaxForm({
				success : function(res) {

					// 글 저장
					var params = $("#WriteForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "cardMngAction/insert", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res == "success") {
								$("#backForm").submit();
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
					
				}
			});
			writeForm.submit(); // ajaxForm 실행	
		}
	});
	$("#btn").on("click", function() {

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
					$("#sendSrchTxt").val($("#empSrchTxt").val());
					$("#page").val("1");
					reloadList();
				});
				
				$("#empSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#empSrchBtn").click();
						
						return false;
					}
				});
				$("#empAllListTbody").on("click", "#empName", function() {
					$("#use_num").val($(this).attr("use_num"));
					$("#use_name").val($(this).attr("use_name"));
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
});
function reloadList() {
	var params = $("#allEmpSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "callEmpSrchAjax", 
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
	function drawList(list) {
		var html = "";
		
		for(data of list) {
			html += "<tr>";
			html += "<td>" + data.DEPT_NAME + "</td>";
			html += "<td>" + data.RANK_NAME + "</td>";
			html += "<td class=\"board_table_hover\" id=\"empName\" use_num=\"" + data.EMP_NUM + "\" use_name=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
			html += "</tr>";
		}
		
		$("#empAllListTbody").html(html);
	} // 사원 목록
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
			<div class="page_title_text">카드 관리</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
<form action="cardList" id="backForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="mng_num" value="${param.mng_num}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchMon" value="${param.searchMon}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<form action="#" id="allEmpSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
			<input type="hidden" id="page" name="page" value="1">
		</form>
<form action="cardList" id="WriteForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="use_num" id="use_num"  />
	<input type="hidden" name="mng_num" value="${param.mng_num}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchMon" value="${param.searchMon}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
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
            <td> 카드 번호 </td>
               <td><input type = "text" id ="card_code" name ="card_code" class = "card_code_cont" ></td>   
            <td> 카드구분 </td>
           <td><select class="card_sep_cont" id ="card_sep" name ="card_sep">
				<option value="0">신용</option>
				<option value="1">체크</option>
			   </select></td>
    
        </tr>
         <tr>
            <td> 카드명 </td>
               <td><input type = "text" class = "card_name_cont" id ="card_name" name ="card_name" ></td>
            <td> 카드사 </td>
               <td><select id ="card_co" name ="card_co" class="card_co_cont">
					<option value="1">농협</option>
					<option value="2">기업</option>
					<option value="3">신한</option>
					<option value="4">현대</option>
					<option value="5">카카오뱅크</option>
					</select></td>
         </tr>
         <tr>
            <td> 카드명의 </td>
               <td><input type = "text" class = "use_name"  id = "use_name" name ="use_name">
               	  <input type = "button" class = "cmn_btn"  id = "btn" value="검색"></td>
            <td></td>
               <td></td>

         </tr>
         <tr>
            <td> 발급일자 </td>
            <td class = "use_date_cont"><input type = "date" class = "use_date_cont" id ="issue_dt" name ="issue_dt"></td>
            <td> 종료일자 </td>
            <td class = "use_date_cont"><input type = "date" class = "use_date_cont" id ="end_dt" name ="end_dt"></td>
         </tr>
         </tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				<div class="cmn_btn" id="addBtn">등록</div>
				<div class="cmn_btn" id="listBtn">취소</div>
			</div>
		</div>
		</form>
	</div>

	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>