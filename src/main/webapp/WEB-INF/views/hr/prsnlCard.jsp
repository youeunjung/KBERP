<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 인사기록카드</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.dtl_cont {
	display: block;
	border-top: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
/* 	background-color: #4B94F233;*/
}
#top_area {
	width: 100%;
	height: 240px;
	display: inline-block;
	vertical-align: top;
	margin-bottom: 5px;
}
#bottom_area {
	width: 100%;
	height: 320px;
	display: inline-block;
	vertical-align: top;
}
#left_top {
	display: inline-block;
	vertical-align: top;
	width: 551px;
	height: 238px;
	margin-right: 7px;
}
#right_top {
	display: inline-block;
	vertical-align: top;
	width: 320px;
	height: 238px;
}
#bottom {
	display: inline-block;
	vertical-align: top;
	width: 878px;
	height: 318px;
}

#table_area {
	width: 872px;
	height: 278px;
	/* overflow-y: auto; */
}

#basic_info_area {
	display: inline-block;
	vertical-align: top;
	width: 164px;
	height: 222px;
	margin: 8px 10px 8px 0px;
	padding-left: 0px;
}
#basic_info_area_right {
	width: 142px;
	display: inline-block;
	vertical-align: top;
	margin-right: 0px;
}
#rt_l1 {
	height: 30px;
	width: 161px;
	margin: 6px 0px 0px 0px;
}
#rt_l1_e1 .cont_name {
	display: inline-block;
	vertical-align: center;
	width: 50px;
	margin-left: 5px;
}
#rt_l1_e1 .cont_text {
	display: inline-block;
	vertical-align: center;
	background-color: #ffffff00;
	outline: 0;
	font-weight: 700;
	text-align: right;
	width: 80px;
}
#pctr_area {
	width: 141px;
	height: 188px;
	margin: 5px 0px 10px 1px;
}
#emp_pctr_area {
	width: 100%;
	height: 100%;
	object-fit: contain;
}
.cont_line_rt {
	margin-top: 16px;
	margin-bottom: 2px;
}
.cont_element {
	display: inline-block;
	vertical-align: top;
	height: 36px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#lt1_l1_e1 {
	width: 248px;
}
#lt1_l1_e2 {
	width: 252px;
}
#lt1_l1_e3 {
	width: 45px;
}
#lt1_l2_e1 {
	width: 132px;
}
#lt1_l2_e2 {
	width: 413px;
}
#lt1_l3_e1 {
	width: 545px;
}
#lt1_l4_e1 {
	width: 150px;
}
#lt1_l4_e2 {
	width: 150px;
}
#lt1_l4_e3 {
	width: 245px;
}

#lt2_l1_e1 {
	width: 181px;
}
#lt2_l1_e2 {
	width: 182px;
}
#lt2_l1_e3 {
	width: 182px;
}
#lt2_l2_e1 {
	width: 272px;
}
#lt2_l2_e2 {
	width: 273px;
}

#lt3_l1_e1 {
	width: 175px;
}
#lt3_l1_e2 {
	width: 370px;
}
#lt3_l2_e1 {
	width: 220px;
}
#lt3_l2_e2 {
	width: 325px;
}

#lt4_l1_e1 {
	width: 260px;
}
#lt4_l1_e2 {
	width: 260px;
}
#lt4_l2_e1 {
	width: 130px;
}
#lt4_l2_e2 {
	width: 130px;
}
#lt4_l2_e3 {
	width: 130px;
}
#lt4_l2_e4 {
	width: 130px;
}
#lt4_l3_e1 {
	width: 260px;
}
#lt4_l3_e2 {
	width: 260px;
}

#edit_zip_code {
	width: 180px;
}

.cont_line {
	margin-top: 12px;
	margin-left: 6px;
}
.cont_name {
	display: block;
	background-color: #ffffff00;
	font-size: 12px;
	color: #4B94F2;
}
.cont_text {
	display: block;
	width: calc(100% - 10px);
	height: 24px;
	background-color: #ffffff;
	text-align: left;
	font-size: 14px;
	padding: 0px 0px 0px 4px;
	margin: 2px 0px 0px 0px;
	border: 0px;
	outline: 1px solid #00000033;
}
#left_top_tab {
	display: block;
	width: 100%;
	height: 24px;
}
#left_top_cont {
	display: block;
	width: 100%;
	height: 214px;
}
#left_top_cont .cont_text {
	display: inline-block;
	vertical-align: top;
}

#bottom_tab {
	display: block;
	width: 100%;
	height: 24px;
}
#bottom_cont {
	display: block;
	width: calc(100% - 6px);
	height: 278px;
	padding: 8px 3px 8px 3px;
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
	font-size: 11pt;
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

.td_cont_text {
	height: 100%;
	width: 100%;
	background: none;
	border: 0;
	outline: 0;
	padding-left: 10px;
	font-size: 9pt;
}


.tab_btn {
	display: inline-block;
	vertical-align: top;
	width: 80px;
	height: 22px;
	border: 1px solid #00000022;
	border-radius: 6px 6px 0px 0px;
	background-color: #FFF;
	color: #4B94F2;
	font-size: 8pt;
	text-align: center;
	line-height: 22px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.func_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 48px;
	height: 20px;
	border: 1px solid #00000022;
	border-radius: 4px 4px 0px 0px;
	font-size: 7pt;
	font-weight: 900;
	text-align: center;
	line-height: 22px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#lt_edit_btn {
	background-color: #F2CB05;
	color: #222;
	float: right;
	margin-top: 2px;
}

#lt_edit_btn:hover {
	background-color: #F2B705;
	cursor: pointer;
}

#btm_add_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-top: 2px;
	margin-left: 2px;
}

#btm_add_btn:hover {
	background-color: #2E83F2;
	cursor: pointer;
}

#btm_del_btn {
	background-color: #fe3a40;
	color: #fff;
	float: right;
	margin-top: 2px;
}
/* 
#btm_del_btn:hover {
	background-color: #ff1016;
	cursor: pointer;
} */


.admnstr_btn {
	display: inline-block;
	vertical-align: top;
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

#a_list_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#a_edit_btn {
	background-color: #F2CB05;
	color: #222;
	float: right;
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

#slry_info_edit_popup .popup_cont_name {
	width: 90px;
}
#slry_info_edit_popup .popup_cont_text {
	width: calc(100% - 116px);
}
#edit_lt3_e4 #edit_bnkbk_copy {
	width: calc(100% - 186px);
}

.sub_text {
	display: inline-block;
	vertical-align: center;
	font-size: 10pt;
	color: #666666;
}

#edit_email {
	width: 300px;
}


#edit_zip_code {
	width: 100px;
}
#edit_zip_code:hover {
	cursor: pointer;
}

#edit_adrs {
	width: 270px;
	margin-left: 4px;
}
#edit_adrs:hover {
	cursor: pointer;
}

.phone_num_sel_box {
	width: 91px;
	font-size: 9pt;
}

#edit_phone_num_1 {
	width: 128px;
}
#edit_phone_num_2 {
	width: 128px;
}
#edit_mbl_num_1 {
	width: 128px;
}
#edit_mbl_num_2 {
	width: 128px;
}

input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#add_grdtn_crtfct {
	width: calc(100% - 166px);
}

#cr_add_popup .popup_cont_name {
	width: 80px;
}
#cr_add_popup .popup_cont_text {
	width: calc(100% - 106px);
}

#qlfctn_add_popup #add_copy_file {
	width: calc(100% - 166px);
}

#admnstr_edit_popup #edit_emp_pctr_file {
	width: calc(100% - 166px);
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
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function tabBtnSelected(obj) {
	$(obj).parents(".tab_bar").children(".tab_btn").css("background-color", "#FFF");
	$(obj).parents(".tab_bar").children(".tab_btn").css("color", "#4B94F2");
	$(obj).css("background-color", "#4B94F2");
	$(obj).css("color", "#FFF");
} 

