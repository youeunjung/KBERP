<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 사원조회</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.srch_wrap {
	width: calc(100%-20px);
	height: 100px;
	/* background-color: #22222222; */
	border-top: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
	padding: 10px 4px 10px 4px;
	/* border-radius: 4px; */
}
.page_srch_area {
	display: inline-block;
	vertical-align: top;
	text-align: left;
	width: 100%;
	height: 30px;
	line-height: 30px;
}

.srch_sel {
	min-width: 100px;
	height: 30px;
	margin-left: 0px;
}

.srch_text_wrap {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 174px);
	height: 28px;
	margin-left: 10px;
	text-align: left;
	border: 1px solid #d7d7d7;
	line-height: 28px;
	background-image: url('./images/cmn/srch_icon.png');
	background-repeat: no-repeat;
	background-size: 26px;
	background-position: right center;
	background-color: #fff;
}

.srch_text_wrap input {
	width: calc(100% - 30px);
	height: 28px;
	padding: 0px 2px;
	vertical-align: middle;
	border: none;
}

.cmn_btn {
	float: right;
}

.srch_cndt_area {
	height: 60px;
	width: 100%;
	margin-top: 10px;
}

.item_wrap {
	display: inline-block;
	vertical-align: top;
	height: 100%;
	width: 410px;
}
#left_item_wrap {
	margin-right: 35px;
}

.radio_wrap, .prd_wrap {
	display: table;
	height: 30px;
	width: 100%;
	margin-bottom: 0px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.radio_wrap .radio_title {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 80px;
	padding-right: 30px;
	text-align: right;
	font-weight: 900;
	font-size: 10pt;
}

.radio_wrap .radio_item_name {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 60px;
	margin: 0;
	padding-left: 10px;
	padding-right: 15px;
	font-size: 10pt;
}

.radio_wrap input:hover, .radio_wrap label:hover {
	cursor: pointer;
}

.radio_wrap input {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 15px;
	margin: 0;
}

#join_date {
	width: 75%;
}

#prd_wrap_empty {
	display: table-cell;
	height: 30px;
	width: 80px;
	padding-right: 30px;
}

.prd_text_wrap {
	display: table-cell;
	height: 30px;
	width: 140px;
}

.prd_text {
	display: inline-block;
	vertical-align: top;
	height: 18px;
	width: 124px;
	font-size: 10pt;
	margin-top: 3px;
}

.prd_clsftn {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 20px;
	font-size: 10pt;
	text-align: center;
}

.prd_sel_btn:hover {
	cursor: pointer;
}

.rslt_wrap {
	width: 100%;
	height: 460px;
	/* border-top: 2px solid #cccccc; */
	border-bottom: 2px solid #cccccc;
	/* background-color: #22222222; */
	/* border-radius: 4px; */
}

.rslt_area {
	width: calc(100% - 8px);
	height: 400px;
	padding: 10px 4px 10px 4px;
}

.pgn_area {
	display: block;
	min-width: 300px;
	text-align:center;
	height: 30px;
	position: static;
	float: center;
}

table {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	background-color: #FFFFFF;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}
tr {
	text-align: center;
}

th {
	height: 26px;
	font-size: 9pt;
	font-weight: 900;
	color: #fff;
}
td {
	height: 21px;
	font-size: 9pt;
	margin-left: 6px;
	border-bottom: 1px solid #f0f0f0;
}
thead tr th {
	position: sticky;
	top: 0;
}
th:nth-child(odd) {
	background-color: #999999;
}
th:nth-child(even) {
	background-color: #939393;
}

td:nth-child(odd) {
	background-color: #fafafa;
}
td:nth-child(even) {
	background-color: #f6f6f6;
}

.td_cont {
	height: 21px;
	width: 100%;
	margin-top: 1px;
}

.func_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 80px;
	height: 28px;
	border: 1px solid #00000022;
	border-radius: 4px;
	font-size: 9pt;
	font-weight: 900;
	text-align: center;
	line-height: 26px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#inqry_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
}

#add_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#inqry_btn:hover, #add_btn:hover {
	background-color: #2E83F2;
}

#del_btn {
	background-color: #fe3a40;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#del_btn:hover {
	background-color: #ff1016;
}

#emp_del_popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 300px;
	height: 140px;
	top: calc(50% - 70px); /* 높이 반  */
	left: calc(50% - 150px); /* 너비 반 */
}

#emp_del_popup .popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
	font-weight: 900;
	text-align: center;
	line-height: 40px;
}

/* 팝업 내용 */

.popup_cont_element {
	display: inline-block;
	vertical-align: top;
	height: 26px;
	width: 100%;
	margin: 0px 0px 10px 0px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.popup_cont_name {
	display: inline-block;
	vertical-align: center;
	height: 24px;
	width: 72px;
	line-height: 24px;
	margin-left: 6px;
	margin-right: 6px;
	background-color: #ffffff00;
	font-size: 12px;
	color: #444444;
}


.popup_cont_text {
	display: inline-block;
	vertical-align: center;
	width: calc(100% - 98px);
	height: 24px;
	background-color: #ffffff;
	text-align: left;
	font-size: 12px;
	padding: 0px 0px 0px 4px;
	margin: 2px 0px 0px 0px;
	border: 0px;
	outline: 1px solid #00000033;
}

#add_hire_type, #add_bank_name {
	width: calc(100% - 94px);
}

