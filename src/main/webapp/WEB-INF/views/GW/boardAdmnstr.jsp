<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 게시판관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.cont_title{padding-bottom: 20px;
    border-bottom: 2px solid #353535;
    font-family: nanumgothic,sans-serif;
    font-size: 20px;
    line-height: 1;
    font-weight: 700;
    color: #000;
}
.page_title_text {
	margin-bottom: 30px;
}
.category_list ul {
    overflow: auto;
    overflow-x: hidden;
    zoom: 1;
    margin: 0;
    padding: 5px 0;
    width: 221px;
}
.tree{
	display: inline-block;
	border: 1px solid #6f6f65;
	height: 520px;
	width: 220px;
	margin-bottom: 20px;
	font-size: 12px;
}
.tree_list{
	zoom: 1;
    margin-left: 5px;
    margin-top: 5px;
    padding: 0;
    line-height: 1.2em;
    word-break: break-all;
    word-wrap: break-word;
    width: 221px;
    font-weight: bold;  
    cursor: pointer;
    
}
.ctgr_name{
	display: inline-block;
	width: 351px;
	height: 50px;
	vertical-align:top; 
	font-size: 12px;
	font-weight: bold;
	color: #424242;
	margin-left: 10px;
}
.tltle_input_box{
	position: relative;
    width: 90%;
    height: 30px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
}
/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();

	
$("#writeBtn").on("click", function () {
	 // getData() : 입력된 데이터 취득
     if(checkEmpty("#ctgry_name")){
        alert("카테고리명을 입력하세요.");
        $("#ctgry_name").focus();
      } else {
   	var actionForm = $("#actionForm");
   	
   	actionForm.ajaxForm({
   		success : function(res) {
				
				//글 저장
				var params = $("#actionForm").serialize();
		        
		        $.ajax({
		        	 type : "post",
		        	 url : "admnstrAction/insert",
		        	 dataType : "json",
		        	 data : params,
		        	 success : function(res) {
		        		 if(res.res == "success"){
		        			 $("#locationForm").attr("action", "boardAdmnstr");
		        			 $("#locationForm").submit();
		        		 } else{
		        			 alert("작성중 문제가 발생하였습니다.");
		        		 }
		   			},
		   			error : function(request, status, error) {
		   				console.log(request.responseText);
		   			}
		     	 }); // ajax end
			}, // success end
			error : function(req) {
				console.log(req.responseText);
			} // error end
   	}); // ajaxForm end
   	
   	actionForm.submit(); // ajaxForm 실행
    } // else end
 }); // writeBtn click end
$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
		
		var tr = $(this).parent().parent();
				
		var params = $("#actionForm").serialize();
		
		$.ajax({
        	 type : "post",
        	 url : "admnstrAction/delete",
        	 dataType : "json",
        	 data : params,
        	 success : function(res) {
        		 if(res.res == "success"){
        			 reloadList(); 
        			 console.log($("#admstrName").val());
        			 $("#locationForm").attr("action", "boardAdmnstr");
        			 $("#locationForm").submit();
         		 } else{
        			 alert("삭제중 문제가 발생하였습니다.");
        		 }
   			},
   			error : function(request, status, error) {
   				console.log(request.responseText);
   			}
     	 });
	}	
});
$("tbody").on("click", "tr", function() {
	var state = $(this).find(".tr_selected").val();
	var flag = $(this).find(".val_existed").val();
	if (flag == "true") {
		if (state == "false") {
			$(this).parent("tbody").find(".trtr .tr_selected").val("false");
			$(this).find(".tr_selected").val("true");
			
			$("#admstrName").val($(this).attr("name"));
			
			console.log("selected : " + $("#admstrName").val());
	
			$(this).parent("tbody").find(".trtr").children("td:nth-child(odd)").css("background-color", "#ffffff");
			$(this).parent("tbody").find(".trtr").children("td:nth-child(even)").css("background-color", "#ffffff");
			
			$(this).children("td").css("background-color", "#ef9a9a");
		} else {
			$(this).find(".tr_selected").val("false");
			
			
			console.log("unselected");
			
			$(this).children("td:nth-child(odd)").css("background-color", "#ffffff");
			$(this).children("td:nth-child(even)").css("background-color", "#ffffff");
		}
	}
});

 
 
});// document end
function reloadList() { // 목록 조회용
	  var params = $("#actionForm").serialize();
  
  $.ajax({
 	 type : "post",
 	 url : "admnstrAjax",
 	 dataType : "json",
 	 data : params,
 	 success : function(res) {
 		 	console.log(res);
 		 	drawList(res.list);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
  });
	
}
function drawList(list) {
	var html = "";
	
	for(var data of list){
		html += "<tr class=\"trtr\" name=\"" + data.CTGRY_NAME + "\">    ";
		html += "	<input type=\"hidden\" class=\"tr_selected\" value=\"false\" />        ";
		html += "	<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
		html += "<td>" + data.BOARD_ADMNSTRTN_NUM + "</td>";
		html += "<td class=\"tree_list\">" + data.CTGRY_NAME + "</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
}

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
				<div class="page_title_text">게시판관리<div class="emp_opt_btn"></div></div>				
		<!-- 해당 내용에 작업을 진행하시오. -->
		
		
		
		</div>
		<div class="cont_area">
		<form action="#" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					
		<h1 class="cont_title">카테고리 관리·설정</h1>
				<div class="tree">
					<table class="board_table">
				<colgroup>
					<col width="50"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>카테고리명</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
				</div>
				<div class="ctgr_name">카테고리명
					<input type="hidden" id="admstrName" name="admstrName"/>
					<input type="hidden" id="writer" name="writer" value="${sEmpNum}"/>
					<input type="text" id= "ctgry_name" name = "ctgry_name" class="tltle_input_box" placeholder="카테고리명을 입력하세요">
				</div>
			<div class="cmn_btn" id="writeBtn">카테고리 추가</div>
			<div class="cmn_btn_ml" id="deleteBtn">삭제</div>
		</form>
		</div>
		</div>
<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>