// 탭 내용 전환
function tabContChange(tId, data, dataList) {
	var check = -1;
	var html = "";
	
	switch (tId) {
	// 인적정보
	case "human_info_btn" :
		console.log("인적정보 탭");
		html += "	<div class=\"cont_line\">                                                                                            ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">주민등록번호</div>                                                                      ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		var brthdt = data.BRTHDT.split("-");
		var year = brthdt[0].slice(-2, 4);
		html += year + brthdt[1] + brthdt[2] + "-";
		if (data.GNDR == 0) {
			if (brthdt[0] < 2000) {
				html += "1";
			} else {
				html += "3";
			}
		} else {
			if (brthdt[0] < 2000) {
				html += "2";
			} else {
				html += "4";
			}
		}
		html += "******" + "\" />";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">생년월일</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"brthdt\" readonly=\"readonly\" value=\"";
		html += brthdt[0] + "년 " + brthdt[1] + "월 " + brthdt[2] + "일";
		html += "\" />        ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e3\">                                                                         ";
		html += "		<div class=\"cont_name\">성별</div>                                                                              ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"gndr\" readonly=\"readonly\" value=\"";
		if (data.GNDR == 0) {
			html += "남";
		} else {
			html += "여";
		}
		html += "\" />                       ";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l2_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">우편번호</div>                                                                            ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"zip_code\" readonly=\"readonly\" value=\"";
		html += data.ZIP_CODE;
		html += "\" />       ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l2_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">주소</div>                                                                              ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"adrs\" readonly=\"readonly\" value=\"";
		html += data.ADRS;
		html += "\" />";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l3_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">상세주소</div>                                                                              ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"dtl_adrs\" readonly=\"readonly\" value=\"";
		html += data.DTL_ADRS;
		html += "\" />";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l4_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">전화번호</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"tlphn_num\" readonly=\"readonly\" value=\"";
		if (data.PHONE_NUM != null) {
			html += data.PHONE_NUM;
		} else {
			html += "-";
		}
		html += "\" />                    ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l4_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">휴대폰번호</div>                                                                        ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"mbl_num\" readonly=\"readonly\" value=\"";
		html += data.MBL_NUM;
		html += "\" />         ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l4_e3\">                                                                         ";
		html += "		<div class=\"cont_name\">E-mail</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"email\" readonly=\"readonly\" value=\"";
		html += data.EMAIL;
		html +="\" /> ";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		$("#lt_edit_btn").show();
		$("#left_top_cont").html(html);
		check = 0;
		break;
	
	// 재직정보
	case "work_info_btn" :
		console.log("재직정보 탭");
		html += "	<div class=\"cont_line\">                                                                                      ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">고용형태</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.HIRE_TYPE == 0) {
			html += "정규직";
		}
		else if (data.HIRE_TYPE == 1) {
			html += "계약직";
		} else {
			html += "기타";
		}
		html += "\" />  ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">재직구분</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.WORK_TYPE == 0) {
			html += "재직";
		} else if (data.WORK_TYPE == 1) {
			html += "퇴사";
		} else if (data.WORK_TYPE == -1) {
			html += "발령 전";
		}
		html += "\" />    ";
		html += "	</div>   ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e3\">                                                                  ";
		html += "		<div class=\"cont_name\">수습여부</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.PRBTN_CHECK == 0) {
			html += "N";
		} else {
			html += "Y";
		}
		html += "\" />       ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		html += "<br/>                                                                                                             ";
		html += "<div class=\"cont_line\">                                                                                         ";  
		html += "	<div class=\"cont_element\" id=\"lt2_l2_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">입사일</div>                                                                      ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"join_date\" readonly=\"readonly\" value=\"";
		html += data.JOIN_DATE;
		html += "\" />   ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l2_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">퇴사일</div>                                                                      ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsgnt_date\" readonly=\"readonly\" value=\"";
		html += data.RSGNT_DATE;
		html += "\" />                   ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		$("#lt_edit_btn").hide();
		$("#left_top_cont").html(html);
		check = 0;
		break;
	
	// 급여정보
	case "slry_info_btn" :
		console.log("급여정보 탭");
		html += "	<div class=\"cont_line\">";
		html += "	<div class=\"cont_element\" id=\"lt3_l1_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">급여이체은행</div>                                                                       ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"slry_trnsf_bank\" readonly=\"readonly\" value=\"";
		if (data != null && data.BANK_NAME != null) {
			html += data.BANK_NAME;
		} else {
			html += "-";
		}
		html += "\" />       ";
		html += "	</div>                                                                                                                ";
		html += "	<div class=\"cont_element\" id=\"lt3_l1_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">급여이체계좌번호</div>                                                                   ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"slry_trnsf_acnt\" readonly=\"readonly\" value=\"";
		if (data != null && data.ACNT_NUM != null) {
			html += data.ACNT_NUM;
		} else {
			html += "-";
		}
		html += "\" /> ";
		html += "	</div>                                                                                                                ";
		html += "</div>                                                                                                                   ";
		html += "<br/>                                                                                                                    ";
		html += "<div class=\"cont_line\">                                                                                                ";
		html += "	<div class=\"cont_element\" id=\"lt3_l2_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">예금주</div>                                                                             ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"dpstr\" readonly=\"readonly\" value=\"";
		if (data != null && data.DPSTR != null) {
			html += data.DPSTR;
		} else {
			html += "-";
		}
		html += "\" />                   ";
		html += "	</div>                                                                                                                ";
		html += "	<div class=\"cont_element\" id=\"lt3_l2_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">통장사본 파일</div>                                                                             ";
		html += "		<br/>                                                                                                             ";
		if (data != null && data.BNKBK_COPY_FILE != null) {
			var fileLength = data.BNKBK_COPY_FILE.length;
			var fileName = data.BNKBK_COPY_FILE.substring(20, fileLength);
			html += "		<a href=\"resources/upload/" + data.BNKBK_COPY_FILE + "\" download=\"" + fileName + "\"><input type=\"text\" title=\"파일 다운로드\" class=\"cont_text\" id=\"bnkbk_copy_file\" readonly=\"readonly\" value=\"" + fileName + "\" /></a>";
		} else {
			html += "		<input type=\"text\" class=\"cont_text\" id=\"bnkbk_copy_file\" readonly=\"readonly\" value=\"\" />                   ";
		}
		html += "	</div>                                                                                                                ";
		html += "</div>                                                                                                                   ";
		$("#lt_edit_btn").show();
		$("#left_top_cont").html(html);
		check = 0;
		break;
		
	// 학력사항
	case "edctn_level_btn" :
		console.log("학력사항 탭");
		html += "<table id=\"btm1_table\">                                   ";
		html += "<colgroup>                                                  ";
		html += "<col width=\"20%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "<col width=\"14%\" />                                       ";
		html += "<col width=\"10%\" />                                       ";
		html += "<col width=\"20%\" />                                       ";
		html += "	<thead>                                                  ";
		html += "		<tr>                                                 ";
		html += "			<th>학교명</th>                                  ";
		html += "			<th>입학일</th>                                  ";
		html += "			<th>졸업일</th>                                  ";
		html += "			<th>학점</th>                                    ";
		html += "			<th>학적구분</th>                                    ";
		html += "			<th>증명서파일</th>                                    ";
		html += "		</tr>                                                ";
		html += "	</thead>                                                 ";
		html += "	<tbody>                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.EDCTN_LEVEL_NUM + "\">                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.SCHL_NAME + "</div></td> ";
			html += "			<td><div class=\"td_cont\">" + dl.ADMSN_DATE + "</div></td> ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.GRDTN_DATE != null) {
				html += dl.GRDTN_DATE;
			}
			html += "</div></td> ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.GRADE != null) {
				html += dl.GRADE;
			}
			html += "</div></td>  ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.SCHL_REGSTR_DVSN == "0") {
				html += "졸업";
			} else if (dl.SCHL_REGSTR_DVSN == "1") {
				html += "수료";
			} else if (dl.SCHL_REGSTR_DVSN == "2") {
				html += "휴학";
			} else if (dl.SCHL_REGSTR_DVSN == "3") {
				html += "퇴학";
			}
			html += "</div></td>  ";
			html += "<td";
			if (dl.GRDTN_CRTFCT_FILE != null) {
				html += " onclick=\"event.cancelBubble=true\">";
				var fileLength = dl.GRDTN_CRTFCT_FILE.length;
				var fileName = dl.GRDTN_CRTFCT_FILE.substring(20, fileLength);
				html += "		<a class=\"td_cont\" href=\"resources/upload/" + dl.GRDTN_CRTFCT_FILE + "\" download=\"" + fileName + "\"><input type=\"text\" title=\"파일 다운로드\" class=\"td_cont_text grdtn_crtfct_file\" readonly=\"readonly\" value=\"" + fileName + "\" /></a>";
			} else {
				html += ">";
				html += "		<div class=\"td_cont grdtn_crtfct_file\"></div>                   ";
			}
			
			html += "		</tr>                                                ";
		}
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "		</tr>                                                ";
			}
		}
		
		html += "	</tbody>                                                 ";
		html += "</table>                                                    ";

		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
		
	// 경력사항
	case "cr_btn" :
		console.log("경력사항 탭");
		html += "<table id=\"btm2_table\">                                                   ";
		html += "<colgroup>                                                                  ";
		html += "<col width=\"18%\" />                                                       ";
		html += "<col width=\"28%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "	<thead>                                                                  ";
		html += "		<tr>                                                                 ";
		html += "			<th>회사(단체)명</th>                                            ";
		html += "			<th>근무기간</th>                                                ";
		html += "			<th>소속부서</th>                                                ";
		html += "			<th>직위</th>                                                    ";
		html += "			<th>직무</th>                                                    ";
		html += "		</tr>                                                                ";
		html += "	</thead>                                                                 ";
		html += "	<tbody>                                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.CR_NUM + "\">                                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.CMPNY_NAME + "</div></td>                   ";
			html += "			<td><div class=\"td_cont\">" + dl.JOIN_DATE + " ~ " + dl.RSGNT_DATE + "</div></td>    ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.DEPT != null) {
				html += dl.DEPT;
			}
			html += "</div></td>                     ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.PSTN != null) {
				html += dl.PSTN;
			}
			html += "</div></td>                       ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.JOB != null) {
				html += dl.JOB;
			}
			html += "</div></td>                    ";
			html += "		</tr>                                                                ";
		}
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td>                     ";
				html += "			<td><div class=\"td_cont\"></div></td>    ";
				html += "			<td><div class=\"td_cont\"></div></td>                     ";
				html += "			<td><div class=\"td_cont\"></div></td>                       ";
				html += "			<td><div class=\"td_cont\"></div></td>                    ";
				html += "		</tr>                                                                ";
			}
		}
		
		html += "	</tbody>                                                                 ";
		html += "</table>                                                                    ";
		
		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
		
		
	// 자격사항
	case "qlfctn_btn" :
		console.log("자격사항 탭");
		html += "<table id=\"btm3_table\">                                   ";
		html += "<colgroup>                                                  ";
		html += "<col width=\"20%\" />                                       ";
		html += "<col width=\"14%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "<col width=\"14%\" />                                       ";
		html += "<col width=\"14%\" />                                       ";
		html += "<col width=\"20%\" />                                       ";
		html += "	<thead>                                                  ";
		html += "		<tr>                                                 ";
		html += "			<th>자격(면허)증명</th>                          ";
		html += "			<th>취득일자</th>                                ";
		html += "			<th>발급기관</th>                                ";
		html += "			<th>취득점수</th>                                ";
		html += "			<th>만료기한</th>                                ";
		html += "			<th>증빙자료</th>                                ";
		html += "		</tr>                                                ";
		html += "	</thead>                                                 ";
		html += "	<tbody>                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.LCNS_NUM + "\">                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.LCNS_NAME + "</div></td>      ";
			html += "			<td><div class=\"td_cont\">" + dl.ACQRMNT_DATE + "</div></td> ";
			html += "			<td><div class=\"td_cont\">" + dl.ISSUE_ORGNZT + "</div></td>        ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.ACQRMNT_SCORE != null) {
				html += dl.ACQRMNT_SCORE;
			}
			html += "</div></td>        ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.EXPRTN_DATE != null) {
				html += dl.EXPRTN_DATE;
			}
			html += "</div></td> ";
			html += "<td";
			if (dl.COPY_FILE != null) {
				html += " onclick=\"event.cancelBubble=true\">";
				var fileLength = dl.COPY_FILE.length;
				var fileName = dl.COPY_FILE.substring(20, fileLength);
				html += "		<a class=\"td_cont\" href=\"resources/upload/" + dl.COPY_FILE + "\" download=\"" + fileName + "\"><input type=\"text\" title=\"파일 다운로드\" class=\"td_cont_text copy_file\" readonly=\"readonly\" value=\"" + fileName + "\" /></a>";
			} else {
				html += ">";
				html += "		<div class=\"td_cont copy_file\"></div>                   ";
			}
			html += "		</tr>                                                ";
		}
		
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td>";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td>    ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "		</tr>                                                ";
			}
		}
		
		html += "	</tbody>                                                 ";
		html += "</table>                                                    ";
		
		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
	}
	
	if (check == 0) { // 상단탭
		$("#selectedTopTab").val(tId);
	} else {
		$("#selectedBottomTab").val(tId);
	}
}

