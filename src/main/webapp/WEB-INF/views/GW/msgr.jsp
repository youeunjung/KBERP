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

.main_box {

}
.left_box {
	width : 350px;
	display : inline-block;
	margin-right: 10px;
}

.right_box {
	width : 300px;
	vertical-align : top;
	display : inline-block;
	
}
.rank_box {
	display :inline-block;
	border : 1px solid;
	width : 330px;
	height : 54px;
	margin-bottom: 10px;
	padding: 8px 0px 8px 20px;
	background-color: #f2cb05;
}

#user_rank {
	display : inline-block;
	vertical-align: top;
	display : inline-block;
	border : 0px solid;
	font-size : 13pt;
	margin-top: 14px;
	margin-right: 85px;
	background-color: #f2cb05;
	font-weight: bold;
	
}

.srch_img {
	vertical-align: bottom;
	display : inline-block;
	width : 30px;
	height : 30px;
	background-image: url("resources/images/GW/write.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 20pt;
	margin-top: 14px;
	cursor: pointer;
}


.chat_box {
	display : inline-block;
	width : 350px;
	height : 610px;
	border : 1px solid;
	overflow: hidden auto;
	background-color: #f4f4f4;
}

.chat_list1 {
	display : block;
	width: 329px;
	height: 60px;
	border : 1px solid #85898F;
	padding: 8px 20px;
	font-size : 12pt;
	background-image: url("resources/images/GW/profile.png");
	background-position: 250px 7px;
	background-repeat: no-repeat;
	background-size: 20pt;
	background-color: white;
	cursor: pointer;
}

.chat_list1 input:focus {
	outline:none;	
}

.chat_list2 input:focus {
	outline:none;	
}

.rank_box input:focus {
	outline:none;
}

.chat_list1_1 {
	display : inline-block;
	width: 40px;
	height: 40px;
	background-image: url("resources/images/GW/alarm.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 25pt;
	cursor: pointer;
	margin-left: 120px;
}
.chat_list2 {
	display : inline-block;
	width: 329px;
	height: 60px;
	border : 1px solid #85898F;
	padding: 8px 20px;
	font-size : 12pt;
	background-image: url("resources/images/GW/profile.png");
	background-position: 250px 7px;
	background-repeat: no-repeat;
	background-size: 20pt;
	background-color: white;
}

.chat_list2_1 {
	display : inline-block;
	width: 40px;
	height: 40px;
	border : 0px solid;
	padding : 2px;
	font-size : 14pt;
	background-image: url("resources/images/GW/alarm.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 25pt;
	cursor: pointer;
	margin-left: 120px;
}

#chat_group {	
	display : inline-block;
	border: 0px solid;
	font-size : 13pt;
	text-overflow: ellipsis;
	margin-right: 28px;
	cursor: pointer;
}

#head_count {
	vertical-align: bottom;
	display : inline-block;
	width: 20px;
	height: 20px;
	border: 0px solid;
	font-size : 13pt;
	cursor: pointer;
}

#chat_view {
	vertical-align : top;
	display : inline-block;
	border: 0px solid;
	font-size : 13pt;
	text-overflow: ellipsis;
	line-height : 14px;
	padding: 2px;
	cursor: pointer;
}

.msgr_main {
	vertical-align : top;
	display : inline-block;
	width: 570px;
	height: 692px;
	padding: 0px;
	border : 1px solid;
}

