<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP 글 등록</title>
<!-- 헤더추가 -->
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

        table{
                border-collapse: collapse;
                border-spacing: 1px;
                text-align:left;
                border-top: 1px solid #b7b7b7;
                margin : 20px 10px;
        }
         tr {
                 width: 100%;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #b7b7b7;
                font-size:15pt;
        }
         td {
                 width: 100%;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #b7b7b7;
        }
       
 textarea{
 resize:none;
 }
  tr:nth-child(3){
 	height: 250px;
 }
 .cmn_btn_ml{
 	float:right;
 }
 
 .save_cont{
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 110px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("content",{
		//옵션
		resize_enabled:false, //크기 변경
		language: "ko",       //언어
		enterMode : 2,        //엔터<br/>처리
		width: "700",		  //가로
		height: "300"  	      //세로
	});
	
	$("#cancelBtn").on("click", function(){
		history.back();
	});
	$("#updateBtn").on("click", function() {
		var html = "";
		
		html += "<div class=\"save_cont\">수정 하시겠습니까?</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "수정",
			contents : html,
			buttons : [{
				name : "수정",
				func:function() {
					$("#content").val(CKEDITOR.instances['content'].getData());
					if(checkEmpty("#title")){
						alert("제목을 입력하세요");
						$("#title").focus();
					}else if(checkEmpty("#content")){
						alert("내용을 입력하세요");
						$("#content").focus();
					}
					else{
						var params= $("#updateForm").serialize();
						
						$.ajax({
							type: "post", // 전송형태
							url : "guidesActionAjax/update" , //통신 주소
							dataType : "json", //받을 데이터 형태
							data : params, //보낼 데이터. 보낼 것이 없으면 안씀
							success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
								if(res.res=="success"){
									$("#backForm").submit();
								}else{
									alert("수정중 문제가 발생하였습니다");
								}
							},
							error: function(request, status, error){ // 문제 발생 시 실행 함수
								console.log(request.responseText); //결과텍스트. 스프링 실행 결과
							}
						});
					}
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
});
function checkEmpty(sel){
	if($.trim($(sel).val())==""){
		return true;
	}else{
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
			<div class="page_title_text">수정</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<form action="#" id="updateForm" method="post">
		<!-- 글번호 가져와서 수정 -->
		<input type="hidden" name="no" value="${param.no}" />
			   <table>
                        <tr>
                        <td>작성자</td>
                        <td>${sEmpName}<input type = "hidden" name = "writer" value="${sEmpNum}"> </td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td><input type = text id="title" name = "title" size=60 value="${data.CMBN_TITLE}"></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea id="content" name = "content" cols=85 rows=20 >${data.CMBN_CONT}</textarea></td>
                        </tr>
                        </table>
	<input type="hidden" id="page" name="page" value="${page}"/>
         </form>
         
         <form action="guideWrtng" id="backForm" method="post">
          <input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="no" name="no"/>
         </form>
					<div class="cmn_btn_ml" id="updateBtn">수정</div>
					<div class="cmn_btn_ml" id="cancelBtn">취소</div>
					
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>