.read_popup_cont_text {
	display: inline-block;
	vertical-align: center;
	width: calc(100% - 98px);
	height: 24px;
	background-color: #ffffff;
	text-align: left;
	font-size: 12px;
	font-weight: 700;
	padding: 0px 0px 0px 4px;
	margin: 2px 0px 0px 0px;
	border: 0px;
	outline: 0;
}

.upld_file {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.upld_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 60px;
	height: 24px;
	font-size: 8pt;
	text-align: center;
	line-height: 22px;
	outline: 1px solid #bbbbbb;
	border-radius: 2px;
	background-color: #dddddd;
	margin-left: 4px;
}

.upld_btn:hover {
	background-color: #d6d6d6;
	cursor: pointer;
}

.upld_btn label:hover {
	cursor: pointer;
}

.add_popup_area {
	padding: 10px;
	outline: 1px solid #cccccc;
}

#popup_left {
	display: inline-block;
	vertical-align: top;
	width: 385px;
	height: 350px;
}

#popup_right {
	display: inline-block;
	vertical-align: top;
	width: 385px;
	height: 350px;
	margin-left: 5px;
}

.add_popup_area_right {
	display: block;
}

#popup_right_top {
	height: 135px;
}

#popup_right_bottom {
	height: 190px;
	margin-top: 5px;
}

#add_text_area {
	display: inline-block;
	vertical-align: top;
	height: 160px;
	width: 230px;
}

#add_zip_code {
	width: 80px;
}
#add_zip_code:hover {
	cursor: pointer;
}

#add_adrs {
	width: 194px;
	margin-left: 4px;
}

#add_bnkbk_copy_file {
	width: calc(100% - 166px);
}

#edit_left_e5 input {
	width: 200px;
}

.add_popup_radio_wrap {
	display: inline-block;
	vertical-align: top;
	width: 120px;
	height: 26px;
}

#edit_left_e4 input[type=radio] {
	display: inline-block;
	vertical-align: top;
	height: 26px;
	margin: 0px 5px 0px 0px;
}

.add_popup_radio_item_name {
	display: inline-block;
	vertical-align: top;
	padding-top: 3px;
	font-size: 10pt;
	color: #333333;
}

.sub_text {
	display: inline-block;
	vertical-align: center;
	font-size: 10pt;
	color: #666666;
}

#add_pctr_wrap {
	display: inline-block;
	vertical-align: top;
	height: 100%;
	width: 120px;
	margin-left: 5px;
	float: right;
}

#add_pctr_area {
	display: block;
	height: 152px;
	width: 114px;
	outline: 1px solid #e2e2e2;
	padding: 3px;
	margin-top: 3px;
}

#emp_pctr_area {
	width: 100%;
	height: 100%;
	opacity: 35%;
	object-fit: contain;
}

#emp_pctr_file_btn_area {
	display: block;
	width: 120px;
	margin: 5px 0px 0px 0px;
}

#emp_pctr_instrcn_wrap {
	height: 130px;
	width: 230px;
	padding: 5px;
}

#right_bottom_e1_name {
	font-size: 10pt;
	font-weight: 700;
}

.emp_pctr_instrcn_title {
	font-size: 9pt;
	color: #fe3a40;
	font-weight: 700;
	margin-top: 5px;
}
.emp_pctr_instrcn_cont {
	font-size: 8.5pt;
	color: #ee1a20;
	font-weight: 500;
	margin-top: 3px;
}

#add_emp_pctr_file {
	width: 100%;
}

#delete_info_text {
	margin-left: 10px;
	font-weight: 700;
	color: #fe3a40;
}

.phone_num_sel_box {
	width: 60px;
	font-size: 9pt;
}

#add_phone_num_1 {
	width: 96px;
}
#add_phone_num_2 {
	width: 96px;
}
#add_mbl_num_1 {
	width: 96px;
}
#add_mbl_num_2 {
	width: 96px;
}