function createAddPopup(pId) {
	console.log(pId);
	var title = "";
	var html = "";
	var size = [520, 310]; // [width, height]
	
	html += "<form action=\"#\" id=\"addForm\" method=\"post\">";
	html += "<input type=\"hidden\" class=\"popup_id\" name=\"popup_id\" value=\"" + pId + "\" />";
	html += "<input type=\"hidden\" name=\"empNum\" value=\"" + $("#nEmpNum").val() + "\" />";
	
	switch (pId) {
	case "edctn_level_btn" :
		title = "학력사항 추가";

		html += "<input type=\"hidden\" class=\"upld_file_name\" name=\"grdtn_crtfct_file\" />";
		
		html += "	<div id=\"edctn_level_add_popup\" >                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e1\">                                                                                        ";
		html += "			<label for=\"add_schl_name\" class=\"popup_cont_name\">학교명* :</label>                                                                   ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_schl_name\" name=\"schl_name\" placeholder=\"학교명\" />                                             ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e2\">                                                                                        ";
		html += "			<label for=\"add_admsn_day\" class=\"popup_cont_name\">입학일* :</label>                                                                   ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_admsn_date\" name=\"admsn_date\" />                   ";
		html += "			<div class=\"prd_sel_btn\" id=\"admsn_day_btn\"></div>                                                                                    ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e3\">                                                                                        ";
		html += "			<label for=\"add_grdtn_day\" class=\"popup_cont_name\">졸업일 :</label>                                                                   ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_grdtn_date\" name=\"grdtn_date\" />                   ";
		html += "			<div class=\"prd_sel_btn\" id=\"grdtn_day_btn\"></div>                                                                                    ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e4\">                                                                                        ";
		html += "			<label for=\"add_grade\" class=\"popup_cont_name\">학점 :</label>                                                                         ";
		html += "			<input type=\"number\" class=\"popup_cont_text\" id=\"add_grade\" name=\"grade\" placeholder=\"학점\" />                                                   ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e5\">                                                                                        ";
		html += "			<label for=\"add_clsftn\" class=\"popup_cont_name\">학적구분* :</label>                                                                    ";
		html += "		<select class=\"popup_cont_text\" id=\"add_schl_regstr_dvsn\" name=\"schl_regstr_dvsn\">";
		html += "				<option value=\"0\" selected>졸업</option>";
		html += "			<option value=\"1\">수료</option>";
		html += "			<option value=\"2\">휴학</option>";
		html += "			<option value=\"3\">퇴학</option>";
		html += "		</select>";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e6\">                                                                                        ";
		html += "			<label for=\"add_grdtn_crtfct\" class=\"popup_cont_name\">졸업증명서 :</label>                                                             ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_grdtn_crtfct\" placeholder=\"졸업증명서 파일 업로드\" readonly=\"readonly\" />     ";
		html += "					<label for=\"grdtn_crtfct_btn\">";
		html += "			<div class=\"upld_btn\">";
		html += "			<label for=\"grdtn_crtfct_btn\">업로드</label>"
		html += "			<input type=\"file\" class=\"upld_file\" id=\"grdtn_crtfct_btn\" name=\"att\" accept=\"image/*\" />                       ";
		html += "			</div>";
		html += "					</label>";
		html += "		</div>                                                                                                                                        ";
		html += "	</div>                                                                                                                                            ";
		break;
		
	case "cr_btn" :
		title = "경력사항 추가";
		
		html += "	<div id=\"cr_add_popup\" >                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e1\">                                                                         ";
		html += "			<label for=\"add_cmpny_name\" class=\"popup_cont_name\">회사(단체)명* :</label>                                             ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_cmpny_name\" name=\"cmpny_name\" placeholder=\"회사(단체)명\" />                       ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e2\">                                                                         ";
		html += "			<label for=\"add_join_day\" class=\"popup_cont_name\">입사일* :</label>                                                     ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_join_date\" name=\"join_date\" />     ";
		html += "			<div class=\"prd_sel_btn\" id=\"join_day_btn\"></div>                                                                      ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e3\">                                                                         ";
		html += "			<label for=\"add_rsgnt_day\" class=\"popup_cont_name\">퇴사일* :</label>                                                    ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_rsgnt_date\" name=\"rsgnt_date\" />    ";
		html += "			<div class=\"prd_sel_btn\" id=\"rsgnt_day_btn\"></div>                                                                     ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e4\">                                                                         ";
		html += "			<label for=\"add_afltn_dprtmn\" class=\"popup_cont_name\">소속부서 :</label>                                               ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_dept\" name=\"dept\" placeholder=\"소속부서\" />                         ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e5\">                                                                         ";
		html += "			<label for=\"add_pstn\" class=\"popup_cont_name\">직위 :</label>                                                           ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_pstn\" name=\"pstn\" placeholder=\"직위\" />                                     ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e6\">                                                                         ";
		html += "			<label for=\"add_job\" class=\"popup_cont_name\">직무 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_job\" name=\"job\" placeholder=\"직무\" />                                      ";
		html += "		</div>                                                                                                                         ";
		html += "	</div>                                                                                                                             ";
		break;
		
	case "qlfctn_btn" :
		title = "자격사항 추가";

		html += "<input type=\"hidden\" class=\"upld_file_name\" name=\"copy_file\" />";
		
		html += "	<div id=\"qlfctn_add_popup\" >                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e1\">                                                                               ";
		html += "			<label for=\"add_lcns_name\" class=\"popup_cont_name\">자격증명* :</label>                                                        ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_lcns_name\" name=\"lcns_name\" placeholder=\"자격증명\" />                                  ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e2\">                                                                               ";
		html += "			<label for=\"add_acqrmnt_day\" class=\"popup_cont_name\">취득일자* :</label>                                                      ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_acqrmnt_date\" name=\"acqrmnt_date\" />        ";
		html += "			<div class=\"prd_sel_btn\" id=\"acqrmnt_day_btn\"></div>                                                                         ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e3\">                                                                               ";
		html += "			<label for=\"add_issue_inst\" class=\"popup_cont_name\">발급기관* :</label>                                                       ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_issue_orgnzt\" name=\"issue_orgnzt\" placeholder=\"발급기관\" />                                 ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e4\">                                                                               ";
		html += "			<label for=\"add_score\" class=\"popup_cont_name\">취득점수 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_acqrmnt_score\" name=\"acqrmnt_score\" placeholder=\"취득점수\" />                                      ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e5\">                                                                               ";
		html += "			<label for=\"add_exprtn_day\" class=\"popup_cont_name\">만료기한 :</label>                                                       ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_exprtn_date\" name=\"exprtn_date\" />         ";
		html += "			<div class=\"prd_sel_btn\" id=\"exprtn_btn_day\"></div>                                                                          ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e6\">                                                                               ";
		html += "			<label for=\"add_evdnc\" class=\"popup_cont_name\">증빙자료 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_copy_file\" placeholder=\"자격사항 증빙자료 업로드\" readonly=\"readonly\" />     ";
		html += "					<label for=\"copy_file_btn\">";
		html += "			<div class=\"upld_btn\">";
		html += "			<label for=\"copy_file_btn\">업로드</label>"
		html += "			<input type=\"file\" class=\"upld_file\" id=\"copy_file_btn\" name=\"att\" accept=\"image/*\" />                                                 ";
		html += "			</div>";
		html += "					</label>";
		html += "		</div>                                                                                                                               ";
		html += "	</div>                                                                                                                             ";
		break;
	}
	
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
				var file_exist = false;

				$(".popup_cont_element input").css("outline", "1px solid #00000033");
				switch (pId) {
				case "edctn_level_btn" :
					if (checkEmpty("#add_schl_name")) {
						$("#add_schl_name").css("outline", "2px solid #fe3a40");
						$("#add_schl_name").focus();
					} else if (checkEmpty("#add_admsn_date")) {
						$("#add_admsn_date").css("outline", "2px solid #fe3a40");
						$("#add_admsn_date").focus();
					} else if (checkEmpty("#add_schl_regstr_dvsn")) {
						$("#add_schl_regstr_dvsn").css("outline", "2px solid #fe3a40");
						$("#add_schl_regstr_dvsn").focus();
					} else {
						flag = true;
					}
					if (!checkEmpty("#add_grdtn_crtfct")) {
						file_exist = true;
					}
					break;
					
				case "cr_btn" :
					if (checkEmpty("#add_cmpny_name")) {
						$("#add_cmpny_name").css("outline", "2px solid #fe3a40");
						$("#add_cmpny_name").focus();
					} else if (checkEmpty("#add_join_date")) {
						$("#add_join_date").css("outline", "2px solid #fe3a40");
						$("#add_join_date").focus();
					} else if (checkEmpty("#add_rsgnt_date")) {
						$("#add_rsgnt_date").css("outline", "2px solid #fe3a40");
						$("#add_rsgnt_date").focus();
					} else {
						flag = true;
					}
					break;
					
				case "qlfctn_btn" :
					if (checkEmpty("#add_lcns_name")) {
						$("#add_lcns_name").css("outline", "2px solid #fe3a40");
						$("#add_lcns_name").focus();
					} else if (checkEmpty("#add_acqrmnt_date")) {
						$("#add_acqrmnt_date").css("outline", "2px solid #fe3a40");
						$("#add_acqrmnt_date").focus();
					} else if (checkEmpty("#add_issue_orgnzt")) {
						$("#add_issue_orgnzt").css("outline", "2px solid #fe3a40");
						$("#add_issue_orgnzt").focus();
					} else {
						flag = true;
					}
					if (!checkEmpty("#add_copy_file")) {
						file_exist = true;
					}
					break;
				}
				if (flag) {
					if (file_exist) {
						var addForm = $("#addForm");
						
						addForm.attr("action", "imageUploadAjax");
						addForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if (res.fileName.length > 0) {
									$(".upld_file_name").val(res.fileName[0]);
									
									addFormAjaxFunction();
								}
							},
							error : function(request) {
								console.log(request.responseText);
							}
						});
						
						addForm.submit();
					} else {
						addFormAjaxFunction();
					}
				}
			}
		}, {
			name : "취소"
		}]
	});
}

