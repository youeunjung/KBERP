/* 검색 데이터들을 저장해놓은 old_ 값으로 값 바꿔주는 함수*/
function replaceToOldSrchData () {
	$("#md_grade").val($("#old_md_grade").val());
	$("#sales_stsA").val($("#old_sales_stsA").val());
	$("#sales_sts0").val($("#old_sales_sts0").val());
	$("#sales_sts1").val($("#old_sales_sts1").val());
	$("#sales_sts2").val($("#old_sales_sts2").val());
	$("#sales_start_date").val($("#old_sales_start_date").val());
	$("#sales_end_date").val($("#old_sales_end_date").val());
	$("#srch_gbn").val($("#old_srch_gbn").val());
	$("#srch_txt").val($("#old_srch_txt").val());
	$("#sort_gbn").val($("#old_sort_gbn").val());
} 

/*검색 데이터 유지 하기 위해 old_ 에 값을 저장해놓는 함수*/
function oldSrchDataSave() {
	$("#old_md_grade").val($("#md_grade").val());
	$("#old_sales_stsA").val($("#sales_stsA").val());
	$("#old_sales_sts0").val($("#sales_sts0").val());
	$("#old_sales_sts1").val($("#sales_sts1").val());
	$("#old_sales_sts2").val($("#sales_sts2").val());
	$("#old_sales_start_date").val($("#sales_start_date").val());
	$("#old_sales_end_date").val($("#sales_end_date").val());
	$("#old_srch_gbn").val($("#srch_gbn").val());
	$("#old_srch_txt").val($("#srch_txt").val());
	$("#old_sort_gbn").val($("#sort_gbn").val());
}