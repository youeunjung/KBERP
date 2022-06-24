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
<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
table{	
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
.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
}
.imgPos{
	text-align: right;
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
.cc_box_in:hover {
	cursor: pointer;
	color: #2E83F2;
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
.btn_pos {
	text-align: center;
}
.btn_wd {
	width: 60px;
}
.cont_pos {
	line-height: 100px;
	text-align: center;
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
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}
.plus_btn_bot {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 7px;
	margin-top: 7.5px;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
.search_text {
	width: 679px;
	background-color: #f2f2f2;
}
#att {
	display: none;
}
#fileName {
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
	
	// 목록
	$("#listBtn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : false,
			title : "알림",
			contents : popContTwoLine("저장되지않았습니다.<br/>나가시겠습니까?"),
			buttons : [{
				name : "나가기",
				func:function() {
					$("#listForm").submit();
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	// 주소
	$("#search_icon").on("click", function() {
		findAddr();
	});
	
	// 파일업로드
	$(".aff_btn").on("click", function() {
		$("#att").click();
	});
	
	// 저장
	$("#addBtn").on("click", function() {
		if(checkEmpty("#ccName")) {
			makeAlert("필수 정보 알림", popContOneLine("고객사를 입력하세요."), function() {
				$("#ccName").focus();
				});
		} else if($("#ccClsfy").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("고객사 분류를 선택하세요."), function() {
				$("#ccClsfy").focus();
			});
		}else if($("#ccGrade").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("등급을 선택하세요."), function() {
				$("#ccGrade").focus();
			});
		} else if(isNaN($("#brNum").val())) {
			makeAlert("알림", popContOneLine("사업자 번호는 숫자만 가능합니다."), function() {
				$("#brNum").val("");
				$("#brNum").focus();
			});
		} else if(checkEmpty("#cName")) {
			makeAlert("필수 정보 알림", popContOneLine("대표명을 입력하세요."), function() {
				$("#cName").focus();
			});
		} else if(isNaN($("#phoneNum").val())) {
			makeAlert("알림", popContOneLine("유선번호는 숫자만 가능합니다."), function() {
				$("#phoneNum").val("");
				$("#phoneNum").focus();
			});
		} else if(isNaN($("#fax").val())) {
			makeAlert("알림", popContOneLine("팩스번호는 숫자만 가능합니다."), function() {
				$("#fax").val("");
				$("#fax").focus();
			});
		} else if(checkEmpty("#zipCodeNum")) {
			makeAlert("필수 정보 알림", popContOneLine("우편번호를 입력하세요."), function() {
				$("#zipCodeNum").focus();
			});
		} else if(checkEmpty("#adrs")) {
			makeAlert("필수 정보 알림", popContOneLine("주소를 입력하세요."), function() {
				$("#adrs").focus();
			});
		} else if(checkEmpty("#dtlAdrs")) {
			makeAlert("필수 정보 알림", popContOneLine("상세주소를 입력하세요."), function() {
				$("#dtlAdrs").focus();
			});
		} else if(checkEmpty("#rvn")) {
			makeAlert("필수 정보 알림", popContOneLine("매출를 입력하세요"), function() {
				$("#rvn").focus();
			});
		} else if(isNaN($("#rvn").val())) {
			makeAlert("알림", popContOneLine("매출은 숫자만 가능합니다."), function() {
				$("#rvn").val("");
				$("#rvn").focus();
			});
		} else if($("#rp").val() == 9) {
			makeAlert("필수 정보 알림", popContOneLine("인지경로를 선택하세요"), function() {
				$("#rp").focus();
			});
		} else {
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : popContOneLine("저장하시겠습니까?"),
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "저장",
					func:function() {
						var addForm = $("#addForm");
						
						addForm.ajaxForm({
							success : function(res) {
								if(res.fileName.length > 0) {
									$("#attFile").val(res.fileName[0]);
								}
								
								var params = $("#addForm").serialize();
								
								$.ajax({
									type : "post",
									url : "clntCmpnyMngActionAjax/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#ccn").val(res.seq);
											
											$("#listForm").attr("action", "clntCmpnyCont");
											$("#listForm").submit();
										} else if(res.res == "overlap") {
											makeAlert("알림", popContOneLine("중복된 고객명입니다."), function() {
												$("#ccName").focus();
											});
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
						
						addForm.submit();
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
				
		} // if End
	});
	
});

// kakao 주소
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipCodeNum').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("adrs").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("adrs").value = jibunAddr;
            }
        }
    }).open();
}

// 파일명
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}
</script>
</head>
<body>
<form action="clntCmpnyList" id="listForm" method="post">
	<input type="hidden" name="ccn" id="ccn" />
	<input type="hidden" id="page" name="page" value="${page}" />
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
			<div class="page_title_text">고객사 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="등록버튼" src="resources/images/sales/save.png" class="btnImg" id="addBtn" />
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
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" name="top" value="${param.top}" />
					<input type="hidden" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" name="menuType" value="${param.menuType}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="ccName" name="ccName" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 분류 *" /></td>
								<td>
									<select class="txt" id="ccClsfy" name="ccClsfy">
											<option value="9">선택하세요</option>
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
									<select class="txt" id="ccGrade" name="ccGrade">
											<option value="9">선택하세요</option>
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
								<td><input type="text" class="txt" id="brNum" name="brNum" placeholder="&quot; - &quot; 제외한 숫자만 입력하세요" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대표 *" /></td>
								<td><input type="text" class="txt" id="cName" name="cName" placeholder="성명" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="유선번호" /></td>
								<td><input type="text" class="txt" id="phoneNum" name="phoneNum" placeholder="&quot; - &quot; 제외한 숫자만 입력하세요" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="팩스번호" /></td>
								<td><input type="text" class="txt" id="fax" name="fax" placeholder="&quot; - &quot; 제외한 숫자만 입력하세요" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="웹사이트" /></td>
								<td><input type="text" class="txt" id="hmpg" name="hmpg" placeholder="홈페이지 주소" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="우편번호 *" /></td>
								<td><input type="text" class="txt" id="zipCodeNum" name="zipCodeNum" /></td>
							</tr>
							<tr height="40">
								<td rowspan="2"><input type="button" class="address" value="주소 *" /></td>
								<td><input type="text" class="txt search_text" id="adrs" name="adrs" readonly="readonly" />
									<img class="btnImg" id="search_icon" alt="돋보기" src="resources/images/sales/mg.png" /></td>
							</tr>
							<tr height="40">
								<td><input type="text" class="txt" placeholder="상세주소" id="dtlAdrs" name="dtlAdrs"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="매출(년) *" /></td>
								<td><input type="text" class="txt" id="rvn" name="rvn" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="인지경로 *"></td>
								<td>
									<select class="txt" id="rp" name="rp">
											<option value="9">선택하세요</option>
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
					<input type="file" id="att" name="att" onchange="uploadName(this)" />
					<input type="hidden" id="attFile" name="attFile" />
					<div class="rvn_txt"> 첨부파일
						<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" />
					</div>
					<div class="cntrct_box_in">
						<input type="text" id="fileName" readonly="readonly" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>