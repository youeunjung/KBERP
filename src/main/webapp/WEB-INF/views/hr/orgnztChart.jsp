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

$blue: #2E83F2;
$black: #222222;
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cont_left {
	display: inline-block;
    vertical-align: top;
    width: 304px;
    height: 578px;
    padding: 15px;
}

.orgnzt_btn_area {
	padding: 10px 0 8px 0;
    display: inline-block;
    vertical-align: top;
    width: 300px;
    height: 33px;
}

.orgnzt_btn {
    border: solid 1px #d7d7d7;
    display: inline-block;
    vertical-align: top;
    padding: 0px 7px;
    width: 96px;
    height: 32px;
    line-height: 30px;
    font-size: 10pt;
    font-weight: 600;
    text-align: center;
    background-color: #f2f2f2;
    margin: 0 2px;
    border-radius: 4px;
    color: #222222;
    cursor: pointer;
}

.orgnzt_btn:active {
	background-color: #F2CB05;
}
.orgnzt_btn:hover {
	background-color: #F2CB05;
}

.orgnzt_area {
    padding: 20px 0 20px 20px;
    display: inline-block;
    vertical-align: top;
    width: 277px;
    height: 455px;
    border: solid 1px #d7d7d7;
    border-radius: 6px;
    user-select: none;
}

.orgnzt_area > div{
    cursor: pointer;
}

.orgnzt_depth1 {
	display: inline-block;
    vertical-align: top;
    width: 260px;
    height: 28px;
}


.orgnzt_depth1_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}

.kb_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
    background-image: url(resources/images/hr/logo20_icon.png);
    background-repeat: no-repeat;
    background-position: 7px 6px;
    background-size: 16px; 
}

.depth_slc_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
    background-image: url(resources/images/hr/right_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px; 
}
.depth_emp_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
}

.depth_slc_icon_on {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 26px;
    background-image: url(resources/images/hr/down_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px; 
}

.depth_txt {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 80px;
    height: 25px;
    font-size: 10pt;
    line-height: 29px;
}

.depth_txt_on {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 80px;
    height: 25px;
    color: #2E83F2;
    font-size: 10pt;
    font-weight: 600;
    line-height: 29px;
}

.orgnzt_depth2_wrap{
	display: none;
}


.orgnzt_depth2 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 235px;
   /* height: 25px;*/
}

.orgnzt_depth2_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}
.orgnzt_depth3_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}
.orgnzt_depth4_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}


.folder_icon {
	display: inline-block;
    vertical-align: top;
    width: 25px;
    height: 25px;
    background-image:url(resources/images/hr/folder_icon.png);
    background-repeat: no-repeat;
    background-position:center;
    background-size: 10px;
}


.orgnzt_depth3_wrap{
	display: none;
}

.orgnzt_depth3 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 205px;
   /* height: 25px;*/
}

.profile_icon {
	display: inline-block;
    vertical-align: top;
    width: 25px;
    height: 25px;
    background-image: url(resources/images/hr/profile15_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px;
}

.orgnzt_depth4_wrap{
	display: none;
}
.orgnzt_depth4 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 205px;
}
.scroll_area{
	overflow-y: scroll; 
}


.super_orgnzt_area {
	line-height: 55px;
    text-align: center;
} 

.super_orgnzt_text {
	display: inline-block;
	width: 60px;
}

.super_orgnzt_area > select {
	display: inline-block;
    width: 161px;
    height: 26px;
    text-align: center;
    margin-left: 10px;
}


.add_orgnzt_area {
	line-height: 35px;
    text-align: center;
}

.add_orgnzt_text {
	display: inline-block;
   	width: 60px;
}

.popup_cont input[type="text"] {
	display: inline-block;
    width: 153px;
    height: 20px;
    text-align: center;
    margin-left: 10px;
}

.orgnzt_del_popup{
	display: inline-block;
	height: 100%;
	width: 100%;
	text-align: center;
	line-height: 100px;
}

.del_dept{
	display: inline-block;
	/*text-align: center;*/
	font-size: 14px;
	font-weight: bold;
}

.del_txt{
	display: inline-block;
	/*text-align: center;*/
}
.orgnzt_emp_info_box {
    display: inline-block;
    vertical-align: top;
    width: 367px;
    height: 167px;
    border: solid 1px #d7d7d7;
    border-radius: 10px;
    padding: 6px;
    margin: 50px;
 
}

.orgnzt_empp_info_box_left {
    display: inline-block;
    vertical-align: top;
    width: 111px;
    height: 148px;
    border-radius: 10px;
    margin: 5px 5px 5px 8px;
}

