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
.container {
	text-align: center;
}
.container{
	padding:10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sD").addClass("activeD")
	$.getJSON("resources/json/testList.json",function(data){
		var r= encodeURI(JSON.stringify(data) , "UTF-8");
		$(".container textarea").html(decodeURI(r)) //JSON.parse(내용) 하면 json으로만들어준대
	})
});
</script>
</head>
<body>
<jsp:include page="a_menu.jsp"></jsp:include>
<div class="container"><br>
		<textarea rows="20" cols="150"></textarea><br>
		<p></p>
		<button class="btn btn-info">수정완료</button> 
</div>
</body>
</html>