.msgr_logo {
	width: 210px;
	height: 200px;
	background-image: url("resources/images/GW/msgr_logo_img.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 140pt;
	margin-top: 200px;
	margin-left: 180px;
}

#main_msgr_btn {
	display: inline-block;
	vertical-align: top ;
	padding: 0px 10px;
	min-width: 30px;
	height: 50px;
	line-height: 30px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	border-radius: 2px;
	background-color : #F2B705;
	color: #222222;
	cursor: pointer;
	margin-top : 200px;
	margin-left : 10px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.srch_mid {
	display : inline-block;
	width: 480px;
	height: 60px;
	margin-top: 10px; 


}
.srch_rcpnt {
	font-size: 11pt;
	text-indent: 10pt;
	font-weight: bold;
	width : 400px;
	height: 25px;
}
.srch_srch {
	margin-top: 10pt;
	margin-left: 9pt;
	font-size: 11pt;
	border: none;
	
}

table {
	border-collapse: collapse;
	width: auto;
	margin-top: 15px;
	border-top: 1px solid #5555; 
}

thead {
	display : inline-block;
	font-size: 14px;
	border-collapse: collapse;
	border-bottom: 1px solid #5555;
}

tbody {
	display :inline-block;
	height: 40px;
	font-size: 13px;
	color: black;
	
}

tr {
	overflow: auto;
}

th:nth-child(1), th:nth-child(2) {
	width: 120px;
	height: 39.5px;
	text-align: center;
	border-right: 1px solid #5555; 
}
th:nth-child(3) {
	width: 120px;
	text-align: center; 
	border-right: 1px solid #5555;
}
th:nth-child(4) {
	width: 120px;
	text-align: center; 
}
td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4) {
	text-align: center;
	font-size: 12pt; 
	width: 120px;
	height: 39.5px;
}


#srch_check {

}

.chart {
	width: 45px;
	height: 45px;
	background-image: url("resources/images/GW/chart.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 38pt;
	position: absolute;
	margin-left: 420px;
	cursor: pointer;
}

.rcpnt_rank_box {
	vertical-align : top;
	display : inline-block;
	width : 530px;
	height : 54px;
	border : 1px solid;
	padding: 8px 20px 8px 20px;
	margin-bottom: 10px;
	background-color: #f2cb05;
}

#rcpnt_rank {
	width : 300px;
	display : inline-block;
	vertical-align: top;
	display : inline-block;
 	border : 0px solid;
	font-size : 13pt;
	margin-top: 17px;
	margin-left : 120px;
	text-align: left;
	background-color: #f2cb05;
	font-weight: bold; 
}

.chat_room {
	vertical-align : top;
	display : inline-block;
	width : 550px;
	height : 590px;
	border : 1px solid;
	padding: 10px;
}

.chat_dtl {
	width : 550px;
	height : 540px;
	border-radius: 8px;
	overflow: auto;
	
}


.chat_input {
	display : inline-block;
	width : 550px;
	height : 40px;
	position: relative;
}

#cont {
	display: inline-block;
	width : 470px;
	height : 40px;
	font-size: 13pt;
	border-radius: 8px;
	text-indent: 10pt;
	position : relative;
}

#chat_img_file {
 	width : 35px;
	height : 35px;
	border : 0px;
	outline : 0px;
 	background-image: url("resources/images/GW/file.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 24pt;
	position: absolute;
	z-index: 100;
	cursor: pointer;
	margin-left: 505px;
	margin-top: 6px;
}

.chat_img_plus {
 	width : 35px;
	height : 35px;
 	background-image: url("resources/images/GW/plus.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 24pt;
	position: absolute;
	z-index: 100;
	cursor: pointer;
	margin-left: 465px;
	margin-top: 6px;
}

.chat_rcpnt {
	display: block;
	text-indent: 5pt;
	background-color: white;
	margin-top: 5pt;
	margin-bottom: 5pt;
}


#chat_rcpnt_name {
	height: 30px;
	font-size: 13pt;
}

#chat_rcpnt_cont {
	border-radius: 8px;
	border : 1px solid;
	font-size: 15pt;
	height: auto;
	width: auto;
	float: left;
	padding: 3px;
}

#chat_rcpnt_time {
	display: inline-block;
	height: auto;
	width: auto;
	font-size: 11pt;
	margin-top: 9pt;
}


.chat_user {
	display: block;
	background-color: white;
	margin-top: 5pt;
	margin-bottom: 5pt;
	text-align: right;
}

#chat_user_name {
	display: block;
	height: 30px;
	font-size: 13pt;
}

#chat_user_cont {
	border-radius: 8px;
	border : 1px solid;
	font-size: 15pt;
	height: auto;
	width: auto;
	float: right;
	padding: 3px;
}

