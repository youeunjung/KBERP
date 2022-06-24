/**
 * cMain.js
 * create by 2022.05.10
 * top 메뉴 핸들링
 */
$(document).ready(function() {
	$(".right_area_wrap").slimScroll({
		width : $(".right_area").width() + "px",
	    height : $(".right_area").height() + "px",
	    axis : 'both'
	});
	
	$(window).resize(function(){
		$(".right_area_wrap").slimScroll({
			width : $(".right_area").width() + "px",
			height : $(".right_area").height() + "px",
			axis : 'both'
		});
	});
	
	//Logout Button
	$("#cLogoutBtn").on("click", function() {
		location.href = "cLogout";
	});
	
	//Login Button
	$("#cLogInBtn").on("click", function() {
		location.href = "indvdlLogin";
	});
	
	//Logo Event
	$(".logo").on("click", function() {
		$("#top").val(69);
		
		$("#menuNum").val(1);
		
		$("#locationForm").attr("action", "cmbnInfo");
		
		$("#locationForm").submit();
	});
	
	//Top Menu Location Event
	$(".menu_depth1_wrap").on("click", ".top_menu, .top_menu_on", function() {
		$("#top").val($(this).attr("topnum"));
		
		$("#menuNum").val($(this).attr("menunum"));
		
		$("#locationForm").attr("action", $(this).attr("adrs"));
		
		$("#locationForm").submit();
	});
});