function addFormAjaxFunction() {
	var params = $("#addForm").serialize();
	
	$.ajax({
		type : "post",
		url : "prsnlCardActionAjax/insert",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.res == "success") {
				var params = $("#bottomTabForm").serialize();
				reloadTab(params);
				closePopup();
				makeAlert("작업 완료", "추가되었습니다.");
			} else {
				makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
			}
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
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

function createEditPopup(pId, data, bankList) {
	console.log(pId);
	var title = "";
	var html = "";
	var size = [0, 0]; // [width, height]
	
	var phone_num_val = ["02", "031", "032", "033", "041", "042", "043", "044", 
		"051", "052", "053", "054", "055", "061", "062", "063", "064"];
	var mbl_num_val = ["010", "011", "016", "017", "018", "019"];
	
	html += "<form action=\"#\" id=\"editForm\" method=\"post\">";
	html += "<input type=\"hidden\" class=\"popup_id\" name=\"popup_id\" value=\"" + pId + "\" />";
	html += "<input type=\"hidden\" name=\"empNum\" value=\"" + $("#nEmpNum").val() + "\" />";
	
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_email\" name=\"edit_email\" value=\"\" />";
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_phone_num\" name=\"edit_phone_num\" value=\"\" />";
	html += "<input type=\"hidden\" class=\"merge_value\" id=\"merge_mbl_num\" name=\"edit_mbl_num\" value=\"\" />";
	
	switch (pId) {
	case "human_info_btn" :
		title = "인적정보 수정";
		size = [500, 272];
		
		html += "	<div id=\"human_info_edit_popup\" >                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e1\">                                                                 ";
		var email = data.EMAIL.split("@");
		html += "			<label for=\"edit_email\" class=\"popup_cont_name\">E-mail* :</label>                                              ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_email\" value=\"" + email[0] + "\" />             ";
		html += "				<div class=\"sub_text\">@kakao.com</div>              ";
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e2\">                                                                 ";
		html += "			<label for=\"edit_zip_code\" class=\"popup_cont_name\">주소* :</label>                                               ";
		html += "			<input type=\"number\" class=\"popup_cont_text\" id=\"edit_zip_code\" name=\"edit_zip_code\" value=\"" + data.ZIP_CODE + "\" readonly=\"readonly\" />              ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_adrs\" name=\"edit_adrs\" value=\"" + data.ADRS + "\" readonly=\"readonly\" />              ";		
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e4\">                                                                 ";
		html += "			<label for=\"edit_dtl_adrs\" class=\"popup_cont_name\">상세주소* :</label>                                           ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_dtl_adrs\" name=\"edit_dtl_adrs\" value=\"" + data.DTL_ADRS + "\" />          ";
		html += "		</div>                                                                                                                ";
		

		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e5\">                                                                 ";
		html += "			<label for=\"edit_phone_num\" class=\"popup_cont_name\">전화번호 : </label>                                       ";
		html += "				<select class=\"popup_cont_text phone_num_sel_box\" id=\"phone_num_sel\">";
		var phone_num = ["-1", "", ""];
		if (data.PHONE_NUM != null) {
			phone_num = data.PHONE_NUM.split("-");
		}
		html += "			<option value=\"-1\">---</option>";
		for (var val of phone_num_val) {
			if (val == phone_num[0]) {
				html += "			<option value=\"" + val + "\" selected>" + val + "</option>";
			} else {
				html += "			<option value=\"" + val + "\">" + val + "</option>";
			}
		}
		html += "				</select>";
		html += "				<div class=\"sub_text\">-</div>              ";
		html += "				<input type=\"number\" class=\"popup_cont_text phone_num_1\" id=\"edit_phone_num_1\" oninput=\"numMaxLimit(this)\" value=\"" + phone_num[1] + "\" />              ";
		html += "				<div class=\"sub_text\">-</div>              ";
		html += "				<input type=\"number\" class=\"popup_cont_text phone_num_2\" id=\"edit_phone_num_2\" oninput=\"numMaxLimit(this)\" value=\"" + phone_num[2] + "\" />              ";
		html += "			</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e6\">                                                                 ";
		html += "				<label for=\"add_mbl_num\" class=\"popup_cont_name\">휴대폰번호* :</label>                                                                ";
		html += "				<select class=\"popup_cont_text phone_num_sel_box\" id=\"mbl_num_sel\">";
		var mbl_num = data.MBL_NUM.split("-");
		
		html += "			<option value=\"-1\">---</option>";
		for (var val of mbl_num_val) {
			if (val == mbl_num[0]) {
				html += "			<option value=\"" + val + "\" selected>" + val + "</option>";
			} else {
				html += "			<option value=\"" + val + "\">" + val + "</option>";
			}
		}
		html += "				</select>";
		html += "				<div class=\"sub_text\">-</div>              ";
		html += "				<input type=\"number\" class=\"popup_cont_text phone_num_1\" id=\"edit_mbl_num_1\" oninput=\"numMaxLimit(this)\" value=\"" + mbl_num[1] + "\" />              ";
		html += "				<div class=\"sub_text\">-</div>              ";
		html += "				<input type=\"number\" class=\"popup_cont_text phone_num_2\" id=\"edit_mbl_num_2\" oninput=\"numMaxLimit(this)\" value=\"" + mbl_num[2] + "\" />              ";
		html += "			</div>                                                                                                                                    ";
		html += "		</div>                                                                                                                ";
		break;
		
	case "slry_info_btn" :
		title = "급여계좌정보 수정";
		size = [520, 240];
		
		html += "<input type=\"hidden\" class=\"upld_file_name\" name=\"bnkbk_copy_file\" />";
		
		html += "	<div id=\"slry_info_edit_popup\" >                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e1\">                                                                                     ";
		html += "			<label for=\"edit_bank_name\" class=\"popup_cont_name\">은행명* :</label>                                                  ";
		html += "		<select class=\"popup_cont_text\" id=\"edit_bank_name\" name=\"edit_bank_name\">";
		var bankName = "";
		if (data != null && data.BANK_NAME != null) {
			bankName = data.BANK_NAME;
		}
		for (var bl of bankList) {
			if (bl.BANK_NAME == bankName) {
				html += "			<option value=\"" + bl.BANK_NUM + "\" selected>" + bl.BANK_NAME + "</option>";
			} else {
				html += "			<option value=\"" + bl.BANK_NUM + "\">" + bl.BANK_NAME + "</option>";
			}
		}
		html += "		</select>";
		
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e2\">                                                                                     ";
		html += "			<label for=\"edit_slry_trnsf_acnt\" class=\"popup_cont_name\">계좌번호* :</label>                                              ";
		html += "			<input type=\"number\" class=\"popup_cont_text\" id=\"edit_acnt_num\" name=\"edit_acnt_num\" value=\"";
		if (data != null && data.ACNT_NUM != null) {
			html += data.ACNT_NUM;
		}
		html += "\" />                          ";
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e3\">                                                                                     ";
		html += "			<label for=\"edit_dpstr\" class=\"popup_cont_name\">예금주명* :</label>                                                                ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_dpstr\" name=\"edit_dpstr\" value=\"";
		if (data != null && data.DPSTR != null) {
			html += data.DPSTR;
		}
		html += "\" />                                            ";
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e4\">                                                                                     ";
		html += "			<label for=\"edit_bnkbk_copy\" class=\"popup_cont_name\">통장사본 파일 :</label>                                                        ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_bnkbk_copy\" readonly=\"readonly\" placeholder=\"파일을 업로드해주세요\" />    ";
		html += "					<label for=\"bnkbk_copy_btn\">";
		html += "			<div class=\"upld_btn\">";
		html += "			<label for=\"bnkbk_copy_btn\">업로드</label>"
		html += "			<input type=\"file\" class=\"upld_file\" id=\"bnkbk_copy_btn\" name=\"att\" accept=\"image/*\" />                                                 ";
		html += "			</div>";
		html += "					</label>";
		html += "		</div>                                                                                                                                    ";
		html += "	</div>                                                                                                                                        ";
		break;
	}
	
	html += "</form>";
	
	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "수정",
			func:function() {
				var flag = false;
				var file_exist = false;

				$(".popup_cont_element input").css("outline", "1px solid #00000033");
				$(".popup_cont_element select").css("outline", "1px solid #00000033");
				switch (pId) {
				case "human_info_btn" :
					if (checkEmpty("#edit_email")) {
						$("#edit_email").css("outline", "2px solid #fe3a40");
						$("#edit_email").focus();
					} else if (checkEmpty("#edit_zip_code")) {
						$("#edit_zip_code").css("outline", "2px solid #fe3a40");
						$("#edit_zip_code").focus();
					} else if (checkEmpty("#edit_adrs")) {
						$("#edit_adrs").css("outline", "2px solid #fe3a40");
						$("#edit_adrs").focus();
					} else if (checkEmpty("#edit_dtl_adrs")) {
						$("#edit_dtl_adrs").css("outline", "2px solid #fe3a40");
						$("#edit_dtl_adrs").focus();
					} else if (($("#phone_num_sel").val() == "-1" || checkEmpty("#edit_phone_num_1") || checkEmpty("#edit_phone_num_2")) &&
							!($("#phone_num_sel").val() == "-1" && checkEmpty("#edit_phone_num_1") && checkEmpty("#edit_phone_num_2"))){
						if ($("#phone_num_sel").val() == "-1") {
							$("#phone_num_sel").css("outline", "2px solid #fe3a40");
							$("#phone_num_sel").focus();
						} else if (checkEmpty("#edit_phone_num_1")) {
							$("#edit_phone_num_1").css("outline", "2px solid #fe3a40");
							$("#edit_phone_num_1").focus();
						} else if (checkEmpty("#edit_phone_num_2")) {
							$("#edit_phone_num_2").css("outline", "2px solid #fe3a40");
							$("#edit_phone_num_2").focus();
						}
					} else if ($("#mbl_num_sel").val() == "-1" || checkEmpty("#edit_mbl_num_1") || checkEmpty("#edit_mbl_num_2")){
						if ($("#mbl_num_sel").val() == "-1") {
							$("#mbl_num_sel").css("outline", "2px solid #fe3a40");
							$("#mbl_num_sel").focus();
						} else if (checkEmpty("#edit_mbl_num_1")) {
							$("#edit_mbl_num_1").css("outline", "2px solid #fe3a40");
							$("#edit_mbl_num_1").focus();
						} else if (checkEmpty("#edit_mbl_num_2")) {
							$("#edit_mbl_num_2").css("outline", "2px solid #fe3a40");
							$("#edit_mbl_num_2").focus();
						}
					} else {
						flag = true;
						$("#merge_email").val($("#edit_email").val() + "@kakao.com");
						if ($("#phone_num_sel").val() != "-1") {
							$("#merge_phone_num").val($("#phone_num_sel").val() + "-" + $("#edit_phone_num_1").val() + "-" +$("#edit_phone_num_2").val());
						}
						$("#merge_mbl_num").val($("#mbl_num_sel").val() + "-" + $("#edit_mbl_num_1").val() + "-" +$("#edit_mbl_num_2").val());
					}
					break;
					
				case "slry_info_btn" :
					if (checkEmpty("#edit_bank_name")) {
						$("#edit_bank_name").css("outline", "2px solid #fe3a40");
						$("#edit_bank_name").focus();
					} else if (checkEmpty("#edit_acnt_num")) {
						$("#edit_acnt_num").css("outline", "2px solid #fe3a40");
						$("#edit_acnt_num").focus();
					} else if (checkEmpty("#edit_dpstr")) {
						$("#edit_dpstr").css("outline", "2px solid #fe3a40");
						$("#edit_dpstr").focus();
					} else {
						flag = true;
					}
					if (!checkEmpty("#edit_bnkbk_copy")) {
						file_exist = true;
					}
					break;
				}
				if (flag) {
					if (file_exist) {
						var editForm = $("#editForm");
						
						editForm.attr("action", "imageUploadAjax");
						editForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if (res.fileName.length > 0) {
									$(".upld_file_name").val(res.fileName[0]);
									editFormAjaxFunction();
								}
							},
							error : function(request) {
								console.log(request.responseText);
							}
						});
						
						editForm.submit();
					} else {
						editFormAjaxFunction();
					}
				}
			}
		}, {
			name : "취소"
		}]
	});
}

