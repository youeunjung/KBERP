
//목록으로 버튼 클릭시, mdList로 이동
function goMdList(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "mdList");
		$("#actionForm").submit();
	});
}
		
//수정 버튼 클릭시, mdUpdate로 이동
function updateMdData() {
	$("#updateBtn").on("click", function(){
		$("#actionForm").attr("action", "mdUpdate");
		$("#actionForm").submit();
	});
}
	
//삭제 버튼 클릭시, mdActionAjax/delete를 통해 성공시 mdList
function deleteMdData(){
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			var callback = ajaxComm("mdActionAjax/delete", params, "")
			callback.done(function(obj){
				$("#actionForm").attr("action", "mdList");
				$("#actionForm").submit();
			});
			
			callback.fail(function(request,status,error) {
				console.log(request.requestText);
			});
		}
	});
}