input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if ("${param.srch_sel}" != "") {
		$("#srch_sel").val("${param.srch_sel}");
	} else {
		$("#old_srch_sel").val("0");
	}
	
	if ("${param.work_clsftn}" != "") {
		switch ("${param.work_clsftn}") {
		case "-1" :
			$("#work_clsftn_entr").prop("checked", true);
			break;
		case "0" :
			$("#work_clsftn_work").prop("checked", true);
			break;
		case "1" :
			$("#work_clsftn_rsgnt").prop("checked", true);
			break;
		}
	}

	if ("${param.emplynt_type}" != "") {
		switch ("${param.emplynt_type}") {
		case "-1" :
			$("#emplynt_type_entr").prop("checked", true);
			break;
		case "0" :
			$("#emplynt_type_rgl_wrk").prop("checked", true);
			break;
		case "1" :
			$("#emplynt_type_cntr_wrk").prop("checked", true);
			break;
		}
	}

	if ("${param.join_date}" != "") {
		switch ("${param.join_date}") {
		case "-1" :
			$("#join_date_entr").prop("checked", true);
			break;
		case "0" :
			$("#join_date_prd_dsgnt").prop("checked", true);
			if ("${param.prd_start}" != "") {
				$("#prd_start").val("${param.prd_start}");
			}
			if ("${param.prd_end}" != "") {
				$("#prd_end").val("${param.prd_end}");
			}
			break;
		}
	}
	
	reloadList();
	btnSetting();
		
	$(".rslt_area").on("mouseenter", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#f3f3f3");
			$(this).children("td:nth-child(even)").css("background-color", "#efefef");
		}
	});
	$(".rslt_area").on("mouseleave", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
			$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
		}
	});
	
	$(".pgn_area").on("click", ".page_btn", function() {
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	$("#srch_rslt").on("click", "tr", function() {	// 목록에서 사원 선택 및 선택 해제하는 기능
		var state = $(this).find(".item_selected").val();
		var flag = $(this).find(".val_existed").val();
		if (flag == "true") {
			if (state == "false") {
				$(this).parent("tbody").find(".table_item .item_selected").val("false");
				$(this).find(".item_selected").val("true");
				
				$("#empNum").val($(this).attr("num"));
				$("#inqry_btn").attr("da", "false");
				$("#del_btn").attr("da", "false");
				btnSetting();
				
				console.log("selected : " + $("#empNum").val());
		
				$(this).parent("tbody").find(".table_item").children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).parent("tbody").find(".table_item").children("td:nth-child(even)").css("background-color", "#f6f6f6");
				
				$(this).children("td").css("background-color", "#b3e0ff");
			} else {
				$(this).find(".item_selected").val("false");
				
				$("#empNum").val("-1");
				$("#inqry_btn").attr("da", "true");
				$("#del_btn").attr("da", "true");
				btnSetting();
				
				console.log("unselected");
				
				$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
			}
		}
	});
	
	$("#srch_rslt").on("dblclick", "tr", function() {
		var flag = $(this).find(".val_existed").val();
		if (flag == "true") {
			$(this).parent("tbody").find(".table_item .item_selected").val("false");
			$(this).find(".item_selected").val("true");
			
			$("#empNum").val($(this).attr("num"));
			$("#inqry_btn").attr("da", "false");
			$("#del_btn").attr("da", "false");
			btnSetting();
			
			$("#inqry_btn").click();
		}
	});
	
	$("input:radio[name=join_date]").on("click", function() {
		if ($(this).val() == 0) {
			$(".prd_text").attr("disabled", false);
		} else {
			$(".prd_text").attr("disabled", true);
		}
	});
	
	$("#srch_txt").on("keypress", function(event) {
		if (event.keyCode == 13) {
			$(".cmn_btn_ml").click();
			
			return false;
		}
	});
	
	$(".cmn_btn_ml").on("click", function() {
		$("#page").val("1");
		
		reloadList();
	});
	
	$(".func_btn").on("mouseenter", function() {
		if ($(this).attr("da") == "false") {
			$(this).css("cursor", "pointer");
		}
	});	
	$(".func_btn").on("mouseleave", function() {
		$(this).css("cursor", "default");
	});
	
	$("#inqry_btn").on("click", function() {
		if ($("#empNum").val() != "-1") {
			$("#i_menuNum").val("5");
			
 			$("#inqryForm").attr("action", "prsnlCard");
			$("#inqryForm").submit();
		}
	});
	
	$("#add_btn").click(function() {
		$.ajax({
			type : "post",
			url : "empInqryActionAjax/select",
			success : function(res) {
				if (res.res == "success") {
					createAddPopup(res.bankList);
				} else {
					makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
				}
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	});
	
	$("#del_btn").click(function() {
		if ($("#empNum").val() != "-1") {
			deleteCheck();
		}
	});
	
	$(".cont_area").on("click", ".popup #cnl_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
	
	$(".cont_area").on("click", ".popup #cnfrm_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
	
	$("body").on("change", "#emp_pctr_file_btn", function() {
		console.log("check 0");
		if ($(this).context.files && $(this).context.files[0]) {
			console.log("check 1");
			var file = $(this).context.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				console.log("check 2");
				console.log(e);
				$("#emp_pctr_area").attr("src", e.target.result);
				$("#emp_pctr_area").css("opacity", "100%");
			}
			reader.readAsDataURL(file);
		} else {
			console.log("check -1");
		}
		console.log("check 3");
	});
	
	$("body").on("change", ".upld_file", function(){
		var fileName = $(this).val().split("\\");
		console.log(fileName[fileName.length-1]);
		switch($(this).attr("id")) {
		case "bnkbk_copy_file_btn" :
			$("#add_bnkbk_copy_file").val(fileName[fileName.length-1]);
			break;
			
		case "emp_pctr_file_btn" :
			$("#add_emp_pctr_file").val(fileName[fileName.length-1]);
			break;
		}
	});
	
	$("body").on("change", ".phone_num_sel_box", function() {
		$(this).parent("div").children(".phone_num_1").focus();
	});
	
	$("body").on("click", "#add_zip_code", function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#add_zip_code").val(data.zonecode);
	        	$("#add_adrs").val(data.address);
	        	$("#add_dtl_adrs").focus();
	        }
	    }).open({popupKey:"popup1"});
	});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	$(".prd_text").attr("disabled", false);
	var params = $("#inqryForm").serialize();
	if ($("input[name=join_date]:checked").val() == "-1") {
		$(".prd_text").attr("disabled", true);
	}
	
	$.ajax({
		type : "post",
		url : "empInqryAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	if (list.length == 0) {
		html += "<tr class=\"table_item\">                 ";
		html += "<td colspan=\"9\">검색 결과가 없습니다.</td> "
		html += "</tr>                                     ";
	} else {
		for (var data of list) {
			html += "<tr class=\"table_item\" num=\"" + data.EMP_NUM + "\">                 ";
			html += "	<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "	<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "	<td><div class=\"td_cont\">" + data.EMP_NUM + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.EMP_NAME + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" 
			if (data.DEPT_NAME != null) {
				html += data.DEPT_NAME;
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.RANK_NAME) {
				html += data.RANK_NAME;
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.MBL_NUM + "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.JOIN_DATE != null) {
				html += data.JOIN_DATE;
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.HIRE_TYPE == 0) {
				html += "정규직";
			}
			else if (data.HIRE_TYPE == 1) {
				html += "계약직";
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.WORK_TYPE == 0) {
				html += "재직";
			} else if (data.WORK_TYPE == 1) {
				html += "퇴사";
			} else if (data.WORK_TYPE == -1) {
				html += "발령 전";
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.RSGNT_DATE != null) {
				html += data.RSGNT_DATE;
			}
			html += "</div></td> ";
			html += "</tr>                                     ";
		}
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";

	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if ($("#page").val() == 1) {
		html += "<div class=\"page_btn page_prev\" page=\"1\">prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";
	}
	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	if ($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$(".pgn_area").html(html);	
}

function btnSetting() {
	if ($("#inqry_btn").attr("da") == "true") {
		$("#inqry_btn").css("background-color", "#eeeeee");
		$("#inqry_btn").css("color", "#999999");
	} else {
		$("#inqry_btn").css("background-color", "#4B94F2");
		$("#inqry_btn").css("color", "#fff");
	}
	
	if ($("#add_btn").attr("da") == "true") {
		$("#add_btn").css("background-color", "#eeeeee");
		$("#add_btn").css("color", "#999999");
	} else {
		$("#add_btn").css("background-color", "#4B94F2");
		$("#add_btn").css("color", "#fff");
	}
	
	if ($("#del_btn").attr("da") == "true") {
		$("#del_btn").css("background-color", "#eeeeee");
		$("#del_btn").css("color", "#999999");
	} else {
		$("#del_btn").css("background-color", "#fe3a40");
		$("#del_btn").css("color", "#fff");
	}
}

function numMaxLimit(e) {
	if (e.value.length >= 4) {
		if (e.className.indexOf("phone_num_1") != -1) {
			$("#" + e.id).parent("div").children(".phone_num_2").focus();
		}
	}
	if (e.value.length > 4) {
		e.value = e.value.slice(0, 4);
	}
}

function createAddPopup(bankList) {
	var title = "신규사원 추가";
	var html = "";
	var size = [820, 470]; // [width, height]
	
	var phone_num_val = ["02", "031", "032", "033", "041", "042", "043", "044", 
			"051", "052", "053", "054", "055", "061", "062", "063", "064"];
	var mbl_num_val = ["010", "011", "016", "017", "018", "019"];
	
	/* 	추가할 내용
	
		* EMP
			- 이름, 영문이름, 사진파일, 생년월일, 성별, 이메일, 우편번호, 주소, 상세주소, 전화번호, 휴대폰번호
		* SLRY_ACNT
			- 은행번호, 계좌번호, 예금주, 통장사본파일
	*/
	
	html += "<form action=\"#\" id=\"empAddForm\" method=\"post\">";
	html += "<input type=\"hidden\" class=\"upld_file_name\" id=\"emp_pctr_file_name\" name=\"emp_pctr_file\" value=\"";
	html += "\" />";
	html += "<input type=\"hidden\" class=\"upld_file_name\" id=\"bnkbk_copy_file_name\" name=\"bnkbk_copy_file\" value=\"";
	html += "\" />";
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_email\" name=\"email\" value=\"\" />";
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_phone_num\" name=\"phone_num\" value=\"\" />";
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_mbl_num\" name=\"mbl_num\" value=\"\" />";
	
	html += "	<div id=\"emp_add_popup\" >                                                                     ";
	html += "		<div class=\"add_popup_area\" id=\"popup_left\" >";
	html += "			<div class=\"popup_cont_element\" id=\"add_left_e1\">                                                                                     ";
	html += "				<label for=\"add_emp_name\" class=\"popup_cont_name\">사원명* :</label>                                                  ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_emp_name\" name=\"emp_name\" placeholder=\"사원명\" />                          ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e2\">                                                                                     ";
	html += "				<label for=\"add_emp_name_eng\" class=\"popup_cont_name\">영문사원명* :</label>                                              ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_emp_name_eng\" name=\"emp_name_eng\" placeholder=\"사원명(영문)\" />                          ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e3\">                                                                                     ";
	html += "				<label for=\"add_brthdt\" class=\"popup_cont_name\">생년월일* :</label>                                                                ";
	html += "				<input type=\"date\" class=\"popup_cont_text\" id=\"add_brthdt\" name=\"brthdt\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e4\">                                                                                     ";
	html += "				<label for=\"add_emp_name_eng\" class=\"popup_cont_name\">성별* :</label>                                                                ";
	html += "				<label class=\"add_popup_radio_wrap\" for=\"add_gndr_man\" >";
	html += "				<input type=\"radio\" id=\"add_gndr_man\" name=\"gndr\" value=\"0\" checked=\"checked\" /><div class=\"add_popup_radio_item_name\">남성</div> ";
	html += "				</label>";
	html += "				<label class=\"add_popup_radio_wrap\" for=\"add_gndr_woman\" >";
	html += "				<input type=\"radio\" id=\"add_gndr_woman\" name=\"gndr\" value=\"1\" /><div class=\"add_popup_radio_item_name\">여성</div> ";
	html += "				</label>";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e5\">                                                                                     ";
	html += "				<label for=\"add_email\" class=\"popup_cont_name\">이메일* :</label>                                                                ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_email\" placeholder=\"이메일\" />              ";
	html += "				<div class=\"sub_text\">@kakao.com</div>              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e6\">                                                                                     ";
	html += "				<label for=\"add_zip_code\" class=\"popup_cont_name\">주소* :</label>                                                                ";
	html += "				<input type=\"number\" class=\"popup_cont_text\" id=\"add_zip_code\" name=\"zip_code\" placeholder=\"우편번호 검색\" readonly=\"readonly\" />              ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_adrs\" name=\"adrs\" readonly=\"readonly\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e7\">                                                                                     ";
	html += "				<label for=\"add_dtl_adrs\" class=\"popup_cont_name\">상세주소* :</label>                                                                ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_dtl_adrs\" name=\"dtl_adrs\" placeholder=\"상세주소\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e8\">                                                                                     ";
	html += "				<label for=\"add_phone_num\" class=\"popup_cont_name\">전화번호 :</label>                                                                ";
	html += "				<select class=\"popup_cont_text phone_num_sel_box\" id=\"phone_num_sel\">";
	html += "			<option value=\"-1\" selected>---</option>";
	for (var val of phone_num_val) {
		html += "			<option value=\"" + val + "\">" + val + "</option>";
	}
	html += "				</select>";
	html += "				<div class=\"sub_text\">-</div>              ";
	html += "				<input type=\"number\" class=\"popup_cont_text phone_num_1\" id=\"add_phone_num_1\" oninput=\"numMaxLimit(this)\" />              ";
	html += "				<div class=\"sub_text\">-</div>              ";
	html += "				<input type=\"number\" class=\"popup_cont_text phone_num_2\" id=\"add_phone_num_2\" oninput=\"numMaxLimit(this)\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e9\">                                                                                     ";
	html += "				<label for=\"add_mbl_num\" class=\"popup_cont_name\">휴대폰번호* :</label>                                                                ";
	html += "				<select class=\"popup_cont_text phone_num_sel_box\" id=\"mbl_num_sel\">";
	html += "			<option value=\"-1\" selected>---</option>";
	for (var val of mbl_num_val) {
		html += "			<option value=\"" + val + "\">" + val + "</option>";
	}
	html += "				</select>";
	html += "				<div class=\"sub_text\">-</div>              ";
	html += "				<input type=\"number\" class=\"popup_cont_text phone_num_1\" id=\"add_mbl_num_1\" oninput=\"numMaxLimit(this)\" />              ";
	html += "				<div class=\"sub_text\">-</div>              ";
	html += "				<input type=\"number\" class=\"popup_cont_text phone_num_2\" id=\"add_mbl_num_2\" oninput=\"numMaxLimit(this)\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_left_e10\">                                                                                     ";
	html += "				<label for=\"add_adrs\" class=\"popup_cont_name\">고용형태* :</label>                                                                ";
	html += "				<select class=\"popup_cont_text\" id=\"add_hire_type\" name=\"hire_type\">";
	html += "					<option value=\"0\" selected>정규직</option>";
	html += "					<option value=\"1\">계약직</option>";
	html += "					<option value=\"2\">기타</option>";
	html += "				</select>";
	html += "			</div>                                                                                                                                    ";
	
	
	html += "		</div>";
	
	html += "		<div id=\"popup_right\" >";
	html += "		<div class=\"add_popup_area\" id=\"popup_right_top\" >";
	html += "			<div class=\"popup_cont_element\" id=\"edit_right_e1\">                                                                                     ";
	html += "				<label for=\"add_bank_name\" class=\"popup_cont_name\">은행명* :</label>                                                  ";
	html += "				<select class=\"popup_cont_text\" id=\"add_bank_name\" name=\"bank_num\">";
	html += "			<option value=\"-1\" selected>은행을 선택하세요.</option>";
	for (var bl of bankList) {
		html += "			<option value=\"" + bl.BANK_NUM + "\">" + bl.BANK_NAME + "</option>";
	}
	html += "				</select>";
	
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_right_e2\">                                                                                     ";
	html += "				<label for=\"add_acnt_num\" class=\"popup_cont_name\">계좌번호* :</label>                                                                ";
	html += "				<input type=\"number\" class=\"popup_cont_text\" id=\"add_acnt_num\" name=\"acnt_num\" value=\"\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_right_e3\">                                                                                     ";
	html += "				<label for=\"add_dpstr\" class=\"popup_cont_name\">예금주명* :</label>                                                                ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_dpstr\" name=\"dpstr\" value=\"\" />              ";
	html += "			</div>                                                                                                                                    ";
	html += "			<div class=\"popup_cont_element\" id=\"edit_right_e4\">                                                                                     ";
	html += "				<label for=\"add_bnkbk_copy_file\" class=\"popup_cont_name\">통장사본 :</label>                                                        ";
	html += "				<input type=\"text\" class=\"popup_cont_text\" id=\"add_bnkbk_copy_file\" readonly=\"readonly\" placeholder=\"파일을 업로드해주세요\" />    ";
	html += "					<label for=\"bnkbk_copy_file_btn\">";
	html += "				<div class=\"upld_btn\" id=\"bnkbk_copy_file_btn_area\" >";
	html += "				<label for=\"bnkbk_copy_file_btn\">업로드</label>"
	html += "				<input type=\"file\" class=\"upld_file\" id=\"bnkbk_copy_file_btn\" name=\"attFile1\" accept=\"image/*\" />                                                 ";
	html += "				</div>";
	html += "					</label>";
	html += "			</div>                                                                                                                                    ";
	html += "		</div>";
	html += "		<div class=\"add_popup_area\" id=\"popup_right_bottom\" >";
	html += "			<div class=\"popup_cont_element\" id=\"add_right_bottom_e1\">                       ";
	html += "				<div id=\"add_text_area\">";
	html += "					<label for=\"add_emp_pctr_file\" class=\"popup_cont_name\" id=\"right_bottom_e1_name\">사원사진</label>                                                        ";
	html += "					<div id=\"emp_pctr_instrcn_wrap\">";
	html += "						<div class=\"emp_pctr_instrcn_title\">업로드 유의사항</div>";
	html += "						<div class=\"emp_pctr_instrcn_cont\">- 가로:세로 비율이 3:4인 증명사진</div>";
	html += "						<div class=\"emp_pctr_instrcn_cont\">- 단색 배경에서 촬영한 사진</div>";
	html += "						<div class=\"emp_pctr_instrcn_cont\">- 이미지 파일만 업로드</div>";
	html += "						<div class=\"emp_pctr_instrcn_cont\">- (확장자 : .jpg, .png)</div>";
	html += "						<div class=\"emp_pctr_instrcn_cont\">- 단정한 사진으로 올려주세요 ^^</div>";
	html += "					</div>";
	html += "					<input type=\"text\" class=\"popup_cont_text\" id=\"add_emp_pctr_file\" readonly=\"readonly\" placeholder=\"파일을 업로드해주세요\" />    ";

	html += "				</div>";
	html += "				<div id=\"add_pctr_wrap\" >";
	html += "					<div id=\"add_pctr_area\">";
	html += "						<img alt=\"사원이미지\" id=\"emp_pctr_area\" src=\"resources/images/cmn/emp_image.png\"/>";
	html += "					</div>";
	html += "					<label for=\"emp_pctr_file_btn\">";
	html += "					<div class=\"upld_btn\" id=\"emp_pctr_file_btn_area\" >";
	html += "						<label for=\"emp_pctr_file_btn\">업로드</label>"
	html += "						<input type=\"file\" class=\"upld_file\" id=\"emp_pctr_file_btn\" name=\"attFile2\" accept=\".jpg,.png\" />          ";
	html += "					</div>";
	html += "					</label>";
	html += "				</div>";
	html += "			</div>             ";
	html += "		</div>";
	html += "		</div>";
	html += "	</div>                                                                                                                                        ";

	html += "</form>";
	
	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "추가",
			func:function() {
				var flag = false;
				var file_exist = 0;

				$(".popup_cont_element input[type=text]").css("outline", "1px solid #00000033");
				$(".popup_cont_element input[type=date]").css("outline", "1px solid #00000033");
				$(".popup_cont_element select").css("outline", "1px solid #00000033");
				if (checkEmpty("#add_emp_name")) {
					$("#add_emp_name").css("outline", "2px solid #fe3a40");
					$("#add_emp_name").focus();
				} else if (checkEmpty("#add_emp_name_eng")) {
					$("#add_emp_name_eng").css("outline", "2px solid #fe3a40");
					$("#add_emp_name_eng").focus();
				} else if (checkEmpty("#add_brthdt")) {
					$("#add_brthdt").css("outline", "2px solid #fe3a40");
					$("#add_brthdt").focus();
				} else if (!$("#add_gndr_man").is(":checked") && !$("#add_gndr_woman").is(":checked")) {
					console.log("성별 선택안됨");
				} else if (checkEmpty("#add_email")) {
					$("#add_email").css("outline", "2px solid #fe3a40");
					$("#add_email").focus();
				} else if (checkEmpty("#add_zip_code")) {
					$("#add_zip_code").css("outline", "2px solid #fe3a40");
					$("#add_zip_code").focus();
				} else if (checkEmpty("#add_adrs")) {
					$("#add_adrs").css("outline", "2px solid #fe3a40");
					$("#add_adrs").focus();
				} else if (checkEmpty("#add_dtl_adrs")) {
					$("#add_dtl_adrs").css("outline", "2px solid #fe3a40");
					$("#add_dtl_adrs").focus();
				} else if (($("#phone_num_sel").val() == "-1" || checkEmpty("#add_phone_num_1") || checkEmpty("#add_phone_num_2")) &&
						!($("#phone_num_sel").val() == "-1" && checkEmpty("#add_phone_num_1") && checkEmpty("#add_phone_num_2"))){
					console.log("check 1");
					if ($("#phone_num_sel").val() == "-1") {
						$("#phone_num_sel").css("outline", "2px solid #fe3a40");
						$("#phone_num_sel").focus();
					} else if (checkEmpty("#add_phone_num_1")) {
						$("#add_phone_num_1").css("outline", "2px solid #fe3a40");
						$("#add_phone_num_1").focus();
					} else if (checkEmpty("#add_phone_num_2")) {
						$("#add_phone_num_2").css("outline", "2px solid #fe3a40");
						$("#add_phone_num_2").focus();
					}
				} else if ($("#mbl_num_sel").val() == "-1" || checkEmpty("#add_mbl_num_1") || checkEmpty("#add_mbl_num_2")){
					console.log("check 2");
					if ($("#mbl_num_sel").val() == "-1") {
						$("#mbl_num_sel").css("outline", "2px solid #fe3a40");
						$("#mbl_num_sel").focus();
					} else if (checkEmpty("#add_mbl_num_1")) {
						$("#add_mbl_num_1").css("outline", "2px solid #fe3a40");
						$("#add_mbl_num_1").focus();
					} else if (checkEmpty("#add_mbl_num_2")) {
						$("#add_mbl_num_2").css("outline", "2px solid #fe3a40");
						$("#add_mbl_num_2").focus();
					}
				} else if ($("#add_bank_name").val() == "-1") {
					$("#add_bank_name").css("outline", "2px solid #fe3a40");
					$("#add_bank_name").focus();
				} else if (checkEmpty("#add_acnt_num")) {
					$("#add_acnt_num").css("outline", "2px solid #fe3a40");
					$("#add_acnt_num").focus();
				} else if (checkEmpty("#add_dpstr")) {
					$("#add_dpstr").css("outline", "2px solid #fe3a40");
					$("#add_dpstr").focus();
				} else {
					console.log("check 3");
					flag = true;
				}
				if (!checkEmpty("#add_bnkbk_copy_file")) {
					file_exist++;
				}
				if (!checkEmpty("#add_emp_pctr_file")) {
					file_exist++;
				}
				if (flag) {
					$("#merge_email").val($("#add_email").val() + "@kakao.com");
					if ($("#phone_num_sel").val() != "-1") {
						$("#merge_phone_num").val($("#phone_num_sel").val() + "-" + $("#add_phone_num_1").val() + "-" +$("#add_phone_num_2").val());
					}
					$("#merge_mbl_num").val($("#mbl_num_sel").val() + "-" + $("#add_mbl_num_1").val() + "-" +$("#add_mbl_num_2").val());
					
					if (file_exist > 0) {
						var editForm = $("#empAddForm");
						
						editForm.attr("action", "imageUploadAjax");
						editForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if (res.fileName.length > 0) {
									if (res.fileName.length == 1 && file_exist == 1) {
										if (!checkEmpty("#add_bnkbk_copy_file")) {
											$("#bnkbk_copy_file_name").val(res.fileName[0]);
										}
										if (!checkEmpty("#add_emp_pctr_file")) {
											$("#emp_pctr_file_name").val(res.fileName[0]);
										}
									} else if (res.fileName.length == 2 && file_exist == 2) {
										$("#bnkbk_copy_file_name").val(res.fileName[0]);
										$("#emp_pctr_file_name").val(res.fileName[1]);
									} else {
										console.log("뭔가 이상한데..?");
									}
									
									console.log("통장사본: " + $("#bnkbk_copy_file_name").val());
									console.log("사원사진: " + $("#emp_pctr_file_name").val());

									empAddFormAjaxFunction();
								}
							},
							error : function(request) {
								console.log(request.responseText);
							}
						});
						
						editForm.submit();
					} else {
						empAddFormAjaxFunction();
					}
				}
			}
		}, {
			name : "취소"
		}]
	});
}