#chat_user_time {
	display: inline-block;
	height: auto;
	width: auto;
	font-size: 11pt;
	float: right;
	margin-top: 9pt;
	margin-right: 5pt;
}

.cmn_btn_ml {
	display : inline-block;	
	border-radius: 5px;
	position: absolute;
	margin-top: 5px;
	margin-left: 0px;
	height : 35px;
	font-size: 14px;
}

.popup_cont {

}

.clicked {
	color : blue;
}



</style>
<script type="text/javascript">
var refreshInterval = null;



$(document).ready(function() {

	reloadList();
	
	$("#main_msgr_btn, .srch_img").on("click", function() {

		var html = "";
		
		html += "		<form action = \"#\" id = \"addForm\" method = \"post\">";
		html += "			<input type = \"hidden\" id = \"no\" name = \"no\" value = \"${sEMP_NUM}\"/>";		
 		html += "			<input type = \"hidden\" id = \"CHAT_NUM\" name = \"CHAT_NUM\" value=\"${chatsq}\"/>";		
 		html += "			<input type = \"hidden\" id = \"EMP_NUM\" name = \"EMP_NUM\" value=\"${EMP_NUM}\"/>";

		html +=	"		<div class = \"srch_mid\">                                          ";
		html +=	"		<div class = \"chart\"></div>                                       ";
		html +=	"			<div class = \"srch_rcpnt\">받는 사람:</div>                      	";
		html +=	"			<input type=\"text\" placeholder = \"검색...\" class = \"srch_srch\">";
		html +=	"			<div id=\"chatList\">                                           ";
		html +=	"			<table>                                                         ";
		html +=	"				<thead>                                                     ";
		html +=	"					<tr>                                                    ";
		html +=	"						<th>부서</th>                                        	";
		html +=	"						<th>직급</th>                                        	";
		html +=	"						<th>성명</th>                                        	";
		html +=	"						<th>확인</th>                                   		";
		html +=	"					</tr>													";
		html +=	"				</thead>                                                    ";
		html +=	"				<tbody>                                                     ";
                                        	
		html +=	"				</tbody>					                                ";
		html +=	"			</table>                                                        ";
		html +=	"			</div>                                                        ";
		html +=	"		</div>                                                              ";
		html += "		</form>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "검색",
			width : 500,
			height : 500,
			contents : html,
			contentsEvent : function() {
				// Ajax태우고
				// list받아서 팝업 테이블에 내용 추가 id추가
				$.ajax({
					type : "post",
					url : "addListChatAjax",
					dataType : "json",
					success : function(res) {
						drawList(res.list);
					},
					error : function(req) {
						console.log(req.responseText)	
					}
				});
				
				$("#chatList").slimScroll({height: "340px"});
 			},
			buttons : [{
				name : "완료",
				func : function() {
					if($("#srch_check:checked").length == 0) {
						alert("대화상대를 선택하세요.");
						$("#srch_check").focus();
					} else {
						var params = $("#addForm").serialize();
						console.log(params);
						// 위 둘은 아닐 수도있음
						// 아작스 태우기
						$.ajax ({
							type : "post",
							url : "actionChatAjax/insert",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									reloadList();
									closePopup();
								} else {
									alert("생성중 문제가 발생하였습니다.");
								}
							},
							error : function(request, status, error) {
								console.log(request.responseText);
							}
						}); 
						 
						}
				}
			}, { 
				name : "취소",
					func : function() {
						closePopup();
					}
				
			}]
			
		});
	}); // main msgr btn
	
	
	
	$("body").on("click", ".chat_list1", function() {	
		
		clearInterval(refreshInterval);
		
		refreshInterval = setInterval(readCont, 1000);
		
		$("#chatNum").val($(this).attr("chatNum"));
		
		var html = "";
		
		html += "		<div class = \"right_box\">                                                      ";
		html += "			<div class = \"rcpnt_rank_box\">                                                 ";
		html += "				<div id = \"rcpnt_rank\"> ${empNum} ${RankName} ${EmpName} </div>";
		html += "			</div>		                                                                  	 ";
		html += "			                                                                              	 ";
		html += "			<div class = \"chat_room\">                                                      ";
		html += "				<div class = \"chat_dtl\">                                                   ";
		
		html += "				</div>                                                                    	 ";
		html += "				<div class = \"chat_input\">                                            	 ";
		
		html += "					<form action = \"#\" id = \"insertForm\" method = \"post\" enctype= \"multipart/form-data\">";
		html += "						<input type = \"hidden\" name = \"chatNum\" value = \"" + $(this).attr("chatNum") + "\">";
		html += "						<div class= \"cmn_btn_ml\" id = \"insertBtn\" style=\"float: left;\">보내기</div>";
										/* 첨부파일 */
		html += "						<div class = \"chat_img\">";
		html += "							<label for = \"attFile\">";
		html += "								<img id = \"chat_img_file\">";
		html += "							</label>";	
		html += "							<input type=\"file\" id=\"attFile\" name=\"attFile\" style=\"display:none\"/>";
		html += "						</div>";
		
		html += "						<div class = \"chat_img_plus\"></div>";
		html += "						<input type= \"text\" placeholder = \"메시지 입력..\" name = \"cont\"  id = \"cont\" onkeydown= \"enterCheck();\" style = \"float: right;  \">";
		html += "						<input type= \"text\" style = \"display:none\">";
		html += "					</form>";
		
		html += "				</div>";
		html += "			</div>";
		html += "		</div>";
	//	init();
		
		$(".msgr_main").remove();
		$(".right_box").html(html);
		
		readCont();
		
		$(".chat_dtl").slimScroll({height:"545px",
								  start: "bottom"});
		
		
		$("#insertBtn").on("click", function() {
			if($.trim($("#cont").val()) == "") {
				alert("내용을 입력하세요.");
			} else {
				insertCont();
			}
		});
		
		
		$(".chat_img_plus").on("click", function() {

			var html = "";
			
			html += "		<form action = \"#\" id = \"joinForm\" method = \"post\">";
			html += "			<input type = \"hidden\" id = \"no\" name = \"no\" value = \"${sEMP_NUM}\"/>";		
	 		html += "			<input type = \"hidden\" id = \"CHAT_NUM\" name = \"CHAT_NUM\" value=\"${chatsq}\"/>";		
	 		html += "			<input type = \"hidden\" id = \"EMP_NUM\" name = \"EMP_NUM\" value=\"${EMP_NUM}\"/>";

			html +=	"		<div class = \"srch_mid\">                                          ";
			html +=	"		<div class = \"chart\"></div>                                       ";
			html +=	"			<div class = \"srch_rcpnt\">받는 사람:</div>                      	";
			html +=	"			<input type=\"text\" placeholder = \"검색...\" class = \"srch_srch\">";
			html +=	"			<div id=\"chatList\">                                           ";
			html +=	"			<table>                                                         ";
			html +=	"				<thead>                                                     ";
			html +=	"					<tr>                                                    ";
			html +=	"						<th>부서</th>                                        	";
			html +=	"						<th>직급</th>                                        	";
			html +=	"						<th>성명</th>                                        	";
			html +=	"						<th>확인</th>                                   		";
			html +=	"					</tr>													";
			html +=	"				</thead>                                                    ";
			html +=	"				<tbody>                                                     ";
	                                        	
			html +=	"				</tbody>					                                ";
			html +=	"			</table>                                                        ";
			html +=	"			</div>                                                        	";
			html +=	"		</div>                                                              ";
			html += "		</form>";
			
			makePopup ({
				bg:true,
				bgClose : false,
				title : "추가 검색",
				width : 500,
				height : 500,
				contents : html,
				contentsEvent : function() {
					$.ajax({
						type : "post",
						url : "addListChatAjax",
						dataType : "json",
						success : function(res) {
							drawList(res.list);
						},
						error : function(req) {
							console.log(req.responseText)
						}
					});
					
					$("#chatList").slimScroll({height:"340px"});
				},
				
				buttons : [{
					name : "완료",
					func : function() {
						if($("#srch_check:checked").length == 0) {
							alert("대화상대를 선택하세요.");
							$("#srch_check").focus();
						} else {
							var params = $("#joinForm").serialize();
							console.log(params);
							
							$.ajax ({
								type : "post",
								url : "actionChatAjax/join",
								dataType : "json",
								data : params,
								success : function(res) {
									if(res.res == "success") {
										
										closePopup();
									} else {
										alert("추가중 문제가 발생하였습니다.");
									}
								},
								error : function(request, status, error) {
									console.log(request.responseText);
								}
							});
							}
						
						}
					}, {
						name : "취소",
							func : function() {
								closePopup();
							}
					
				}]
				
			});
		}); // chat_img_plus End
		
		
	}); // div End
		
	
	
	
}); // ready

