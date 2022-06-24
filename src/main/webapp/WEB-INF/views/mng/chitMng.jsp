<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 매입전표/매출전표</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}


/* 개인 작업 영역 */
.srch_month {
	height: 27px;
}

.srch_month:focus {
	outline: 2px solid #F2CB05; 
}

.board_table thead tr:nth-child(2) {
	border-top: 1px solid #d7d7d7;
}

.board_table thead td {
	border: 1px solid #d7d7d7;
	text-align: center;
	font-weight: bold;
	background-color: #F2F2F2;
	height: 40px;
	font-size: 11pt;
}

.board_table tbody td {
	color: black;
}

.chit_admnstrtn_total_table {
	border-collapse: collapse;
	font-size: 10.5pt;
}

.chit_admnstrtn_total_table td {
	height: 50px;
	border: 1px solid #DDDDDD;
	padding-left: 10px;
	text-align: center;
}

.board_bottom {
	margin-bottom: 15px;
}

.chit_admnstrtn_total_table td:nth-child(1) {
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

/* 결재요청 팝업 css */
.aprvl_rqst_wrap {
	text-align: right;
	margin-top: 20px;
}

.aprvl_check_wrap {
	display: inline-block;
	vertical-align: top;
	font-size: 10.5pt;
	margin-right: 10px;
	font-weight: bold;
	text-align: center;
	background-color: #F2F2F2;
}

.aprvl_check_sts {
	display: inline-block;
	vertical-align: top;
	width: 80px;
}

.aprvl_check_res {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 30px;
		
}

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
    resize: none;
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

.popup_emp_srch_area {
	display: inline-block;
	vertical-align: top;
	width: 567px;
	height: 31px;
	text-align: center;
	margin: 10px 10px;
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
	margin: 0 12px;
	display: inline-block;
	vertical-align: top;
	height: 240px;
	/* width: 545px;*/
	/* border: solid 1px #d7d7d7;*/
	/* overflow: hidden; */
}

.empinqry_list {
	display: inline-table;
	border-collapse: collapse;
	width: 553px;
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



</style>
<script type="text/javascript">
$(document).ready(function() {
	
	
	
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
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
	
	reloadList();
	$("#aprvlRqst").css('display', 'none');
	$("#aprvlAgainRqst").css('display', 'none');
	
	$("#pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	
	$("#srchMonth").on("change", function() {
		$("#page").val("1");
		$("#mon").val($("#srchMonth").val());
		$("#aprvlMon").val($("#srchMonth").val());
		reloadList();
	});
	
	/* 결재요청 */
	$("#aprvlRqst").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"aprvl_popup_area\">                          ";
		html += "	<div class=\"aprvl_title_wrap\">                       ";
		html += "		<div class=\"aprvl_title_txt\">제목</div>          ";
		html += "		<input type=\"text\" class=\"aprvl_title_input\" id=\"aprvlTitle\" name=\"aprvlTitle\"/> ";
		html += "	</div>			                                       ";
		html += "	<div class=\"aprvl_cont_wrap\">                        ";
		html += "		<div class=\"aprvl_cont_txt\">내용</div>           ";
		html += "		<textarea class=\"aprvl_cont_input\"id=\"aprvlCont\" name=\"aprvlCont\"/>  ";
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
		html += "</div>";  
		
		/* 결재요청 팝업 시작 */
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width: 500,
			height: 400,
			title : "결재요청",
			contents : html,
			draggable : true,
			contentsEvent : function() {
				
				/* 입력칸 클릭 시 버튼 클릭 */
				$("#aprvlerInput").on("click", function() {
					$("#aprvlerBtn").click();
				});
				$("#rfrncInput").on("click", function() {
					$("#rfrncBtn").click();
				});
				
				/* 결재권자 검색 버튼 클릭 */
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
		            
		            /* 결재권자 팝업 시작 */
		            makePopup({
		            	depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "결재권자 선택",
						contents : html2, 
						draggable : true,
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
							
							// 사원 검색 엔터 처리
						 	$("#inqryTxt").on("keypress", function(event) {
					 			if(event.keyCode == 13) {
					 				$("#inqryBtn").click();
					 				return false;
					 			}
						 	});
							
							// 검색 버튼 클릭 이벤트
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
						   	 $("#aprvlerInqry_tbody").on("click", "tr", function() {
						   		 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
						   	 });
							 
							 $("#aprvlerChk").on("click", function() {
								 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
							 });
						},
						buttons : [{
							name : "확인",
							func:function() { 
							    // 결재권자 체크된 값 가져오기
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
		            }); /* 결재권자 팝업 끝 */
		            
		            $(".empinqry_area").slimScroll({height: "240px"},{width: "450px"}); // 슬림스크롤
		            
		            
				}); /* 결재권자 검색 버튼 클릭 이벤트 끝 */
				
				/* 참조자 검색 버튼 클릭 이벤트 */
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
		            
		            // 참조자 선택 팝업
					makePopup({
						depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "참조인 선택",
						contents : html2,
						draggable : true,
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
							
							 /* 엔터 시 클릭이벤트 */
							$("#inqryTxt").on("keypress", function(event) {
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
						   	 $("#aprvlerInqry_tbody").on("click", "tr", function() {
						   		 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
						   	 });
							
							// 체크박스 클릭 처리
						   	$("#aprvlerChk").on("click", function() {
								 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
							 });
						},
						buttons : [{
							name : "확인",
							func: function() {
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
					}); /* 참조자 선택 팝업 끝 */
					
					$(".empinqry_area").slimScroll({height: "240px"},{width: "450px"}); // 슬림스크롤
					
				}); /* 참조자 검색 버튼 클릭 이벤트 끝 */
			},
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
					      url : "aprvlRqstAjax/rqst",
					      dataType : "json",
					      data : params,
					      success : function(res) {
			    	 		  if(res.res=="success") {
								  $("#aprvlNum").val(res.aprvlNum);
								  console.log("결재번호  : " + $("#aprvlNum").val())
									  
								  var params = $("#aprvlSuccessForm").serialize();
			    				  $.ajax({
			    					  type : "post",
			    					  url : "aprvlRqstAjax/aprvlOk",
			    				      dataType : "json",
			    					  data : params,
			    					  success : function(res) {
			    					      if(res.res=="success") {
			    							  makeAlert("알림", "결재가 요청되었습니다.", function() {
			    							      location.reload();
			    	    	 				      console.table(res); 
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
			}] /* 팝업 버튼 끝 */
		}); /* 결재요청 팝업 끝 */
		
	}); /* 결재요청 버튼 끝 */
	
	/* 결재 재요청 버튼 */
	$("#aprvlAgainRqst").on("click", function() {
		var html = "";
		
		html += "<div class=\"aprvl_popup_area\">                          ";
		html += "	<div class=\"aprvl_title_wrap\">                       ";
		html += "		<div class=\"aprvl_title_txt\">제목</div>          ";
		html += "		<input type=\"text\" class=\"aprvl_title_input\" id=\"aprvlTitle\" name=\"aprvlTitle\"/> ";
		html += "	</div>			                                       ";
		html += "	<div class=\"aprvl_cont_wrap\">                        ";
		html += "		<div class=\"aprvl_cont_txt\">내용</div>           ";
		html += "		<textarea class=\"aprvl_cont_input\"id=\"aprvlCont\" name=\"aprvlCont\"/>  ";
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
		html += "</div>";  
		
		/* 결재 재요청 팝업 시작 */
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width: 500,
			height: 400,
			title : "결재 재요청",
			contents : html,
			draggable : true,
			contentsEvent : function() {
				
				/* 입력칸 클릭 시 버튼 클릭 */
				$("#aprvlerInput").on("click", function() {
					$("#aprvlerBtn").click();
				});
				$("#rfrncInput").on("click", function() {
					$("#rfrncBtn").click();
				});
				
				/* 결재권자 검색 버튼 클릭 */
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
		            
		            /* 결재권자 팝업 시작 */
		            makePopup({
		            	depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "결재권자 선택",
						contents : html2, 
						draggable : true,
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
							
							// 사원 검색 엔터 처리
						 	$("#inqryTxt").on("keypress", function(event) {
					 			if(event.keyCode == 13) {
					 				$("#inqryBtn").click();
					 				return false;
					 			}
						 	});
							
							// 검색 버튼 클릭 이벤트
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
						   	 $("#aprvlerInqry_tbody").on("click", "tr", function() {
						   		 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
						   	 });
							 
							 // 체크박스 클릭 처리
						   	 $("#aprvlerChk").on("click", function() {
								 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
							 });
							 
						},
						buttons : [{
							name : "확인",
							func:function() { 
							    // 결재권자 체크된 값 가져오기
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
		            }); /* 결재권자 팝업 끝 */
		            
		            $(".empinqry_area").slimScroll({height: "240px"},{width: "450px"}); // 슬림스크롤
		            
		            
				}); /* 결재권자 검색 버튼 클릭 이벤트 끝 */
				
				/* 참조자 검색 버튼 클릭 이벤트 */
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
		            
		            // 참조자 선택 팝업
					makePopup({
						depth : 2,
						bg : false,
						bgClose : false,
						width: 600,
						height: 400,
						title : "참조인 선택",
						contents : html2,
						draggable : true,
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
							
							 /* 엔터 시 클릭이벤트 */
							$("#inqryTxt").on("keypress", function(event) {
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
						   	 $("#aprvlerInqry_tbody").on("click", "tr", function() {
						   		 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
						   	 });
							
						 	 // 체크박스 클릭 처리
						   	 $("#aprvlerChk").on("click", function() {
								 var checkbox = $(this).find("td:first-child :checkbox");
						   		 
						   	 	 if(checkbox.prop("checked")) {
						   		 	checkbox.prop("checked", false);
						   	 	 } else {
						   	 		checkbox.prop("checked", true);
						   	 	 }
							 });
							
						},
						buttons : [{
							name : "확인",
							func: function() {
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
					}); /* 참조자 선택 팝업 끝 */
					
					$(".empinqry_area").slimScroll({height: "240px"},{width: "450px"}); // 슬림스크롤
					
				}); /* 참조자 검색 버튼 클릭 이벤트 끝 */
			},
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
					      url : "aprvlRqstAjax/rqst",
					      dataType : "json",
					      data : params,
					      success : function(res) {
			    	 		  if(res.res=="success") {
								  $("#aprvlNum").val(res.aprvlNum);
								  console.log("결재번호  : " + $("#aprvlNum").val())
									  
								  var params = $("#aprvlSuccessForm").serialize();
			    				  $.ajax({
			    					  type : "post",
			    					  url : "aprvlRqstAjax/aprvlAgainOk",
			    				      dataType : "json",
			    					  data : params,
			    					  success : function(res) {
			    					      if(res.res=="success") {
			    							  makeAlert("알림", "결재가 재요청되었습니다.", function() {
			    							      location.reload();
			    	    	 				      console.table(res); 
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
			}] /* 팝업 버튼 끝 */
		}); /* 결재요청 팝업 끝 */
		
	});
	
	$("#listTbody").on("click", "#chitNum", function() {
		$("#sendChitNum").val($(this).attr("chitnum"));
		
		$("#actionForm").attr("action", "chitNumCheck");
		$("#actionForm").submit();
	});
	
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	console.log("achtionForm을 serialize :" + params);
	
	$.ajax({
		type : "post",
		url : "chitMngAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log("res :" + res);
			
			drawList(res.list);
			drawPaging(res.pb);
			drawSum(res.data);
			drawAprvlSts(res.aprvlSts, res.list);
			
			var today = new Date();
			var todayMonth = today.getFullYear() + "-" + lpad((today.getMonth() + 1), 2, 0);
			
			if(todayMonth < res.monCheck) {
				$("#aprvlRqst").css('display', 'none');
				$("#aprvlAgainRqst").css('display', 'none');
			}
			
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

// 전표 목록 그리기
function drawList(list) {
	var html = "";
	
	console.log(list);
	
	for(data of list) {
		html += "<tr>";
		html += "<td class=\"board_table_hover\" id=\"chitNum\" chitnum=\"" + data.CHIT_NUM + "\">" + data.CHIT_NUM + "</td>";
		
		if(data.DEVIT_AMNT != null) {
			html += "<td>" + data.DEVIT_AMNT + " 원</td>";			
		} else {
			html += "<td>-</td>";			
		}
		
		if(data.CREDIT_AMNT != null) {
			html += "<td>" + data.CREDIT_AMNT + " 원</td>";			
		} else {
			html += "<td>-</td>";						
		}
		
		html += "<td>" + data.ACNT_NAME + "</td>";
		if(data.RMRKS != null) {
			html += "<td>" + data.RMRKS + "</td>";			
		} else {
			html += "<td>-</td>";
		}
		html += "</tr>";
	}
	
	$("#listTbody").html(html);
	
}


// 페이징 버튼 그리기
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

// 합계 데이터 그리기
function drawSum(data) {
	var html = "";
	
	html += "<tr>";
	html += "<td>차변 합계</td>";
	if(data != null && data.DEVIT_SUM != null) {
		html += "<td>" + data.DEVIT_SUM + " 원</td>";		
	} else {
		html += "<td>0원</td>";
	}
	html += "</tr>";
	html += "<tr>";
	html += "<td>대변 합계</td>";
	if(data != null && data.CREDIT_SUM != null) {
		html += "<td>" + data.CREDIT_SUM + " 원</td>";
	} else {
		html += "<td>0원</td>";
	}
	html += "</tr>";
	
	$("#totalTbody").html(html);
}

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

// 결재 현황 조회
function drawAprvlSts(aprvlSts, list) {
	
	
	var html = "";
	html += "<div class=\"aprvl_check_sts\">결재 현황 :</div>"; 
	console.log("list : " + list);
	
	if(list != "") {

		if(aprvlSts == null) {
			html += "<div class=\"aprvl_check_res\">-</div>"
			$("#aprvlRqst").css('display', 'inline-block');
			$("#aprvlAgainRqst").css('display', 'none');
			
		} else if(aprvlSts.APRVL_STS == 0) { /* 결재 진행중 */
			html += "<div class=\"aprvl_check_res\">결재 진행중</div>";
			$("#aprvlRqst").css('display', 'none');
			$("#aprvlAgainRqst").css('display', 'none');
		} else if(aprvlSts.APRVL_STS == 1) { /* 결재 완료 */
			html += "<div class=\"aprvl_check_res\" style=\"color:#2E83F2;\">결재 완료</div>";
			$("#aprvlRqst").css('display', 'none');
			$("#aprvlAgainRqst").css('display', 'none');
		} else { /* 결재 반려 */
			html += "<div class=\"aprvl_check_res\" style=\"color:#ff6f60;\">결재 반려</div>";
			$("#aprvlRqst").css('display', 'none');
			$("#aprvlAgainRqst").css('display', 'inline-block');
		}
		
	} else {
		html += "<div class=\"aprvl_check_res\">-</div>"
		$("#aprvlRqst").css('display', 'none');
		$("#aprvlAgainRqst").css('display', 'none');
	}
	
		
	$("#aprvlCheck").html(html);
	

}

</script>
</head>
<body>
	
	<!-- 결재 요청 성공시 결재진행중 상태로 변경 -->
	<form action="#" id="aprvlSuccessForm" method="post">
		<input type="hidden" id="aprvlNum" name="aprvlNum" />
		<input type="hidden" id="aprvlMon" name="mon" value="${mon}"/>
		<input type="hidden" id="emp_num" name="empNum" value="${sEmpNum}" />
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
	
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${mon}">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="sendChitNum" name="sendChitNum">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">매입전표 / 매출전표</div>
			<div class="page_srch_area">
				<div class="aprvl_check_wrap" id="aprvlCheck"></div>
				<input type="month" class="srch_month" id="srchMonth" value="${mon}"/>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="300">
				</colgroup>
				<thead>
					<tr>
						<td rowspan="2">전표번호</td>
						<td colspan="2">금액</td>
						<td rowspan="2">계정명</td>
						<td rowspan="2">비고</td>
					</tr>
					<tr>
						<td>차변</td>
						<td>대변</td>
					</tr>
				</thead>
				<tbody id="listTbody">
				</tbody>
			</table>

			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area">
				</div>
			</div>

			<div>
				<table class="chit_admnstrtn_total_table">
					<colgroup>
						<col width="200">
						<col width="700">
					</colgroup>
					<tbody id="totalTbody">
					</tbody>
				</table>
				<div class="aprvl_rqst_wrap">
					<div class="cmn_btn" id="aprvlRqst">결재요청</div>
					<div class="cmn_btn" id="aprvlAgainRqst">결재 재요청</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>