function empAddFormAjaxFunction() {
	var params = $("#empAddForm").serialize();
	
	$.ajax({
		type : "post",
		url : "empInqryActionAjax/insert",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.res == "success") {
				closePopup();
				createAddSuccessPopup(res.newEmpInfo);
			} else {
				makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
			}
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function createAddSuccessPopup(params) {
	var title = "사원추가 성공";
	var html = "";
	var size = [360, 270]; // [width, height]
	
	html += "	<div id=\"add_success_popup\" >                                                                     ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_zip_code\" class=\"popup_cont_name\">사원번호 :</label>                                                                ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" value=\"" + params.EMP_NUM + "\" readonly=\"\" />              ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_emp_name\" class=\"popup_cont_name\">사원명 :</label>                                                  ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" value=\"" + params.EMP_NAME + "\" readonly=\"\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_emp_name_eng\" class=\"popup_cont_name\">영문사원명 :</label>                                              ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" value=\"" + params.EMP_NAME_ENG + "\" readonly=\"\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_brthdt\" class=\"popup_cont_name\">생년월일 :</label>                                                                ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" value=\"" + params.BRTHDT + "\" readonly=\"\" />              ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_emp_name_eng\" class=\"popup_cont_name\">성별 :</label>                                                                ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" value=\"" 
	if (params.GNDR == "0") {
		html += "남성";
	} else {
		html += "여성";
	}
	html += "\" readonly=\"\" />              ";
	html += "		</div>                          ";
	html += "	</div>";

	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "확인",
			func:function() {
				closePopup();
				location.reload();
			}
		}]
	});
}