function editFormAjaxFunction() {
	var params = $("#editForm").serialize();
	
	$.ajax({
		type : "post",
		url : "prsnlCardActionAjax/update",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.res == "success") {
				var params = $("#topTabForm").serialize();
				reloadTab(params);
				closePopup();
				makeAlert("작업 완료", "수정되었습니다.");
			} else {
				makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
			}
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function createAdmnstrEditPopup(data) {
	var title = "기본정보 수정";
	var html = "";
	var size = [520, 235]; // [width, height]
	
	html += "<form action=\"#\" id=\"editForm\" method=\"post\">";
	html += "<input type=\"hidden\" class=\"popup_id\" name=\"popup_id\" value=\"admnstr_edit_popup\" />";
	html += "<input type=\"hidden\" name=\"empNum\" value=\"" + $("#nEmpNum").val() + "\" />";
	html += "<input type=\"hidden\" class=\"upld_file_name\" name=\"emp_pctr_file\" value=\"";
	html += "\" />";
	
	html += "	<div id=\"admnstr_edit_popup\" >                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\" id=\"edit_a_e1\">                                                                                     ";
	html += "			<label for=\"edit_emp_num\" class=\"popup_cont_name\">사원번호 :</label>                                                  ";
	html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_emp_num\" readonly=\"readonly\" value=\"";
	html += $("#nEmpNum").val();
	html += "\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\" id=\"edit_a_e2\">                                                                                     ";
	html += "			<label for=\"edit_emp_name\" class=\"popup_cont_name\">사원명 :</label>                                              ";
	html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_emp_name\" name=\"emp_name\" value=\"";
	html += data.EMP_NAME;
	html += "\" />                          ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\" id=\"edit_a_e3\">                                                                                     ";
	html += "			<label for=\"edit_emp_name_eng\" class=\"popup_cont_name\">영문사원명 :</label>                                                                ";
	html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_emp_name_eng\" name=\"emp_name_eng\" value=\"";
	html += data.EMP_NAME_ENG;
	html += "\" />                                            ";
	html += "		</div>                                                                                                                                    ";
	html += "		<div class=\"popup_cont_element\" id=\"edit_a_e4\">                                                                                     ";
	html += "			<label for=\"edit_emp_pctr_file\" class=\"popup_cont_name\">사원사진 :</label>                                                        ";
	html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_emp_pctr_file\" readonly=\"readonly\" placeholder=\"파일을 업로드해주세요\" value=\"";
	if (data.EMP_PCTR_FILE != null) {
		html += data.EMP_PCTR_FILE;
	}
	html += "\" />    ";
	html += "			<label for=\"emp_pctr_file_btn\">";
	html += "			<div class=\"upld_btn\">";
	html += "			<label for=\"emp_pctr_file_btn\">업로드</label>"
	html += "			<input type=\"file\" class=\"upld_file\" id=\"emp_pctr_file_btn\" name=\"att\" accept=\"image/*\" />                                                 ";
	html += "			</div>";
	html += "			</label>";
	html += "		</div>                                                                                                                                    ";
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
			name : "수정",
			func:function() {
				var flag = false;
				var file_exist = false;

				$(".popup_cont_element input").css("outline", "1px solid #00000033");
				if (checkEmpty("#edit_emp_num")) {
					$("#edit_emp_num").css("outline", "2px solid #fe3a40");
					$("#edit_emp_num").focus();
				} else if (checkEmpty("#edit_emp_name_eng")) {
					$("#edit_emp_name_eng").css("outline", "2px solid #fe3a40");
					$("#edit_emp_name_eng").focus();
				} else {
					flag = true;
				}
				
				if (!checkEmpty("#edit_emp_pctr_file")) {
					file_exist = true;
				}
				if (flag) {
					if (file_exist) {
						var editForm = $("#editForm");
						
						editForm.attr("action", "imageUploadAjax");
						editForm.ajaxForm({
							success : function(res) {
								console.log("업로드테스트 1");
								// 물리파일명 보관
								if (res.fileName.length > 0) {
									console.log("업로드테스트 2");
									$(".upld_file_name").val(res.fileName[0]);
									admnstrEditFormAjaxFunction();
									location.reload();
								}
							},
							error : function(request) {
								console.log(request.responseText);
							}
						});
						
						editForm.submit();
					} else {
						admnstrEditFormAjaxFunction();
					}
				}
			}
		}, {
			name : "취소"
		}]
	});
}


