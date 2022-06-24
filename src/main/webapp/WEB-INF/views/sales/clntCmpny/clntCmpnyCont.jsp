<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	LocalDateTime version = LocalDateTime.now() ;	
	request.setAttribute("version", version);		//캐시 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객사</title>
<!-- popup css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/common_sales.css?version=${version}" />
<!-- popup javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */
.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}
.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 20px auto;
}
table {	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4) {
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(11) > td:nth-child(1) {
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3) {
	text-align: center;
}
.btn {
	width : 90px;
	height: 40px;
}
.popBtn {
	width: 100px;
	height: 40px;
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	border: none;
	text-align: center;
}
.btn, .address {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
}
.btnImg:hover, .plus_btn:hover {
	cursor: pointer;
}
.txt {
	height: 30px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.pop_txt {
	height: 30px;
	width: 420px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.btnImg {
	width : 30px;
	float: right;
	margin-left: 10px;
}
.imgPos {
	position: relative;
}
.btnImg_in {
    position: absolute;
    left: 395px;
    top: 4px;
    width: 25px;
    cursor: pointer;
}
.title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-top: 100px;
	margin-bottom: 30px;
}
.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.drop_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.up_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
}
.drop_btn_bot:hover, .up_btn_bot:hover {
	cursor: pointer;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}
.cc_box_in {
	display: inline-block;
	vertical-align: top;
	width: 480px;
	height: 65px;
	padding-top: 5px;
	padding-left: 20px;
	white-space: pre;
	font-size: 13px;
	line-height: 20px;
}
.cc_box_right {
	display: inline-block;
	vertical-align: top;
	width: 305px;
	height: 70px;
	padding-right: 20px;
}
.right_box {
	width: 136px;
	height: 70px;
	font-size: 14px;
	padding-left: 162px;
	line-height: 70px;
	text-align: center;
}
.boldname{
	font-weight: bold;
}
.popup_boldname{
	font-weight: bold;
	font-size : 12px;
}
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	font-size: 10pt;
}
.rvn_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 5px;
}
.pop_cntrct_box_in {
    width: 520px;
    height: 50px;
    border: 1px solid #d7d7d7;
    border-radius: 7px;
    font-size: 10pt;
}
.pop_rvn_txt {
    height: 25px;
    width: 520px;
    padding: 0 15px;
    font-size: 14px;
    color: black;
    box-sizing: border-box;
    outline: none;
    border-radius: 3px;
    line-height: 25px;
    border: 1px solid #d7d7d7;
    background-color: #F2F2F2;
    text-align: left;
    font-weight: bold;
	margin-top: 10px;
    margin-bottom: 5px;
}
.plus_btn {
    display: inline-block;
    vertical-align: middle;
    width: 18px;
    height: 18px;
    background-image: url(resources/images/sales/plus.png);
    background-size: 18px 18px;
    float: right;
    margin-right: 5px;
    margin-top: 3px;
}
.plus_btn_bot {
	position: absolute;
	top: 7px;
	left: 884px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
#att {
	display: none;
}
.opbx {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.cbx {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.hbx {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
hr {
	margin-bottom: 10px;
}
.op_title { 
	font-size: 11pt;
}
.cl_title { 
	position: relative;
	font-size: 11pt;
}
.bot_title { 
	font-size: 11pt;
}
textarea {
	width: 757px;
	height: 52px;
	font-size: 10.5pt;
	white-space: pre-wrap;
	resize: none;
	font-family: "맑은 고딕";
	display: inline-block;
	vertical-align: top;
	outline: none;
}
.subm {
	margin-left: 14px;
	width: 35px;
	height: 56px;
	line-height: 56px;
}
.OpinionBox {
	width: 830px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.name {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 20px;
}
.txtOp, .dt, .del {
	padding-left: 20px;
	word-break: break-all;
	margin: 5px 0 5px 0;
}
.dt {
	padding-right: 590px;
}
.del:hover {
	cursor: pointer;
	color: #F2CB05;
}
.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}
.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}
.dwon_icon {
	display:inline-block;
	vertical-align: middle;
	width: 24px;
	height: 24px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 24px 24px;
	float: right;
	margin-top: 3px;
}
.dwon_icon:hover {
	cursor: pointer;
}
.side_btn_area {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 827px;
	height: 30px;
	margin-left: 100px;
	line-height: 30px;
}
.save_btn, .list_btn {
	display: inline-block;
	vertical-align: top;
	width: 30px;
	height: 30px;
	line-height: 30px;
	font-size: 11pt;
	font-weight: bold;
	margin: 0px 5px;
	border-radius: 2px;
	cursor: pointer;
	color: #7b7b7b;
}
.mgtop {
	margin-top: 50px;
}
.sc_title {
	width: 927px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
	background-color: #F2CB05;
}
.popup_table {
	border-collapse: collapse;
	display: table-cell;
	margin: 0px;
}
.popup_table td:nth-child(1) {
	width: 100px;
}
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
    margin: -10px 0px 0px -10px;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
}
.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}
.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}
.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}
.popup_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
}
.popup_mng_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_cc_box_in {
   width: 550px;
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 5px;
}
.popup_mng_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_mng_box_in:hover, .popup_cc_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/client.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldMngName{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
.popCmnBtn {
	margin-top: 35px;
	margin-left: 200px;
}
.popMngBtn {
	margin-top: 5px;
	margin-left: 25px;
}
.popup_box_mng {
	height: 297px;
	padding-top: 8px;
}
.popup_box_cc {
	height: 322px;
	padding-top: 8px;
}
[href] {
	color: black;
	text-decoration: none;
}
#fileName, #popFileName {
	border: hidden;
	outline: none;
}
.text_center{
	width: 100%;
	height: 100%;
	line-height: 100px;
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 고객 보임
	$(".cl_title").on("click", ".drop_btn_bot", function() {
		$(".cbx").hide();
		html = "<div class=\"up_btn_bot\"></div>";
		$("#clListCnt_right").html(html);
	});
	
	// 고객 숨김
	$(".cl_title").on("click", ".up_btn_bot", function() {
		$(".cbx").show();
		html = "<div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
		$("#clListCnt_right").html(html);
	});
	
	// 목록
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyList");
		$("#actionForm").submit();
	});
	
	// 수정
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyUpdate");
		$("#actionForm").submit();
	});
	
	// 삭제
	$("#deleteBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "알림",
			contents : popContOneLine("삭제하시겠습니까?"),
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "예",
				func:function() {
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "clntCmpnyMngActionAjax/delete",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#actionForm").attr("action", "clntCmpnyList");
								$("#actionForm").submit();
							} else {
								makeAlert("알림", "삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					
					closePopup();
				}
			}, {
				name : "아니오"
			}]
		});		
	});

	// 선택박스 초기값
	$("#ccClsfy").val(${data.CLNT_CMPNY_CLSFY_NUM}).prop("selected", true);
	$("#ccGrade").val(${data.GRADE_NUM}).prop("selected", true);
	$("#rp").val(${data.RCGNTN_PATH_NUM}).prop("selected", true);
	
	// 의견
	reloadOpList();
	
	// 의견 등록
	$(".subm").on("click", function() {
		if($("#tatacont").val() != '' && $("#tatacont").val() != null) {
			var params = $("#botOpActionForm").serialize();
		
			$.ajax({
				type : "post",
				url : "ccOpBotActionAjax/insert",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "success") {
						$("#tatacont").val("");
						reloadOpList();
					} else {
						makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
					}
				},
				error : function(request, status, error) {
					console.log(request.responseText);
				}
			});
		} else {
			makeAlert("알림", popContOneLine("내용을 입력해주세요."));
		}
	});
	
	
	// 의견 삭제
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "알림",
			contents : popContTwoLine("삭제하시겠습니까?"),
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "예",
				func:function() {
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "ccOpBotActionAjax/update",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								reloadOpList();
							} else {
								makeAlert("알림", popContOneLine("삭제중 문제가 발생하였습니다."));
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					closePopup();
				}
			}, {
				name : "아니오"
			}]
		});
		
	});
	
	// 고객
	reloadCList();

	// 고객 등록
	$(".cl_title").on("click", ".plus_btn_bot", function() {
 		var html = "";
 		
		html += "<form action=\"fileUploadAjax\" id=\"ClAddForm\" method=\"post\" enctype=\"multipart/form-data\">";
		html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
		html += "<table class=\"popup_table\">                                                                                        ";
		html += "	<tbody>                                                                                                           ";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객 *\" readonly=\"readonly\"/></td>                    ";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"cName\" name=\"cName\" /></td>                                ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사 *\" /></td>                                       ";
		html += "			<td>                                                                                                      ";
		html += "				<div class=\"imgPos\">                                                                                ";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"ccName\" name=\"ccName\" value=\"${data.CLNT_CMPNY_NAME}\" readonly=\"readonly\" />                       ";
		html += "					<input type=\"hidden\" id=\"ccNum\" name=\"ccNum\" value=\"${data.CLNT_CMPNY_NUM}\" />                                             ";
		html += "				</div>                                                                                                ";
		html += "			</td>                                                                                                     ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                            ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"부서\" /></td>                                           ";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"dept\" name=\"dept\" /></td>                                  ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                            ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"직책\" /></td>                                           ";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"duty\" name=\"duty\" /></td>								  ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                            ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"휴대폰 번호*\" /></td>                                   ";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"mbl\" name=\"mbl\" placeholder=\"&quot; - &quot; 제외한 숫자만 입력하세요\" /></td>									  ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                            ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"메일\" /></td>                                           ";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"email\" name=\"email\" /></td>                                ";
		html += "		</tr>                                                                                                         ";
		html += "		<tr height=\"10\">                                                                                            ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"담당자 *\" /></td>                                       ";
		html += "			<td>                                                                                                      ";
		html += "				<div class=\"imgPos\">                                                                                ";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"mngEmp\" name=\"mngEmp\" readonly=\"readonly\" />                       ";     
		html += "					<input type=\"hidden\"id=\"mngNum\" name=\"mngNum\" />                                            ";        
		html += "					<img class=\"btnImg_in\" id=\"mngPop\" alt=\"팝업\" src=\"resources/images/sales/usericon.png\">  ";          
		html += "				</div>                                                                                                ";
		html += "				</td>                                                                                                 ";
		html += "		</tr>                                                                                                         ";
		html += "	</tbody>                                                                                                          ";
		html += "</table>                                                                                                             ";
		html += "<div class=\"pop_rvn_txt\"> 첨부파일                                                                                        ";
		html += "<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />                                   ";
		html += "</div>                                                                                                                  ";
		html += "<div class=\"pop_cntrct_box_in\">                                                                                           ";
		html += "<input type=\"text\" id=\"popFileName\" readonly=\"readonly\" />";
		html += "</div>                                                                                                                  ";
		html += "<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadName(this)\" />                                                                         ";
		html += "<input type=\"hidden\" id=\"attFile\" name=\"attFile\" />                                                               ";
		html += "</form>";
		
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "고객 등록",
			contents : html,
			contentsEvent : function() {
				
				$(".aff_btn").on("click", function() {
					$("#att").click();
				});
				
				$("#ccPop").on("click", function() {
					var html = "";
			        
				 	html += "<form action=\"#\" id=\"popupCcForm\">";
					html += " <div class=\"popup_title_mid\">                                                   ";
				 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
					html += " <div class=\"ptm_left\">                                                          ";
					html += " 	<div class=\"ptm_left_top\">고객사명</div>		                              ";
					html += " 	<div class=\"ptm_left_bot\">고객사분류</div>		                              ";
					html += " </div>                                                                          ";
					html += " <div class=\"ptm_mid\">                                                           ";
					html += " 	<div class=\"ptm_mid_top\">                                                     ";
					html += " 		<input type=\"text\"  class=\"text_size2\" placeholder=\"검색어를 입력해주세요\" /> ";
					html += " 	</div>		                                                                  ";
					html += " 	<div class=\"ptm_mid_bot\">                                                     ";
					html += " 		<select class=\"sel_size\">                                                 ";
					html += " 			<option value=\"9\">선택안함</option>                                             ";
					html += " 			<option value=\"0\">거래고객사</option>                                           ";
					html += " 			<option value=\"1\">파트너사</option>                                             ";
					html += " 			<option value=\"2\">해지고객사</option>                                           ";
					html += " 			<option value=\"3\">정지고객사</option>                                           ";
					html += " 			<option value=\"4\">외국고객사</option>                                           ";
					html += " 			<option value=\"5\">기타</option>                                                 ";
					html += " 		</select>                                                                 ";
					html += " 	</div>	                                                                      ";
					html += " </div>                                                                          ";
					html += " <div class=\"cmn_btn popCmnBtn\">검색</div>                                           ";
					html += " </div>";
					html += "</form>";
					html +=	"<div class=\"popup_box_cc\"></div>";
					html += "<div class=\"board_bottom\">     ";
					html += "<div class=\"pgn_area\"></div>   ";
					html += "</div>                         ";
					
					makePopup({
						depth : 2,
						bg : false,
						width : 600,
						height : 524,
						title : "고객사 조회",
						contents : html,
						contentsEvent : function() {
							$("#popup2").draggable();
							
							drawCcList();
							
							$(".popup_box_cc").on("click", ".popup_cc_box_in", function() {
								var cnn = $(this).children("#cnn").val(); 
								var ccn = $(this).children("#ccn").val(); 
								document.getElementById("ccName").value = cnn;
								document.getElementById("ccNum").value = ccn;
								closePopup(2);
							});
							
							$(".pgn_area").on("click", "div", function() {
								$("#page").val($(this).attr("page"));
								drawCcList();
							});
							
						},
						buttons : {
							name : "닫기",
							func:function() {
								closePopup(2);
							}
						}
					});
				});
				
				// (팝업)담당자
				$("#mngPop").on("click", function() {
					
					var html = "";
					
				 	html += "<div class=\"popup_title_mid\">"; 
				 	html += "<form action=\"#\" id=\"popupMngForm\">";
				 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
					html += "<div class=\"ptm_left\">";
					html += "<div class=\"ptm_left_top\">팀분류</div>";		
					html += "<div class=\"ptm_left_bot\">사원분류</div>";	
					html += "</div>";
					html += "<div class=\"ptm_mid\">";
					html += "<div class=\"ptm_mid_top\">";
					html += "<select class=\"sel_size\" name=\"deptS\">";
					html += "<option value=\"6\">영업1팀</option>";
					html += "<option value=\"7\">영업2팀</option>";
					html += "<option value=\"8\">영업3팀</option>";
					html += "</select>";
					html += "</div>";
					html += "<div class=\"ptm_mid_bot\">";
					html += "<select class=\"sel_size\" name=\"empS\">";
					html += "<option value=\"0\">사원번호</option>";
					html += "<option value=\"1\">사원명</option>";
					html += "</select>";
					html += "</div>";
					html += "</div>";
					html += "<div class=\"ptm_mid_right\">";
					html += "<div class=\"ptm_mid_right_top\"></div>";
					html += "<div class=\"ptm_mid_right_bot\">";
					html += "<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" id=\"searchT\" name=\"searchT\" />";
					html += "</div>";
					html += "</div>";
					html += "<div class=\"ptm_right\">";
					html += "<div class=\"ptm_right_top\"></div>";
					html += "<div class=\"ptm_right_bot\">";
					html += "<div class=\"cmn_btn\" id=\"meBtn\">검색</div>";
					html += "</div>";
					html += "</div>";
					html += "</form>";
					html += "</div>";
					html +=	"<div class=\"popup_box_mng\"></div>";
					html += "<div class=\"board_bottom\">     ";
					html += "<div class=\"pgn_area\"></div>   ";
					html += "</div>                         ";
					
					makePopup({
						depth : 2,
						bg : false,
						width : 600,
						height : 500,
						title : "담당자 조회",
						contents : html,
						contentsEvent : function() {
							$("#popup2").draggable();
							
							drawMngList();
							
							$(".popup_box_mng").on("click", ".popup_mng_box_in", function() {
								var mng = $(this).children("#mng").val();
								var mge = $(this).children("#mge").val();
								document.getElementById("mngEmp").value = mng;
								document.getElementById("mngNum").value = mge;
								closePopup(2);
							});
							
							$("#meBtn").on("click", function () {
								$("#page").val("1");
								drawMngList();
							});
							
							$("#searchT").on("keypress", function(event) {
								if(event.keyCode == 13 ) {
									$("#meBtn").click();
									return false;
								}
							});
							
							$(".pgn_area").on("click", "div", function() {
								$("#page").val($(this).attr("page"));
								drawMngList();
							});
							
						},
						buttons : {
							name : "닫기",
							func:function() {
								closePopup(2);
							}
						}
					});
					
				});
			},
			width : 600,
			height : 500,
			buttons : [{
				name : "등록",
				func : function() {
					if(checkEmpty("#cName")) {
						makeAlert("필수 정보 알림", popContOneLine("고객을 입력하세요"), function() {
							$("#cName").focus();
						});
					} else if(checkEmpty("#mbl")) {
						makeAlert("필수 정보 알림", popContOneLine("휴대폰번호를 입력하세요"), function() {
							$("#mbl").focus();
						});
					} else if(checkEmpty("#mngEmp")) {
						makeAlert("필수 정보 알림", popContOneLine("담당자를 선택하세요"), function() {
							$("#mngEmp").focus();
						});
					} else {
						var ClAddForm = $("#ClAddForm");
						
						ClAddForm.ajaxForm({
							success : function(res) {
								if(res.fileName.length > 0) {
									$("#attFile").val(res.fileName[0]);
								}
								
								var params = $("#ClAddForm").serialize();
								
								$.ajax({
									type : "post",
									url : "clntMngAjax/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											reloadCList();
										} else {
											makeAlert("알림", popContOneLine("등록중 문제가 발생하였습니다."));
										}
									},
									error : function(request, status, error) {
										console.log(request.responseText);
									}
								}); // ajax End
								
							},
							error : function(req) {
								console.log(req.responseText);
							}
						}); // ajaxForm End
						
						ClAddForm.submit();
						closePopup(1);
						reloadCList();
					}
					
				}
			}, {
				name : "취소"
			}]
		});
	});

	console.log($("#cmNum").val());
	console.log("aaaaa");
	
});

