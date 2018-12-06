<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anima-mundi admin page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap-theme.min.css">
<style type="text/css">
#sTB{
	margin: 10px;
	width: 100%;
}
#sTB thead{
	background-color: #EEC9C8;
	text-align: center;
	font-weight: bold;
}
.container a{
	margin-top:10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sD").addClass("activeD")
	var editBtn=$('<a href="#" class="btn btn-info">JSON 수정</a>');
	$("#fixD").append(editBtn)
	$(editBtn).click(function(){
		location.href="editTest.do"
	})
	$.getJSON("test_main.do",function(data){
		$.each(data,function(i,t){
			var tr=$("<tr><td>"+t.testTable_name+"</td><td>"+t.test_name+"</td><td>"+t.point+"</td></tr>");
			$("#tbody").append(tr)
			$(tr).click(function(){
				$("#detailM").modal("show")
				$.getJSON("testDetail.do",{tablename:t.testTable_name},function(d){
					$("#detailM .modal-body").html(d.question+"<br><br>");
					$.each(d,function(k,v){
						if(k.substring(0,1)=='a'){
							$("#detailM .modal-body").append(k.substring(1,2)+") "+v+"<br>");
							$("#detailM .modal-body").append("\t → "+d["r"+k.substring(1,2)]+"<br>");
							}
						})
				})
			})	
		})
	})
});
</script>
</head>
<body>
<jsp:include page="a_menu.jsp"></jsp:include>
<div class="container">

<table id="sTB" class="table table-hover">
	<thead>
	<tr>
		<td>TABLENAME</td>
		<td>TESTNAME</td>
		<td>POINT</td>
	</tr>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>
</div>

<!-- 심리테스트 상세창 -->
<div class="modal" id="detailM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">심리테스트 상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>