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
	width: 1100px;
}
/* 개인 작업 영역 */
.cont_area {
	display: inline-block;
	vertical-align: top;
	width: 1060px;
	height: 650px;
	padding: 10px 25px;
}

.crtfct_rqst {
	display: inline-block;
    vertical-align: top;
    width: 900px;
    height: 200px;
    padding: 10px 0px;
}

.crtfct_rqst_title {
height: 25px;
    font-size: 13pt;
    color: #333333;
    font-weight: 600;
    padding: 20px 0px;
}

.crtfct_rqst_cont {
display: inline-block;
    vertical-align: top;
    width: 705px;
    height: 94px;
    padding: 10px;
    border-radius: 5px;
    border: solid 1px #d7d7d7;
}

.rqst_slct_wrap {
height: 25px;
    display: inline-block;
    width: 276px;
    text-align: center;
    padding: 5px;
}
.rqst_slct_title {
    line-height: 30px;
    display: inline-block;
    vertical-align: top;
    font-size: 10pt;
    width: 100px;
    height: 30px;
    color: #4b94f2;
    font-weight: 600;
	
}
.rqst_slct {
 display: inline-block;
    vertical-align: top;
    width: 130px;
    height: 25px;
    border: solid 1px #b7b7b7;
    border-radius: 3px;
    margin: 3px 0 0 5px;
}

.rqst_input_wrap {
    width: 840px;
    height: 30px;
    margin-top: 20px;
}

.rqst_input_title {
display: inline-block;
    line-height: 23px;
    vertical-align: top;
    font-size: 10pt;
    height: 30px;
    width: 100px;
    color: #4b94f2;
    font-weight: 600;
    padding: 0px 10px;
    margin-left: 6px;
}

.rqst_input{
	width: 404px;
    height: 21px;
    border-radius: 3px;
    border: solid 1px #d7d7d7;
    margin-bottom: 12px;
    resize: none;
    padding-left: 10px;
    margin-left: 4px;
}

.rqst_btn_area {
vertical-align: top;
    display: inline-block;
    width: 143px;
    /* height: 50px; */
    text-align: right;
}

.rqst_btn {
    background-color: #4B94F2;
    color: #fff;
    display: inline-block;
    vertical-align: bottom;
    width: 68px;
    height: 31px;
    border: 1px solid #00000022;
    border-radius: 4px;
    font-size: 10pt;
    font-weight: 600;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
}

.rqst_btn:active {
	background-color: #74abf5;
}

.crtfct_list {
    display: block;
    width: 730px;
    height: 430px;
    padding: 10px 0px;
}

.crtfct_list_title {
height: 25px;
    font-size: 13pt;
    color: #333333;
    font-weight: 600;
    padding: 20px 0px;
}

.crtfct_list_cont {
    display: inline-block;
    vertical-align: top;
    width: 730px;
    height: 289px;
    padding: 0px 0 10px 0;
    border-top: solid 1px #d7d7d7;
    overflow-y: scroll;
    border-bottom: solid 1px #d7d7d7;
}

.crtfct_table {
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}

.crtfct_table thead tr {
   background-color: #f4f4f4;
   border-bottom: 1px solid #d7d7d7;
   height: 35px;
   font-size: 10pt;
   position: sticky;
   top: 0; 
}

.crtfct_table tbody tr {
   border-bottom: 1px solid #d7d7d7;
   height: 30px;
   text-align: center;
   color: #333333;
   font-size: 9.5pt;
}

/* .crtfct_table tbody tr:hover {
   background-color: rgb(200,218,248);
} */

.crtfct_table thead tr{
	color: #333333;
	font-size: 13px;
}
/* .cont_area {
display : none;
}
 */
 .crtfct_html {
	font-size: 13px;
	color: #222222;
}
.print_area {
	display: none;
}
.print_area th {
font-size: 25px;
font-weight: normal;
}
@page {
    size: 21cm 29.7cm;
    margin: 30mm 45mm 30mm 45mm;
}

/* #printArea {
	width: 750px;
	height: 1000px;	
} */

/* .crtfct_html{
width:18cm;
height: 28cm;
} */

