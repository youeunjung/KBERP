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

.apntm_add_btn_area {
	height: 30px;
	margin-bottom: 15px;
}

.apntm_add_btn_area {
	text-align: right;
}

.apntm_add_btn {
	background-color: #4B94F2;
	color: #fff;
	display: inline-block;
	vertical-align: bottom;
	width: 93px;
	height: 37px;
	border: 1px solid #00000022;
	border-radius: 4px;
	font-size: 11pt;
	font-weight: 600;
	text-align: center;
	line-height: 26px;
	user-select: none;
	cursor: pointer;
}

.apntm_add_btn:active {
	background-color: #74abf5;
}

.srch_wrap {
	height: 80px;
	border: solid 1px #b7b7b7;
	padding: 10px;
	border-radius: 4px;
	margin-bottom: 20px;
	user-select: none;
}

.srch_top_area {
	display: inline-block;
	vertical-align: top;
	text-align: left;
	width: 100%;
	height: 30px;
	line-height: 30px;
}

.srch_select {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	min-width: 100px;
	height: 30px;
}

.srch_input {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 174px);
	height: 28px;
	margin-left: 10px;
	margin-right: 10px;
	text-align: left;
	border: 1px solid #d7d7d7;
	line-height: 28px;
}

.srch_input input {
	width: 99%;
	height: 28px;
	padding: 0px 0px 0px 10px;
	vertical-align: middle;
	border: none;
}

.srch_bottom_area {
	height: 60px;
	margin-top: 18px;
}

.aprvl_radio_wrap {
	display: inline-block;
	vertical-align: top;
	width: 375px;
	height: 30px;
}

.aprvl_radio_area {
	display: inline-block;
	font-size: 13px;
	font-weight: 500;
}

.aprvl_radio_title {
	display: inline-block;
	vertical-align: top;
	color: #222222;
	font-size: 10.5pt;
	font-weight: 600;
	margin-bottom: 0px;
	margin: 0px 15px 0px 10px;
}

.aprvl_radio_area input {
	margin: 3px 7px 0px 10px;
}

.aprvl_radio_area input, label {
	cursor: pointer;
}

.srch_prd_wrap {
	display: inline-block;
	vertical-align: top;
	width: 700px;
	height: 30px;
}

.prd_radio_title {
	margin-right: 15px;
	display: inline-block;
	color: #222222;
	font-size: 10.5pt;
	font-weight: 600;
	margin-bottom: 5px;
}

.prd_radio_area {
	display: inline-block;
	font-size: 13px;
	font-weight: 500;
}

.prd_radio_form>* {
	width: 19px;
	color: #222222;
	font-size: 10pt;
	font-weight: 500;
	margin-right: 5px;
}

.prd_wrap {
	display: inline-block;
	vertical-align: top;
	width: 402px;
	height: 30px;
	margin-left: 21px;
}

.prd_wrap>input {
	width: 120px;
}

.prd_radio_area input {
	margin: 4px 8px 0px 10px;
}

.prd_text_wrap {
	display: inline-block;
	vertical-align: top;
	height: 30px;
	width: 127px;
}

.prd_text {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	display: inline-block;
	vertical-align: top;
	height: 18px;
	width: 115px;
	font-size: 9pt;
	text-align: center;
}

.apntm_date_input {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	display: inline-block;
	vertical-align: top;
	height: 21px;
	width: 121px;
	font-size: 9pt;
	text-align: center;
}

.prd_clsftn {
	display: inline-block;
	vertical-align: top;
	height: 30px;
	width: 35px;
	font-size: 10pt;
	text-align: center;
	margin-right: 7px;
}
/*             왼쪽         */
.apntm_cont_left_area {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 520px;
	border-bottom: solid 1px #b7b7b7;
}

}
.apntm_list_area {
	display: inline-block;
	vertical-align: top;
	height: 450px;
	width: 520px;
	border: solid 1px #d7d7d7;
	/* overflow-y: scroll; */
}

.apntm_list_title {
	display: inline-block;
	vertical-align: top;
	color: #222222;
	font-size: 11pt;
	height: 35px;
	width: 522px;
	font-weight: 600;
	border-bottom: solid 1px #b7b7b7;
}

thead {
	color: #333333;
}

.apntm_list {
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}

.apntm_list thead tr {
	background-color: #f3f3f3;
	border-bottom: 1px solid #d7d7d7;
	height: 40px;
	font-size: 13px;
	position: sticky;
	top: 0;
}

.apntm_list tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 40px;
	text-align: center;
	color: #333333;
	font-size: 9.5pt;
}

.apntm_list tbody tr:hover {
	background-color: #f3f3f3;
}

/* ================ 오른쪽 ========== */
.apntm_cont_right_area {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 520px;
	margin-left: 45px;
}

.apntm_add_title_area {
	height: 35px;
	width: 530px;
}

.apnmt_add_top_area {
	height: 200px;
}

.apntm_add_title {
	display: inline-block;
	vertical-align: top;
	color: #4B94F2;
	font-size: 11pt;
	height: 30px;
	width: 448px;
	font-weight: 600;
}

.apntm_info_title {
	display: inline-block;
	vertical-align: top;
	color: #222222;
	font-size: 11pt;
	height: 30px;
	width:373px;
	font-weight: 600;
}

.apntm_add_btn_area_2 {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 130px;
}