// 의견 ajax
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "ccOpBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.opListCnt);
			drawOpList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

// 의견 개수
function drawOpCnt(opListCnt) {
	var html = "";
	
	html = "<h3>의견(" + opListCnt + ")</h3>";
	
	$(".op_title").html(html);
}

// 의견 목록
function drawOpList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"name\">" + data.EMP_NAME + "(" + data.DEPT_NAME + " / " + data.RANK_NAME + ")" + "</div>";
		html += "<div class=\"txtOp\">" + data.CONT + "</div>";
		html += "<div class=\"dt\">" + data.RGSTRTN_DATE + "</div>";
		if(data.EMP_NUM == ${sEmpNum} || ${sEmpNum} == "2022000001") {
			html += "<div class=\"del\">삭제";
			html += "<input type=\"hidden\" id=\"cmntNum\" name=\"cmntNum\" value=\"" + data.CMNT_NUM + "\" />";
			html += "</div>";
		}
		html += "</div>";
	}
	
	$(".opbx").html(html);
	
}

// 고객 목록 ajax
function reloadCList() {
	var params = $("#botClActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawClCnt(res.clListCnt);
			drawClList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

// 고객 목록 개수
function drawClCnt(clListCnt) {
	var html = "";
	
	html = "<h3>고객(" + clListCnt + ")</h3><div id=\"clListCnt_right\"><div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div><div>";
	
	$(".cl_title").html(html);
}

// 고객 목록
function drawClList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"cc_box_in\"><span class=\"boldname\">" + data.CLNT_NAME + "(" + data.DUTY + " / " + data.DEPT + ")</span><br/>tel	" + data.MBL + "<br/>mail	" + data.EMAIL + "</div>";
		html += "</div>";
	}
	
	$(".cbx").html(html);
	
}