.orgnzt_emp_img_wrap {
    display: inline-block;
    vertical-align: top;
    width: 95px;
    height: 105px;
    border: solid 1px #d7d7d7;
    border-radius: 10px;
    margin: 11px 4px 0 4px;
}

.orgnzt_emp_name {
    display: inline-block;
    vertical-align: top;
    width: 100px;
    height: 33px;
    border-radius: 10px;
    margin: 5px 5px 5px 5px;
    color: #2E83F2;
    font-size: 12px;
    font-weight: 600;
    text-align: center;
    line-height: 30px;
    letter-spacing: 12px;
    padding-left: 6px;
   	
}
	
.orgnzt_emp_info_box_right {
    display: inline-block;
    vertical-align: top;
    width: 230px;
    height: 153px;
    border-radius: 10px;
    padding: 5px;
}
 
.orgnzt_emp_info_wrap {
    display: inline-block;
    vertical-align: top;
    width: 228px;
    height: 32px;
    border-radius: 10px;
    padding: 3px;
}
 
.orgnzt_emp_info_txt {
    display: inline-block;
    vertical-align: top;
    width: 49px;
    height: 25px;
    border-radius: 5px;
    padding: 2px;
    color: #444444;
    font-size: 11px;
    font-weight: 600;
    text-align: right;
    line-height: 30px;
    letter-spacing: 2px;
    margin-right: 17px;
}