.apntm_add_btn_2 {
	background-color: #F2B705;
    color: #333333;
    display: inline-block;
    vertical-align: bottom;
    width: 75px;
    font-weight:600;
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

.apntm_del_btn {
	background-color: dadce1;
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

.apntm_add_btn_2:active {
	background-color: #F2CB05;
}

.apnmt_add {
	display: inline-block;
	vertical-align: top;
	height: 440px;
	width: 520px;
	border: solid 1px #b7b7b7;
	padding: 5px;
	border-radius: 5px;
}

.apnmt_add_area {
	display: inline-block;
	vertical-align: top;
	height: 440px;
	width: 520px;
	border: solid 1px #b7b7b7;
	padding: 5px;
	border-radius: 5px;
}

.apnmt_add_top_area {
	height: 165px;
	width: 530px;
}

.apnmt_prfl_img {
	display: inline-block;
	vertical-align: top;
	margin: 11px;
	height: 135px;
	width: 115px;
	border: solid 1px #d7d7d7;
	background-image: url("../images/cmn/profile_icon.png");
	background-size: 100%;
	background-repeat: none;
	background-position: center;
}

.apnmt_prfl_info_wrap {
	display: inline-block;
	vertical-align: top;
	width: 230px;
	height: 135px;
	margin: 12px;
}

.apnmt_prfl_info {
	display: inline-block;
	vertical-align: top;
	width: 359px;
	height: 30px;
	margin: 2px 0;
	font-size: 9pt;
	font-weight: 600;
	color: #595959;
}

.prfl_info_input {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	width: 98px;
	height: 17px;
	margin-left: 20px;
	padding-left: 5px;
}

.prfl_srch_btn {
	display: inline-block;
	vertical-align: top;
	height: 24px;
	width: 24px;
	margin-left: 7px;
	background-image: url("resources/images/hr/srch_icon.png");
	background-size: 100%;
	cursor: pointer;
}

.prfl_info_text {
	display: inline-block;
	vertical-align: top;
	width: 67px;
	height: 17px;
	line-height: 24px;
	margin-left: 23px;
}

.apnmt_add_mid_area {
	height: 158px;
	width: 530px;
}

.apnmt_info_wrap {
	width: 530px;
	height: 30px;
	margin: 2px 0;
	font-size: 9pt;
	font-weight: 600;
	color: #595959;
	margin: 18px;
}

.apnmt_info {
	display: inline-block;
	vertical-align: top;
	width: 250px;
	height: 30px;
}

.apnmt_info_text {
	display: inline-block;
	vertical-align: top;
	width: 70px;
	height: 30px;
}

.apnmt_add_info_text {
	display: inline-block;
	vertical-align: top;
	width: 70px;
	height: 30px;
	color: #2E83F2;
}

.apnmt_info_text_end {
	display: inline-block;
	vertical-align: top;
	width: 70px;
	height: 30px;
	color: black;
	font-weight: 500;
}

.apnmt_select {
	display: inline-block;
	vertical-align: top;
	width: 123px;
	height: 23px;
	border: solid 1px #b7b7b7;
	border-radius: 3px;
}

.apnmt_info_input {
	display: inline-block;
	vertical-align: top;
	width: 110px;
	height: 19px;
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	padding-left: 5px;
}

.apnmt_add_bottom_area {
	height: 110px;
	width: 530px;
}

.apnmt_add_cont_wrap {
	font-size: 9pt;
	font-weight: 600;
	color: #595959;
	height: 94px;
	width: 505px;
	border: solid 1px #d7d7d7;
	border-radius: 10px;
	text-align: center;
	margin-left: 6px;
}

.apnmt_add_cont_title {
	height: 30px;
	font-size: 9pt;
	font-weight: 600;
	color: #595959;
}

.apnmt_add_cont_input {
	height: 55px;
	width: 450px;
	border: solid 1px #ffffff;
}

#apntm_cont {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 520px;
}

.popup_srch_input input {
	width: 97%;
	height: 24px;
	padding-left: 11px;
	vertical-align: middle;
	border: none;
}

.popup_emp_srch_area {
	display: inline-block;
	vertical-align: top;
	width: 567px;
	height: 31px;
	text-align: center;
	margin: 0 5px;
}

.popup_srch_box {
	display: inline-block;
}

.emp_srch_select {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	min-width: 100px;
	height: 29px;
}

.popup_srch_input {
	display: inline-block;
	vertical-align: top;
	width: 366px;
	height: 28px;
	margin-left: 10px;
	margin-right: 10px;
	text-align: center;
	border: 1px solid #d7d7d7;
	line-height: 26px;
}

.popup_srch_input input {
	width: 93%;
	height: 23px;
	padding-left: 11px;
	vertical-align: middle;
	border: none;
}

.empinqry_area {
	margin: 12px;
	display: inline-block;
	vertical-align: top;
	height: 250px;
	/* width: 545px;*/
	/* border: solid 1px #d7d7d7;*/
	/* overflow: hidden; */
}

.empinqry_list {
	display: inline-table;
	border-collapse: collapse;
	width: 553px;
	margin-bottom: 15px;
}

.empinqry_list thead tr {
	background-color: #f1f1f1;
	border-bottom: 1px solid #d7d7d7;
	height: 30px;
	font-size: 10pt;
	position: sticky;
	top: 0;
}

.empinqry_list tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 26px;
	text-align: center;
	color: #222222;
	font-size: 9.5pt;
}

.empinqry_list tbody tr:hover {
	background-color: rgb(200, 218, 248);
}

.dvsnInfo {
	display: inline-block;
	width: 200px;
	height: 30px;
	font-size: 13px;
	color: #222222;
	
}
#emp_pctr_area {
	width: 100%;
    height: 100%;
    object-fit: contain;
}

.page_title_bar_custom {
    height: 30px;
}

/*       결재팝업              */

.aprvl_popup_area {
/*display: inline-block; */
    /* vertical-align: top; */
    width: 455px;
    height: 280px;
    /* border: 1px solid #d7d7d7; */
    padding: 10px;
}

.aprvl_title_wrap {
	display: block;
	width: 450px;
    height: 50px;
    text-align: left;
}

.aprvl_title_txt {
display: inline-block;
    vertical-align: top;
    width: 62px;
    height: 30px;
    color: #444444;
    text-align: right;
    margin-right: 6px;
    line-height: 26px;
}

.aprvl_title_input {
    display: inline-block;
    vertical-align: top;
    width: 342px;
    height: 25px;
    border: 1px solid #d7d7d7;
    margin-bottom: 9px;
    border-radius: 5px;
    padding-left: 10px;
}

.aprvl_cont_wrap {
display: block;
    width: 458px;
    height: 125px;
    text-align: left;
    border-bottom: solid 1px #d7d7d7;
}

.aprvl_cont_txt {
    display: inline-block;
    vertical-align: top;
    width: 62px;
    height: 30px;
    color: #444444;
    text-align: right;
    margin-right: 6px;
    line-height: 29px;
}

.aprvl_cont_input {
display: inline-block;
    vertical-align: top;
    width: 342px;
    height: 99px;
    border: solid 1px #d7d7d7;
    border-radius: 5px;
    padding-left: 10px;
}

.aprvler_wrap {
    display: block;
    width: 450px;
    height: 40px;
    text-align: left;
    margin-top: 29px;
}

.aprvler_txt {
    display: inline-block;
    vertical-align: top;
    width: 62px;
    height: 30px;
    color: #444444;
    text-align: right;
    margin-right: 6px;
    line-height: 29px;
}

.aprvler_input {
    display: inline-block;
    vertical-align: top;
    width: 308px;
    height: 26px;
    border: 1px solid #d7d7d7;
    padding-left: 10px;
    border-radius: 5px;
}

.aprvler_btn {
    display: inline-block;
    vertical-align: top;
    height: 24px;
    width: 24px;
    margin-left: 7px;
    background-image: url(resources/images/hr/srch_icon.png);
    background-size: 100%;
    cursor: pointer;
    margin-top: 4px;
}

.rfrnc_wrap {
    display: block;
    width: 450px;
    height: 50px;
    text-align: left;
}

.rfrnc_txt {
display: inline-block;
    vertical-align: top;
    width: 62px;
    height: 30px;
    color: #444444;
    text-align: right;
    margin-right: 6px;
    line-height: 29px;
}

.rfrnc_input {
    display: inline-block;
    vertical-align: top;
    width: 308px;
    height: 26px;
    border: 1px solid #d7d7d7;
    border-radius: 5px;
    padding-left: 10px;
}

