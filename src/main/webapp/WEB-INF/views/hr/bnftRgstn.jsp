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
.bnftRgstn_left_area {
	display: inline-block;
	vertical-align: top;
	height: 490px;
	width: 500px;
	border-bottom: solid 1px #b7b7b7;
}
.bnftRgstn_right_area {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 500px;
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
.bnftRgstn_btn_area {
	display: inline-block;
	vertical-align: top;
	height: 30px;
	width: 480px;
	margin-left: 45px;
    padding: 10px 0 10px 0;
	
}
.bnftRgstn_cont_area {
	display: inline-block;
	vertical-align: top;
    height: 440px;
    width: 500px;
	margin-left: 45px;
	
}
.bnftRgstn_cont_table {
	display: inline-table;
	border-collapse: collapse;	
    width: 480px;
    height: 438px;
	margin-bottom: 15px;
}

.bnftRgstn_cont_table tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 40px;
	text-align: center;
	color: #222222;
	font-size: 9.5pt;
}
.bnftRgstn_cont_table tbody tr td {
	border: 1px solid #d7d7d7;
}
.bnftRgstn_set_btn{
    color: #000;
    display: inline-block;
    vertical-align: bottom;
    width: 75px;
    height: 28px;
    border: 1px solid #dadce1;
    border-radius: 4px;
    font-size: 9pt;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
}
.bnftRgstn_btn{
	float: right;
	background-color: #F2B705;
    color: #333333;
    display: inline-block;
    vertical-align: bottom;
    width: 75px;
    font-weight: 600;
    height: 28px;
    border: 1px solid #dadce1;
    border-radius: 4px;
    font-size: 9pt;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
    margin-left: 7px;
}

/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
  
	$(".empinqry_area").slimScroll({height: "450px"});
	   

});
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
			<div class="page_title_text">수당 관리</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bnftRgstn_left_area">
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
					         <tr>
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
			<div class="bnftRgstn_right_area">
				<div class="bnftRgstn_btn_area">
					<input type="button" class="bnftRgstn_set_btn" value="수당설정"/>
					<input type="button" class="bnftRgstn_btn" value="수당삭제"/>
					<input type="button" class="bnftRgstn_btn" value="수당등록"/>
				</div>
				<div class="bnftRgstn_cont_area">
					<table class="bnftRgstn_cont_table">
						<colgroup>
							<col width="20"/>
							<col width="100"/>
							<col width="100"/>
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="10"  style="font-weight:600; writing-mode:tb-rl; letter-spacing: 41.5px;">수당항목</td>
								<td style="font-weight:600;">지급항목</td>
								<td style="font-weight:600;">금액</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td style="font-weight:600;">지급총액</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>