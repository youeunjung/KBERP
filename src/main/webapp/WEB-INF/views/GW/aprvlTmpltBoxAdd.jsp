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
	width: 900px;
}

.aprvl_btun{
	width: 900px;
	display: inline-flex;
	justify-content: flex-end;
	margin-bottom: 20px;
	
}

.aprvl {
	border: 1px solid #000;
	font-size: 14px;
	background-color: #F2B705;
	text-align: center;
	width: 50px;
	height: 30px;
	
	margin-right: 10px;
	line-height: 2;
	
}


.save {
	border: 1px solid #000;
	font-size: 14px;
	background-color: #F2B705;
	text-align: center;
	width: 50px;
	height: 30px;
	line-height: 2;
}



.aprvl_line {
	font-size: 14px;
	display: inline-block;
	border-collapse: collapse;
	margin-left: 600px;
	margin-bottom: 10px;
}








.container {
	background-color: #b7b7b7;
}

#dcmnt_num{
	margin-left: 20px;
	margin-right: 150px;
	width: 100px;
	height: 25px;
	margin-top: 10px;
	margin-bottom: 20px;
}

#draft_day{
	margin-left: 20px;
	width: 120px;
	height: 25px;
}

#drftr {
	margin-left: 35px;
	margin-right: 150px;
	width: 100px;
	height: 25px;
}

#draft_dept{
	margin-left: 20px;
	width: 100px;
	height: 25px;
}

#crbn_copy {
	margin-top: 20px;
	margin-left: 35px;
	width: 100px;
	height: 25px;
}

#dcmnt_tlte{
	margin-top: 20px;
	margin-left: 20px;
	width: 300px;
	height: 25px;
}

#atchd_file{
	margin-top: 20px;
	margin-left: 20px;
	width: 200px;
	height: 25px;
}

#atchd_file_box{
	width: 200px;
	margin-left: 20px;
	height: 25px;
}

#draft {
	margin-top: 20px;
	margin-left: 35px;
	height: 25px;
}

#cont {
	margin-top: 20px;
	margin-bottom: 10px;
	margin-left: 50px;
	width: 700px;
	height: 100px;
}

.aprvl_cmnt{
	border-collapse: collapse;
	height: 100px;
	font-size: 14px;
	border: 1px solid #000;
}


.aprvl_cmnt tbody tr {
	border-top: 1px solid #000;
	text-align: center;
}

.aprvl_cmnt th {
	border-right: 1px solid #000;
}

.aprvl_cmnt td {
	border-right: 1px solid #000;
}
span {
	font-size: 14px;
	text-align: right;
}

h3 {
	font-size: 18px;
}

#deleteBtn {
	border: 1px solid #000;
	font-size: 14px;
	background-color: #F2B705;
	text-align: center;
	width: 50px;
	height: 30px;
	line-height: 2;
	
}

