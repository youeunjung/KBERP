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

/* 페이지 추가버튼 영역 */
.page_add_btn_area{
	width: 100%;
	height: 35px;
	text-align: right;
	padding-top: 5px;
	
}

/* 페이지 설정 영역 */
.pase{
	display: inline-block;
	vertical-align: top;
	width: 900.5px;
	height: 330px;
	border: 1px solid #7b7b7b;
}
.area_box{
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 100px;
}

.pase_title{
	width :100%;
	height: 40px;
	line-height: 40px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 10px;
	background-color: #f2cb05;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
.opt_area{
	display: inline-block;
	vertical-align: top;
	width: 450px;
	height: 100px;
}
#txt{
	display: inline-block;
	vertical-align: top;
	text-align: center;
	font-size: 10.5pt;
	font-weight: bold;
	margin-top: 5px;
	margin-left: 5px;
	background-color: #F2CB05;
}
.cmn_btn_ml{
	display: inline-block;
	vertical-align: top;
	margin-top: 10px;
}
#txt_file{
	display: inline-block;
	vertical-align: top;
	text-align: left;
	font-size: 10.5pt;
	margin-top: 15px;
	margin-left: 5px;
}
#btn_img{
	width: 16px;
	height: 16px;
	margin-top: 7px;
}
.cmn_btn_mb{
	float: right;
	margin-top: 5px;
	background-color: #f4f4f4;
}

</style>
<script type="text/javascript">
$(document).ready(function() {

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
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			
			
			<!-- 페이지 설정 영역 시작 -->
			<div class="pase">
				<div class="pase_title">페이지 1</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 1" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
					<div class="opt_area">
						<input id="txt" type="text" value="영역 2" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 3" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
					<div class="opt_area">
						<input id="txt" type="text" value="영역 4" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 5" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
			</div><!-- 페이지 설정 영역 끝 -->
			
			<!-- 페이지 설정 영역 2 -->
			<div class="pase">
				<div class="pase_title">페이지 2
					<div class="cmn_btn_mb">페이지 삭제</div>
				</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 1" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
					<div class="opt_area">
						<input id="txt" type="text" value="영역 2" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 3" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
					<div class="opt_area">
						<input id="txt" type="text" value="영역 4" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
				<div class="area_box">
					<div class="opt_area">
						<input id="txt" type="text" value="영역 5" readonly="readonly" size="10px" />
						<br/>
						<div class="cmn_btn_ml"><img id="btn_img" alt="불러오기" src="resources/images/CS/plus.png"></div>
						<input id="txt_file" type="text" value="불러온 파일(제목)" readonly="readonly" size="30px" style="background-color: #f4f4f4;" />
					</div>
				</div>
			</div><!-- 페이지 설정 영역 2 끝 -->
			
			<!-- 페이지 추가 버튼 영역 -->
			<div class="page_add_btn_area">
				<div class=cmn_btn_mr>페이지 추가</div>
			</div>
			
			<div class="board_bottom">
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>