</style>
<script type="text/javascript">
$(document).ready(function() {
	console.log()
   $(".crtfct_list_cont").slimScroll({height: "280px"}); // 슬림스크롤
   $("#rqstBtn").on("click", function() {
	   if ($("#kind").val() == '선택') {
			makeAlert("알림", "증명서 종류를 선택하세요.", function(){
			$("#kind").focus();
			});
		} else if ($("#issueCount").val() == '선택') {$
			makeAlert("알림", "발급 매수를 선택하세요.", function(){
			$("#issueCount").focus();
			});
		} else if ($("#issueType").val() == '선택') {
			makeAlert("알림", "발급 유형을 선택하세요.", function(){
			$("#issueType").focus();
			});
		} else if (checkEmpty("#use")) {
			makeAlert("알림", "발급용도를 입력하세요.", function(){
			$("#use").focus();
			});
		} else {
			var params = $("#addForm").serialize();	
			console.log("발급신청버튼 클릭! 파람즈 값 : " + params)
	 		$.ajax({
			      type : "post",
			      url : "crtfctUserAjax/addCrtfct",
			      dataType : "json",
			      data : params,
			      success : function(res) {
			    	  if(res.res == "success"){
				    	  console.log(res);
				    	  makeAlert("알림","발급요청이 완료되었습니다.", function(){
				    	  location.reload();
				    	  });
			    	  } else {
			    		  makeAlert("알림","발급요청 중 오류가 발생하였습니다.<br/> 관리자에게 문의하세요.")
			    	  }
			    	  
			      }, 
			      error : function(req) {
			         console.log(req.responseText);
			      }
		   }); 
			
		}
	   
   });
    $("#print").on("click", function(){
    	$("#rCrtfctNum").val($("#pCrtfctNum").val());
    	console.log($("#rCrtfctNum").val())
    	var params = $("#printForm").serialize();
    	$.ajax({
		      type : "post",
		      url : "crtfctUserAjax/print",
		      dataType : "json",
		      data : params,
		      success : function(res) {
			    	  if(res.res=="success"){
				    	  console.log(res);
				    	  onPrint();
			    	  }
		      }, 
		      error : function(req) {
		         console.log(req.responseText);
		      }
	   }); 
   }); 
   
});

function onPrint() {
   var html = document.querySelector('html');
   var printContents = document.querySelector('#printArea').innerHTML;
   var printDiv = document.createElement("DIV");
   printDiv.className = "print_div";

   html.appendChild(printDiv);
   printDiv.innerHTML = printContents;	
   document.body.style.display = 'none';
   window.print();
   document.body.style.display = 'block';
   printDiv.style.display = 'none';
}


</script>
</head>
<form name="pf">
	<input type="hidden" name="printzone">
</form>
<form action="#" id="printForm">
	<input type="hidden" name="rCrtfctNum" id="rCrtfctNum">
	<input type="hidden" name="rEmpNum" id="rEmpNum" value="${sEmpNum}">
</form>
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
<!-- 내용영역 -->
		<div class="page_title_bar">
			<div class="page_title_text">증명서발급</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<form action="#" id="addForm" method="post">
			<input type="hidden" id="sEmpNum" name="sEmpNum" value="${sEmpNum}" />
				<div class="crtfct_rqst">
					<div class="crtfct_rqst_title">발급신청</div>
					<div class="crtfct_rqst_cont">
						<div class="rqst_slct_wrap">
							<div class="rqst_slct_title">증명서종류*</div>
							<select class="rqst_slct" id="kind" name="kind">
								<option >선택</option>
								<option value="0">재직증명서</option>
								<option value="1">경력증명서</option>
								<option value="2">퇴직증명서</option>
								<option value="3">기타</option>
							</select>
						</div>
						<div class="rqst_slct_wrap">
							<div class="rqst_slct_title">발급매수*</div>
							<select class="rqst_slct" id="issueCount" name="issueCount">
								<option value="0">선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
