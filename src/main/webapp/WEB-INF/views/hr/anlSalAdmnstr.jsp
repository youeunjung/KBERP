<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP 연봉관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
      /*드래그 금지*/
      .cont_wrap,
      .navi_bar,
      .popup_main {
        -ms-user-select: none;
        -moz-user-select: -moz-none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        user-select: none;
      }
      /*-----------------------------------------------------*/
      /*팝업영역*/
      /*생성 버튼 클릭 시 팝업*/
      /*생성 팝업 -> 인상버튼 클릭*/
      .popup_incrs {
        display: none;
      }
      /*일괄 인상 버튼 클릭 시 팝업*/
      .popup_pckg_incrs {
        display: none;
      }
      /*수정 버튼 클릭 시 팝업*/
      .popup_mdfy {
        display: none;
      }
      /*수정 팝업 -> 수정버튼 클릭*/
      .popup_incrs_mdfy {
        display: none;
      }
      /*수정 팝업 -> 일괄수정버튼 클릭*/
      .popup_pckg_incrs_mdfy {
        display: none;
      }
      /*결재 버튼 클릭 시 팝업*/
      .popup_aprvl {
        display: none;
      }
      /*팝업 배경*/
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
      /*팝업 메인*/
      .popup_main {
        display: inline-block;
        width: 300px;
        height: 300px;
        box-shadow: 0px 0px 4px 0px #b7b7b7;
        position: absolute;
        top: calc(50% - 150px);
        left: calc(50% - 150px);
        z-index: 100;
        background-color: #f4f4f4;
        border-radius: 2px;
      }
      /*팝업창 타이틀*/
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
      /*팝업창 내용 부분*/
      .popup_cont {
        width: calc(100% - 20px);
        height: calc(100% - 100px);
        padding: 10px;
        /* 표준 폰트 크기 */
        /* font-size: 10.5pt; */
      }
      /*팝업창 버튼 부분*/
      .popup_btn_area {
        width: 100%;
        height: 35px;
        text-align: right;
        padding-top: 5px;
        box-shadow: inset 0px 0px 2px 0px #b7b7b7;
      }
      .popup_main {
        /* 숨김용 */
        /* 크기변경용 */
        width: 500px;
        height: 200px;
        top: calc(50% - 100px); /* 높이 반  */
        left: calc(50% - 250px); /* 너비 반 */
        text-align: center;
        line-height: 97px;
      }
      .popup_cont {
        /* 내용 변경용 */
        font-size: 10.5pt;
      }

      /*인상률 영역*/
      .incrs_area {
        display: inline-block;
        vertical-align: middle;
        width: 450px;
        height: 100px;
        border-color: #222222;
        border-width: 1px;
        border-style: solid;
      }
      /*인상률 텍스트*/
      .incrs_text {
        display: inline-block;
        width: 60px;
        height: 30px;
        color: #222222;
        font-size: 10pt;
        font-weight: bold;
        text-align: center;
      }
      /*인상률 인풋*/
      #incrs_input {
        display: inline-block;
        width: 170px;
        height: 30px;
      }
      /*-----------------------------------------------------*/
      /*내용영역*/
      .cont_area {
        width: 900px;
        height: 500px;
        border-top: 2px solid #222222;
        border-bottom: 2px solid #222222;
        overflow-y: auto;
      }
      /*제목영역*/
      .anl_sal_page_title_text {
        display: inline-block;
        vertical-align: top;
        width: 350px;
        height: 30px;
        line-height: 30px;
        color: #2e83f2;
        font-size: 16pt;
        font-weight: bold;
        text-shadow: 0px 0 1px #7b7b7b;
      }
      /*기준년도,셀렉트 박스(조회) 큰 레이아웃*/
      .srch_area {
        display: inline-block;
        vertical-align: top;
        text-align: left;
        width: 300px;
        height: 30px;
        line-height: 30px;
        border-radius: 7px;
        border-color: #222222;
        border-style: solid;
        border-width: 1px;
      }

      /*기준년도*/
      .stndr_year_srch_text {
        display: inline-block;
        vertical-align: top;
        text-align: center;
        width: 100px;
        height: 20px;
        margin-bottom: 5px;
        margin-top: 5px;
        line-height: 20px;
        color: #222222;
        font-size: 10pt;
        font-weight: bold;
      }
      /*기준년도 셀렉트*/
      .stndr_year_srch_sel {
        min-width: 100px;
        height: 20px;
        margin-left: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      /*생성/수정/결제 버튼영역*/
      .btn_area {
        display: inline-block;
        vertical-align: top;
        text-align: right;
        width: 198px;
        height: 30px;
        line-height: 30px;
        margin-left: 0px;
      }
	  
	  /*귀속년도
	  .atrbtn {
	  	display : none;
	  }
	  */
      /*연봉 테이블*/
      .anl_sal_table {
        display: inline-table;
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 15px;
      }

      .anl_sal_table thead tr {
        border-bottom: 1px solid #d7d7d7;
        height: 40px;
        font-size: 11pt;
        background-color: #f2f2f2;
        position: sticky;
        top: 0px;
      }

      .anl_sal_table tbody tr {
        border-bottom: 1px solid #d7d7d7;
        height: 40px;
        text-align: center;
        color: #7b7b7b;
        font-size: 10.5pt;
      }

      .anl_sal_table tbody tr:hover {
        color: #7b7b7b;
        font-weight: bold;
        background-color: #f2f2f2;
      }

      .anl_sal_table_on {
        background-color: rgb(200, 218, 248);
        font-weight: bold;
        border-bottom: 1px solid #d7d7d7;
        height: 40px;
        text-align: center;
        color: #7b7b7b;
        font-size: 10.5pt;
      }
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 슬림스크롤
	$(".cont_area").slimScroll({height: "450px"});
	
	setYear();
	
	
	//셀렉트로 연봉 출력
	$("#stndr_year").on("change", function() {
		$("#year").val($("#stndr_year").val());
		reloadList();
	});
	
	$("#sal_prdc").on("click", function() {
		console.log("sal_prdc_ok");
	});
	
	$("#sal_mdfy").on("click", function() {
		console.log("sal_mdfy_ok");
		makeAlert("연봉 입력", "생성 데이터가 존재하지 않습니다."); 

	});
	
});