function admnstrEditFormAjaxFunction() {
	var params = $("#editForm").serialize();
	
	$.ajax({
		type : "post",
		url : "prsnlCardActionAjax/update",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.res == "success") {
				closePopup();
				makeAlert("작업 완료", "수정되었습니다.", function() {
					reloadBasicInfoArea(params);
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

function reloadBasicInfoArea() {
	var params = $("#basicInfoForm").serialize();
	
	$.ajax({
		type : "post",
		url : "prsnlCardSubAjax/reloadBasicInfo",
		dataType : "json",
		data : params,
		success : function(res) {
			drawBasicInfoArea(res.data, res.filePath);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawBasicInfoArea(params, filePath2) {
	var html = "";
	html += "	<div class=\"cont_line_rt\">                                                                                                            ";
	html += "	<div class=\"cont_element\">                                                                                                            ";
	html += "		<div class=\"cont_name\">이름(한글)</div>                                                                                           ";
	html += "		<br/>                                                                                                                               ";
	html += "		<input type=\"text\" class=\"cont_text\" id=\"emp_name\" readonly=\"readonly\" value=\"" + params.EMP_NAME + "\" />               ";
	html += "	</div>                                                                                                                                  ";
	html += "</div>                                                                                                                                     ";
	html += "<div class=\"cont_line_rt\">                                                                                                               ";
	html += "	<div class=\"cont_element\">                                                                                                            ";
	html += "		<div class=\"cont_name\">이름(영문)</div>                                                                                           ";
	html += "		<br/>                                                                                                                               ";
	html += "		<input type=\"text\" class=\"cont_text\" id=\"emp_name_eng\" readonly=\"readonly\" value=\"" + params.EMP_NAME_ENG + "\" />       ";
	html += "	</div>                                                                                                                                  ";
	html += "</div>                                                                                                                                     ";
	html += "<div class=\"cont_line_rt\">                                                                                                               ";
	html += "	<div class=\"cont_element\">                                                                                                            ";
	html += "		<div class=\"cont_name\">소속부서</div>                                                                                             ";
	html += "				<input type=\"text\" class=\"cont_text\" id=\"dprtmn\" readonly=\"readonly\" value=\"";
	if (params.DEPT_NAME != null) {
		html += params.DEPT_NAME;
	}
	html += "\" />        ";
	html += "		<br/>                                                                                                                               ";
	html += "	</div>                                                                                                                                  ";
	html += "</div>                                                                                                                                     ";
	html += "<div class=\"cont_line_rt\">                                                                                                               ";
	html += "	<div class=\"cont_element\">                                                                                                            ";
	html += "		<div class=\"cont_name\">직급</div>                                                                                                 ";
	html += "		<br/>                                                                                                                               ";
	html += "		<input type=\"text\" class=\"cont_text\" id=\"pstn\" readonly=\"readonly\" value=\"";
	if (params.RANK_NAME != null) {
		html += params.RANK_NAME;
	}
	html += "\" />                  ";
	html += "	</div>                                                                                                                                  ";
	html += "</div>                                                                                                                                     ";

	$("#basic_info_area").html(html);
	var srcUrl = "";
	if (params.EMP_PCTR_FILE != null) {
		srcUrl = "resources/upload/" + params.EMP_PCTR_FILE;
	} else {
		srcUrl = "resources/images/cmn/emp_image.png";
	}
	$("#emp_pctr_area").attr("src", srcUrl);
}


function createDelPopup(pId) {
	console.log(pId);
	
	$("#tabId").val($("#selectedBottomTab").val());
	
	var html = "";
	html += "	<div class=\"popup_cont\">                                                             ";
	html += "	선택하신 항목을 삭제하시겠습니까?                                                                      ";
	html += "	</div>                                                                                 ";

	makePopup({
		bg : true,
		bgClose : false,
		height : 140,
		title : "삭제 확인",
		contents : html,
		buttons : [{
			name : "확인",
			func:function() {
				var params = $("#deleteForm").serialize();
				
				$.ajax({
					type : "post",
					url : "prsnlCardActionAjax/delete",
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "success") {
							var params = $("#bottomTabForm").serialize();
							reloadTab(params);
							closePopup();
							makeAlert("작업 완료", "삭제되었습니다.");
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
	
	switch (pId) {
	case "edctn_level_btn" :
		break;
	case "cr_btn" :
		break;
	case "qlfctn_btn" :
		break;
	}
}

function reloadTab(params) {
	console.log("***** reloadTab *****");
	console.log($("#nEmpNum").val());
	
	$.ajax({
		type : "post",
		url : "prsnlCardTabAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			console.log(res.tabName + "탭을 선택");
			$("#" + res.tabName).parent(".tab_bar").find(".tab_btn input[type=hidden]").val("false");
			$("#" + res.tabName).find("input[type=hidden]").val("true");
			tabBtnSelected("#" + res.tabName);
			tabContChange(res.tabName, res.tabData, res.tabDataList);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function btnSetting() {
	if ($("#btm_del_btn").attr("da") == "true") {
		$("#btm_del_btn").css("background-color", "#eeeeee");
		$("#btm_del_btn").css("color", "#999999");
	} else {
		$("#btm_del_btn").css("background-color", "#fe3a40");
		$("#btm_del_btn").css("color", "#fff");
	}
}

$(document).ready(function() {
	$("#isAdmnstr").val(${is_admnstr});
	
	$("#human_info_btn").css("background-color", "#4B94F2");
	$("#human_info_btn").css("color", "#FFF");
	$("#edctn_level_btn").css("background-color", "#4B94F2");
	$("#edctn_level_btn").css("color", "#FFF");
	
	if ($("#isAdmnstr").val() == "1") {
		$("#cont_area").css("background-color", "#aaaaaa");
	}
	
	if ($("#isAdmnstr").val() == "1") {
		$("#topTabAdmnstr").val($("#nEmpNum").val());
	}

	reloadBasicInfoArea();
	
	var params = $("#topTabForm").serialize();
	reloadTab(params);
	
	if ($("#isAdmnstr").val() == "1") {
		$("#bottomTabAdmnstr").val($("#nEmpNum").val());
	}
	var params = $("#bottomTabForm").serialize();
	reloadTab(params);
	
	btnSetting();
	
	$(".tab_btn").hover(function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false;
		}
		if (!state) {
			$(this).css("background-color", "#dbebff");
			$(this).css("cursor", "pointer");
		}
	}, function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false;
		}
		if (!state) {
			$(this).css("background-color", "#FFF");
			$(this).css("cursor", "default");
		}
	});
	$(".tab_btn").click(function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false; 
		}
		if (state) {
			console.log("선택되어 있는 탭");
		} else {
			if ($(this).parent("div").attr("id") == "left_top_tab") {
				$("#selectedTopTab").val($(this).attr("id"));
				console.log($(this).attr("id"));
				if ($("#isAdmnstr").val() == "1") {
					$("#topTabAdmnstr").val($("#nEmpNum").val());
				}
				console.log($("#topTabAdmnstr").val());
				var params = $("#topTabForm").serialize();
			}
			else if ($(this).parent("div").attr("id") == "bottom_tab") {
				$("#selectedBottomTab").val($(this).attr("id"));
				console.log($(this).attr("id"));
				if ($("#isAdmnstr").val() == "1") {
					$("#bottomTabAdmnstr").val($("#nEmpNum").val());
				}
				var params = $("#bottomTabForm").serialize();
				$("#selItemNum").val("-1");
				if ($("#btm_del_btn").attr("da") == "false") {
					$("#btm_del_btn").attr("da", "true");
					btnSetting();
				}
			} else {
				console.log("이거 안됨");
			}
			reloadTab(params);
		}
	});
	
	$("body").on("mouseenter", "#bnkbk_copy_file, .grdtn_crtfct_file, .copy_file", function() {
		if ($(this).val() != "" && $(this).val() != null) {
			$(this).css("cursor", "pointer");
			$(this).css("text-decoration", "underline");
			$(this).css("color", "#4B94F2");
		}
	});
	$("body").on("mouseleave", "#bnkbk_copy_file, .grdtn_crtfct_file, .copy_file", function() {
		if ($(this).val() != "" && $(this).val() != null) {
			$(this).css("cursor", "default");
			$(this).css("text-decoration", "none");
			$(this).css("color", "#000000");
		}
	});
	
	
	$(".func_btn").on("mouseenter", function() {
		if ($(this).attr("da") == "false") {
			$(this).css("cursor", "pointer");
		}
	});	
	$(".func_btn").on("mouseleave", function() {
		$(this).css("cursor", "default");
	});
	

	$("#lt_edit_btn").click(function() {
		params = $("#topTabForm").serialize();
		
		$.ajax({
			type : "post",
			url : "prsnlCardTabAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				console.log(res.tabName + "탭을 선택");
				console.log(res.tabData);
				
				createEditPopup(res.tabName, res.tabData, res.bankList);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	});

	$("#btm_add_btn").click(function() {
		createAddPopup($("#selectedBottomTab").val());
	});
	
	$("#btm_del_btn").click(function() {
		if ($("#selItemNum").val() != "-1") {
			createDelPopup($("#selectedBottomTab").val());
		}
	});

	$("body").on("change", ".upld_file", function(){
		var fileName = $(this).val().split("\\");
		$(this).parent("div").parent("label").parent("div").children("input[type=text]").val(fileName[fileName.length-1]);
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
	
	$("#table_area").slimScroll({height: "280px"});
	
	$("#table_area").on("mouseenter", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#f3f3f3");
			$(this).children("td:nth-child(even)").css("background-color", "#efefef");
		}
	});
	
	$("#table_area").on("mouseleave", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
			$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
		}
	});
	$("#table_area").on("click", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		var flag = $(this).find(".val_existed").val();
		if (flag == "true") {
			if (state == "false") {
				$(this).parent("tbody").find(".table_item .item_selected").val("false");
				$(this).find(".item_selected").val("true");
				$("#selItemNum").val($(this).attr("no"));
				console.log("selected: " + $("#selItemNum").val());
				$("#btm_del_btn").attr("da", "false");
				btnSetting();
		
				$(this).parent("tbody").find(".table_item").children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).parent("tbody").find(".table_item").children("td:nth-child(even)").css("background-color", "#f6f6f6");
				
				
				$(this).children("td").css("background-color", "#b3e0ff");
			} else {
				$(this).find(".item_selected").val("false");
				$("#selItemNum").val("-1");
				console.log("unselected");
				$("#btm_del_btn").attr("da", "true");
				btnSetting();
				
				$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
			}
		}
	});
	
	
	$(".admnstr_btn").on("mouseenter", function() {
		if ($(this).attr("da") == "false") {
			$(this).css("cursor", "pointer");
		}
	});	
	$(".admnstr_btn").on("mouseleave", function() {
		$(this).css("cursor", "default");
	});
	
	
	$("#a_list_btn").on("click", function() {
		$("#i_menuNum").val("6");
		
		$("#backForm").submit();
	});
	
	$("#a_edit_btn").click(function() {
		params = $("#basicInfoForm").serialize();
		
		$.ajax({
			type : "post",
			url : "prsnlCardSubAjax/reloadBasicInfo",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				
				createAdmnstrEditPopup(res.data);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	});
	
	$("body").on("click", "#edit_zip_code, #edit_adrs", function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#edit_zip_code").val(data.zonecode);
	        	$("#edit_adrs").val(data.address);
	        	$("#edit_dtl_adrs").focus();
	        	$("#edit_dtl_adrs").select();
	        }
	    }).open({popupKey:"popup1"});
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
			<c:choose>
				<c:when test="${is_admnstr eq '1'}">
					<div class="page_title_text">인사기록카드(관리자)</div>
				</c:when>
				<c:otherwise>
					<div class="page_title_text">인사기록카드</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${is_admnstr eq '1'}">
					<div class="admnstr_btn" id="a_list_btn" da="false">목록</div>
					<div class="admnstr_btn" id="a_edit_btn" da="false">수정</div>
					<form action="empInqry" id="backForm" method="post">
						<input type="hidden" id="old_srch_sel" name="srch_sel" value="${param.srch_sel}" />
						<input type="hidden" id="old_srch_txt" name="srch_txt" value="${param.srch_txt}" />
						<input type="hidden" id="old_work_clsftn" name="work_clsftn" value="${param.work_clsftn}" />
						<input type="hidden" id="old_emplynt_type" name="emplynt_type" value="${param.emplynt_type}" />
						<input type="hidden" id="old_join_date" name="join_date" value="${param.join_date}" />
						<input type="hidden" id="old_prd_start" name="prd_start" value="${param.prd_start}" />
						<input type="hidden" id="old_prd_end" name="prd_end" value="${param.prd_end}" />
						<input type="hidden" id="i_top" name="top" value="${param.top}" />
						<input type="hidden" id="i_menuNum" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" id="i_menuType" name="menuType" value="${param.menuType}" />
						<input type="hidden" id="page" name="page" value="${param.page}" />
					</form>
				</c:when>
			</c:choose>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<input type="hidden" id="isAdmnstr" name="isAdmnstr" value="-1" />
			<c:choose>
				<c:when test="${is_admnstr eq '1'}">
				<input type="hidden" id="nEmpNum" name="nEmpNum" value="${param.empNum}" />
				</c:when>
				<c:otherwise>
				<input type="hidden" id="nEmpNum" name="nEmpNum" value="${sEmpNum}" />
				</c:otherwise>
			</c:choose>
			<form action="#" id="basicInfoForm" method="post">
				<c:choose>
					<c:when test="${is_admnstr eq '1'}">
					<input type="hidden" name="sEmpNum" value="${param.empNum}" />
					</c:when>
					<c:otherwise>
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="selectedBasicInfo" name="selectedBasicInfo" value="basic_info_area"/>
				<input type="hidden" id="basicInfoAdmnstr" name="admnstrNum" value="-1"/>
			</form>
			<form action="#" id="topTabForm" method="post">
				<input type="hidden" id="selectedTopTab" name="selectedTopTab" value="human_info_btn"/>
				<input type="hidden" id="topTabAdmnstr" name="admnstrNum" value="-1"/>
			</form>
			<form action="#" id="bottomTabForm" method="post">
				<input type="hidden" id="selectedBottomTab" name="selectedBottomTab" value="edctn_level_btn"/>
				<input type="hidden" id="bottomTabAdmnstr" name="admnstrNum" value="-1"/>
			</form>
			<form action="#" id="deleteForm" method="post">
				<input type="hidden" id="selItemNum" name="selItemNum" value="-1" />
				<input type="hidden" id="tabId" name="tabId" value="edctn_level_btn"/>
			</form>
			<div id="top_area">
				<div class="cont_wrap" id="left_top">
					<div class="tab_bar" id="left_top_tab">
						<div class="tab_btn" id="human_info_btn">인적정보<input type="hidden" value="true" /></div>
						<div class="tab_btn" id="work_info_btn">재직정보<input type="hidden" value="false" /></div>
						<div class="tab_btn" id="slry_info_btn">급여정보<input type="hidden" value="false" /></div>
						<div class="func_btn" id="lt_edit_btn" da="false">수정</div>
					</div>
					<div class="dtl_cont" id="left_top_cont">
						
					</div>
				</div>
				<div class="dtl_cont" id="right_top">
					<div id="basic_info_area">

					</div>
					<div id="basic_info_area_right">
						<div class="cont_line" id="rt_l1">
							<div class="cont_element" id="rt_l1_e1">
								<div class="cont_name">사원번호</div>
									<c:choose>
										<c:when test="${is_admnstr eq '1'}">
											<input type="text" class="cont_text" id="emp_num" readonly="readonly" value="${param.empNum}" />
										</c:when>
										<c:otherwise>
											<input type="text" class="cont_text" id="emp_num" readonly="readonly" value="${sEmpNum}" />
										</c:otherwise>
									</c:choose>
							</div>
						</div>
						<br/>
						<div id="pctr_area">
							<img alt="사원이미지" id="emp_pctr_area" src=""/>
						</div>
					</div>
				</div>
			</div>
			<div id="bottom_area">
				<div class="cont_wrap" id="bottom">
					<div class="tab_bar" id="bottom_tab">
						<div class="tab_btn" id="edctn_level_btn">학력사항<input type="hidden" value="true" /></div>
						<div class="tab_btn" id="cr_btn">경력사항<input type="hidden" value="false" /></div>
						<div class="tab_btn" id="qlfctn_btn">자격사항<input type="hidden" value="false" /></div>
						<div class="func_btn" id="btm_add_btn" da="false">추가</div>
						<div class="func_btn" id="btm_del_btn" da="true">삭제</div>
					</div>
					<div class="dtl_cont" id="bottom_cont">
						<div id="table_area">
						</div>
					</div>
				</div>
			</div>
		</div> <!-- cont_area 끝 -->
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>