function enterCheck() {
	if(event.keyCode == 13) {
		if($.trim($("#cont").val()) == "") {
			alert("내용을 입력해 주세요.");
		} else {
			insertCont();
		}
		return;
	}
}

function insertCont() {
	$(".chat_dtl").val($("#cont").val());
	
/*	var insertForm = $("#insertForm");
	
	insertForm.ajaxForm({
		success : function(res) {
			if(res.fileName.length > 0) {
				// 물리파일명 보관
				$("#attFile").val(res.fileName[0]);
			} */
		
	
		var params = $("#insertForm").serialize();
		
	 		$.ajax({
				type : "post",
				url : "insertContAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					console.log(res);
					$(".chat_dtl").val("");
					$("#cont").val("");
					readCont();
				},
				error : function(res) { 
					alert(res.errorMessage);
					$(".chat_dtl").val("");
					$("#cont").val("");
				}
			}); 
/*		},
		error : function(req) {
			console.log(req.responseText);
		}
	}); // ajaxForm End
 		insertForm.submit(); */
	}
	
/* function chatDelete() {
	var params = "";
	
	$.ajax({
		type : "post",
		
	})
}	 */

	

function readCont() {
//	clearInterval(refreshInterval);
	// 채팅 인서트는 성공했지만, 리스트띄우는건 실패. 오류명 undefined 'parsererror' 
	var params = $("#readForm").serialize();
	$.ajax({
		type : "post",
		url : "getContListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log("성공")
				console.log(res.list);
				console.log(res);
			if(res.list.length != 0) {
				var html = "";
				for(var i = 0 ; i < res.list.length; i++) {
					if(res.list[i].EMP_NUM ==  '${sEmpNum}') {
							html += "<div class = \"chat_user\">";
							html += "<div id = \"chat_user_name\"></div>";
							html += "<div id = \"chat_user_cont\">" + res.list[i].CONT + "&nbsp;</div>";
							html += "<div id = \"chat_user_time\">" + res.list[i].RGSTRTN_DT +"</div>";
							html += "</div>";
						} else {
							html += "<div class = \"chat_rcpnt\">";
							html += "<div id = \"chat_rcpnt_name\">" + res.list[i].EMP_NAME + res.list[i].RANK_NAME + "</div>";
							html += "<div id = \"chat_rcpnt_cont\">" + res.list[i].CONT + "&nbsp;</div>";
							html += "<div id = \"chat_rcpnt_time\">" + res.list[i].RGSTRTN_DT + "</div>";
							html += "</div>";
						}
					}
				
					$(".chat_dtl").append(html);
					$("#lastContNo").val(res.list[res.list.length -1].CONT_NUM);
					
					scrollDown()
				}
			},
			error : function(res, error) {
				console.log(res.responseText);
				console.log(res);
				console.log("실패");
				alert(res.errorMessage);
				
			}
	}); 
}


