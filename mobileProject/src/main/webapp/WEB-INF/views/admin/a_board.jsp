<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anima-mundi admin page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap-theme.min.css">
<style type="text/css">
#bTB{
	margin: 10px;
	width: 100%;
}
#bTB thead{
	background-color: #DF9C9D;
	text-align: center;
	font-weight: bold;
}
.container a{
	margin-top:10px;
}
.th{
	background-color:#D9D9D9;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#bD").addClass("activeD")

	$("#tbody tr").click(function(){
		var bno = $(this).find(".bno").html()
		$.ajax({
			url:"qaBoardDetail.do",
			data:{bno:bno},
			success:function(data){
				var d = eval("("+data+")")
				$("#detailM").modal("show")
				$("#detailM .modal-body").html("<table class='table table-border'><tr>"+
						"<td class='th'>작성자</td><td>"+d.id+"</td><td class='th'>작성날짜</td><td>"+d.writeDate+"</td></tr>"+
						"<tr><td class='th'>제목</td><td colspan='3'> ["+d.category+"] "+d.title+"</td></tr>"+
						"<tr><td colspan='4'>"+d.content+"</td></tr>"+
						"<tr><td class='th'>파일</td><td colspan='3'>"+d.filename+"</td></tr></table>")
						
				var updateBtn=$('<button type="button" class="btn btn-primary">Answer</button>');
				$("#detailM .modal-footer").html(updateBtn)
				$("#detailM .modal-footer").append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>')
				
				updateBtn.click(function(){
					$("#detailM").modal("hide")
					$("#answerM").modal("show")
					$("#answerM .modal-body").html("<table class='table table-border'><tr>"+
							"<td class='th'>작성자</td><td>"+d.id+"</td><td class='th'>작성날짜</td><td>"+d.writeDate+"</td></tr>"+
							"<tr><td class='th'>제목</td><td colspan='3'> ["+d.category+"] "+d.title+"</td></tr>"+
							"<tr><td colspan='4'><textarea>"+d.content+"</textarea></td></tr>"+
							"<tr><td class='th'>파일</td><td colspan='3'>"+d.filename+"</td></tr></table>")
					var updateBtn=$('<button type="button" class="btn btn-primary">Complete</button>');
					$("#answerM .modal-footer").html(updateBtn)
					$("#answerM .modal-footer").append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>')
					
				})
			}
		})
	})
});
</script>
</head>
<body>
<jsp:include page="a_menu.jsp"></jsp:include>
<div class="container">
<a href="#" class="btn btn-light pull-right">찾기</a>
<table id="bTB" class="table table-hover">
	<thead>
	<tr>
		<td>NO</td>
		<td>CATEGORY</td>
		<td>ID</td>
		<td>TITLE</td>
		<td>DATE</td>
		<td>STATE</td>
	</tr>
	</thead>
	<tbody id="tbody">
	<c:forEach items="${list }" var="b">
		<tr>
			<td class="bno">${b.bno }</td>
			<td>${b.category}</td>
			<td>${b.id}</td>
			<td>${b.title}</td>
			<td>${b.writeDate}</td>
			<td>${b.state}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

<!-- 문의글 상세창 -->
<div class="modal" id="detailM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">문의글 상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
</div>

<!-- 문의글 답변창 -->
<div class="modal" id="answerM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">문의글 답변</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>