// (팝업)고객사 ajax
function drawCcList() {
	var params = $("#popupCcForm").serialize();
	
	$.ajax({
		type : "post",
		url : "popupCcListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

// (팝업)고객사 목록
function drawList(list) {
	var html = "";

	for(var data of list) {                                                                               
		html += "<div class=\"popup_cc_box_in\" id=\"box\">                                                               ";
		html += "<input type=\"hidden\" id=\"cnn\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"ccn\" value=\"" + data.CLNT_CMPNY_NUM + "\" />";
		html += "<div class=\"popup_box_left\">                                                          ";
		html += "	<span class=\"company\"></span>                                                         ";
		html += "</div>                                                                                   ";
		html += "<span class=\"popup_cc_box_right\">                                                        ";
		html += "	<span class=\"popup_boldname\">" + data.CLNT_CMPNY_NAME + " / " +  data.CLNT_CMPNY_CLSFY_NAME + " / " + data.GRADE_NAME + "</span><br/>                 ";
		html += "	<span class=\"adrs_name\">" + data.ADRS + "</span><br/>                                              ";
		html += "	<span class=\"clntCmpny_dt\">" + data.RGSTRTN_DATE + "</span>                                  ";
		html += "</span>                                                                                  ";
		html += "</div>                                                                           ";
	}                                                                                                     
	                      
	$(".popup_box_cc").html(html);
	
}

// (팝업)고객사 페이징
function drawPaging(pb) {
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
	
	$(".pgn_area").html(html);

}

// (팝업)담당자 ajax
function drawMngList() {
	var params = $("#popupMngForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawMngCont(res.mngList);
			drawMngPaging(res.mngPb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

//(팝업)담당자 목록
function drawMngCont(mngList) {
	var html = "";
	
	for(var data of mngList) {
		html +=	"<div class=\"popup_mng_box_in\" id=\"mlb\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"mngIcon\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_mng_box_right\">";
		html +=	 data.EMP_NUM + " " + "<span class=\"boldMngName\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";                                                                      
	}                                                                                                     
	                      
	$(".popup_box_mng").html(html);
	
}

//(팝업)담당자 페이징
function drawMngPaging(mngPb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = mngPb.startPcount; i <= mngPb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == mngPb.maxPcount) {
		html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

}

// 파일명
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
	$("#popFileName").val(filename);
}
</script>
</head>
<body>
<!-- 목록이동 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${param.page}" />
	<input type="hidden" id="cmNum" name="cmNum" value="${param.ccn}" />
	<input type="hidden" name="ccn" value="${param.ccn}" />
	<input type="hidden" name="clntCmpnyClsfyNum" value="${param.clntCmpnyClsfyNum}" />
	<input type="hidden" name="searchType" value="${param.searchType}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
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
			<div class="page_title_text">고객사 상세보기</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
			<!-- 검색영역 선택적 사항 -->
			<!-- <div class="page_srch_area">
				<select class="srch_sel">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" />
				</div>
				<div class="cmn_btn_ml">검색</div>
			</div> -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<table>
					<colgroup>
						<col width="200" />
						<col width="auto" />
					</colgroup>
					<tbody>
						<tr>
							<td><input type="button" class="btn" value="고객사 *" readonly="readonly" /></td>
							<td><input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="고객사 분류 *" /></td>
							<td>
								<select class="txt" id="ccClsfy" name="ccClsfy" disabled="disabled">
									<option value="0">거래고객사</option>
									<option value="1">파트너사</option>
									<option value="2">해지고객사</option>
									<option value="3">정지고객사</option>
									<option value="4">외국고객사</option>
									<option value="5">기타</option>
								</select>
							</td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="등급 *" /></td>
							<td>
								<select class="txt" id="ccGrade" name="ccGrade" disabled="disabled">
									<option value="0">S</option>
									<option value="1">A</option>
									<option value="2">B</option>
									<option value="3">C</option>
									<option value="4">D</option>
								</select>
							</td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="사업자번호" /></td>
							<td><input type="text" class="txt" value="${data.BSNSMN_RGSTRTN_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="대표" /></td>
							<td><input type="text" class="txt" value="${data.CLNT_NAME}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="유선번호" /></td>
							<td><input type="text" class="txt" value="${data.PHONE_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="팩스번호" /></td>
							<td><input type="text" class="txt" value="${data.FAX}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="웹사이트" /></td>
							<td><input type="text" class="txt" value="${data.HMPG}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="우편번호" /></td>
							<td><input type="text" class="txt" value="${data.ZIP_CODE_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td rowspan="2"><input type="button" class="address" value="주소 *" /></td>
							<td><input type="text" class="txt search_text" value="${data.ADRS}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="text" class="txt" placeholder="상세주소" value="${data.DTL_ADRS}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="매출(년)*" /></td>
							<td><input type="text" class="txt" value="${data.RVN}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="인지경로"></td>
							<td>
								<select class="txt" id="rp" name="rp" disabled="disabled">
									<option value="0">자사홈페이지</option>
									<option value="1">인터넷검색</option>
									<option value="2">지인소개</option>
									<option value="3">세미나</option>
									<option value="4">전화</option>
									<option value="5">기타</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 첨부파일 -->
				<c:set var="fileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
				<c:set var="fileName" value="${fn:substring(data.ATT_FILE_NAME, 20, fileLength)}"></c:set>
				<div class="rvn_txt">
					첨부파일
				</div>
				<div class="cntrct_box_in">
					<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${fileName}">${fileName}</a>
				</div>
				<!-- 상세보기 내용 하단부분 -->
				<form action="#" id="botOpActionForm" method="post">
					<input type="hidden" name="ccn" value="${param.ccn}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<input type="hidden" id="cmntNum" name="cmntNum" />
					<!-- 의견 -->
					<div class="mgtop"></div>
					<div class="op_title"></div>
					<hr color="#F2B705" width="925px">
					<div class="opbx"></div>
					<div class="opBox">
						<textarea id="tatacont" name="tacont"></textarea>
						<div class="cmn_btn subm">등록</div>
					</div>
				</form>
				<form action="#" id="botClActionForm" method="post">
					<input type="hidden" name="ccn" value="${param.ccn}" />
					<!-- 고객 -->
					<div class="mgtop"></div>
					<div class="cl_title"></div>
					<hr color="#F2B705" width="925px">
					<div class="cbx"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>