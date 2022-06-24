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
	font-size: 10.5pt;
}
/* 개인 작업 영역 */
input:focus {
	outline-color: #F2CB05;
}
#file_preview{
	vertical-align:top;
	display:inline-block;
	width: 300px;
	height: 300px;
}
#fclty_input_area{
	display: inline-block;
	margin-top: 110px;
	margin-left: 100px;
}

#file_name{
	display:inline-block;
	width: 235px; 
	padding: 10px 0px;
	text-align: center;
}
.fclty_input_text{
	display:inline-block;
	width: 100px;
}
.fclty_input{
	display: inline-block;
	height: 23px;
}
.cmn_btn_ml{
	margin-top: 5px;
}
.fclty_input_row{
	margin-bottom: 5px;
}
.button_row{
	float: right;
}
#previews img{
	min-height: 350px;
	min-width : 350px;
	max-width:350px;
	max-height: 350px;
}
#atchmn_row{
	margin-top: 50px;
}
#files{
	display: none;
}
input:focus {
	outline-color: #F2CB05;
}
#fileUpload{
	width: 305px;
}
.name_srch_table{
	margin-left: 35px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","fcltList");
		$("#actionForm").submit();
	});
	$("#fileUpload").on("click",function(){
		files.click();
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
	html += "<div>";
	html += "<div>";
	html += "<div>";
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
				console.log("click!");
				$("#fcltyEmp").val($(this).attr("name"));
				$("#numEmp").val($(this).attr("empNum"));
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
	
	$("#addBtn").on("click",function(){
		if(checkEmpty("#fcltyName")){
			makeAlert("확인","시설물명을 입력하세요");
			$("#fcltyName").focus();
		}else if(checkEmpty("#fcltyPlace")){
			makeAlert("확인","시설물 위치를 입력하세요");
			$("#fcltyPlace").focus();
		}else if(checkEmpty("#fcltyEmp")){
			makeAlert("확인","관리자명을 입력하세요");
			$("#fcltyEmp").focus();
		}else if(checkEmpty("#fcltyCnt")){
			makeAlert("확인","수용인원을 입력하세요");
			$("#fcltyCnt").focus();
		}else if(checkEmpty("#attFile")){
			makeAlert("확인","시설물 사진을 첨부하세요");
		}else{
			var updateForm = $("#updateForm");
			
					updateForm.ajaxForm({
				success : function(res){
					console.log(res);
					// 물리파일명 보관
					if(res.fileName.length > 0){
						$("#attFile").val(res.fileName[0]);						
					}
					// 글 저장
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post",
						url : "fcltAction/update",
						dataType : "json",
						data : params,
						success : function(res){ 
							if(res.res == "success"){
								$("#actionForm").attr("action","fcltView");
								$("#actionForm").submit();
							}else{
								alert("작성 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
							
						}
					});
				},
				error : function(req) {
					console.log(request.responseText);
				} // error end
			}); //ajaxform end
			updateForm.submit(); //ajaxForm 실행
		}
	});
});
function checkEmpty(sel){
	if($.trim($(sel).val()) ==""){
		return true;
	}else{
		return false;
	}
}
function show(input){
	  if(input.files){
	    
	    for(var i=0; i<input.files.length; i++){
	      var file = input.files[i];
	      
	      if(file.type.match(/image.*/)) {
	        $('#previews').empty();
	        $('span.warning').text('');
	        
	        var reader = new FileReader();

	        reader.onload = function(e){
	          var result = e.target.result;
	          var img = $('<img />', {src: result});
	          $('#previews').append(img);
	        }

	        reader.readAsDataURL(file);
	      } else {
	        $('span.warning').text('Only images supported :)');
	      }
	    }
	  }
	}

	$(function(){
	  $('#files').on('change', function(ev){
	    console.log(ev);
	    show(this);
	  });
	});
	
function reloadList() {
		var params = $("#empSrchForm").serialize();
		
		$.ajax({
			type : "post",
			url : "empSrchAjax", 
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
		html += "<td>" + data.EMP_NUM + "</td>";
		html += "<td class=\"board_table_hover\" id=\"empName\" empNum=\"" + data.EMP_NUM + "\" name=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
		html += "</tr>";
	}
	
	$("#empListTbody").html(html);
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
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">시설물 수정</div>
			
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="no" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
<form action="#" id="empSrchForm" method="post">
		<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
		<input type="hidden" id="page" name="page" value="1">
</form>
		<div class="cont_area">
		
<form action="fileUploadAjax" id="updateForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="top" name="top" value="${param.top}" />
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
		<input type="hidden" name="mngEmpNum" value="${sEmpNum}">
		<input type="hidden" id="no" name="no" value="${param.no}" />
		<input type="hidden" name="empNum" id="numEmp" value="${data.EMP_NUM}"/>
			<!-- 여기부터 쓰면 됨 -->
				<div id="file_preview">
					<div id="previews">
						<img src="resources/${data.ATT_PCTR}">
					</div>
						<div>
						  <span class="warning"></span>
						</div>
				</div>
				
				<div id="fclty_input_area">
					
					<div class="fclty_input_row">	
						<div class="fclty_input_text">시설물 명 : </div>
						<input type="text" class="fclty_input" id="fcltyName" name="fcltyName" value="${data.FCLTY_NAME}">
					</div>
					<div class="fclty_input_row">	
						<div class="fclty_input_text">위치 : </div>
						<input type="text" class="fclty_input" id="fcltyPlace" name="place" value="${data.PLACE}">
					</div>
					<div class="fclty_input_row">
						<div class="fclty_input_text">관리자 : </div>
						<input type="text" class="fclty_input" id="fcltyEmp"  readonly="readonly" value="${data.MNG_EMP}" >			
						<div class="cmn_btn" id="srchEmp">관리자 검색</div>
					</div>
					<div class="fclty_input_row">
						<div class="fclty_input_text">수용인원 : </div>
						<input type="text" class="fclty_input" id="fcltyCnt" name="acptNum" value="${data.ACPT_NUM_OF_PL}">
					</div>
					<div class="fclty_input_row">
						<div class="fclty_input_text">비고 : </div>
						<input type="text" class="fclty_input" id="rmrks" name="rmrks" value="${data.RMRKS}">
					</div>
					<div class="button_row">
						<div class="cmn_btn_ml" id="addBtn">수정</div>
						<div class="cmn_btn_ml" id="listBtn">목록으로</div>
					</div>
				</div>
				<div id="atchmn_row">
					<input type="file" id="files" name="att" />
					<input type="hidden" id="attFile" name="attFile" value="${data.ATT_PCTR}"/>
					<div class="cmn_btn_ml" id="fileUpload" >첨부파일</div>
				</div>	
</form>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>