function checkInput() {
	if($("input:checkbox[name=srch_check]").is(":checked") == true) {
		return true;
	} else {
		return false;
	}
}

function checkEmpty(sel) {
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
		alert("대화를 입력하세요.");
	}
}

function reloadList() {
	var params = $("#chatBoxForm").serialize();
	
	$.ajax({
		type : "post",
		url : "DrawRoomAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawRoom(res.list);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
	
}

/* function scrollDown() {
	$(".chat_dtl").animate ({
		scrollTop: $(".chat_dtl").prop("scrollHeight") 
	}, 'slow', function () {});
} */

function scrollDown() {
 $(".chat_dtl").scrollTop($(".chat_dtl")[0].scrollHeight);
 	
}


function drawList(list) {
	
	var html = "";
	
		for(var data of list) {
			html +=	"<tr no =\"" +data.EMP_NUM +"\">";
			html +=	"<td>" +data.DEPT_NAME + "</td>";
			html +=	"<td>" +data.RANK_NAME + "</td>";
			html +=	"<td>" +data.EMP_NAME + "</td>";
			html +=	"<td><input type =\"checkbox\" id = \"srch_check\" name = \"srch_check\" value = \"" +data.EMP_NUM + "\"></td> ";
			html +=	"</tr>";
		}	
	$("tbody").html(html);
}

function drawRoom(list) {
	
	console.log(list);
	
	var html = "";
		
		for(var data of list) { 
			html += "		<div class = \"chat_list1\" chatNum = \"" + data.CHAT_NUM + "\">";
			html += "			<input type=\"text\" value = \"" + data.EMP_NAME + "\" id = \"chat_group\" readonly=\"readonly\" />";
			html += "			<input type=\"text\" value = \"" + data.CNT + "\" id = \"head_count\" readonly=\"readonly\"/>";
			if(data.CONT != null) {
				html += "			<input type=\"text\" value = \"" + data.CONT + "\" id = \"chat_view\" readonly=\"readonly\" style = \"width:150px; color: #85898F\"/>";
			} else {
				html += "			<input type=\"text\" value = \"대화가 없습니다.\" id = \"chat_view\" readonly=\"readonly\" style = \"width:150px; color: #85898F\"/>";
			}
			html += "			<div class = \"chat_list1_1\"></div>";
			html += "		</div>";
		}
	$(".chat_box").html(html);
}


var chat_list1 = document.getElementsByClassName("chat_list1");

function handleClick(event) {
    console.log(event.target);
    console.log(this);
    console.log(event.target.classList);

    if(event.target.classList[1] == "clicked") {
    	event.target.classList.remove("clicked");
    } else {
    	for(var i = 0; i < chat_list1.length; i++) {
    		chat_list1[i].classList.remove("clicked");
    	}
    	event.target.classList.add("clicked");
    }
}

function init() {
	for (var i = 0; i < chat_list1.length; i++) {
		chat_list1[i].addEventListener("click", handleClick);
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
		<!-- <div class="page_title_bar">
			 <div class="page_title_text">메신저</div>
			 </div> -->
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<form action="#" id="chatBoxForm">
				<input type= "hidden" name="EMP_NUM" value="${sEmpNum}"/>
				<input type= "hidden" name="CHAT_NUM" value="${chatsq}"/>
				<input type = "hidden" id = "srch_check" name = "srch_check" value = "checked"/>
			</form>
			
			<form action = "#" id = "readForm">
				<input type="text" id = "lastContNo" name = "lastContNo" value = "${maxNo}">
				<input type ="text" id = "chatNum" name = "chatNum" value = "${chatNum}"/>
				<input type ="text" id = "sEmpNum" name = "sEmpNum" value = "${sEmpNum}"/>
			</form>
			
				<div class = "main_box">
	<div class = "left_box">
		<div class = "rank_box">
		<div id = "user_rank">${sDeptName} ${sRankName} ${sEmpName}	</div>
		<div class = "srch_img"></div>	
		</div>
		
		<div class = "chat_box">
			
		</div>
	</div>
	
	<div class = "right_box">
		<div class = "msgr_main">
		<div class = "msgr_logo">
			<input type="button" value = "메시지 보내기" id = "main_msgr_btn" />	
		</div>
		</div>
	</div>
</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>