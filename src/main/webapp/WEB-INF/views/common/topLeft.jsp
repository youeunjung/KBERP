<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

</script>
<input type="hidden" id="athrtyTypeNum" name="athrtyTypeNum" value="${athrtyTypeNum}" />
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>
<!-- Top Bar -->
<div class="top_area">
	<div class="logo"><div class="logo_erp_text">ERP</div></div>
	<div class="menu_depth1_wrap">
		<c:forEach var="menu" items="${topMenu}">
			<c:choose>
				<c:when test="${menu.MENU_NUM eq param.top}">
					<%-- _on 달린 것이 활성화 상태 --%>
					<div class="top_menu_on" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="sample">
					<%-- 
					<div class="top_menu_on" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="${menu.ADRS}">
					 --%>
						<div class="top_menu_text">${menu.MENU_NAME}</div>
						<div class="top_menu_bar"></div>
					</div>
				</c:when>
				<c:otherwise>
					<%-- 
					<div class="top_menu" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="sample">
					 --%>
					<div class="top_menu" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="${menu.ADRS}">
						<div class="top_menu_text">${menu.MENU_NAME}</div>
						<div class="top_menu_bar"></div>
					</div>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
	</div>
</div>
	<!-- Left Menu -->
	<div class="left_area">
		<div class="emp_info_area">
			<div class="emp_info">
				<div class="emp_image_area">
					<div class="emp_image_wrap">
						<c:choose>
							<c:when test="${empty sEmpPctrFile}">
							<%-- 이미지 없을 경우 --%>
								<img alt="사원이미지" src="resources/images/cmn/emp_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="사원이미지" src="resources/upload/${sEmpPctrFile}"/>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="emp_info_wrap">
					<div class="emp_name_txt">${sEmpName}<div class="emp_opt_btn"></div></div>
					<div class="emp_dept_txt">${sDeptName}&nbsp;${sRankName}</div>
				</div>
			</div>
			<div class="emp_menu_area">
				<div class="emp_menu">메신저</div>
				<div class="emp_menu">내정보</div>
				<div class="emp_menu_last" id="logoutBtn">로그아웃</div>
			</div>
		</div>
		<div class="left_menu_dpeth1_txt">
		<c:forEach var="menu" items="${topMenu}">
				<c:if test="${menu.MENU_NUM eq param.top}">${menu.MENU_NAME}</c:if>
		</c:forEach>
		</div>
		<div class="left_menu_wrap">
		</div>
	</div>
	<!-- Contents -->
	<div class="right_area">
		<div class="right_area_wrap">
		<div class="navi_bar"></div>