function deleteCheck() {
	var params = $("#inqryForm").serialize();
	
	$.ajax({
		type : "post",
		url : "empInqryActionAjax/deleteCheck",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.res == "success") {
				if (res.delCheck == "1") {
					createDeletePopup(res.edctnLevelCount, res.crCount, res.qlfctnCount);
				} else {
					createDeleteFailedPopup();
				}
			} else {
				makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
			}
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function createDeletePopup(el, cr, qlfctn) {
	var title = "사원정보 삭제";
	var html = "";
	var size = [330, 230]; // [width, height]
	
	html += "	<div id=\"delete_popup\" >                                                                     ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"el_count\" class=\"popup_cont_name\">학력사항 :</label>                                                                ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" id=\"el_count\" value=\"" + el + " 개\" readonly=\"\" />              ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_emp_name\" class=\"popup_cont_name\">경력사항 :</label>                                                  ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" id=\"el_count\" value=\"" + cr + " 개\" readonly=\"\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "			<label for=\"add_emp_name_eng\" class=\"popup_cont_name\">자격사항 :</label>                                              ";
	html += "			<input type=\"text\" class=\"read_popup_cont_text\" id=\"el_count\" value=\"" + qlfctn + " 개\" readonly=\"\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\" id=\"delete_info_text\">                                                                                     ";
	html += "			해당 사원과 연결된 정보도 함께 삭제합니다.";
	html += "		</div>            ";
	html += "	</div>";

	
	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "확인",
			func:function() {
				var params = $("#inqryForm").serialize();
				
				$.ajax({
					type : "post",
					url : "empInqryActionAjax/delete",
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "success") {
							closePopup();
							makeAlert("작업 완료", "삭제되었습니다.", function() {
								location.reload();
							});
						} else {
							makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
						}
					},
					error : function(request, status, error) {
						console.log(request.responseText);
					}
				});
			}
		}, {
			name : "취소"
		}]
	});
}

