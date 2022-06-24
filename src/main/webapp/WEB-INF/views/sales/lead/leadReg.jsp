<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- 리드 리스트 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/lead/leadReg.css" />

<!-- popup css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/common_sales.css?version=${version}" />

<!-- 리드 팝업 css -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/lead/leadPopup.css" />

<!-- popup javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	//목록 버튼 클릭시 
	$("#listBtn").on("click", function() {
		// 내용이 입력되어있으면 팝업창 띄움
		if($("#leadName").val() != "" || $("#clntName").val() != ""  || 
		   $("#ccName").val() != "" || $("#mngEmp").val() != "" || $("#psblCheck").val() != "") {
			
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : popContTwoLine("내용이 저장되지 않았습니다.<br/>페이지를 나가시겠습니까?"),
				contentsEvent : function() {
					
				},
				buttons : [{
				name : "확인",
				func:function() {
					$("#listForm").submit();
					console.log("One!");
					}
				}, {
					name : "취소"
				}]			
			});
		} else {
			$("#listForm").submit();
		}
	});	
	
	// 첨부파일 +버튼
	$(".plus_btn").on("click", function() {
		$("#att").click();
	});

	// 가능여부 숫자 100 넘어가면 초기화 
	$("#psblCheck").on("change", function() {
		if($(this).val() * 1 > 100) {
			$(this).val("");
			a.style.display = "block";
		} else {
			a.style.display = "";
		}
	});
	
	// 저장버튼
	$("#writeBtn").on("click", function() {
		if(checkEmpty("#leadName")) {
			makeAlert("필수 정보 알림", popContOneLine("리드명을 입력하세요."), function() {
				$("#leadName").focus();				
			});
		} else if(checkEmpty("#clntName")) {
			makeAlert("필수 정보 알림", popContOneLine("고객명을 입력하세요."), function() {
				$("#clntName").focus();				
			});
		} else if(checkEmpty("#ccName")) {
			makeAlert("필수 정보 알림", popContOneLine("고객사명을 입력하세요."), function() {
				$("#ccName").focus();				
			});
		} else if(checkEmpty("#mngEmp")) {
			makeAlert("필수 정보 알림", popContOneLine("담당자를 입력하세요."), function() {
				$("#mngEmp").focus();				
			})
		} else if(checkEmpty("#psblCheck")) {	
			makeAlert("필수 정보 알림", popContOneLine("가능여부를 입력하세요."), function() {
				$("#psblCheck").focus();									
			});
		} else {	
			
			makePopup({
				depth : 1,
				bg : false,
				bgClose : false,
				title : "알림",
				width : 400,
				height : 200,
				contents : popContOneLine("저장하시겠습니까?"),
				buttons : [{
					name : "확인",
					func:function() {
						
						makePopup({
							depth : 2,
							bg : true,
							bgClose : false,
							title : "알림",
							contents : popContOneLine("저장되었습니다."),
							width : 400,
							height : 180,
							buttons : {
								name : "확인",
								func:function() {
									var writeForm = $("#writeForm");
									
									writeForm.ajaxForm({
										success : function(res) {
											// 물리파일명 보관
											if(res.fileName.length > 0) {
												$("#attFile").val(res.fileName[0]);										
											}
											// 글 저장
											var params = $("#writeForm").serialize();
									
											$.ajax({
												type : "post", 
												url : "leadAction/insert", 
												dataType : "json", 
												data : params, 
												success : function(res) { 
													if(res.res == "success") {
														$("#listForm").submit();
													} else {
														makeAlert("알림", popContOneLine("작성중 문제가 발생하였습니다."));
													}
												},
												error : function(request, status, error) {
													console.log(request.responseText);
												}
											}); //ajax end	
										},
										error : function(req) {
											console.log(req.responseText);
										}
									});	
									writeForm.submit(); // ajaxForm 실행							
								} // 확인 func end
							} // buttons1 end
						}) // popup end
					console.log("One!");
					closePopup();
					} // 저장 func end
				}, {
					name : "취소"
				}] 
			}); // makePopup end		
		} 
	}); 
	// 고객 조회 팝업
	$("#clntIcon").on("click", function() {
		var html = "";
		
		html += "<div class=\"popup_title_mid\" id=\"ecS\">"; 
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html += 	"<div class=\"popup_box\" id=\"ecBox\"></div>";
		html += 	"<div class=\"board_bottom2\">";
		html +=			"<div class=\"pgn_area\" id=\"ecpb\"></div>";
		html +=		"</div>";
		html +=	"</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			bgClose : false,
			title : "고객 조회",
			contents : html,
			width : 600,
			height : 500,
			contentsEvent : function() {
				ecSearchBox();
				ecList();
				
				$("#ecBox").on("click", ".popup_box_in", function() {
					var ecnm = $(this).children("#ecnm").val();
					var ecn = $(this).children("#ecn").val();
					var cnn = $(this).children("#cnn").val();
					var ccn = $(this).children("#ccn").val();
					var ccgNum = $(this).children("#ccgNum").val();	
					var mnge = $(this).children("#mnge").val();
					var mgee = $(this).children("#mgee").val();
					
					document.getElementById("clntName").value = ecnm;
					document.getElementById("clntNum").value = ecn;			
					document.getElementById("ccName").value = cnn;
					document.getElementById("ccNum").value = ccn;
					document.getElementById("ccGrade").value = ccgNum;
					document.getElementById("mngEmp").value = mnge;
					document.getElementById("mngNum").value = mgee;
					
					closePopup();					
				});
				
				//페이징
				$("#ecpb").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					
					ecList();
				});
				
				// 검색버튼
				$("#ecBtn").on("click", function () {
					$("#page").val("1");
					
					ecList();
				});
				
				$("#ecSearchTxt").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#page").val("1");
						
						ecList();
						return false;
					}
				});	
			},
			buttons : [{
				name : "고객 추가",
				func:function() {
					ecAddPopup();
				}
			},	{
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}]
		});			
	});
});
/* ******************************************* 고객 추가 팝업 ******************************************* */
function ecAddPopup() {
	var html = "";
	
	html += "<div class=\"popup_cont pc_back\">";
	html += "<form action=\"#\" id=\"ccAddForm\" method=\"post\">";
	html += 	"<div class=\"popup_table\">";
	html += 		"<div class=\"btn2\">고객 *</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"clntName\" name=\"clntName\" /></div>";
	html += 		"<div class=\"btn2\">고객사 *</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"clntCmpnyName\" name=\"clntCmpnyName\" />";
	html +=				"<input type=\"hidden\" id=\"ccNumber\" name=\"ccNumber\" />";
	html += 			"<span class=\"imgPos2\"><img class=\"btnImg2\" id =\"ccImg\" alt=\"돋보기\" src=\"resources/images/sales/mg.png\" /></span>";		
	html += 		"</div>";
	html += 		"<div class=\"btn2\">부서</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"dept\" name=\"dept\" /></div>";
	html += 		"<div class=\"btn2\">직책</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"duty\" name=\"duty\" /></div>";							
	html += 		"<div class=\"btn2\">휴대폰 번호*</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"mbl\" name=\"mbl\" /></div>";															
	html += 		"<div class=\"btn2\">메일</div>";
	html += 		"<div class=\"txt2\"><input type=\"text\" class=\"txt3\" id=\"email\" name=\"email\" /></div>";							
	html += 		"<div class=\"btn2\">담당자 *</div>";
	html += 		"<div class=\"txt2\">";
	html += 			"<input type=\"text\" class=\"txt3\" id=\"mngName\" name=\"mngName\" />";
	html +=				"<input type=\"hidden\" id=\"mngNumber\" name=\"mngNumber\" />";
	html += 			"<span class=\"imgPos2\"><img class=\"btnImg2\" id=\"userImg\" alt=\"담당자\" src=\"resources/images/sales/usericon.png\" /></span>";
	html += 		"</div>";
	html += 	"</div>";
	html += "</form>";
	html += "</div>";
	
	makePopup({
		depth : 2,
		bg : false,
		bgClose : false,
		title : "고객 등록",
		draggable : true,
		contents : html,
		contentsEvent : function() {
			
			$("#ccImg").on("click", function() {
				var html = "";
				
				html += "<div class=\"popup_title_mid\" id=\"ccS\">"; 
				html += "</div>";
				html += "<div class=\"popup_cont pc_back\">";
				html +=		"<div class=\"popup_box\" id=\"ccBox\"></div>";
				html += 	"<div class=\"board_bottom2\">";
				html +=			"<div class=\"pgn_area\" id=\"ccpb\"></div>";
				html +=		"</div>"; 
				html += "</div>";
				
				makePopup({
					depth : 3,
					bg : true,
					bgClose : false,
					title : "고객사 조회",
					draggable : true,
					contents : html,
					contentsEvent : function() {
						ccSearchBox();
						ccList();
						
						$("#ccBox").on("click", ".popup_box_in", function() {
							var cnn = $(this).children("#cnn").val();
							var ccn = $(this).children("#ccn").val();
							document.getElementById("clntCmpnyName").value = cnn;
							document.getElementById("ccNumber").value = ccn;

							closePopup(3);
						});
						
						//페이징 
						$("#ccpb").on("click", "div", function() {
							$("#page").val($(this).attr("page"));
							
							ccList();
						});
						
						// 검색버튼
						$("#ccBtn").on("click", function () {
							$("#page").val("1");
							
							ccList();
							
						});
						
						$("#ccSearchTxt").on("keypress", function(event) {
							if(event.keyCode == 13 ) {
								$("#page").val("1");
								
								ccList();
								return false;
							}
						});	
					}, 
					width : 600,
					height : 500,
					buttons : {
						name : "닫기",
						func:function() {
							console.log("Three!");
							closePopup(3);
						}
					}
				});	// 고객사 조회 makePopup end
			}); // ccIcon click function end
			
			$("#userImg").on("click", function() {
				var html = "";
				
				html += "<div class=\"popup_title_mid\" id=\"mngrS\">"; 
				html += "</div>";
				html += "<div class=\"popup_cont pc_back\">";
				html +=		"<div class=\"popup_box\" id=\"mngrBox\"></div>";
				html += 	"<div class=\"board_bottom2\">";
				html +=			"<div class=\"pgn_area\" id=\"mngrpb\"></div>";
				html +=		"</div>";
				html += "</div>";
				
				makePopup({
					depth : 3,
					bg : true,
					bgClose : false,
					title : "담당자 조회",
					draggable : true,
					contents : html,
					contentsEvent : function() {
						mngrSearchBox();
						mngrList();
						
						$("#mngrBox").on("click", ".popup_box_in", function() {
							var mng = $(this).children("#mng").val();
							var mge = $(this).children("#mge").val();
							document.getElementById("mngName").value = mng;
							document.getElementById("mngNumber").value = mge;
							closePopup(3);
						});
						
						//페이징 
						$("#mngrpb").on("click", "div", function() {
							$("#page").val($(this).attr("page"));
							
							mngrList();
						});
						// 검색버튼
						$("#mngrBtn").on("click", function () {
							$("#page").val("1");
							
							mngrList();	
						});
						
						$("#searchT").on("keypress", function(event) {
							if(event.keyCode == 13 ) {
								$("#mngrBtn").click();
								
								return false;
							}
						});
					}, 
					width : 600,
					height : 500,
					buttons : {
						name : "닫기",
						func:function() {
							console.log("Three!");
							closePopup(3);
						}
					}
				});	// 담당자 조회 makePopup end
			});
		},
		width : 600,
		height : 400,
		buttons : [{
			name : "등록",
			func:function() {
				
				if(checkEmpty("#clntName")) {
					makeAlert("필수 정보 입력", popContOneLine("고객명을 입력하세요."), function() {
						$("#clntName").focus();						
					});
				} else if(checkEmpty("#clntCmpnyName")) {
					makeAlert("필수 정보 입력", popContOneLine("고객사명을 입력하세요."), function() {
						$("#clntCmpnyName").focus();						
					});
				} else if(checkEmpty("#mbl")) {
					makeAlert("필수 정보 입력", popContOneLine("휴대폰번호를 입력하세요."), function() {
						$("#mbl").focus();											
					});
				} else if (checkEmpty("#mngName")) {
					makeAlert("필수 정보 입력", popContOneLine("담당자를 입력하세요."), function() {
						$("#mngName").focus();						
					});
				} else {
						makePopup({
							depth : 4,
							bg : true,
							bgClose : true,
							title : "저장 완료",
							contents : popContOneLine("저장되었습니다."),
							width : 400,
							height : 180,
							buttons : {
								name : "확인",
								func : function() {
									var params = $("#ccAddForm").serialize(); 
									
									$.ajax({
										type : "post",
										url : "leadAction/ecInsert", 
										dataType : "json",
										data : params,
										success : function(res) {
											if(res.res == "success") {
												$("#ecSearchTxt").val("");
												$("#ecPopupForm #page").val("1");
												$("#ecBtn").click(); 
												closePopup(4);
												closePopup(2);
											} else {
												alert("작성 중 문제가 발생하였습니다.");
											}
										},
										error : function(request, status, error) {
											console.log(request.responseText);
										}
									});
								}
							}
						}); // 저장완료 makePopup end					
					} // else end				
				} // 등록 func end
			}, {
				name : "취소"
			}]
		});
	}
