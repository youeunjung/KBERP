<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqdt</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.buttons_bottom {
    margin-top: 10px;
	text-align:10px;
}

.title-area {
    margin-bottom: 30px;
}

.title {
	width: 940px;
    font-size: 22px;
    font-weight: bold;
    text-indent: 10px;
    padding: 10px 0px;
    border-top: 3px solid gray;
}

.writer {
	float:right;
	font-size: 16px;
	font-weight: bold;
	color: #909090;
}
.wrtr_info {
	margin-bottom:10px;
	
}
.date {
	display: inline-block;
    font-size: 16px;
    line-height: 13px;
    color: #909090;
    text-indent: 10px;
}

.cont{
	overflow: auto;
	width: 940px;
	height: 500px;
	border: 1px solid #F0F0F0;
	
	font-size: 15px;
}
.cmn_btn {
	margin-right:10px;
}
</style>
<script type="text/javascript">

	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "faq");
			$("#actionForm").submit();
		});
		
		$("#updateBtn").on("click", function () {
			$("#actionForm").attr("action", "faqUpdate");
			$("#actionForm").submit();
		});
		
		$("#deleteBtn").on("click", function() {
			makePopup({
				bg : false,
				bgClose : false,
				title : "삭제",
				contents : "게시글을 삭제하시겠습니까?",
				draggable : true,
				buttons : [{
					name : "예",
					func:function() {
						var params =  $("#actionForm").serialize();
						$("#actionForm").attr("action", "faq");
				$.ajax({
					type : "post", 
					url : "faqdtActionAjax/delete", 
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
				}
			}, {
				name : "아니오"
				}]//buttons end
			}); //makepopup end
		});// deleteBtn end
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
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="top" name="top" value="${param.top}"/>
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">FAQ</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<div class="title-area">
			<div class="title">${data.WRTNG_TITLE}</div>
			<div class="writer">${data.EMP_NAME}</div>
			<div class="wrtr_info">
				<div class="date">${data.WRTNG_DATE}</div>
				<span class="cate">
					<select disabled="disabled" id="ctgry_name" name="ctgry_name">
				 	<option>${data.CTGRY_NAME}</option>
					</select>
				</span>
			</div>
		</div>
			
		<div class="cont">
		${data.WRTNG_CONT}
		</div>
		<div class="buttons_bottom">
				<div class="cmn_btn" id="listBtn">목록</div>
				<div class="cmn_btn" id="updateBtn">수정</div>
				<div class="cmn_btn" id="deleteBtn">삭제</div>
			</div>
		</div>
	</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>