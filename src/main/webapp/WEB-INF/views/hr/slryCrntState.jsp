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
.slryCrntState_left_area {
	display: inline-block;
	vertical-align: top;
	height: 490px;
	width: 500px;
	border-bottom: solid 1px #b7b7b7;
}
.slryCrntState_right_area {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 440px;
	margin-left: 45px;
}
.popup_emp_srch_area {
    display: inline-block;
    vertical-align: top;
    width: 464px;
    height: 22px;
    text-align: center;
    margin: 0 5px;
    border-top: solid 1px #b7b7b7;
    padding: 8px;
}

.popup_srch_box {
	display: inline-block;
}

.emp_srch_select {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	min-width: 90px;
	height: 29px;
}

.popup_srch_input {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 28px;
	margin-left: 10px;
	margin-right: 10px;
	text-align: center;
	border: 1px solid #d7d7d7;
	line-height: 26px;
}

.popup_srch_input input {
width: 283px;
    height: 26px;
    padding-left: 11px;
    border: none;
}

.empinqry_area {
	margin: 12px;
	display: inline-block;
	vertical-align: top;
	height: 250px;
}

.empinqry_list {
	display: inline-table;
	border-collapse: collapse;	
	width: 480px;
	margin-bottom: 15px;
}

.empinqry_list thead tr {
	background-color: #f1f1f1;
	border-bottom: 1px solid #d7d7d7;
	height: 30px;
	font-size: 10pt;
	position: sticky;
	color: #222222;
	top: 0;
}

.empinqry_list tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 30px;
	text-align: center;
	color: #222222;
	font-size: 9.5pt;
}

.empinqry_list tbody tr:hover {
	background-color: rgb(200, 218, 248);
}
.slry_cont_area{
	display: inline-block;
	width: 437px;
    height: 430px;
    border: solid 1px #d7d7d7;
}
.slry_table{ 
	display: inline-table;
	width: 100%;
	border-collapse: collapse;
	border: solid 1px b7b7b7;
	color: #222222;
	font-size: 11px;
}
.slry_table tbody tr {
   border-bottom: 1px solid #d7d7d7;
   height: 30px;
   text-align: center;
   color: #333333;
   font-size: 9.5pt;
}
.slry_cont_txt{
    margin-bottom: 20px;
    padding-top: 10px;
    color: #333333;
    font-size: 14px;
    font-weight: 600;
}
/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
  
	$(".empinqry_area").slimScroll({height: "450px"});
	$(".slry_cont_area").slimScroll({height: "420px"});
	
   // 급여 상세보기
   $("tbody").on("click", "tr", function() {
      $("#eNum").val($(this).attr("eNum"));
      $("tbody").children("tr").css("background-color", "#ffffff");
      $(this).css("background-color", "rgb(200,218,248)");
	   console.log("급여상세 클릭! empnum : " + $("#eNum").val())

      reloadCont();
   });
	   

});
function reloadCont(){
   var params = $("#slryForm").serialize();
   
   $.ajax({
      type : "post",
      url : "slryCrntStateAjax/cont",
      data : params,
      dataType : "json",
      success : function(res) {
         drawCont(res.bnft, res.slry, res.tBnft);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
}

function drawCont(bnft, slry, tBnft){
	console.log(bnft, slry, tBnft)
	var html = '';
	var tSal = '';
	var sal = '';
	var bnf = '';
	
	sal = slry.ANL_SAL * 1
	bnf = tBnft.AMNT * 1
	
	if (isNaN(sal) || sal == 'undefined' || sal == null) { // 값이 없어서 NaN값이 나올 경우
		sal = 0;
		}
	if (isNaN(bnf) || bnf == 'undefined' || bnf == null) { // 값이 없어서 NaN값이 나올 경우
		bnf = 0;
		}
	
	tSal = sal + bnf
	console.log("총 급여" + tSal)    
	console.log("기본급" + sal + "수당" + bnf) 
	
	
	html += '<div class=\'slry_cont_txt\'>' + slry.SYSMON + '</div>                      ';
	html += '<div class=\'slry_cont_area\'>                                   ';
	html += '	<table class=\'slry_table\'>                                  ';
	html += '		<colgroup>                                                ';
	html += '			<col width=\'35%\'/>                                  ';
	html += '			<col width=\'65%\'/>                                  ';
	html += '		</colgroup>                                               ';
	html += '		<tbody>                                                   ';
	html += '			<tr>                                                  ';
	html += '				<td style=\'font-weight:600;\'>기본급</td>     ';
	html += '				<td>' + slry.ANL_SAL + '</td>                           ';
	html += '			</tr>                                                 ';
	for(var data of bnft){
	html += '			<tr>                                                  ';
	html += '				<td style=\'font-weight:600;\'>' + data.LIST_NAME + '</td>       ';
	html += '				<td>' + data.AMNT + '</td>                                  ';
	html += '			</tr>                                                 ';
	}
	html += '			<tr>                                                  ';
	html += '				<td style=\'font-weight:600;\'>총 급여</td>   ';
	html += '				<td style=\'font-weight:600;\'>' + tSal + '</td>   ';
	html += '			</tr>                                                 ';
	html += '		</tbody>                                                  ';
	html += '	</table>                                                      ';
	html += '</div> ';
	
	$("#slryHtml").html(html);
	
}
</script>
</head>
<body>
	<form action="#" id="slryForm" method="post">
		<input type="hidden" id="eNum" name="eNum"/>
	</form>
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
			<div class="page_title_text">급여 현황</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="slryCrntState_left_area">
				<div class="popup_emp_srch_area">       
					<select class="emp_srch_select" id="inqryGbn" name="inqryGbn">
						<option value="0" selected>전체</option>
						<option value="1">부서명</option>      
						<option value="2">사원명</option>      
						<option value="3">직급명</option>     
					</select>                                   
					<div class="popup_srch_input">	                 
						<input type="text" id="inqryTxt" name="inqryTxt"/>        
					</div>                                      
					<div class="cmn_btn" id="inqryBtn">검색</div>           
					</div>                                      
					<div class="empinqry_area">        
		             <table class="empinqry_list">  
		               <colgroup>                     
		                  <col width="80"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		               </colgroup>                    
		               <thead>                        
		                  <tr>                        
		                     <th>no</th>            
		                     <th>부서</th>            
		                     <th>직급</th>            
		                     <th>사원명</th>         
		                     <th>사원번호</th>        
		                  </tr>                       
		               </thead>                       
		               <tbody id="aprvlerInqry_tbody">  
               			  <c:forEach var="data" items="${list}">
					         <tr eNum="${data.EMP_NUM}">
					            <td>${data.ROWNUM}</td>
					            <td>${data.DEPT_NAME}</td>
					            <td>${data.RANK_NAME}</td>
					            <td>${data.EMP_NAME}</td>
					            <td>${data.EMP_NUM}</td>
					         </tr>
					      </c:forEach>
		               </tbody>                       
		              </table>                        
		            </div>       
	            </div>
				<div class="slryCrntState_right_area" id="slryHtml">

				</div>
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>