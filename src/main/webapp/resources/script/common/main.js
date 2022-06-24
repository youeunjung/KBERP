/**
 * main.js
 * create by 2022.03.16
 * top 및 left메뉴 핸들링
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
	
	getLeftMenu();
	
	//Logout Button
	$("#logoutBtn").on("click", function() {
		location.href = "logout";
	});
	
	//Logo Event
	$(".logo").on("click", function() {
		$("#top").val(21);
		
		$("#menuNum").val(1);
		
		$("#menuType").val("B");
		
		$("#locationForm").attr("action", "board");
		
		$("#locationForm").submit();
	});
	
	//Left Menu Location Event
	$(".left_area").on("click", ".menu_depth2_area, .menu_depth2_single_area,  .menu_depth3", function() {
		if($(this).is("[adrs]")) {
			$("#menuNum").val($(this).attr("menunum"));
			
			if($(this).attr("adrs") == "board") {
				$("#menuType").val("B");
			} else {
				$("#menuType").val("M");
			}
			
			$("#locationForm").attr("action", $(this).attr("adrs"));
			
			$("#locationForm").submit();
		} else {
			$(".menu_depth2_on").attr("class", "menu_depth2");
			
			$(this).parent().attr("class", "menu_depth2_on");
		}
	});
	
	//Top Menu Location Event
	$(".menu_depth1_wrap").on("click", ".top_menu, .top_menu_on", function() {
		$("#top").val($(this).attr("topnum"));
		
		$("#menuNum").val($(this).attr("menunum"));
		
		if($(this).attr("adrs") == "board") {
			$("#menuType").val("B");
		} else {
			$("#menuType").val("M");
		}
		
		$("#locationForm").attr("action", $(this).attr("adrs"));
		
		$("#locationForm").submit();
	});
});

function getLeftMenu() {
	var params = $("#locationForm").serialize();
	
	$.ajax({
		type : "post",
		url : "leftMenuAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			drawLeftMenu(result.leftMenu);			
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawLeftMenu(menu) {
	var secDepthCheck = false;
	var html = "";
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].DEPTH == 2) { // 2DEPTH
			if(menu[i].CNT == 0) { // 단일메뉴
				if(menu[i].MENU_TYPE == $("#menuType").val() && menu[i].MENU_NUM == $("#menuNum").val()) {
					html += "<div class=\"menu_depth2_on\">";
				} else {
					html += "<div class=\"menu_depth2\">";
				}
				html += "<div class=\"menu_depth2_single_area\" menunum=\"" + menu[i].MENU_NUM + "\" adrs=\"" + menu[i].ADRS + "\">";
				html += "<div class=\"menu_depth2_text\">" + menu[i].MENU_NAME + "</div>";
				html += "<div class=\"left_menu_bar\"></div>";
				html += "</div>";
				html += "</div>";
			} else {
				html += "<div class=\"menu_depth2\">";
				html += "<div class=\"menu_depth2_area\" menunum=\"" + menu[i].MENU_NUM + "\">";
				html += "<div class=\"menu_depth2_text\">" + menu[i].MENU_NAME + "</div>";
				html += "<div class=\"left_menu_bar\"></div>";
				html += "</div>";
				html += "<div class=\"menu_depth3_wrap\">";
				// 3DEPTH
				for(var j = 0 ; j < menu.length ; j++) {
					if(menu[j].DEPTH == 3 && menu[i].MENU_NUM == menu[j].SUPER_MENU_NUM) {
						if(menu[j].MENU_TYPE == $("#menuType").val() && menu[j].MENU_NUM == $("#menuNum").val()) { //현재 메뉴 구분
							secDepthCheck = true;
							html += "<div class=\"menu_depth3_on\" menunum=\"" + menu[j].MENU_NUM + "\" adrs=\"" + menu[j].ADRS + "\">";
						} else {
							html += "<div class=\"menu_depth3\" menunum=\"" + menu[j].MENU_NUM + "\" adrs=\"" + menu[j].ADRS + "\">";
						}
						
						html += "" + menu[j].MENU_NAME + "";
						html += "</div>";
					}
				}
				html += "</div>";
				html += "</div>";
			}
		}
	} // menu for end
	$(".left_menu_wrap").html(html);
	
	// GNB DRAWING
	var flow = [];
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].MENU_NUM == $("#menuNum").val()) {
			flow = menu[i].MENU_FLOW.split(",");
			
			if(secDepthCheck) {
				$(".menu_depth2_area[menunum='" + menu[i].SUPER_MENU_NUM + "']").parent().attr("class", "menu_depth2_on");
			}
			break;
		}
	}
	
	var gnb = "Home";
	for(var i = 0 ; i < menu.length ; i++) {
		for(var j = 0 ; j < flow.length ; j++) {
			if(menu[i].MENU_NUM == flow[j]) {
				gnb += "<div class=\"navi_next\"></div>" + menu[i].MENU_NAME;
			}
		}
	}
	
	$(".navi_bar").html(gnb);
}