/* ******************************************* 고객 조회 팝업 ******************************************* */
function ecSearchBox() {
	var html = "";
	
	html += 	"<form action=\"#\" id=\"ecPopupForm\">";
 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
	html += 		"<div class=\"ptm_left2\">";
	html += 			"<div class=\"ptm_left_top\">고객/고객사</div>";			
	html += 		"</div>";
	html += 		"<div class=\"ptm_mid2\">";
	html += 			"<div class=\"ptm_mid_top\">";
	html += 				"<input type=\"text\" class=\"text_size2\" id=\"ecSearchTxt\" name=\"ecSearchTxt\" placeholder=\"검색어를 입력해주세요\" />";
	html += 			"</div>";
	html += 		"</div>";
	html += 		"<div class=\"ptm_mid_right\"></div>";
	html += 		"<div class=\"ptm_right2\">";
	html += 			"<div class=\"ptm_right_top2\">";
	html += 				"<div class=\"cmn_btn\" id=\"ecBtn\">검색</div>";
	html += 			"</div>";
	html += 		"</div>";
	html +=		"</form>";
	
	$("#ecS").html(html);
}

function ecList() {
	var params = $("#ecPopupForm").serialize();
	
	$.ajax({
		type : "post",
		url : "ecListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			ecDrawList(res.list);
			drawPaging(res.pb, "#ecpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}		
	});
}

function ecDrawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"popup_box_in\">";
 		html += "<input type=\"hidden\" id=\"ecnm\" value=\"" + data.CLNT_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"ecn\" value=\"" + data.CLNT_NUM + "\" />";
		html += "<input type=\"hidden\" id=\"cnn\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"ccn\" value=\"" + data.CLNT_CMPNY_NUM + "\" />";
		html += "<input type=\"hidden\" id=\"ccgNum\" value=\"" + data.GRADE_NUM + "\" />";
		html += "<input type=\"hidden\" id=\"mnge\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mgee\" value=\"" + data.EMP_NUM + "\" />";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">" + data.CLNT_NAME + " / " + data.CLNT_CMPNY_NAME + " / " + data.GRADE_NAME + "등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일 " + data.RDATE + "</span>";
		html += "</div>";
		html += "</div>";		
	}
		$("#ecBox").html(html);
}

 
/* ******************************************* 고객사 조회 팝업 ******************************************* */
function ccSearchBox() {
	var html = "";
	
	html += 	"<form action=\"#\" id=\"ccPopupForm\">";
 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
	html += 		"<div class=\"ptm_left\">";
	html +=				"<div class=\"ptm_left_top\">고객사분류</div>";	
	html +=				"<div class=\"ptm_left_bot\">고객사명</div>";	
	html += 		"</div>";
	html +=			"<div class=\"ptm_mid\">";
	html +=				"<div class=\"ptm_mid_top\">";
	html +=					"<select class=\"sel_size\" id=\"cccnType\" name=\"cccnType\">";
	html +=						"<option value=\"6\">선택안함</option>";
	html +=						"<option value=\"0\">거래고객사</option>";
	html +=						"<option value=\"1\">파트너사</option>";
	html +=						"<option value=\"2\">해지고객사</option>";
	html +=						"<option value=\"3\">정지고객사</option>";
	html +=						"<option value=\"4\">외국고객사</option>";
	html +=						"<option value=\"5\">기타</option>";
	html +=					"</select>";
	html +=				"</div>";		
	html +=				"<div class=\"ptm_mid_bot\">";
	html +=					"<input type=\"text\" class=\"text_size2\" id=\"ccSearchTxt\" name=\"ccSearchTxt\" placeholder=\"검색어를 입력해주세요\" />";
	html +=				"</div>";	
	html += 		"</div>";
	html += 		"<div class=\"ptm_mid_right\">";
	html +=				"<div class=\"ptm_mid_right_top\"></div>";
	html +=				"<div class=\"ptm_mid_right_bot\"></div>";
	html += 		"</div>"; 
	html += 		"<div class=\"ptm_right\">";
	html +=				"<div class=\"ptm_right_top\"></div>";
	html +=				"<div class=\"ptm_right_bot\">";
	html +=					"<div class=\"cmn_btn\" id=\"ccBtn\">검색</div>";
	html +=				"</div>";
	html += 		"</div>";
	html += 	"</form>";
	
	$("#ccS").html(html);
}
function ccList() {
	var params = $("#ccPopupForm").serialize();

	$.ajax({
		type : "post",
		url : "ccListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			ccDrawList(res.list);
			drawPaging(res.pb, "#ccpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});			
}
function ccDrawList(list) {
	var html = "";

	for(var data of list) {
		
	html += "<div class=\"popup_box_in\">";
	html += "<input type=\"hidden\" id=\"cnn\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
	html += "<input type=\"hidden\" id=\"ccn\" value=\"" + data.CLNT_CMPNY_NUM + "\" />";
	html += "<input type=\"hidden\" id=\"ccgNum\" value=\"" + data.GRADE_NUM + "\" />";
	html +=	"<div class=\"popup_cc_box_left\">";
	html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
	html +=	"</div>";
	html +=	"<div class=\"popup_cc_box_right2\">";
	html +=	"<span class=\"boldname2\">" + data.CLNT_CMPNY_NAME + " / " + data.CLNT_CMPNY_CLSFY_NAME + " / " + data.GRADE_NAME + "등급</span><br/>";
	html +=	"<span class=\"adrs_name\">" + data.ADRS + " " + data.DTL_ADRS + "</span><br/>";
	html += "<span class=\"clntCmpny_dt\">등록일 " + data.RD + "</span>";
	html += "</div>";
	html += "</div>";
	
	}

	$("#ccBox").html(html);
}
/* ******************************************* 담당자 조회 팝업 ******************************************* */
function mngrSearchBox() {
 		var html = "";
		
	 	html += 	"<form action=\"#\" id=\"mngrPopupForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid\">";
		html +=				"<div class=\"ptm_mid_top\">";
		html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
		html +=						"<option value=\"6\">영업부</option>";
		html +=						"<option value=\"7\">영업1팀</option>";
		html +=						"<option value=\"8\">영업2팀</option>";
		html +=					"</select>";
		html +=				"</div>";		
		html +=				"<div class=\"ptm_mid_bot\">";
		html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
		html +=						"<option value=\"0\">사원번호</option>";
		html +=						"<option value=\"1\">사원명</option>";
		html +=					"</select>";
		html +=				"</div>";	
		html += 		"</div>";
		html += 		"<div class=\"ptm_mid_right\">";
		html +=				"<div class=\"ptm_mid_right_top\"></div>";
		html +=				"<div class=\"ptm_mid_right_bot\">";
		html +=					"<input type=\"text\" id=\"searchT\" name=\"searchT\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn\" id=\"mngrBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		
		$("#mngrS").html(html);
}
function mngrList() {
	var params = $("#mngrPopupForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngrListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			mngrDrawList(res.list);
			drawPaging(res.pb, "#mngrpb");
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});	
}
function mngrDrawList(list) {
	var html = "";
		
	for(var data of list) {
		
		html +=	"<div class=\"popup_box_in\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	 data.EMP_NUM + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";	
	}
	
	$("#mngrBox").html(html);
	
}
/* ******************************************* 페이징 ******************************************* */
function drawPaging(pb, sel) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(sel).html(html);
}
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
<form action="leadList" id="listForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="srchType" value="${param.srchType}" />
	<input type="hidden" name="psNum" value="${param.psNum}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="listSort" value="${param.listSort}" />
</form>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">리드 등록</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="writeBtn"/>
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<form action="fileUploadAjax" id="writeForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${param.page}" />
			<input type="hidden" name="top" value="${param.top}" />
			<input type="hidden" name="menuNum" value="${param.menuNum}" />
			<input type="hidden" name="menuType" value="${param.menuType}" />
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->		
						<table>
							<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="150" />
							<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td><input type="button" class="btn" value="리드명 *" readonly="readonly"/></td>
									<td colspan="3"><input type="text" class="txt" id="leadName" name="leadName" /></td>
								</tr>
								<tr>
									<td><input type="button" class="btn" value="고객명 *" readonly="readonly"/></td>
									<td colspan="3">
										<input type="text" class="txt" id="clntName" name="clntName" />
										<input type="hidden" id="clntNum" name="clntNum" />
										<img class="btnImg_in" id="clntIcon" alt="팝업" src="resources/images/sales/popup.png" />
									</td>
								</tr>
								<tr>
									<td><input type="button" class="btn" value="고객사 *" readonly="readonly"/></td>
									<td colspan="3">
										<input type="text" class="txt" id="ccName" name="ccName" readonly="readonly" pla />
										<input type="hidden" id="ccNum" name="ccNum" />
									</td>
								</tr>
								<tr>
									<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/>
									<td colspan="3">
										<select class="txt_in" id="ccGrade" name="ccGrade" disabled="disabled">
											<optgroup>
												<option value="5">고객사 등록 후 자동 입력</option>
												<option value="0">S</option>										
												<option value="1">A</option>										
												<option value="2">B</option>										
												<option value="3">C</option>										
												<option value="4">D</option>										
											</optgroup>
									</select>
									</td>
								</tr>
								<tr>
									<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
									<td colspan="3">
										<select class="txt_in" id="rp" name="rp">
											<option value="0">자사홈페이지</option>
											<option value="1">인터넷검색</option>
											<option value="2">지인소개</option>
											<option value="3">세미나</option>
											<option value="4">전화</option>
											<option value="5">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
									<td>
										<input type="hidden" id="mngNum" name="mngNum" />
										<input type="text" class="mngTxt" id="mngEmp" name="mngEmp"/>
									</td>
									<td><input type="button" class="btn" value="가능여부 *" readonly="readonly"/></td>
									<td>
										<input type="text" class="txt" id="psblCheck" name="psblCheck" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="text-align: right;" maxlength="3"/>
										<div id="percent">%</div>
										
									</td>
								</tr>
								<tr>
									<th></th>
									<th></th>
									<th></th>
									<th><span id="a">숫자 0~100까지만 입력가능합니다.</span></th>
								</tr>													
							</tbody>
						</table>
						<div></div>
						<!-- 첨부자료 -->
							<input type="file" id="att" name="att" style="display: none;" onchange="uploadName(this)" /> 
							<input type="hidden" id="attFile" name="attFile" />
						<div class="rvn_txt"> 첨부파일
							<img class="plus_btn" src="resources/images/sales/plus.png" border='0' > 
						</div>
						<div class="cntrct_box_in">
							<input type="text" id="fileName" name="fileName" readonly="readonly" /> 
						</div>
						
					</div> <!-- bodyWrap end -->
				</div>	
			</form>
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>