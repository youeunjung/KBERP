<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeNote</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.note {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 500px;
	border: 1px solid #000;
}

.title {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 50px;
	text-indent: 35px;
	line-height: 50px;
	background-image: url('resources/images/GW/note.png');
	background-size: 18px 18px;
	background-repeat: no-repeat;
	background-position: 10px 16px;
	font-size: 17px;
	font-weight: bold;
}

.title_bar {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 3px;
	background-color: #4B94F2;
}

.guide {
	display: table-cell;
	vertical-align: middle;
	width: 900px;
	height: 50px;
	background-color: #F2CB05;
	font-size: 12px;
	text-align: center;
	/*padding-left: 10px;*/
}

.cont {
	border-top: 1px solid black;
}

.rcpnt_emp {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 50px;
	background-color: #dadada;
	text-align: center;
	line-height: 50px;
	font-size: 15px;
	font-weight: bold;
}

.emp {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
	margin-left: 6px;
}

.rcpnt_btn {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
	margin-left: 11px;
}

#cnt {
	resize: none;
	width: 895px;
	height: 235px;
}

.file {
	display: inline-block;
	width: 180px;
}

.note_bottom {
	text-align: right;
	margin-top: 50px;
	margin-right: 15px;
}

.srch_mid {
	display: inline-block;
	width: 480px;
	height: 60px;
	margin-bottom: 15px;
}

table {
	border-collapse: collapse;
	width: auto;
	margin-top: 15px;
	border-top: 1px solid #5555;
}

thead {
	display: inline-block;
	font-size: 14px;
	border-collapse: collapse;
	border-bottom: 1px solid #5555;
}

tbody {
	display: inline-block;
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
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 답장할때 보낸사람을 받는사람으로 표기
	if($("#senum").val() == "") {
		$("#rcpnt_name").val(""); // 보낸사람이 없으면 받는사람 text를 공백으로 둠.
	} else {
		$("#rcpnt_name").val($("#senum").val() + "(" + $("#sename").val() + ")" ); // 보낸사람이 있으면 받는사람 text에 사원번호(이름)을 표기
		$("#rcpnt").val($("#senum").val()); // 보낸사람이 있으면 rcpnt에 사원번호를 넣어둠.
	}
	
	/* $(".rcpnt_btn").on("click", function() {
		var html = "";
		html += "<div id=\"t\">";
		html += "<input type=\"checkbox\" id=\"no\" value=\"2022000017\" />지사원";
		html += "<input type=\"checkbox\" id=\"no\" value=\"2\" />2";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "받는사람",
			contents : html,
			buttons : [{
				name : "추가",
				func:function() {
					// var arr = [];
					
					if(checkEmpty("#t #no:checked")) {
						alert("받는사람을 선택하세요.");
					}
					
					$("#t #no:checked").each(function() {
						$("#rcpnt").val($(this).val());
						//arr.push($(this).val());
						//console.log(arr.toString());
						closePopup();
					});
				}
			}, {
				name : "취소"
			}]
		});
	}); */
	
	$(".rcpnt_btn, #rcpnt_name").on("click", function() {
				
		var html = "";
		
		html +=	"	<div class = \"srch_mid\">                                              ";
		html +=	"		<div class = \"chart\" id = \"chart\">                              ";
		html +=	"			<table>                                                         ";
		html +=	"				<thead>                                                     ";
		html +=	"					<tr>                                                    ";
		html +=	"						<th>부서</th>                                        ";
		html +=	"						<th>직급</th>                                        ";
		html +=	"						<th>성명</th>                                        ";
		html +=	"						<th>선택</th>                                   		";
		html +=	"					</tr>													";
		html +=	"				</thead>                                                    ";
		html +=	"				<tbody>                                                     ";
		html +=	"				</tbody>					                                ";
		html +=	"			</table>                                                        ";
		html +=	"		</div>                                                              ";
		html +=	"	</div>                                                                  ";
		
	makePopup({
			bg : true,
			bgClose : false,
			title : "받는사람",
			width : 500,
			height : 500,
			contents : html,
			contentsEvent : function() {
				// Ajax태우고, list받아서 팝업 테이블에 내용 추가 id추가
				$.ajax({
					type : "post",
					url : "NoteOrgnztChartAjax",
					dataType : "json",
					success : function(res) { 
						drawList(res.list);
					},
					error : function(req) {
						console.log(req.responseText)	
					}
				});
				
				$("#chart").slimScroll({height: "340px"});
 			},
 			buttons : [{
				name : "추가",
				func:function(res) {
					if($("#srch_check:checked").length == 0) {
						alert("받는사람을 선택하세요.");
					} else {
						$("#rcpnt_name").val($("#srch_check:checked").val()); // 받는사람 text엔 사원번호(이름)이 보여지도록 함.
						$("#rcpnt").val($("#srch_check:checked").val().substr(0, 10)); // 실제로 사원번호를 받는 id는 rcpnt
						closePopup();
					}
				}
			}, {
				name : "취소"
			}]
			
		});
	});
	
	$("#sendBtn").on("click", function() {
		if(checkEmpty("#rcpnt_name")) {
			alert("받는사람을 입력하세요.");
			$("#rcpnt_name").focus();
		} else if(checkEmpty("#cnt")) {
			alert("내용을 입력하세요.");
			$("#cnt").focus();
		} else {
			var sendForm = $("#sendForm");
				
			sendForm.ajaxForm({
				success : function(res) {
					// 물리파일명 보관
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);
					}
				
					// 글 저장
					var params = $("#sendForm").serialize();
					
					$.ajax({
						type : "post",
						url : "NoteAction/insert",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								// 셀렉터를 사용해서 폼의 메뉴넘만 28로 바꿔서 넘겨줌.
								$("#actionForm #menuNum").val("28");
							    $("#actionForm").attr("action", "sentNoteBox");
								$("#actionForm").submit();
							} else {
								alert("작성중 문제가 발생하였습니다.");
							}
						},
						error : function(result, status, error) {
							console.log(result, responseText);
						}
				   });
		       },
		       error : function() {
		    	   console.log(req.responseText);
			   }
		  });
	      sendForm.submit();
	    }
	});
	
	$("#cnlBtn").on("click", function() {
		$("#actionForm #menuNum").val("27");
		$("#actionForm").attr("action", "rcvdNoteBox");
		$("#actionForm").submit();
	});
});