function createDeleteFailedPopup() {
	var title = "사원정보 삭제 불가";
	var html = "";
	var size = [400, 150]; // [width, height]
	
	html += "	<div id=\"delete_failed_popup\" >                                                                     ";
	html += "		<div class=\"popup_cont_element\">                                                                                     ";
	html += "		<div class=\"popup_cont_element\" id=\"delete_failed_info_text\">                                                                                     ";
	html += "			발령 기록이 존재하는 사원은 삭제할 수 없습니다.";
	html += "		</div>                                                  ";
	html += "	</div>";
	html += "	</div>";


	
	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "확인",
			func:function() {
				closePopup();
			}
		}]
	});
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
			<div class="page_title_text">사원조회</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="func_btn" id="del_btn" da="true">삭제</div>
			<div class="func_btn" id="add_btn" da="false">신규</div>
			<div class="func_btn" id="inqry_btn" da="true">조회</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<input type="hidden" id="old_srch_sel" value="${param.srch_sel}" />
			<input type="hidden" id="old_srch_txt" value="${param.srch_txt}" />
			<input type="hidden" id="old_work_clsftn" value="${param.work_clsftn}" />
			<input type="hidden" id="old_emplynt_type" value="${param.emplynt_type}" />
			<input type="hidden" id="old_join_date" value="${param.join_date}" />
			<input type="hidden" id="old_prd_start" value="${param.prd_start}" />
			<input type="hidden" id="old_prd_end" value="${param.prd_end}" />
			<form action="#" id="inqryForm" method="post">
				<input type="hidden" id="i_top" name="top" value="${param.top}" />
				<input type="hidden" id="i_menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="i_menuType" name="menuType" value="${param.menuType}" />
				<input type="hidden" id="page" name="page" value="${page}" />
				<input type="hidden" id="empNum" name="empNum" value="-1" />
				<input type="hidden" id="superEmpNum" name="superEmpNum" value="${sEmpNum}" />
				<div class="srch_wrap">
					<div class="page_srch_area">
						<select class="srch_sel" name="srch_sel">
							<option value="-1" selected>전체</option>
							<option value="0">사원번호</option>
							<option value="1">사원명</option>
							<option value="2">부서명</option>
						</select>
						<div class="srch_text_wrap">
							<input type="text" id="srch_txt" name="srch_txt" value="${param.srch_txt}" />
						</div>
						<div class="cmn_btn_ml">검색</div>
					</div>
					<div class="srch_cndt_area">
						<div class="item_wrap" id="left_item_wrap">
							<div class="radio_wrap" id="work_clsftn">
								<div class="radio_title">재직구분</div>
								<input type="radio" id="work_clsftn_entr" name="work_clsftn" value="-1" checked="checked" /><label class="radio_item_name" for="work_clsftn_entr">전체</label>
								<input type="radio" id="work_clsftn_work" name="work_clsftn" value="0" /><label class="radio_item_name" for="work_clsftn_work">재직</label>
								<input type="radio" id="work_clsftn_rsgnt" name="work_clsftn" value="1" /><label class="radio_item_name" for="work_clsftn_rsgnt">퇴사</label>
							</div>
							<div class="radio_wrap" id="emplynt_type">
								<div class="radio_title">고용형태</div>
								<input type="radio" id="emplynt_type_entr" name="emplynt_type" value="-1" checked="checked" /><label class="radio_item_name" for="emplynt_type_entr">전체</label>
								<input type="radio" id="emplynt_type_rgl_wrk" name="emplynt_type" value="0" /><label class="radio_item_name" for="emplynt_type_rgl_wrk">정규직</label>
								<input type="radio" id="emplynt_type_cntr_wrk" name="emplynt_type" value="1" /><label class="radio_item_name" for="emplynt_type_cntr_wrk">계약직</label>
							</div>
						</div>
						<div class="item_wrap">
							<div class="radio_wrap" id="join_date">
								<div class="radio_title">입사일</div>
								<input type="radio" id="join_date_entr" name="join_date" value="-1" checked="checked" /><label class="radio_item_name" for="join_date_entr">전체</label>
								<input type="radio" id="join_date_prd_dsgnt" name="join_date" value="0" /><label class="radio_item_name" for="join_date_prd_dsgnt">기간지정</label>
							</div>
							<div class="prd_wrap">
								<div id="prd_wrap_empty"></div>
								<div class="prd_text_wrap">
									<input type="date" class="prd_text" id="prd_start" name="prd_start" disabled="disabled" />
								</div>
								<div class="prd_clsftn">~</div>
								<div class="prd_text_wrap">
									<input type="date" class="prd_text" id="prd_end" name="prd_end" disabled="disabled" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="rslt_wrap">
				<div class="rslt_area">
					<table id="srch_rslt">
					<colgroup>
						<col width="10%" />
						<col width="12%" />
						<col width="12%" />
						<col width="8%" />
						<col width="14%" />
						<col width="12%" />
						<col width="10%" />
						<col width="10%" />
						<col width="12%" />
					</colgroup>
						<thead>
							<tr>
								<th>사원번호</th>
								<th>사원명</th>
								<th>소속부서</th>
								<th>직급</th>
								<th>연락처</th>
								<th>입사일</th>
								<th>고용형태</th>
								<th>재직구분</th>
								<th>퇴사일</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="pgn_area">

				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>