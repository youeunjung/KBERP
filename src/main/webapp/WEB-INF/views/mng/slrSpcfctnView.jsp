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
/* 개인 작업 영역 */
#cont{
 text-align: right;
}
.srch_month {
	display: inline-block;
	vertical-align:middle;
	height: 27px;
	margin-top:2px;
}
#page_srch_area{
 width:100%;
 height: 35px;
 text-align: right;
}
.
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#srchMonth").on("change", function() {
		$("#mon").val($("#srchMonth").val());
		$("#actionForm").submit();
		
	});
	
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
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
			<div class="page_title_text">급여명세서 조회</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		
	    <form action="#" id="actionForm" method="post">
		<input type="hidden" id="empNum" name="empNum" value="${sEmpNum}">
		<input type="hidden" id="mon" name="mon" value="${mon}">
		<input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
	
<div class= "title" style="width: 898px; height:33px; padding-top:10px; font-size:11pt; text-align:center; 
border:1px solid black; border-collapse:collapse; font-weight: bold; background-color: #F2F2F2;"> 급여명세서 조회 페이지</div>
			<div class="page_srch_area" id = "page_srch_area">
					<input type="month" class="srch_month" id="srchMonth" value="${mon}"/>
			</div>

<style>table,th,td {border:1px solid black;
                        border-collapse:collapse;}</style>
	<table style="width: 900px; height:60px; font-size:10.5pt">
    <tbody>
        <tr>
            <td style="width: 100px;text-align: center;">사원명</td>
            <td id= "cont" style="width: 200px;">${data.EMP_NAME}</td>
            <td style="width: 100px;text-align: center;">부서</td>
            <td id= "cont" style="width: 200px;">${data.DEPT_NAME}</td>
            <td style="width: 100px;text-align: center;">직급</td>
            <td id= "cont" style="width: 200px;">${data.RANK_NAME}</td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;">은행명</td>
            <td id= "cont" style="width: 200px;">${data.BANK_NAME}</td>
            <td style="width: 100px;text-align: center;">예금주</td>
            <td id= "cont" style="width: 200px;">${data.DPSTR}</td>
            <td style="width: 100px;text-align: center;">급여계좌</td>
            <td id= "cont" style="width: 200px;">${data.ACNT_NUM}</td>
        </tr>
    </tbody>
</table>
<div style="width:900px; height:10px"></div>
<table style="width: 900px; height:60px; font-size:10.5pt; ">
    <tbody>
        <tr style="background-color: #F2F2F2; font-weight: bold;">
            <td colspan="6" style="width: 450px; text-align: center;">지급 내역</td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;">기본급여</td>
            <td id= "cont" style="width: 100px; ">${data.SLRY}</td>
            <td style="width: 100px;text-align: center;">식대</td>
            <td id= "cont" style="width: 100px;">${data.BNFT_1}</td>
            <td style="width: 100px;text-align: center;">교통비</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_2}</td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;">출산보육수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_3}</td>
            <td style="width: 100px;text-align: center;">시간외수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_4}</td>
            <td style="width: 100px;text-align: center;">야간근로수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_5}</td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;">휴일근로수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_6}</td>
            <td style="width: 100px;text-align: center;">상여금</td>
            <td id= "cont"  style="width: 100px;">${data.BNFT_7}</td>
            <td style="width: 100px;text-align: center;">성과급</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_8}</td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;">직급수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_9}</td>
            <td style="width: 100px;text-align: center;">연차수당</td>
            <td id= "cont" style="width: 100px; ">${data.BNFT_10}</td> 
            <td style="width: 100px;text-align: center;">기타</td>
            <td id= "cont" style="width: 100px; ">0</td>
        </tr>

    </tbody>
</table>
<div style="width:900px; height:10px"></div>
<table style="width: 900px; height:60px; font-size:10.5pt;">
    <tbody>
        <tr style="background-color: #F2F2F2; font-weight: bold;">
            <td colspan="4" style="width: 900px; text-align: center;">공제 내역</td>
        </tr>
        <tr>
            <td style="width: 150px;text-align: center;">국민연금</td>
            <td id= "cont" style="width: 150px; ">${data.KM}</td>
            <td style="width: 150px;text-align: center;">고용보험</td>
            <td id= "cont" style="width: 150px; ">${data.KY}</td>
        </tr>
        <tr>
            <td style="width: 150px;text-align: center;">건강보험</td>
            <td id= "cont" style="width: 150px; text-align: rignt">${data.KG}</td>
            <td style="width: 150px;text-align: center;">근로소득세</td>
            <td id= "cont" style="width: 150px;">${data.KR}</td>
        </tr>
        <tr>
            <td style="width: 150px;text-align: center;">요양보험</td>
            <td id= "cont" style="width: 150px; ">${data.YY}</td>
            <td style="width: 150px;text-align: center;">지방소득세</td>
            <td id= "cont" style="width: 150px; ">${data.JB}</td>
        </tr>
    </tbody>
</table>
<div style="width:900px; height:10px;"></div>

<table style="width: 450px; height:20px; font-size:10.5pt; margin-bottom:15px;">
    <tbody>
        <tr>
            <td style="width:150px; text-align: center">지급총액</td>
            <td id= "cont" style="width:150px;">${data.ADBNFT}</td>
        </tr>
        <tr>
            <td style="width:150px; text-align: center">공제총액</td>
            <td id= "cont" style="width:150px; t">${data.WH}</td>
        </tr>
        <tr>
            <td style="width:150px; text-align: center">실지급액</td>
            <td  id= "cont" style="width:150px;">${data.RESULT_AMT}</td>
        </tr>
    </tbody>
</table>
			<div class="board_bottom">
			
			</div>
			</form>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>