function drawList(list) {
	
	var html = "";
	
	for(var data of list) {
		html +=	"<tr no =\"" + data.EMP_NAME +"\">";
		html +=	"<td>" + data.DEPT_NAME + "</td>";
		html +=	"<td>" + data.RANK_NAME + "</td>";
		html +=	"<td>" + data.EMP_NAME + "</td>";
		html +=	"<td><input type =\"radio\" id = \"srch_check\" name = \"srch_check\" value = \"" + data.EMP_NUM + "(" + data.EMP_NAME + ")" + "\"><label for=\"srch_check\"></label></td> ";
		html +=	"</tr>";
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
			<div class="page_title_text">쪽지쓰기</div>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="top" name="top" value="${param.top}" /> 
				<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" /> 
				<input type="hidden" id="no" name="no" value="${param.no}" />
				<!-- 받은편지에서 보낸사람의 이름을 나타냄 -->
				<input type="hidden" id="sename" name="sename" value="${param.sename}" />
				<!-- 받은편지에서 보낸사람의 사원번호를 나타냄-->
				<input type="hidden" id="senum" name="senum" value="${param.senum}" />
			</form>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="note">
				<div class="title">
					쪽지쓰기
					<div class="title_bar"></div>
				</div>
				<div class="guide">
					※ 받는 사람은 직접 입력이 가능합니다.<br /> (단, 입력 시 '사원번호'로 입력을 해야 하며, 받는사람 버튼에서
					단일 선택을 허용합니다.)
				</div>
				<form action="fileUploadAjax" id="sendForm" method="post" enctype="multipart/form-data">
					<div class="cont">
						<div class="rcpnt_emp">받는사람</div>
						<div class="emp">
							<!-- 단순히 사원번호(이름)의 형태를 띄우게하기 위해서 존재 -->
							<input type="text" size="95" id="rcpnt_name" name="rcpnt_name" readonly="readonly" />
						</div>
						<div class="rcpnt_btn">
							<input type="button" value="받는사람" />
						</div>
					</div>
					<textarea placeholder="내용을 입력하세요." id="cnt" name="cnt"></textarea>
					<div class="atchmnt">
						<div class="file">
							<input type="file" id="att" name="att" />
						</div>
					</div>
					<!-- SQL로 데이터를 보내기 위해서 실제로 사용되어지는 id는 rcpnt(사원번호를 담음) -->
					<input type="hidden" id="rcpnt" name="rcpnt" />
					<!-- 보낸편지와 받는편지를 동시에 생성하기 위함. -->
					<input type="hidden" id="sndr" name="sndr" value="${sEmpNum}" /> 
					<input type="hidden" id="notesq" name="notesq" value="${notesq}" /> 
					<input type="hidden" id="attFile" name="attFile" />
					<div class="note_bottom">
						<div class="cmn_btn_ml" id="sendBtn">보내기</div>
						<div class="cmn_btn_ml" id="cnlBtn">취소</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>