/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	 reloadList();  //추후에 결재 비동기로 구현했을 때 사용할 예정
	 reloadList1();  //추후에 결재 비동기로 구현했을 때 사용할 예정
	
	$(".aprvl").on("click", function() {
		
		
		
	/*	html += "<div style=\"margin-top: 20px; font-size: 14px;\">";
		html +=	"<span>결재처리</span>";
		html +=	"<input type = \"radio\" name=\"a\" id=\"r1\"/><label for = \"r1\" >승인</label>";
		html +=	"<input type = \"radio\" name=\"a\" id=\"r2\"/><label for = \"r2\" >반려</label>";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<span>결재의견</span>";
		html +=	"<input type=\"text\" id=\"aprvl_cmnt\">";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<span>파일</span>";
		html +=	"<input type=\"text\" style=\"width: 200px; margin-left: 28px; margin-top: 20px;\">";
		html +=	"<input type=\"file\">";
		html +=	"</div>";
		*/
		
		var html = "";
		 		
		html += "<form action=\"#\" id=\"savesForm\" method=\"post\">"; 
		$("#aprvlNum").val($("#aprvl_num").val());
		console.log(aprvl_num);
		
		console.log("aprvl_num");
		
		html += "<input type=\"hidden\" id=\"top\" name=\"top\" value=\"${param.top}\" />";
		html += "<input type=\"hidden\" id=\"menuNum\" name=\"menuNum\" value=\"${param.menuNum}\" />";
		html += "<input type=\"hidden\" id=\"menuType\" name=\"menuType\" value=\"${param.menuType}\" />";
		html += "<input type=\"hidden\" id=\"aprvlNum\" name=\"aprvlNum\"/>";
		html += "<input type=\"text\" id=\"no\" name=\"no\" value= \"${param.no}\"/>";
		
		
		html += "<div style=\"margin-top: 20px; font-size: 14px;\">";
		html += "<span id = \"process\">결재처리</span>";
		html += "<input type = \"radio\" name=\"a\" value=\"1\" id=\"r1\"/><label for = \"r1\" >승인</label>";
		html += "<input type = \"radio\" name=\"a\" value=\"2\" id=\"r2\"/><label for = \"r2\" >반려</label>";
		html += "</div>";
		html += "<div>";
		html += "<span>결재자</span>";
		html += "<input type=\"text\" name=\"aprvler\" id=\"aprvler\" value=\"" + "${sEmpName}" +"\">";
		html += "</div>";
		html += "<div>";
		html += "<span>부서</span>";
		html += "<input type=\"text\" name=\"dept\" id=\"dept\" value=\"" + "${sDeptName}" +"\">";
		html += "</div>";
		html += "<div>";
		html += "<span>결재일시</span>";
		let time = new Date();
		
		html += "<input type=\"text\" name=\"aprvl_date\" id=\"aprvl_date\" value=\"" + new Date(time).getFullYear()+'-'+(new Date(time).getMonth()+1)+'-'+ new Date(time).getDate() + "\">";
		html += "</div>";
		html += "<div>";
		html += "<span>의견</span>";
		html += "<input type=\"text\" name=\"cmnt\" id=\"cmnt\" style=\"width: 200px; height: 100px; margin-left: 28px; margin-top: 20px;\">";
		html += "</div>"; 
		html += "</form>"; 
		
		
	makePopup({
		bg : true,
		bgClose : false,
		width : 600,
		height : 600,
		title : "결재",
		contents : html,
		contentsEvent : function() {
			  
			console.log("????");
			$.ajax({
				type : "post",
				url : "aprvlProcessAjax",
				dataType : "json",
					error : function(req) {
					console.log(req.responseText)	
				}
				
			});
			
			
					
			},
		buttons : [{
			name : "저장",
			func:function() {
				
				var params = $("#savesForm").serialize();
				
				$.ajax({
					type : "post",
					url : "aprvlAction/update",
					dataType : "json",
					data : params,
					success : function(res) {
						console.log(res);
						history.go(0);
					
					},
					error : function(req) {
						console.log(req.responseText)	
					}
				});    
												
				/* let action = $('input[name="a"]:checked');
				
				let time =$('input[name="aprvl_date"]').val();
				
				let cmnt =$('input[name="cmnt"]').val();
				
				let action_value = action.val();
				console.log('value', action_value);
				
				let containers = $('.aprvl_cmnt tbody'); */
				
				/* let html = '';
								
				let sEmpName = "${sEmpName}";
				let sDeptName = "${sDeptName}";
				let test_tr = `<tr><td>\${action_value}</td><td>\${sEmpName}</td><td>\${sDeptName}</td><td>\${time}</td><td>\${cmnt}</td></tr>`;
				html += test_tr;
				
				let samples = action_value +",${sEmpName},${sDeptName}," + time +"," + cmnt;
				
				$("#action_value").val(samples); */
								
				/* containers.append(html);
				 */
				/* $("#deleteBtn").on("click", function(){
					console.log(test_tr);
					
						
					
					//셀렉터를 활용하면 remove를 할수있음
					
				}) */
				
		
				
				closePopup();
			}
		
		},//버튼 저장 
		{name : "닫기"
		}] //버튼 닫기
		
		}); //팝업 

		
		
		}); // 결재클래스 클릭
		