.rfrnc_btn {
display: inline-block;
    vertical-align: top;
    height: 24px;
    width: 24px;
    margin-left: 7px;
    background-image: url(resources/images/hr/srch_icon.png);
    background-size: 100%;
    cursor: pointer;
    line-height: 66px;
    margin-top: 4px;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
   // 조회 필터 기본 세팅
   if ("${param.searchGbn}" != "") {
      $("#searchGbn").val("${param.searchGbn}");
   } else {
      $("#oldSearchGbn").val("0");
   }
   
   // 슬림스크롤
   $(".apntm_list_area").slimScroll({height: "450px"});
   
   // 인사발령 메인화면
   reloadList();

   
   // 발령 상세보기 
   $("tbody").on("click", "tr", function() {
      $("#delApntmNum").val($(this).attr("apntmNum"));
      $("#empNum").val($(this).attr("empNum"));
      $("#apntmNum").val($(this).attr("apntmNum"));
      $("#stsNum").val($(this).attr("stsNum"));
      $("tbody").children("tr").css("background-color", "#ffffff");
      $(this).css("background-color", "rgb(200,218,248)");
	   console.log("발령리스트 클릭! empnum : " + $("#empNum").val() + "apntmNum : " + $("#apntmNum").val())

      reloadCont();
   });
   
   // 기간조회 비활성화
   $(".prd_value").on("click",  function() {
     var valueCheck = $(".prd_value:checked").val();
     
     if(valueCheck == "1") {
    	 $(".prd_text").attr("disabled", false);
    	 $("#prd_start").focus();
     } else {
    	 $(".prd_text").val("");
    	 $(".prd_text").attr("disabled", true);
     }
   });
   
   // 검색 버튼 클릭 시
   $("#searchBtn").on("click", function() {
	    if($(".prd_value:checked").val() == "1") { // 기간설정 선택시 checkEmpty
	    	if(checkEmpty("#prd_start")||checkEmpty("#prd_end")){
	    		makeAlert("알림","기간을 입력하세요.");
	    	} else {
	  	      $("#oldSearchAprvl").val($("#searchAprvl").val());
		      $("#oldSearchGbn").val($("#searchGbn").val());
		      $("#oldSearchTxt").val($("#searchTxt").val());      
		      $("#oldstartPrd").val($("#startPrd").val());      
		      $("#oldendPrd").val($("#endPrd").val());      
		      reloadList();
	    	}
	   } else {
	      $("#oldSearchAprvl").val($("#searchAprvl").val());
	      $("#oldSearchGbn").val($("#searchGbn").val());
	      $("#oldSearchTxt").val($("#searchTxt").val());      
	      $("#oldstartPrd").val($("#startPrd").val());      
	      $("#oldendPrd").val($("#endPrd").val());      
	      reloadList();
	   }
   });
   

   // 발령 추가
   $("#apntm_add_btn").on("click", function() {
	   console.log("현재접속사원번호 :" + $("#sEmpNum").val())
	   reloadAddApntm();
	   console.log("발령추가 클릭!")

	   // 사원조회 팝업
		$("body").on("click", "#prfl_srch_btn", function() {
			console.log("돋보기 클릭!")
						
			var html = "";
			html += "<form action=\"#\" id=\"inqryForm\" method=\"post\">" ;
			html += "<input type=\"hidden\" id=\"inqryNo\" name=\"inqryNo\"  />" ;
			html += "<div class=\"popup_emp_srch_area\">         ";
			html += "<select class=\"emp_srch_select\" id=\"inqryGbn\" name=\"inqryGbn\">          ";
			html += "	<option value=\"0\" selected>전체</option>";
			html += "	<option value=\"1\">부서명</option>      ";
			html += "	<option value=\"2\">사원명</option>      ";
			html += "	<option value=\"3\">직급명</option>      ";
			html += "</select>                                   ";
			html += "<div class=\"popup_srch_input\">	                 ";
			html += "	<input type=\"text\" id=\"inqryTxt\" name=\"inqryTxt\"/>                  ";
			html += "</div>                                      ";
			html += "<div class=\"cmn_btn\" id=\"inqryBtn\">검색</div>           ";
			html += "</div>                                      ";
			html += "</form>";														
			html += "<div class=\"empinqry_area\">        ";
            html += " <table class=\"empinqry_list\">   ";
            html += "   <colgroup>                      ";
            html += "      <col width=\"100\"/>         ";
            html += "      <col width=\"100\"/>         ";
            html += "      <col width=\"100\"/>         ";
            html += "      <col width=\"100\"/>         ";
            html += "   </colgroup>                     ";
            html += "   <thead>                         ";
            html += "      <tr>                         ";
            html += "         <th>부서</th>             ";
            html += "         <th>직급</th>             ";
            html += "         <th>사원명</th>           ";
            html += "         <th>사원번호</th>         ";
            html += "      </tr>                        ";
            html += "   </thead>                        ";
            html += "   <tbody id=\"empinqry_tbody\">   ";
            html += "   </tbody>                        ";
            html += "  </table>                         ";
            html += "</div>                             ";
			
			makePopup({
				bg : false,
				bgClose : false,
			 	width: 600,
			 	height: 400,
				title : "사원조회",
				contents : html,
				contentsEvent : function() {
					var params = $("#inqryForm").serialize();	
			 		$.ajax({
					      type : "post",
					      url : "apntmListAjax/inqryList",
					      dataType : "json",
					      data : params,
					      success : function(res) {
					    	  console.log(res);
					    	  drawInqryList(res.inqryList);
					      }, 
					      error : function(req) {
					         console.log(req.responseText);
					      }
				   }); 
			 		
			 	   // 사원 선택 
			 	   $("tbody").on("click", "tr", function() {
			 	      $("#inqryNo").val($(this).attr("no"));
			 	      $("tbody").children("tr").css("background-color", "#ffffff");
			 	      $(this).css("background-color", "rgb(200,218,248)");
			 	      console.log("inqryNo : " + $("#inqryNo").val())
			 	   });
			 	   
		   	   	   // 사원조회 버튼이벤트
			 	   $("#inqryTxt").on("keypress", function(event) { // 엔터 시 클릭
		 			  if(event.keyCode == 13) {
		 				  $("#inqryBtn").click();
		 				  return false;
		 			  }
			 	   });
			   	   $("#inqryBtn").on("click", function() { 
		   		      console.log("사원조회팝업 버튼클릭!")
				   	   var params = $("#inqryForm").serialize();	
				   	   console.log("inqryGbn  : " + $("#inqryGbn").val())
				 		$.ajax({
						      type : "post",
						      url : "apntmListAjax/inqryList",
						      dataType : "json",
						      data : params,
						      success : function(res) {
						    	  console.log(res);
						    	  drawInqryList(res.inqryList);
						      }, 
						      error : function(req) {
						         console.log(req.responseText);
						      }
					   }); 
			   	   });
		      },
				draggable : true,
				buttons : [{
					name : "확인",
					func:function() {
					   	   var params = $("#inqryForm").serialize();	
					 		$.ajax({
							      type : "post",
							      url : "apntmListAjax/inqryEmp",
							      dataType : "json",
							      data : params,
							      success : function(res) {
							    	  console.log(res);
							    	  $("#addEmpNum").val(res.inqryEmp.EMP_NUM);
									  $("#empName").val(res.inqryEmp.EMP_NAME);
									  $("#emp_pctr_area").attr("src", "resources/upload/" + res.inqryEmp.EMP_PCTR_FILE);
									  $("#deptName").val(res.inqryEmp.RANK_NAME);
									  $("#rankName").val(res.inqryEmp.DEPT_NAME);
							      }, 
							      error : function(req) {
							         console.log(req.responseText);
							      }
						   }); 
						console.log("사원조회!");
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
   			$(".empinqry_area").slimScroll({height: "255px"},{width: "450px"}); // 슬림스크롤
		}); // 사원조회팝업 끝
		
		// 발령구분 퇴사 선택 시 발령종료일 외 비활성화
		$("body").on("change", "#addDvsnNum", function(){
			  console.log("발령구분값: " + $('#addDvsnNum option:selected').val())
			    if ($('#addDvsnNum option:selected').val() == 1) {
			    	makeAlert("알림", "퇴사는 발령종료일만 입력하세요");
			    	$("#addDeptNum").attr("disabled", true);
			    	$("#addDeptNum").val("");
			    	$("#addRankNum").attr("disabled", true);
			    	$("#addRankNum").val("");
			    	$("#addStart").attr("disabled", true);
			    	$("#addStart").val("");
			    	$("#addEnd").focus();
			    } else {
			    	$("#addDeptNum").attr("disabled", false);
			    	$("#addDeptNum").val("선택");
			    	$("#addRankNum").attr("disabled", false);
			    	$("#addRankNum").val("선택");
			    	$("#addStart").attr("disabled", false);
			    }
		  }); 
		//발령추가
		$("body").on("click", "#addApntmBtn", function() {
			console.log("등록클릭!")
			if($('#addDvsnNum option:selected').val() != 1) { //발령구분 퇴사 아닐 시 
				if ($("#addEmpNum").val() == '') {
					makeAlert("알림", "돋보기를 눌러 발령사원을 선택하세요.", function(){
					$("#prfl_srch_btn").focus();
					});
				} else if ($("#addDvsnNum").val() == '선택') {
					makeAlert("알림", "발령구분을 선택하세요.", function(){
					$("#addDvsnNum").focus();
					});
				} else if ($("#addDeptNum").val() == '선택') {
					makeAlert("알림", "발령부서를 선택하세요.", function(){
					$("#addDeptNum").focus();
					});
				} else if ($("#addRankNum").val() == '선택') {
					makeAlert("알림", "발령직급을 선택하세요.", function(){
					$("#addRankNum").focus();
					});
				} else if ($("#addStart").val() == '')  {
					makeAlert("알림", "발령시작일을 입력하세요.", function(){
					$("#addStart").focus();
					});
				} else {
					$("#aprvlCont").val($("#addDvsnNum option:selected").attr("cont"))
					console.log("결재요청내용 : " + $("#addDvsnNum option:selected").attr("cont"))
					console.log("결재요청사원번호 : " + $("#sEmp").val())
					// 발령 최종등록
			   	   var params = $("#addApntmForm").serialize();	
			 		$.ajax({
					      type : "post",
					      url : "apntmListAjax/insertApntm",
					      dataType : "json",
					      data : params,
					      success : function(res) {
					    	  if(res.res == "success"){
					    	 	 makeAlert("알림","발령이 등록되었습니다.", function(){
				    		 	 	location.reload();
					    	 	 });
					    	  } else {
					    		  makeAlert("알림", "작업중 문제가 발생하였습니다.");
				    	 	 }
					    	  console.log(res);
					      }, 
					      error : function(req) {
					         console.log(req.responseText);
					      }
				   }); 
	
				}
			} else { // 발령구분 퇴사일 시 
				if($("#addEnd").val() == '') {
						makeAlert("알림", "발령종료일을 입력하세요.", function(){
						$("#addEnd").focus();
					});
				} else {
					var params = $("#addApntmForm").serialize();	
			 		$.ajax({
					      type : "post",
					      url : "apntmListAjax/updateApntm",
					      dataType : "json",
					      data : params,
					      success : function(res) {
					    	  makeAlert("알림","발령이 등록되었습니다.", function(){
				    		  	location.reload();
					    	  });
					    	  console.log(res);
					      }, 
					      error : function(req) {
					         console.log(req.responseText);
					      }
				   }); 
				}
			}
	

		});
		
  	});// 발령추가 끝
  	
  	
  	//발령취소 버튼이벤트
  	$("body").on("click","#aprvlDelBtn", function() {
  		makePopup({
			bg : false,
			bgClose : false,
			title : "삭제",
			contents : "발령을 취소하시겠습니까?", 
			draggable : true,
			buttons : [{
				name : "확인",
				func:function() {
					var params = $("#delForm").serialize();
					$.ajax({
					       type : "post",
					       url : "apntmListAjax/deleteApntm",
					       data : params,
					       dataType : "json",
					       success : function(res) {
							   closePopup();
							   makeAlert("알림", "발령이 취소되었습니다.", function(){
								   location.reload();
							   });
					       }, 
					       error : function(req) {
					          console.log(req.responseText);
					       }
					    });
					console.log("삭제!");
				}
			}, {
				name : "취소"
			}]
		});
  		
  	}); 
  	// 결재요청 버튼이벤트 
  	$("body").on("click","#aprvlBtn", function() {
  		$("#aApntmNum").val($(this).attr("aApntmNum"));
  		console.log("결재요청 발령번호  : " + $("#aApntmNum").val())
  		
		var html = "";
		
		html += "<div class=\"aprvl_popup_area\">                          ";
		html += "	<div class=\"aprvl_title_wrap\">                       ";
		html += "		<div class=\"aprvl_title_txt\">제목</div>          ";
		html += "		<input type=\"text\" class=\"aprvl_title_input\" id=\"aprvlTitle\" name=\"aprvlTitle\"/> ";
		html += "	</div>			                                       ";
		html += "	<div class=\"aprvl_cont_wrap\">                        ";
		html += "		<div class=\"aprvl_cont_txt\">내용</div>           ";
		html += "		<input type=\"text\" class=\"aprvl_cont_input\"id=\"aprvlCont\" name=\"aprvlCont\"/>  ";
		html += "	</div>			                                       ";
		html += "	<div class=\"aprvler_wrap\">                           ";
		html += "		<div class=\"aprvler_txt\">결재권자</div>          ";
		html += "		<input type=\"text\" readonly=\"readonly\" id=\"aprvlerInput\" class=\"aprvler_input\"/>     ";
		html += "		<div class=\"aprvler_btn\" id=\"aprvlerBtn\"  ></div>                  ";
		html += "	</div>			                                       ";
		html += "	<div class=\"rfrnc_wrap\">                             ";
		html += "		<div class=\"rfrnc_txt\">참조인</div>              ";
		html += "		<input type=\"text\" readonly=\"readonly\" id=\"rfrncInput\" class=\"rfrnc_input\"/>       ";
		html += "		<div class=\"rfrnc_btn\" id=\"rfrncBtn\"></div>                    ";
		html += "	</div>			                                       ";
		html += "</div>                                                    ";
		
		// 결재라인 지정
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width: 500,
			height: 400,
			title : "결재요청",
			contents : html, 
			contentsEvent : function() {
				
				/* 입력칸 클릭 시 버튼 클릭 */
				$("#aprvlerInput").on("click", function() {
					$("#aprvlerBtn").click();
				});
				
				$("#aprvlerBtn").on("click", function() {
					var html2 = "";
					html2 += "<form action=\"#\" id=\"inqryForm\" method=\"post\">" ;
					html2 += "<input type=\"hidden\" id=\"inqryNo\" name=\"inqryNo\"  />" ;
					html2 += "<div class=\"popup_emp_srch_area\">         ";
					html2 += "<select class=\"emp_srch_select\" id=\"inqryGbn\" name=\"inqryGbn\">          ";
					html2 += "	<option value=\"0\" selected>전체</option>";
					html2 += "	<option value=\"1\">부서명</option>      ";
					html2 += "	<option value=\"2\">사원명</option>      ";
					html2 += "	<option value=\"3\">직급명</option>      ";
					html2 += "</select>                                   ";
					html2 += "<div class=\"popup_srch_input\">	                 ";
					html2 += "	<input type=\"text\" id=\"inqryTxt\" name=\"inqryTxt\"/>                  ";
					html2 += "</div>                                      ";
					html2 += "<div class=\"cmn_btn\" id=\"inqryBtn\">검색</div>           ";
					html2 += "</div>                                      ";
					html2 += "</form>";														
					html2 += "<div class=\"empinqry_area\">        ";
		            html2 += " <table class=\"empinqry_list\">   ";
		            html2 += "   <colgroup>                      ";
		            html2 += "      <col width=\"30\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "   </colgroup>                     ";
		            html2 += "   <thead>                         ";
		            html2 += "      <tr>                         ";
		            html2 += "         <th>선택</th>             ";
		            html2 += "         <th>부서</th>             ";
		            html2 += "         <th>직급</th>             ";
		            html2 += "         <th>사원명</th>           ";
		            html2 += "         <th>사원번호</th>         ";
		            html2 += "      </tr>                        ";
		            html2 += "   </thead>                        ";
		            html2 += "   <tbody id=\"aprvlerInqry_tbody\">   ";
		            html2 += "   </tbody>                        ";
		            html2 += "  </table>                         ";
		            html2 += "</div>                             ";
					//결재권자 선택 팝업
					makePopup({
						depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "결재권자 선택",
						contents : html2, 
						contentsEvent : function() {
							var params = $("#inqryForm").serialize();	
					 		$.ajax({
							      type : "post",
							      url : "apntmListAjax/inqryList",
							      dataType : "json",
							      data : params,
							      success : function(res) {
							    	  console.log(res);
							    	  drawAprvlerInqryList(res.inqryList);
							      }, 
							      error : function(req) {
							         console.log(req.responseText);
							      }
						   });
				   	   	   // 사원조회
					 	   $("#inqryTxt").on("keypress", function(event) { // 엔터 시 클릭이벤트
				 			  if(event.keyCode == 13) {
				 				  $("#inqryBtn").click();
				 				  return false;
				 			  }
					 	   });
					   	   $("#inqryBtn").on("click", function() { 
				   		      console.log("결재권자 선택팝업 버튼클릭!")
						   	   var params = $("#inqryForm").serialize();	
						   	   console.log("inqryGbn  : " + $("#inqryGbn").val())
						 		$.ajax({
								      type : "post",
								      url : "apntmListAjax/inqryList",
								      dataType : "json",
								      data : params,
								      success : function(res) {
								    	  console.log(res);
								    	  drawAprvlerInqryList(res.inqryList);
								      }, 
								      error : function(req) {
								         console.log(req.responseText);
								      }
							   }); 
					   	   });
					   	   // tr 선택시 체크박스 선택처리
					   	   $("#aprvlerInqry_tbody").on("click","tr",function(){
					   		 var checkbox = $(this).find("td:first-child :checkbox");
					   		 
					   	 	 if(checkbox.prop("checked")) {
					   		 	checkbox.prop("checked", false);
					   	 	 } else {
					   	 		checkbox.prop("checked", true);
					   	 	 }
						 });
					   	   
						},
						draggable : true,
						buttons : [{
							name : "확인",
							func:function() { 
							   // 결재권자 체크 된 값 가져오기
						   	   var aprvler_emp_num_arr = [];
						   	   var aprvler_emp_name_arr = [];
						   	   var aprvler_rank_num_arr = [];
						   	   $("input[name=aprvlerChk]:checked").each(function() {
						   		   var empNum = $(this).attr("aprvlerNum");
						   		   var empName = $(this).attr("aprvlerName");
						   		   var rankNum = $(this).attr("aprvlerRankNum");
							   	   aprvler_emp_num_arr.push(empNum);
							   	   aprvler_emp_name_arr.push(empName);
							   	   aprvler_rank_num_arr.push(rankNum);
							   	   aprvler_rank_num_arr.sort(function(a,b){
							   		   return b-a; // 결재순번 rank_num 내림차순 정렬
							   	   }) ; 
							   	  
						   	   });
						   	   console.log("결재권자 체크값 : " + aprvler_emp_num_arr, aprvler_emp_name_arr, aprvler_rank_num_arr)
						   	   $("#aprvlerInput").val(aprvler_emp_name_arr);
						   	   $("#aprvlerList").val(aprvler_emp_num_arr);
						   	   $("#aprvlTurn").val(aprvler_rank_num_arr);
						   	   closePopup(2);
							}
						}, {
							name : "취소"
						}]
					});
					$(".empinqry_area").slimScroll({height: "255px"},{width: "450px"}); // 슬림스크롤
				}); // 결재권자선택버튼 클릭이벤트 끝
				
				// 참조자선택버튼 클릭이벤트
				$("#rfrncInput").on("click", function() {
					$("#rfrncBtn").click();
				});
				$("#rfrncBtn").on("click", function() {
					var html2 = "";
					html2 += "<form action=\"#\" id=\"inqryForm\" method=\"post\">" ;
					html2 += "<input type=\"hidden\" id=\"inqryNo\" name=\"inqryNo\"  />" ;
					html2 += "<div class=\"popup_emp_srch_area\">         ";
					html2 += "<select class=\"emp_srch_select\" id=\"inqryGbn\" name=\"inqryGbn\">          ";
					html2 += "	<option value=\"0\" selected>전체</option>";
					html2 += "	<option value=\"1\">부서명</option>      ";
					html2 += "	<option value=\"2\">사원명</option>      ";
					html2 += "	<option value=\"3\">직급명</option>      ";
					html2 += "</select>                                   ";
					html2 += "<div class=\"popup_srch_input\">	                 ";
					html2 += "	<input type=\"text\" id=\"inqryTxt\" name=\"inqryTxt\"/>                  ";
					html2 += "</div>                                      ";
					html2 += "<div class=\"cmn_btn\" id=\"inqryBtn\">검색</div>           ";
					html2 += "</div>                                      ";
					html2 += "</form>";														
					html2 += "<div class=\"empinqry_area\">        ";
		            html2 += " <table class=\"empinqry_list\">   ";
		            html2 += "   <colgroup>                      ";
		            html2 += "      <col width=\"30\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "      <col width=\"100\"/>         ";
		            html2 += "   </colgroup>                     ";
		            html2 += "   <thead>                         ";
		            html2 += "      <tr>                         ";
		            html2 += "         <th>선택</th>             ";
		            html2 += "         <th>부서</th>             ";
		            html2 += "         <th>직급</th>             ";
		            html2 += "         <th>사원명</th>           ";
		            html2 += "         <th>사원번호</th>         ";
		            html2 += "      </tr>                        ";
		            html2 += "   </thead>                        ";
		            html2 += "   <tbody id=\"aprvlerInqry_tbody\">   ";
		            html2 += "   </tbody>                        ";
		            html2 += "  </table>                         ";
		            html2 += "</div>                             ";
					//참조자 선택 팝업
					makePopup({
						depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "참조인 선택",
						contents : html2, 
						contentsEvent : function() {
							var params = $("#inqryForm").serialize();	
							
					 		$.ajax({
							      type : "post",
							      url : "apntmListAjax/inqryList",
							      dataType : "json",
							      data : params,
							      success : function(res) {
							    	  console.log(res);
							    	  drawAprvlerInqryList(res.inqryList);
							      }, 
							      error : function(req) {
							         console.log(req.responseText);
							      }
						   });
				   	   	   // 사원조회 버튼이벤트
					 	   $("#inqryTxt").on("keypress", function(event) { // 엔터 시 클릭이벤트
				 			  if(event.keyCode == 13) {
				 				  $("#inqryBtn").click();
				 				  return false;
				 			  }
					 	   });
					   	   $("#inqryBtn").on("click", function() { 
				   		      console.log("결재권자 선택팝업 버튼클릭!")
						   	   var params = $("#inqryForm").serialize();	
						   	   console.log("inqryGbn  : " + $("#inqryGbn").val())
						 		$.ajax({
								      type : "post",
								      url : "apntmListAjax/inqryList",
								      dataType : "json",
								      data : params,
								      success : function(res) {
								    	  console.log(res);
								    	  drawAprvlerInqryList(res.inqryList);
								      }, 
								      error : function(req) {
								         console.log(req.responseText);
								      }
							   }); 
					   	   });
					   	   // tr 선택시 체크박스 선택처리
					   	   $("#aprvlerInqry_tbody").on("click","tr",function(){
					   		 var checkbox = $(this).find("td:first-child :checkbox");
					   		 
					   	 	 if(checkbox.prop("checked")) {
					   		 	checkbox.prop("checked", false);
					   	 	 } else {
					   	 		checkbox.prop("checked", true);
					   	 	 }
						 });
					   	   
						},
						draggable : true,
						buttons : [{
							name : "확인",
							func:function() { 
							   // 참조인 체크 된 값 가져오기
						  	   var rfrnc_emp_num_arr = [];
						   	   var rfrnc_emp_name_arr = [];
						   	   $("input[name=aprvlerChk]:checked").each(function() {
						   		   var empNum = $(this).attr("aprvlerNum");
						   		   var empName = $(this).attr("aprvlerName");
						   			rfrnc_emp_num_arr.push(empNum);
						   			rfrnc_emp_name_arr.push(empName);
						   	   });
						   	   console.log("참조인 체크값 : " + rfrnc_emp_num_arr, rfrnc_emp_name_arr)
						   	   $("#rfrncInput").val(rfrnc_emp_name_arr);
						   	   $("#rfrncList").val(rfrnc_emp_num_arr);
						   	   
						   	   closePopup(2);
							}
						}, {
							name : "취소"
						}]
					});
					$(".empinqry_area").slimScroll({height: "255px"},{width: "450px"}); // 슬림스크롤
				}); // 참조인 선택버튼 클릭이벤트 끝
				
			},
			draggable : true,
			buttons : [{
				name : "확인",
				func:function() {	
					$("#title").val($("#aprvlTitle").val());
					$("#cont").val($("#aprvlCont").val());
					$("#aprvlTurn").val($("#aprvlTitle").val());
					
					var params = $("#aprvlForm").serialize();
					console.log("결재폼값" + params)
					
					$.ajax({
					      type : "post",
					      url : "apntmListAjax/aprvl",
					      dataType : "json",
					      data : params,
					      success : function(res) {		
				    	 			 if(res.res=="success"){
							    		 /*   makeAlert("알림", "결재가 요청되었습니다.", function(){
											location.reload();
    	 									console.log(res);
										  }); */
										  $("#aNum").val(res.aNum);
										  console.log("결재번호  : " + $("#aNum").val())
										  
										  var params = $("#aprvlSuccessForm").serialize();
				    						$.ajax({
				    						      type : "post",
				    						      url : "apntmListAjax/aprvlSuccess",
				    						      dataType : "json",
				    						      data : params,
				    						      success : function(res) {		
				    					    	 			 if(res.res=="success"){
				    								    			makeAlert("알림", "결재가 요청되었습니다.", function(){
				    												location.reload();
				    	    	 									console.log(res); 
				    	    	 									
				    											  });
				    					    	 			 }
				    						      },
				    						      error : function(req) {
				    						         		console.log(req.responseText);
				    						      		}
				    	 					 	
				    	  					     
				    						}); 
				    	 			 }
					      },
					      error : function(req) {
					         		console.log(req.responseText);
					      		}
 					 	
  					     
					}); 
				}
			}, {
				name : "취소"
			}]
		});
  		
  	});
  	
  	
  	
});

// 사원조회 리스트 생성
function drawAprvlerInqryList(inqryList) {
	var html = "";
	
    for(var data of inqryList) {
        html += "<tr no=\"" + data.EMP_NUM + "\">"   
        html += " 	<td><input type=\"checkbox\" aprvlerNum=\""+data.EMP_NUM+"\" aprvlerRankNum=\""+data.RANK_NUM+"\" id=\"aprvlerChk\" name=\"aprvlerChk\" aprvlerName=\"" + data.EMP_NAME + "\"/></td> ";
        html += " 	<td>" + data.DEPT_NAME + "</td> ";
        html += " 	<td>" + data.RANK_NAME + "</td> ";
        html += " 	<td>" + data.EMP_NAME + "</td> ";
        html += " 	<td>" + data.EMP_NUM + "</td> ";
        html += " </tr>                       ";
    }
	$("#aprvlerInqry_tbody").html(html);
}

// 사원조회 리스트 생성
function drawInqryList(inqryList) {
	var html = "";
	
    for(var data of inqryList) {
        html += "<tr no=\"" + data.EMP_NUM + "\">"   
        html += " 	<td>" + data.DEPT_NAME + "</td> ";
        html += " 	<td>" + data.RANK_NAME + "</td> ";
        html += " 	<td>" + data.EMP_NAME + "</td> ";
        html += " 	<td>" + data.EMP_NUM + "</td> ";
        html += " </tr>                       ";
    }
	$("#empinqry_tbody").html(html);
}


// 발령 리스트 리로드
function reloadList() {
   var params = $("#actionForm").serialize();
	console.log(params)
   
   $.ajax({
      type : "post",
      url : "apntmListAjax/list",
      data : params,
      dataType : "json",
      success : function(res) {
         drawList(res.list);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
   
}

// 발령 상세정보 리로드
function reloadCont() {
   var params = $("#actionForm").serialize();
   
   $.ajax({
      type : "post",
      url : "apntmListAjax/cont",
      data : params,
      dataType : "json",
      success : function(res) {
         drawCont(res.cont, res.emp);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
   
}

// 발령 리스트 그리기
function drawList(list) {
   var html = "";
   
   for(var data of list) {                                 
      html += "<tr id=\"tbodyTr\" stsNum=\"" + data.STS_NUM + "\" apntmNum=\"" + data.APNTM_NUM + "\"empNum=\"" + data.EMP_NUM + " \">" ;
      html += "<td>" + data.ROWNUM + "</td>"           ;
      if(data.APNTM_DVSN_NUM == 0) {
     	 html += "<td>입사</td>"      ;
      } else if(data.APNTM_DVSN_NUM == 1) {
       		 html += "<td>퇴사</td>"      ;
      } else if(data.APNTM_DVSN_NUM == 2) {
       		 html += "<td>승진</td>"      ;
      } else {
       		 html += "<td>이동</td>"      ;
      }
      html += "<td>" + data.EMP_NAME + "</td>"            ;
      html += "<td>" + data.DEPT_NAME + "</td>"           ;
      html += "<td>" + data.RANK_NAME + "</td>"           ;
      html += "<td>" + data.START_DATE + "</td>"          ;
      if(data.STS_NUM == "0") {
     	 html += "<td>결재진행중</td>"           ;
      } else if(data.STS_NUM == "1") {
     	 html += "<td style=\"color:#4B94F2;\">결재완료</td>"           ;
      } else if(data.STS_NUM == "2") {
     	 html += "<td style=\"color:#ff6f60;\">결재반려</td>"           ;
      } else {
    	  html += "<td> - </td>"           ;
      }
      html += "</tr>"                                     ;
   }
   $("tbody").html(html);
}   

// 발령 상세정보 생성
function drawCont(cont, emp){
   var html = "";
   
   html += "<div class=\"apntm_cont_right_area\">                                                     ";
   html += "   <div class=\"apntm_add_title_area\">                                                   ";
   html += "      <div class=\"apntm_info_title\">발령상세</div>                                      ";
   // STS_NUM 결재요청 전 상태일 경우 결재버튼, 발령취소버튼 생성
   if($("#stsNum").val() == "NULL" || $("#stsNum").val() == "" || $("#stsNum").val() == "undefined"){
   html += "      <input type=\"button\" class=\"apntm_del_btn\" id=\"aprvlDelBtn\" value=\"발령취소\" />                                      ";
   html += "      <input type=\"button\" class=\"apntm_add_btn_2\" id=\"aprvlBtn\" aApntmNum=\""+cont.APNTM_NUM +"\" value=\"결재요청\" />                                      ";
   }
   html += "   </div>                                                                                 ";
   html += "   <div class=\"apnmt_add_area\">                                                         ";
   html += "      <div class=\"apnmt_add_top_area\">                                                 ";
   html += "        <div class=\"apnmt_prfl_img\" id=\"empImg\"><img id=\"emp_pctr_area\" src=\"resources/upload/" + emp.EMP_PCTR_FILE + "\" /></div>";
   html += "         <div class=\"apnmt_prfl_info_wrap\">                                           ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_num\">                                      ";
   html += "                  <div class=\"prfl_info_text\">사원번호</div>                       ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" disabled value=\"" + emp.EMP_NUM + "\" />  ";
  // html += "                  <div class=\"prfl_srch_btn\"></div>                            "; 돋보기버튼 - 나중에 시간나면 사원조회로 이동하게끔 만들기
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_name\">                                     ";
   html += "                  <div class=\"prfl_info_text\">사원명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" disabled value=\"" + emp.EMP_NAME + "\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_dept\">                                         ";
   html += "                  <div class=\"prfl_info_text\">부서</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" disabled value=\"" + emp.DEPT_NAME + "\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_team\">                                         ";
   html += "                  <div class=\"prfl_info_text\">직급</div>                           ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" disabled value=\"" + emp.RANK_NAME + "\" />";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_mid_area\">                                                 ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령번호</div>                           ";
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"" + cont.APNTM_NUM + "\" />                                        ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령구분</div>                         ";
   if(cont.APNTM_DVSN_NUM == 0) {
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"입사\" />                                        ";
   } else if(cont.APNTM_DVSN_NUM == 1) {
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"퇴사\" />                                        ";
   } else if(cont.APNTM_DVSN_NUM == 2) {
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"승진\" />                                        ";
   } else {
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"이동\" />                                        ";
   }
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령부서</div>                           ";
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"" + cont.DEPT_NAME + "\" />                                        ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령직급</div>                         ";
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"" + cont.RANK_NAME + "\" />                                        ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령시작</div>                         ";
   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"" + cont.START_DATE + "\" />                                        ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text_end\">발령종료</div>                      ";
   if(cont.END_DATE == null) {
	   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\" - \" />                                        ";
   } else {
 	   html += "               <input type=\"text\" class=\"apnmt_info_input\" disabled value=\"" + cont.END_DATE + "\" />                                        ";
   }						
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_bottom_area\">                                              ";
   html += "         <div class=\"apnmt_add_cont_wrap\">                                            ";
   html += "            <div class=\"apnmt_add_cont_title\"> - 세부내용 - </div>                   ";
   if(cont.DTL_CONT == null) {
   html += "            <input type=\"text\" class=\"apnmt_add_cont_input\" disabled value=\"\" />                     ";
   } else {
   html += "            <input type=\"text\" class=\"apnmt_add_cont_input\" disabled value=\"" + cont.DTL_CONT + "\" />                     ";
   }
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "   </div>                                                                                 ";
   html += "</div>                                                                                    ";
   $("#apntm_cont").html(html);
}

function reloadAddApntm(){
	 $.ajax({
	      type : "post",
	      url : "apntmListAjax/addApntm",
	      dataType : "json",
	      success : function(res) {
	    	  drawAddApntm(res.dept, res.rank);
	      },
	      error : function(req) {
	         console.log(req.responseText);
	      }
	   });
}

// 발령 등록 생성
function drawAddApntm(dept,rank){
	console.log(dept,rank)
   var html = "";
   
   html += "<form action=\"#\" id=\"addApntmForm\" method=\"post\">" ;
   html += "<input type=\"hidden\" id=\"aprvlCont\" name=\"aprvlCont\"  />";
   html += "<input type=\"hidden\" id=\"sEmpNum\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
   html += "<div class=\"apntm_cont_right_area\">                                                     ";
   html += "   <div class=\"apntm_add_title_area\">                                                   ";
   html += "      <div class=\"apntm_add_title\">신규발령</div>                                      ";
   html += "      <input type=\"button\" class=\"apntm_add_btn_2\" id=\"addApntmBtn\" value=\"등록\" />                                      ";
   html += "   </div>                                                                                 ";
   html += "   <div class=\"apnmt_add_area\">                                                         ";
   html += "      <div class=\"apnmt_add_top_area\">                                                 ";
   html += "         <div class=\"apnmt_prfl_img\" id=\"empImg\"><img id=\"emp_pctr_area\" /></div>                                           ";
   html += "         <div class=\"apnmt_prfl_info_wrap\">                                           ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_num\">                                      ";
   html += "                  <div class=\"prfl_info_text\">사원번호</div>                       ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" readonly=\"readonly\" name=\"addEmpNum\" id=\"addEmpNum\" value=\"\" />  ";
   html += "                  <div class=\"prfl_srch_btn\" id=\"prfl_srch_btn\"></div>                                ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_name\">                                     ";
   html += "                  <div class=\"prfl_info_text\">사원명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\"  readonly=\"readonly\" id=\"empName\" value=\"\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_dept\">                                         ";
   html += "                  <div class=\"prfl_info_text\">부서</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\"  readonly=\"readonly\" id=\"deptName\"value=\"\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_team\">                                         ";
   html += "                  <div class=\"prfl_info_text\">직급</div>                           ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\"  readonly=\"readonly\" id=\"rankName\"value=\"\" />";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_mid_area\">                                                 ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_add_info_text\">발령구분</div>                         ";
   html += "               <select class=\"apnmt_select\" id=\"addDvsnNum\" name=\"addDvsnNum\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option value=\"0\" cont=\"입사\">입사</option>                                              ";
   html += "                  <option value=\"1\" cont=\"퇴사\">퇴사</option>                                              ";
   html += "                  <option value=\"2\" cont=\"승진\">승진</option>                                              ";
   html += "                  <option value=\"3\" cont=\"이동\">이동</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                    ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_add_info_text\">발령부서</div>                           ";
   html += "               <select class=\"apnmt_select\"  id=\"addDeptNum\" name=\"addDeptNum\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   for(var data of dept){
   html += "                  <option value=\"" + data.DEPT_NUM + "\">" + data.DEPT_NAME  + "</option>  ";
   }
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_add_info_text\">발령직급</div>                         ";
   html += "               <select class=\"apnmt_select\" id=\"addRankNum\" name=\"addRankNum\" >                                        ";
   html += "                  <option selected>선택</option>                                     ";
   for(var data of rank){
   html += "                  <option value=\"" + data.RANK_NUM + "\">" + data.RANK_NAME + "</option>";                                          
   }
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_add_info_text\">발령시작</div>                         ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"apntm_date_input\" id=\"addStart\" name=\"addStart\"/>         ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text_end\">발령종료</div>                      ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"apntm_date_input\" id=\"addEnd\" name=\"addEnd\"/>           ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_bottom_area\">                                              ";
   html += "         <div class=\"apnmt_add_cont_wrap\">                                            ";
   html += "            <div class=\"apnmt_add_cont_title\"> - 세부내용 - </div>                   ";
   html += "            <input type=\"text\" class=\"apnmt_add_cont_input\" name=\"addCont\" />                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "   </div>                                                                                 ";
   html += "</div>                                                                                    ";
   html += "</form>";	
   $("#apntm_cont").html(html);
}
</script>
</head>
<body>
	<!-- 발령결재 성공시 결재진행중 상태로 변경하는 폼 -->
	<form action="#" id="aprvlSuccessForm" method="post">
		<input type="hidden" id="aNum" name="aNum" />
		<input type="hidden" id="aApntmNum" name="aApntmNum" />
	</form>
	<!-- 결재 데이터 넘기는 폼 -->
	<form action="#" id="aprvlForm" method="post">
		<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}" />
		<input type="hidden" id="title" name="title" />
		<input type="hidden" id="cont" name="cont" />
		<input type="hidden" id="aprvlerList" name="aprvlerList" />
		<input type="hidden" id="rfrncList" name="rfrncList" />
		<input type="hidden" id="att" name="att" />
		<input type="hidden" id="aprvlTurn" name="aprvlTurn" />
	</form>
	<!-- <input type="hidden" id="sEmpNum" value="${sEmpNum}" /> -->
	<input type="hidden" id="oldInqryGbn" value="${param.inqryGbn}" />
	<input type="hidden" id="oldInqryTxt" value="${param.inqryTxt}" />
	<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
	<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="searchAprvl" value="${param.searchAprvl}" />
	<input type="hidden" id="startPrd" value="${param.startPrd}" />
	<input type="hidden" id="endPrd" value="${param.endPrd}" />
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar_custom">
			<div class="page_title_text">인사발령</div>
		</div>
		<div class="apntm_add_btn_area">
			<input type="button" class="apntm_add_btn" id="apntm_add_btn"
				value="발령추가" />
		</div>
		<form action="#" id="delForm" method="post">
			<input type="hidden" id="delApntmNum" name="delApntmNum">
		</form>
		<!--------------------- 발령 조회 Form ------------------------->
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="top" value="${param.top}"> 
			<input type="hidden" name="menuNum" value="${param.menuNum}"> 
			<input type="hidden" name="menuType" value="${param.menuType}"> 
			<input type="hidden" id="apntmNum" name="apntmNum" />
			<input type="hidden" id="empNum" name="empNum" />
			<input type="hidden" id="stsNum" name="stsNum" />
			<div class="srch_wrap">
				<div class="srch_top_area">
					<select class="srch_select" id="searchGbn" name="searchGbn">
						<option selected value="0">전체</option>
						<!--  <option value="1">발령구분</option>  -->
						<option value="2">사원명</option>
						<option value="3">발령부서</option>
						<option value="4">발령직급</option>
					</select>
					<div class="srch_input">
						<input type="text" name="searchTxt" id="searchTxt"
							value="${param.searchTxt}" />
					</div>
					<div class="cmn_btn" id="searchBtn">검색</div>
				</div>
				<div class="srch_bottom_area">
					<div class="aprvl_radio_wrap">
						<div class="aprvl_radio_title">결재상태</div>
						<div class="aprvl_radio_area" id="searchAprvl" name="searchAprvl">
							<input type="radio" name="aprvl" id="aprvl_entr" value="0"
								checked="checked" /><label for="aprvl_entr">전체</label> <input
								type="radio" name="aprvl" id="aprvl" value="1" /><label
								for="aprvl">완료</label> <input type="radio" name="aprvl"
								id="aprvl_rjct" value="2" /><label for="aprvl_rjct">반려</label>
							<input type="radio" name="aprvl" id="aprvl_cnsdr" value="3" /><label
								for="aprvl_cnsdr">진행중</label>
						</div>
					</div>
					<div class="srch_prd_wrap">
						<div class="prd_radio_title">발령시작일</div>
						<div class="prd_radio_area">
							<input type="radio" name="prd" class="prd_value" id="prd_entr"
								value="0" checked="checked" /><label for="prd_entr">전체</label> <input
								type="radio" name="prd" class="prd_value" id="prd" value="1" /><label
								for="prd">기간설정</label>
						</div>
						<div class="prd_wrap">
							<div class="prd_text_wrap">
								<input type="date" class="prd_text" id="prd_start"
									name="startPrd" disabled value="${param.startPrd}" />
							</div>
							<div class="prd_clsftn">~</div>
							<div class="prd_text_wrap">
								<input type="date" class="prd_text" id="prd_end" name="endPrd"
									disabled value="${param.endPrd}" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--------------------- 발령 리스트 ------------------------->
		<div class="apntm_cont_left_area">
			<div class="apntm_list_title">발령목록</div>
			<div class="apntm_list_area">
				<table class="apntm_list">
					<colgroup>
						<col width="80" />
						<col width="100" />
						<col width="100" />
						<col width="150" />
						<col width="100" />
						<col width="150" />
						<col width="200" />
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>발령구분</th>
							<th>사원명</th>
							<th>발령부서</th>
							<th>발령직급</th>
							<th>발령시작일</th>
							<th>결재현황</th>
						</tr>
					</thead>
					<tbody id="apntm_tbody"></tbody>
				</table>
			</div>
		</div>
		<div id="apntm_cont"></div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>