//셀렉트 년도
function setYear(){
	var dt = new Date();
	var year = "";
	var com_year = dt.getFullYear();
	$("#stndr_year").append("<option value=''>연도를 선택하세요</option>");
	for(var y = (com_year); y >= (com_year-10); y--){
		$("#stndr_year").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
	}
}


//연봉 리스트 리로드
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "anlInqryAjax",
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

//연봉 리스트 생성
function drawList(list) {
   var html = "";
   
   for(var data of list) {
	  
      html += "<tr id=\"tbodyTr\" no=\"" + data.EMP_NUM + "\">"        ;
      html += "<td>" + data.EMP_NUM + "</td>"           ;
      html += "<td>" + data.EMP_NAME + "</td>"            ;
      html += "<td>" + data.DEPT_NAME + "</td>"           ;
      html += "<td>" + data.RANK_NAME + "</td>"           ;
      if(data.ANL_SAL==null)
    	  	html += "<td></td>";
    	  else
      		html += "<td id=\"anlSal\">" + data.ANL_SAL + "</td>"          ;
      html += "<td><input type=\"number\" class=\"atrbtn\" id=\"atrbtn\"></td>"	;
      html += "</tr>"                                     ;
      
   }
   $("tbody").html(html);
}

</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="year" name="year" value="${year}"> 
        <input type="hidden" id="anlSal" name="anlSal" value="${anlSal}"> 
        <input type="hidden" id="empNum" name="empNum" value="${empNum}">
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
          <div class="anl_sal_page_title_text">연봉관리</div>
          <div class="srch_area">
            <div class="stndr_year_srch_text">기준년도</div>
            <select class="stndr_year_srch_sel" id="stndr_year">
            </select>
          </div>
          <div class="btn_area">
            <div class="cmn_btn_ml" id="sal_prdc">생성</div>
            <div class="cmn_btn_ml" id="sal_mdfy">저장</div>
          </div>
        </div>
        <!-- 해당 내용에 작업을 진행하시오. -->
        <div class="cont_area">
          <!-- 여기부터 쓰면 됨 -->
          <table class="anl_sal_table">
            <colgroup>
              <col width="200" />
              <col width="200" />
              <col width="200" />
              <col width="200" />
              <col width="200" />
              <col width="200" />
            </colgroup>
            <thead>
              <tr>
                <th>사원번호</th>
                <th>이름</th>
                <th>직급</th>
                <th>부서</th>
                <th>기준년도 연봉</th>
                <th>귀속년도 연봉</th>
              </tr>
            </thead>
            <tbody id="anl_sal_table_tbody">  
            </tbody>
          </table>
        </div>
      </div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>