.orgnzt_emp_info_input {	
    display: inline-block;
    vertical-align: top;
    width: 143px;
    height: 22px;
    border: solid 1px #d7d7d7;
    border-radius: 2px;
    padding-left: 5px;
    margin-top: 6px;
}
#cont_right{
	display: inline-block;
    vertical-align: top;
    margin-top: 17px;
}
#orgnzt_emp_img {
	width: 100%;
    height: 100%;
    object-fit: contain;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 조직도 생성
	reloadTree();
    
	// 슬림스크롤
	$(".scroll_area").slimScroll({height: "460px"},{width: "275px"});
	   
   // 사원 상세보기 
   $(".orgnzt_area").on("click", "#orgnztEmp", function() {
      $("#orgnztEmpNum").val($(this).attr("orgnztEmpNum"));

      reloadEmpInfo();
   });
	
	// 조직추가
	$("#orgnzt_add_btn").on("click", function() {
		var html = "";
		html += "	<div class=\"super_orgnzt_area\">                           ";
		html += "		<div class=\"super_orgnzt_text\">상위부서</div>         ";
		console.log("sdeptNum : " + $(sdeptNum).val())
		// sdeptNum : 마지막 선택 부서 == 상위조직 부서 
		// 미선택 시 카카오뱅크를 상위조직으로 함
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			$("#deptLevel").val($("#default").attr("deptLevel"));
			html += "		<input type=\"text\" readonly=\"readonly\" value=\"카카오뱅크\" />";
		} else {
			html += "		<input type=\"text\" readonly=\"readonly\" value = \"" + $(dname).val() + "\" />";
		}
		html += "   </div>                                                      ";
		html += "	<div class=\"add_orgnzt_area\">                             ";
		html += "		<div class=\"add_orgnzt_text\">부서명</div>             ";
		html += "		<input type=\"text\" id=\"deptInput\" />";
		html += "	</div>                                                      ";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "등록",
			contents : html, 
			draggable : true,
			buttons : [{
				name : "확인",
				func:function() {
						if (checkEmpty("#deptInput")) {
							makeAlert("알림","부서명을 입력하세요.", function(){
							$("#deptInput").focus();
							});
						} else {
							$("#deptName").val($("#deptInput").val());
							var params = $("#actionForm").serialize();
							$.ajax({
							       type : "post",
							       url : "orgnztChartActionAjax/insert",
							       data : params,
							       dataType : "json",
							       success : function(res) {
									   closePopup();
									   makeAlert("알림", "부서가 추가되었습니다", function() {
										   location.reload();
									   });
							       }, 
							       error : function(req) {
							          console.log(req.responseText);
							       }
							    });
							console.log("등록!"); 
						}
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	// 조직수정
	$("#orgnzt_mdfy_btn").on("click", function() {
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			 makeAlert("알림", "수정할 부서를 선택하세요."); 
		} else {
			$.ajax({
			       type : "post",
			       url : "orgnztChartAjax",
			       dataType : "json",
			       success : function(res) {
						var html = "";
						
						html += "	<div class=\"super_orgnzt_area\">                           ";
						html += "		<div class=\"super_orgnzt_text\">상위부서</div>         ";
						html += "		<select id=\"superDeptSelect\">                                           ";
    	   			  	//선택 부서의 상위부서 없을 경우 카카오뱅크를 첫번째 옵션으로 설정
						if($("#superDeptNum").val() == "" || $("#superDeptNum").val()  == null || $("#superDeptNum").val()  == "undefined") {
		    	    	 	 console.log("현재 - 상위부서 null 임, 상위부서번호 : " + $("#superDeptNum").val())
				    	html += "	 <option odeptNum=\"\" odeptLevel=\"1\">카카오뱅크</option> ";
							for(var data of res.dept ) { 
								if(data.DEPT_NUM != $("#sdeptNum").val()) {
					   			    html += "<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
								}
							}
    	   			  	//선택 부서의 상위부서 있을 경우 해당 상위부서를 첫번째 옵션, 카카오뱅크를 두번째 옵션으로 설정
		    	    	} else {
		    	    	 	 console.log("현재 - 상위부서 null 아님, 상위부서번호 : " + $("#superDeptNum").val())
		    	    		 for(var data of res.dept ) { 
			    	    		 if(data.DEPT_NUM == $("#superDeptNum").val()) {
					   			 html += "<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
			    				 html += "<option odeptNum=\"\" odeptLevel=\"1\">카카오뱅크</option> ";
			    	    		 } 
			    	    	 }
			    	    	 for(var data of res.dept ) { 
			    	    		 if(data.DEPT_NUM != $("#sdeptNum").val() && data.DEPT_NUM != $("#superDeptNum").val()) {
   								 html += "<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
			    	    		 }
			    	    	 }
								    	    	 
			    	     }
						html += "		</select>                                           ";
						html += "   </div>                                                      ";
						html += "	<div class=\"add_orgnzt_area\">                             ";
						html += "		<div class=\"add_orgnzt_text\">부서명</div>             ";
						html += "		<input type=\"text\" id=\"deptInput\" value=\"" +$(dname).val() + "\" />";
						html += "	</div>                                                      ";
						
						makePopup({
							bg : false,
							bgClose : false,
							title : "수정",
							contents : html, 
							draggable : true,
							buttons : [{
								name : "확인",
								func:function() {
									if (checkEmpty("#deptInput")) {
										makeAlert("알림","부서명을 입력하세요.", function(){
										$("#deptInput").focus();
										});
									} else {
									$("#deptName").val($("#deptInput").val());
									if($("#superDeptSelect option:selected").attr("odeptNum") == "undefined" || $("#superDeptSelect option:selected").attr("odeptNum") == "" ) {
									$("#mdfySuperDeptNum").val(null);
									$("#mdfyDeptLevel").val("1");
									} else {
									$("#mdfySuperDeptNum").val($("#superDeptSelect option:selected").attr("odeptNum"));
									}
									$("#mdfyDeptLevel").val($("#superDeptSelect option:selected").attr("odeptLevel"));
									var params = $("#actionForm").serialize();
									$.ajax({
									       type : "post",
									       url : "orgnztChartActionAjax/update",
									       data : params,
									       dataType : "json",
									       success : function(res) {
											   closePopup();
											   makeAlert("알림", "부서가 수정되었습니다.", function(){
												   location.reload();
											   });
									       }, 
									       error : function(req) {
									          console.log(req.responseText);
									       }
									    });
									}
									console.log("수정!");
								}
							}, {
								name : "취소"
							}]
						});
			       },
			       error : function(req) {
			          console.log(req.responseText);
			       }
			    });
		}
		
	});
	
	// 조직삭제
	$("#orgnzt_del_btn").on("click", function() {
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			 makeAlert("알림", "삭제하실 부서를 선택하세요."); 
		} else {
			var html = "";
			
			html += "<div class=\"orgnzt_del_popup\">  ";
			html += "	<div class=\"del_dept\"> [ " +$(dname).val() + " ]</div> ";
			html += "	<div class=\"del_txt\">부서를 삭제하시겠습니까?<\/div>";
			html += "</div>  ";
			
			makePopup({
				bg : false,
				bgClose : false,
				title : "삭제",
				contents : html, 
				draggable : true,
				buttons : [{
					name : "확인",
					func:function() {
						var params = $("#actionForm").serialize();
						$.ajax({
						       type : "post",
						       url : "orgnztChartActionAjax/delete",
						       data : params,
						       dataType : "json",
						       success : function(res) {
								   closePopup();
								   makeAlert("알림", "부서가 삭제되었습니다.", function(){
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
		}
		
	});
	
	// 조직도 토글
	$(".orgnzt_area").on("click", ".orgnzt_depth1, .orgnzt_depth2, .orgnzt_depth3", function(e) {
		console.log(this)
		$("#sdeptNum").val($(this).attr("sdeptNum"));
		$("#dname").val($(this).attr("dname"));
		$("#deptLevel").val($(this).attr("deptLevel"));
		$("#superDeptNum").val($(this).attr("superDeptNum"));
		var depth = $(this).attr("class").substring(12);
		var obj = $(this);
		console.log(depth == "1");
		if(depth == "1") {
			$(".orgnzt_depth2_wrap").toggle("fast", function() { 
				if($(".orgnzt_depth2_wrap").is(":visible")) {
					$(".orgnzt_depth1").css({"color":"#2E83F2", "font-weight":"bold"});
				} else {
					$(".orgnzt_depth1").css({"color":"black", "font-weight":""});
				}
			}); 
		} else {
			e.stopPropagation(); // 버블링 방지
			$(this).children(".orgnzt_depth" + (depth * 1 + 1) + "_wrap").toggle("fast", function() { 
				if(obj.children(".orgnzt_depth" + (depth * 1 + 1) + "_wrap").is(":visible")) {
					if(depth == "2") {
						$(".orgnzt_area .orgnzt_depth3_area").css({"color":"black", "font-weight":""});
					} else if(depth == "3") {
						$(".orgnzt_area .orgnzt_depth2_area").css({"color":"black", "font-weight":""});
						obj.parent().parent().children(".orgnzt_depth2_area").css({"color":"#2E83F2", "font-weight":"bold"});
					}
					$(".orgnzt_area .orgnzt_depth" + depth + "_area").css({"color":"black", "font-weight":""});
					obj.children(".orgnzt_depth" + depth + "_area").css({"color":"#2E83F2", "font-weight":"bold"});
				} else {
					$(".orgnzt_area .orgnzt_depth" + depth + "_area").css({"color":"black", "font-weight":""});
				}
			}); 
		}
		
	});
	
});


// 조직도 리로드
function reloadTree() {
    $.ajax({
       type : "post",
       url : "orgnztChartAjax",
       dataType : "json",
       success : function(res) {
    	   drawTree(res.dept);
    	   drawTree2(res.dept);
    	   drawTree3(res.emp);
       },
       error : function(req) {
          console.log(req.responseText);
       }
    });
 } 

// 1뎁스 부서 생성
function drawTree(dept){
	for(var data of dept) {                              
		if(data.SUPER_DEPT_NUM == null) {
			var html = "";
			html += "<div class=\"orgnzt_depth2\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) + "\"  sdeptNum=\"" + data.DEPT_NUM + "\" dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM +  "\"> ";
			html += "<div class=\"orgnzt_depth2_area\">      ";
			html += "	<div class=\"depth_slc_icon\"></div> ";
			html += "	<div class=\"folder_icon\"></div>    ";
			html += "	<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "</div>                                  ";
			html += "<div class=\"orgnzt_depth3_wrap\" id=\"" + data.DEPT_NUM + "\"></div>";
			html += "</div>                                  ";
			$("#depth2").append(html);
		} 
	}
}

// 1뎁스 외 부서 생성
function drawTree2(dept) {
	for(var data of dept){
		if(data.SUPER_DEPT_NUM != null) {
			var html = "";
			html += "<div class=\"orgnzt_depth3\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) + "\" sdeptNum=\"" + data.DEPT_NUM + "\"  dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM +  "\" >   ";
			html += "	<div class=\"orgnzt_depth3_area \">                      ";
			html += "		<div class=\"depth_slc_icon\"></div>               ";
			html += "		<div class=\"folder_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "<div class=\"orgnzt_depth4_wrap\" id=\"" + data.DEPT_NUM + "\"></div>";
			html += "</div>                                                    ";
			$("#" + data.SUPER_DEPT_NUM).append(html);
		}
	} 
}

// 사원 생성
function drawTree3(emp) {
	for(var data of emp){
		var html = "";
			html += "<div class=\"orgnzt_depth3\" id=\"orgnztEmp\" orgnztEmpNum=\"" + data.EMP_NUM + "\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) +  "\" sdeptNum=\"" + data.DEPT_NUM + "\" dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM + "\">  ";
			html += "	<div class=\"orgnzt_depth3_area\">                     ";
			html += "		<div class=\"depth_emp_icon\"></div>               ";
			html += "		<div class=\"profile_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.EMP_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "</div>                                                    ";
			$("#" + data.DEPT_NUM).append(html);
	}
}

// 사원 상세정보 리로드
function reloadEmpInfo() {
   var params = $("#empInfoForm").serialize();
   
   $.ajax({
      type : "post",
      url : "orgnztChartActionAjax/empInfo",
      data : params,
      dataType : "json",
      success : function(res) {
    	  drawEmpInfo(res.empInfo);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
   
}
// 사원 상세정보 그리기
function drawEmpInfo(empInfo){
    var html = "";
    
    html +=   " <div class=\"orgnzt_emp_info_box\">                                     ";
	html += "	<div class=\"orgnzt_empp_info_box_left\">                               ";
	html += "		<div class=\"orgnzt_emp_img_wrap\"><img id=\"orgnzt_emp_img\" src=\"resources/upload/" + empInfo.EMP_PCTR_FILE + "\" /></div>   ";
	html += "		<div class=\"orgnzt_emp_name\" id=\"orgnztEmpName\" >" + empInfo.EMP_NAME + "</div>   ";
	html += "	</div>                                                                  ";
	html += "	<div class=\"orgnzt_emp_info_box_right\">                               ";
	html += "		<div class=\"orgnzt_emp_info_wrap\">                                ";
	html += "			<div class=\"orgnzt_emp_info_txt\" id=\"empDeptName\" >부서</div> ";
	html += "			<input type=\"text\" class=\"orgnzt_emp_info_input\" readonly=\"readonly\" value=\"" + empInfo.DEPT_NAME + "\"/>          ";
	html += "		</div>                                                              ";
	html += "		<div class=\"orgnzt_emp_info_wrap\">                                ";
	html += "			<div class=\"orgnzt_emp_info_txt\" id=\"empRankName\" >직급</div> ";
	html += "			<input type=\"text\" class=\"orgnzt_emp_info_input\" readonly=\"readonly\"  value=\"" + empInfo.RANK_NAME + "\"/>          ";
	html += "		</div>                                                              ";
	html += "		<div class=\"orgnzt_emp_info_wrap\">                                ";
	html += "			<div class=\"orgnzt_emp_info_txt\" id=\"empHp\" >연락처</div>   ";
	html += "			<input type=\"text\" class=\"orgnzt_emp_info_input\" readonly=\"readonly\"  value=\"" + empInfo.PHONE_NUM + "\"/>          ";
	html += "		</div>                                                              ";
	html += "		<div class=\"orgnzt_emp_info_wrap\">                                ";
	html += "			<div class=\"orgnzt_emp_info_txt\" id=\"empMail\" >이메일</div> ";
	html += "			<input type=\"text\" class=\"orgnzt_emp_info_input\" readonly=\"readonly\"  value=\"" + empInfo.EMAIL + "\"/>          ";
	html += "		</div>                                                              ";
	html += "	 </div>                                                                 ";
	html +=   "</div> ";
	   
   $("#cont_right").html(html);
}
</script>
</head>
<body>
	<form action="#" id="empInfoForm"> 
		<input type="hidden" id="orgnztEmpNum" name="orgnztEmpNum" />
	</form>
		<input type="hidden" id="dname" /> 
	<form action="#" id="actionForm">
		<input type="hidden" id="sdeptNum" name="sdeptNum" value="${sdeptNum}" /> 
		<input type="hidden" id="deptName" name="deptName" /> 
		<input type="hidden" id="deptLevel" name="deptLevel" value="${deptLevel}" /> 
		<input type="hidden" id="mdfySuperDeptNum" name="mdfySuperDeptNum"  value="" /> 
		<input type="hidden" id="mdfyDeptLevel" name="mdfyDeptLevel" /> 
		<input type="hidden" id="superDeptNum" name="superDeptNum"   /> 
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
			<div class="page_title_text">조직도</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cont_left">
				<!-- 읽기권한 있는 경우 버튼생성 -->
				<c:if test="${menuAthrty == 2}">
					<div class="orgnzt_btn_area">
						<input type="button" class="orgnzt_btn" id="orgnzt_add_btn" value="부서등록" />
						<input type="button" class="orgnzt_btn" id="orgnzt_mdfy_btn" value="부서수정" />
					    <input type="button" class="orgnzt_btn" id="orgnzt_del_btn" value="부서삭제" />
					</div>
				</c:if>
				<div class="orgnzt_area">
					<div class="scroll_area">
						<div class="orgnzt_depth1_wrap">
							<div class="orgnzt_depth1" id="default" dname="카카오뱅크"  deptLevel="1" superDeptNum="" >
								<div class="depth_slc_icon"></div>
								<div class="kb_icon"></div>
								<div class="depth_txt">카카오뱅크</div>
							</div>
							<div class="orgnzt_depth2_wrap" id="depth2">
							</div>
						</div>	
					</div>
				</div>
			</div>
			<div class="cont_right" id="cont_right"></div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>