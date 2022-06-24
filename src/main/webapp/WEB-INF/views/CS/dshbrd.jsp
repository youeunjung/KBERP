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
	width: 1100px;
}
/* 개인 작업 영역 */

.area_title{
	min-width: 30px;
	max-width: 180px;
	height: 25px;
	background-color: #F2B705;
	text-align: center;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin-top: 2px;
	margin-left: 2px;
	box-shadow: 0px 1px 4px 0px #b7b7b7;
	border-radius: 2px;
}

/* 5개 영역지정 */
.area1{
	display: inline-block;
	vertical-align:top;
	width: 1098px;
	height: 200px;
	border: 1px solid #f2CB05;
	background-color: #f4f4f4;
}
.area2{
	display: inline-block;
	vertical-align:top;
	width: 366px;
	height: 400px;
	border: 1px solid #f2CB05;
	border-top: none;
	background-color: #f4f4f4;
}
.areaN{
	display: inline-block;
	vertical-align: top;
	width: 365px;
	height: 400px;
	border: none;
}
	.area3{
		display: inline-block;
		vertical-align:top;
		width: 365px;
		height: 200px;
		border: none;
		background-color: #f4f4f4;
	}
	.area4{
		display: inline-block;
		vertical-align:top;
		width: 365px;
		height: 199px;
		border: 1px solid #f2CB05;
		border-left: none;
		border-right: none;
		background-color: #f4f4f4;
	}
.area5{
	display: inline-block;
	vertical-align:top;
	width: 365px;
	height: 400px;
	border: 1px solid #f2CB05; 
	border-top: none;
	background-color: #f4f4f4;
}

/* 각 영역 아래 돋보기버튼, 표버튼 */
.area_btn_area{
	width: 100%;
	height: 30px;
	text-align: right;
	padding-top: 5px;
	margin-top: 9px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
#btn_img{
	width: 100%;
	height: 100%;
}

/* 각 영역 안에 데이터 들어가는 공간 (현재 이미지와 표로 들어가 있음) */
.graph_slct_see_1{
	width: 1000px;
	height: 120px;
	margin-top: 10px;
	margin-left: 50px;
	background-color: white;
}
#chart_img{
	width: 1000px;
	height: 120px;
}
	
.graph_slct_see_2_5{
	width: 310px;
	height: 320px;
	background-color: white;
	margin-top: 10px;
	margin-left: 25px;
}
#column_img{
	width: 315px;
	height: 320px;	
}
#landscape_img{
	width: 315px;
	height: 320px;
}

.graph_slct_see_3_4{
	width: 325px;
	height: 120px;
	background-color: white;
	margin-top: 10px;
	margin-left: 20px;
}
#curcle_img{
	width: 325px;
	height: 120px;
}

.chart_table{
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}
.chart_table thead tr {
	border-top: 2px solid #222222;
	border-bottom: 1px solid #d7d7d7;
	height: 20px;
	font-size: 11pt;
}
.chart_table tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 20px;
	text-align: center;
	color: #7b7b7b;
	font-size: 10.5pt;
}

/* 페이지와 버튼 공간 */
.board_bottom{
	margin-top: 10px;
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
			
			<!-- 영역 1 시작 -->
			<div class="area1">
				<div class="area_title"></div>
				<br/>
				<div class="graph_slct_see_1"></div>
				<div class="area_btn_area">
					<div class=cmn_btn_mr><img id="btn_img" alt="상세보기" src="resources/images/CS/zoom.png"></div>
					<div class=cmn_btn_mr><img id="btn_img" alt="전환" src="resources/images/CS/change.png"></div>
				</div>
			</div> <!-- 영역 1 끝 -->
			
			<!-- 영역 2 시작 -->
			<div class="area2">
				<div class="area_title"></div>
				<br/>
				<div class="graph_slct_see_2_5"></div>
				<div class="area_btn_area">
					<div class=cmn_btn_mr><img id="btn_img" alt="상세보기" src="resources/images/CS/zoom.png"></div>
					<div class=cmn_btn_mr><img id="btn_img" alt="전환" src="resources/images/CS/change.png"></div>
				</div>
			</div> <!-- 영역 2 끝 -->
			
			<!-- 영역지정 3,4 시작 -->
			<div class="areaN">
				<!-- 영역 3 시작 -->
				<div class="area3">
					<div class="area_title"></div>
					<br/>
					<div class="graph_slct_see_3_4"></div>
					<div class="area_btn_area">
						<div class=cmn_btn_mr><img id="btn_img" alt="상세보기" src="resources/images/CS/zoom.png"></div>
						<div class=cmn_btn_mr><img id="btn_img" alt="전환" src="resources/images/CS/change.png"></div>
					</div>				
				</div> <!-- 영역 3 끝 -->
				<!-- 영역 4 시작 -->
				<div class="area4">
					<div class="area_title"></div>
					<br/>
					<div class="graph_slct_see_3_4">
						<table class="chart_table">
				            <thead></thead>
				
				            <tbody></tbody>
				        </table>
					</div>
					<div class="area_btn_area">
						<div class=cmn_btn_mr><img id="btn_img" alt="상세보기" src="resources/images/CS/zoom.png"></div>
						<div class=cmn_btn_mr><img id="btn_img" alt="전환" src="resources/images/CS/change.png"></div>
					</div>
				</div><!-- 영역 4 끝 -->
			</div><!-- 영역지정 3,4 끝 -->
			
			<!-- 영역 5 시작 -->
			<div class="area5">
				<div class="area_title"></div>
				<br/>
				<div class="graph_slct_see_2_5"></div>
				<div class="area_btn_area">
					<div class=cmn_btn_mr><img id="btn_img" alt="상세보기" src="resources/images/CS/zoom.png"></div>
					<div class=cmn_btn_mr><img id="btn_img" alt="전환" src="resources/images/CS/change.png"></div>
				</div>			
			</div><!-- 영역 5 끝 -->
			
			<div class="board_bottom">
				<div class="pgn_area">
					<div class="page_btn page_first">first</div>
					<div class="page_btn page_prev">prev</div>
					<div class="page_btn_on">1</div>
					<div class="page_btn">2</div>
					<div class="page_btn">3</div>
					<div class="page_btn">4</div>
					<div class="page_btn">5</div>
					<div class="page_btn page_next">next</div>
					<div class="page_btn page_last">last</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>