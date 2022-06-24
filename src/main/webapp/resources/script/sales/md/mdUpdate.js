
//목록으로 버튼(#listBtn) 클릭시, mdList(#actionForm)로 이동
function goMdList() {
	$("#listBtn").on("click", function () {
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width    : 400,
			height   : 180,
			title    : "알림",
			draggable: true,
			contents : "내용이 저장되지 않았습니다.<br> 페이지를 나가시겠습니까?",
			buttons  : [{
				name : "확인",
				func : function() {
					$("#actionForm").submit();
					closePopup();
							}
						},{
				name : "취소"
						}]
		});
	});
}



// 저장 버튼(#saveBtn) 클릭시, 필수항목 체크 후 mdActionAjax/update 로 이동 
// update 성공시 mdReg로 이동하는 함수
function updateMdData(){
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#md_name")){
			alert("상품명을 입력하세요.");
			$("#md_name").focus();
		}else if(checkSelect("#md_type")){
			alert("상품 유형을 입력하세요.");
			$("#md_type").focus();
		}else if(checkSelect("#md_grade")){
			alert("상품 등급을 입력하세요.");
			$("#md_grade").focus();
		}else if(checkSelect("#sales_sts")){
			alert("판매 상태를 입력하세요.");
			$("#sales_sts").focus();
		}else if(checkEmpty("#limit_amnt")){
			alert("한도 금액을 입력하세요.");
			$("#limit_amnt").focus();
		}else if(checkNum("#limit_amnt")){
			alert("한도 금액은 숫자만 입력 가능합니다.");
			$("#limit_amnt").focus();
		}else if(checkEmpty("#sales_start_date")){
			alert("판매기간 시작일을 입력하세요.");
			$("#sales_start_date").focus();
		}else if(!checkEmpty(sales_end_date)){
			if($("#sales_end_date").val() < $("#sales_start_date").val()){
				alert("판매기간 종료일을 판매기간 시작일 이후로 설정해 주세요.");
				$("#sales_end_date").focus();
			}
		}else if(checkEmpty("#intrst_rate")){
			alert("이자율을 입력하세요.");
			$("#intrst_rate").focus();
		}else if(checkNum("#intrst_rate")){
			alert("이자율은 숫자만 입력 가능합니다.");
			$("#intrst_rate").focus();
		}else if(checkSelect("#mid_prdmptn_psbl_check")){
			alert("중도 상환 가능 여부를 입력하세요.");
			$("#mid_prdmptn_psbl_check").focus();
		}else if(checkSelect("#loan_prd")){
			alert("대출 기간을 입력하세요.");
			$("#loan_prd").focus();
		}else{
			makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width    : 400,
			height   : 180,
			title    : "알림",
			draggable: true,
			contents : "저장하시겠습니까?",
			buttons  : [{
				name : "확인",
				func : function() {
					var writeForm = $("#writeForm");
					
						writeForm.ajaxForm({
							
							success : function(res) {
								
								if(res.fileName) {
									$("#attFile").val(res.fileName[0]);
								}
								var params = $("#writeForm").serialize();
								var callback = ajaxComm("mdActionAjax/update", params,"");
								callback.done(function(obj){
									$("#actionForm").attr("action", "mdList");
									$("#actionForm").submit();
								});
								callback.fail(function(request,status,error) {
									console.log(request.requestText);
								});
							},
							
							error : function(req) {
								console.log(req.responseText);
							}
						});
					
					writeForm.submit();
					closePopup();
					
						}
					},{
						name : "취소"
				}]
		});
			
		}
	});
}