$("#save").on("click", function(){
		
		history.back();
		

		
		
		
	
		
		
	});
		
	

});


 function reloadList1() { // 목록 조회용 + 페이징 조회용
	  var params = $("#actionForm").serialize();
  
  $.ajax({
 	 type : "post",
 	 url : "aprvlListsAjax",
 	 dataType : "json",
 	 data : params,
 	 success : function(res) {
 		 	console.log(res);
 		 	console.log("옴?");
 		 	drawList(res.list);
 		 	
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
  });
	
}


function drawList(list){
	var html = "";
	for(var data of list){
	
html+= "	<tr no=\"data.APRVL_NUM\">  ";
			if(data.APRVL_STS == "0") {
			 	html += "<td>결재진행중</td>";
		 	} else if(data.APRVL_STS == "1") {
				 html += "<td style=\"color:#4B94F2;\">결재완료</td>"           ;
		 	} else if(data.APRVL_STS == "2") {
				 html += "<td style=\"color:#ff6f60;\">결재반려</td>"           ;
		 	} else {
			 	 html += "<td> - </td>"           ;
		 	}
html+= "<td>" + data.EMP_NAME + "</td>                 ";
html += "<td>" + data.DEPT_NAME + "</td>";
let time = data.STS_CHNG_DATE;
html += "<td>" + new Date(time).getFullYear()+'-'+(new Date(time).getMonth()+1)+'-'+ new Date(time).getDate() + "</td>";

html+= " <td>" + data.CMNT + "</td>                     ";
html+= "		</tr>";
	
	
	                                                                          
	
	}                                                                                        
	$(".aprvl_cmnt tbody").html(html);
} 

function reloadList() { // 목록 조회용 + 페이징 조회용
	  var params = $("#actionForm").serialize();

$.ajax({
	 type : "post",
	 url : "aprvlStsAjax",
	 dataType : "json",
	 data : params,
	 success : function(res) {
		 	console.log(res);
		 	console.log("옴?");
		 	drawLists(res.list);
		 	drawLists1(res.list);
		 	
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
});
	
}

function drawLists(list){
	var html = "";
	
	for(var data of list){
		html +=	"<th>"+ data.DEPT_NAME +"</th>";
		}
	
	$(".aprvl_line thead").html(html);
	
	}
function drawLists1(list){
	var html = "";
	
	
		html += "<tr>"
			for(var data of list){
		html +=	"<td>"+ data.EMP_NAME +"</td>";
			}
		html += "</tr>"
		html += "<tr>"
			for(var data of list){
		
		html +=	"<td>"+ data.STS_CHNG_DATE +"</td>";
			}
		html += "</tr>"
		html += "<tr>"
			for(var data of list){
			// 1html+= "	<tr no=\"data.APRVL_NUM\">  ";
		if(data.APRVL_STS == "0") {
		 	html += "<td>결재진행중</td>";
	 	} else if(data.APRVL_STS == "1") {
			 html += "<td style=\"color:#4B94F2;\">결재완료</td>"           ;
	 	} else if(data.APRVL_STS == "2") {
			 html += "<td style=\"color:#ff6f60;\">결재반려</td>"           ;
	 	} else {
		 	 html += "<td> - </td>"           ;
	 	}
			}
		html += "</tr>"
		
	
	$(".aprvl_line tbody").html(html);
	
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
			<div class="page_title_text">결재</div>
			<!-- 검색영역 선택적 사항 -->
	<form action="aprvlTmpltBox" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					<input type="hidden" id="no" name="no" value = "${param.no}"/>
									
		</form>
	
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
						<div class="aprvl_btun">
				
				<span class="save" id="save">저장</span>
			</div>
			<div>
			<table class="aprvl_line" border="1">
				<colgroup>
					
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						
					</tr>
				</thead>
				<tbody>
					<tr>
					</tr>
				</tbody>
			</table>
			</div>
			<form action="#" id="testing" method="post">
				<input type="hidden" id="draft_day" name="draft_day" value="${data.DRAFT_DATE}"/>
			<div class="container">
			<div>
				<span>결재번호</span>
				<input type="text" value="${param.no}" id="no" name="no">
				<span>기안일자</span>
				<input type="text" name="title" id="title" value= "${param.title}">
			</div>
			<div>
				<span>기안자</span>
				<input type= "text" id="drftr" name="" value="${lists.EMP_NAME}">
				<span>기안부서</span>
				<input type= "text" id= "draft_dept" name="" value="${lists.DEPT_NAME}"> 
			</div>
			<div>
				<span>참조자</span>
				<input type="text" id="crbn_copy">
			</div>
			<div>
				<span>문서제목</span>
				<input type="text" id="dcmnt_tlte" value= "${lists.TITLE}">
			</div>
			<div>
				<span>첨부파일</span>
				<input type="text" id="atchd_file_box">
				<input type="file" id="atchd_file">
			</div>
			
			<div>
				<span>내용</span>
				<input type="text" id="cont" value="${lists.CONT}">
			</div>
			</div>
			
				</form>
				</div>
				
			<div class="container_1">
				<div>
					<h3>결재의견</h3>
					<div>
					<input type= "button" class="aprvl" id = "aprvl" value="결재">
					<input type= "button" id="deleteBtn" value="삭제">
					</div>
					
				</div>
				  <form action="#" id="saveForm" method="post">  
				<input type="hidden" id="top" name="top" value="${param.top}" />
				<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
				<input type="hidden" id="aprvl_num" name="aprvl_num"  value="${param.no}" />
				<input type="hidden" id="action_value" name="action_value" value="${action_value}">
				<div>
				<input type="text" id="aprvl_nums" name="aprvl_nums" value="${param.aprvl_num}" />
					<table class="aprvl_cmnt">
						<colgroup>
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="550">
						</colgroup>
						<thead>
							<tr>
								<th>결재</th>
								<th>결재자</th>
								<th>부서</th>
								<th>결재일시</th>
								<th>의견</th>
							</tr>
						</thead>
						<tbody>
				
						</tbody>
					</table>
				</div>
				  </form> 
			</div>
				
			</div>                                                                                     
			
		
		
		</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>

</body>
</html>