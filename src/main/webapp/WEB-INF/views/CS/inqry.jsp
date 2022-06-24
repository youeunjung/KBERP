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
.cont_area {
	display: inline-block;
}

.cnsl_page {
	display: inline-block;
	width: 900px;
	height: 40px;
	line-height: 40px;
	color: #2E83F2;
	text-shadow: 0px 0 1px #7b7b7b;
	font-size: 14pt;
	font-weight: bold;
	text-indent: 10px;
	border-bottom: 2px solid #2E83F2;
}

.inqry_info, .ansr_info {
	font-size: 10.5pt;
    margin-left: 30px;
    margin-bottom: 10px;
    font-family: 맑은고딕;
}

.inqry_info th, .ansr_info th {
	text-align: left;
	width: 95px;
	height: 50px;
}

.es_text {
	display: inline;
	line-height: 50px;
    font-size: 10pt;
    text-shadow: none;
    text-indent: 645px;
}

.th_star {
	display: inline-block;
	color: #2E83F2;
	margin-left: -3px;
}

.th_star_input {
	display: inline;
	color: #999;
	font-weight: normal;
}

tbody td {
	height: 30px;
}

tbody td input {
	width: 160px;
	height: 20px;
	padding: 5px 10px;
	border: none;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

tbody td input:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

.inqry_info td select {
	width: 180px;
	height: 30px;
	text-indent: 5px;
}

tr:nth-child(4) input, tr:nth-child(6) input {
	width: 700px;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

tr:nth-child(5) {
	vertical-align: top;
}

.wrtng_cont {
	height: 300px;
	font-size: 10.5pt;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
	padding: 10px 10px;
}

.wrtng_cont:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

.ansr_info tbody tr:nth-child(2) input {
	width: 700px;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

.ansr_info tr:nth-child(3) {
    vertical-align: top;
}

.ansr_cont {
	height: 300px;
	font-size: 10.5pt;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
	padding: 10px 10px;
}

#att, #ansr_att {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

.cmn_btn_ml {
	/* 마우스 드래그 금지 */
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.cnsl_bottom {
	float: right;
	margin-top: 10px;
	margin-right: 50px;
	vertical-align: bottom;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
}

.popup_cont {
	text-align: center;
	line-height: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "inqryList");
		$("#actionForm").submit();
	});
	
	$("#ansr_rvs").on("click", function () {
		$("#actionForm").attr("action", "ansrAdd");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "삭제",
			contents : "답변을 삭제하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					var params =  $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "inqryActionAjax/delete", 
						dataType : "json", 
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
								$("#actionForm").submit();
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText); 			
						}
					});
					closePopup();
				} // func:function end
			}, {
				name : "아니오"
			}]
		}); // makePopup end
	}); // deleteBtn end
}); // document ready end
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
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NAME}" />
		<input type="hidden" id="ctgry_name" name="ctgry_name" value="${data.CTGRY_NAME}" />
		<input type="hidden" id="ansrAttName" value="${fileName}" />
		<input type="hidden" id="top" name="top" value="${param.top}"/>
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<span class="page_title_text">1:1 문의</span>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cnsl_top">
			<c:choose>
				<c:when test="${empty data.ANSR_TITLE}">
					<div class="cnsl_page">상담글
						<div class="es_text">
							<div class="th_star">*</div>
							<div class="th_star_input">항목은 필수입력 항목입니다.</div>
						</div>
					</div>
					<table class="inqry_info">
					<tbody>
						<tr>
							<th scope="row">이름
								<span class="th_star">*</span>
							</th>
							<td>
								<input type="text" id="clnt_name" name="clnt_name" readonly="readonly" value="${data.CLNT_NAME}">
							</td>
						</tr>
						<tr>
							<th scope="row">연락처
								<span class="th_star">*</span>
							</th>
							<td>
								<input type="text" readonly="readonly" value="${data.PHONE_NUM_1}">
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리
								<span class="th_star">*</span>
							</th>
							<td>
								<select disabled="disabled" id="ctgry_name" name="ctgry_name">
									<option>${data.CTGRY_NAME}</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">문의 제목
								<span class="th_star">*</span>
							</th>
							<td>
								<input type="text" name="wrtng_title" readonly="readonly" value="${data.WRTNG_TITLE}">
							</td>
						</tr>
						<tr>
							<th scope="row">문의 내용
								<span class="th_star">*</span>
							</th>
							<td>
								<div class="wrtng_cont">${data.WRTNG_CONT}</div>
							</td>
						</tr>
						<c:if test="${!empty data.ATT_FILE}">
							<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
							<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<a href="resources/upload/${data.ATT_FILE}" download="${fileName}">
										${data.ATT_FILE}
										</a>
									</td>
								</tr>
						</c:if>
					</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="cnsl_page">상담글
							<div class="es_text">
								<div class="th_star">*</div>
								<div class="th_star_input">항목은 필수입력 항목입니다.</div>
							</div>
						</div>
						<table class="inqry_info">
						<tbody>
							<tr>
								<th scope="row">이름
									<span class="th_star">*</span>
								</th>
								<td>
									<input type="text" id="clnt_name" name="clnt_name" readonly="readonly" value="${data.CLNT_NAME}">
								</td>
							</tr>
							<tr>
								<th scope="row">연락처
									<span class="th_star">*</span>
								</th>
								<td>
									<input type="text" readonly="readonly" value="${data.PHONE_NUM_1}">
								</td>
							</tr>
							<tr>
								<th scope="row">카테고리
									<span class="th_star">*</span>
								</th>
								<td>
									<select disabled="disabled" id="ctgry_name" name="ctgry_name">
										<option>${data.CTGRY_NAME}</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">문의 제목
									<span class="th_star">*</span>
								</th>
								<td>
									<input type="text" name="wrtng_title" readonly="readonly" value="${data.WRTNG_TITLE}">
								</td>
							</tr>
							<tr>
								<th scope="row">문의 내용
									<span class="th_star">*</span>
								</th>
								<td>
									<div class="wrtng_cont">${data.WRTNG_CONT}</div>
								</td>
							</tr>
							<c:if test="${!empty data.ATT_FILE}">
							<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
							<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<a href="resources/upload/${data.ATT_FILE}" download="${fileName}">
										${data.ATT_FILE}
										</a>
									</td>
								</tr>
							</c:if>
						</tbody>
						</table>
					<div class="cnsl_page">답변글</div>
					<table class="ansr_info">
						<tbody>
							<tr>
								<th scope="row">상담자명
								</th>
								<td>
									<input type="text" id="emp_name" name="emp_name" readonly="readonly" value="${data.EMP_NAME}">
								</td>
							</tr>
							<tr>
								<th scope="row">답변 제목
								</th>
								<td>
									<input type="text" name="wrtng_title" readonly="readonly" value="${data.ANSR_TITLE}">
								</td>
							</tr>
							<tr>
								<th scope="row">답변 내용
								</th>
								<td>
									<div class="ansr_cont">${data.ANSR_CONT}</div>
								</td>
							</tr>
							<c:if test="${!empty data.ANSR_ATT_FILE}">
							<c:set var="fileLength" value="${fn:length(data.ANSR_ATT_FILE)}"></c:set>
							<c:set var="fileName" value="${fn:substring(data.ANSR_ATT_FILE, 20, fileLength)}"></c:set>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<a href="resources/upload/${data.ANSR_ATT_FILE}" download="${fileName}">
										${fileName}
										</a>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
				<div class="cnsl_bottom">
					<div class="cmn_btn_ml" id="listBtn">목록</div>
					<c:choose>
						<c:when test="${empty data.ANSR_TITLE}">
							<div class="cmn_btn_ml" id="ansr_rvs">답변등록</div>
						</c:when>
						<c:otherwise>
							<div class="cmn_btn_ml" id="ansr_rvs">수정</div>
						</c:otherwise>
					</c:choose>
					<c:if test="${!empty data.ANSR_TITLE}">
						<div class="cmn_btn_ml" id="deleteBtn">삭제</div>
					</c:if>
				</div>
			</div> <!-- cnsl_top의 끝 -->
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>