<!-- 						<div class="rqst_slct_wrap">
							<div class="rqst_slct_title">발급유형*</div>
							<select class="rqst_slct" id="issueType" name="issueType" >
								<option >선택</option>
								<option value="0">국문증명서</option>
								<option value="1">영문증명서</option>
							</select>
						</div> -->
						<div class="rqst_input_wrap">
							<div class="rqst_input_title">용도 및 제출처*</div>
								<textarea class="rqst_input" rows="1" cols="20" id="use" name="use"></textarea>
							<div class="rqst_btn_area">
								<input type="button" value="신청" class="rqst_btn" id="rqstBtn"/>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="crtfct_list">
				<div class="crtfct_list_title">발급목록</div>
				<div class="crtfct_list_cont">
					<table class="crtfct_table">
						<colgroup>
							<col width="30">      
							<col width="80">      
							<col width="100">
							<col width="200">
							<col width="100">
							<col width="100">
							<col width="150">
							<%-- <col width="50"> --%>
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>증명서번호</th>
								<th>증명서종류</th>
								<th>발급용도</th>
								<th>발급요청일</th>
								<th>발급완료일</th>
								<th>발급현황</th>
							<!--<th>인쇄</th>  -->	
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${list}">
						         <tr>
						            <td>${data.ROWNUM}</td>
						            <c:choose>
							            <c:when test="${data.ISSUE_STS_NUM==1}">
								            <td id="pCrtfctNum">${data.CRTFCT_NUM}</td>
							            </c:when>
							            <c:when test="${data.ISSUE_STS_NUM!=1}">
								            <td >-</td>
							            </c:when>
						            </c:choose>
						         	<c:choose>
						         		<c:when test="${data.CRTFCT_KIND==0}">
						         			<td>재직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==1}">
						         			<td>경력증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==2}">
						         			<td>퇴직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==3}">
						         			<td>기타</td> 
						         		</c:when>
						         	</c:choose>
						            <td>${data.USE}</td>
						            <td>${data.RQST_DATE}</td>
						            <td>${data.ISSUE_DATE}</td>
						         	<c:choose>
						         		<c:when test="${data.ISSUE_STS_NUM==0}">
						         			<td>발급요청</td> 
						         		</c:when>
						         		<c:when test="${data.ISSUE_STS_NUM==1}">
						         			<td style="color:#4B94F2;">발급완료</td> 
						         		</c:when>
						         		<c:when test="${data.ISSUE_STS_NUM==2}">
						         			<td style="color:#ff6f60;">발급불가: ${data.RSN}</td> 
						         		</c:when>
						         	</c:choose>
						        <%--  	<c:if test="${data.ISSUE_STS_NUM==1}">
				         				<td><input type="button" value="인쇄" id="print"/></td>
						         	</c:if> --%>
						         </tr>
						      </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div> <!-- contarea 끝 -->
		</div>
		<div class="print_area" id="printArea">
			<div class="print_outline">
				<table class="crtfct_html" border="1" cellspacing="0">
					<colgroup>
						<col width="100">
						<col width="80">
						<col width="130">
						<col width="50">
						<col width="40">
						<col width="60">
						<col width="30">
						<col width="130">
					</colgroup>
					<tr height="150">
						<th colspan="8" align="center"> 재직증명서 </th>
					</tr>
					<tr height="35">
						<td colspan="8" align="right">발급번호 : 제 호</td>
					</tr>
					<tr height="35">
						<td rowspan="2"align="center">인적사항</td>
						<td align="center">성명</td>
						<td colspan="2"></td>
						<td colspan="2"align="center">주민등록번호</td>
						<td colspan="2"></td>
					</tr>
					<tr height="35">
						<td align="center">주소</td>
						<td colspan="6"></td>
					</tr>
					<tr height="35">
						<td rowspan="2"align="center">재직사항</td>
						<td colspan="1"align="center">현소속</td>
						<td colspan="2"></td>
						<td colspan="2"align="center">현직위</td>
						<td colspan="2"></td>
					</tr>
					<tr height="35">
						<td colspan="1">입사일자</td>
						<td colspan="2"></td>
						<td colspan="2" align="center">담당업무</td>
						<td colspan="2"></td>
					</tr>
					<tr height="35">
						<td colspan="2" align="center">용도</td>				
						<td colspan="6"></td>				
					</tr>
					<tr height="250">
						<td colspan="8" align="center">상기인은 위와 같이 재직하고 있음을 증명합니다.</td>
					</tr>
					<tr height="35">
						<td colspan="5" rowspan="3" align="right" >확인자</td>
						<td align="center">부서</td>
						<td colspan="2"></td>
					</tr>
					<tr height="35">
						<td align="center">직급</td>
						<td colspan="2"></td>
					</tr>
					<tr height="35">
						<td align="center">성명</td>
						<td colspan="2"></td>
					</tr>
					<tr height="150">
						<td colspan="8" align="center"> 년 월 일</td> 
					</tr>
					<tr height="100">
						<td colspan="8" align="center">한국카카오은행(주)</td>
					</tr>
				</table>
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>