<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Welcome to AnimaMundi</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#bg{
	text-align: center;
	margin:auto;
	border: none;
}
#bg div{
	margin:10px;
	background-color: white;
	border-radius: 10px;
}
#bg div img{
	padding:20px;
	width: 250px; 
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div data-role="page" id="main" data-fullscreen="true">
		<jsp:include page="menuPanel.jsp"></jsp:include>
		<div data-role="content" id="bg">
			<div>
				<img src="resources/img/infoImg/chat.png">
				<img src="resources/img/infoImg/custom.png">
				<img src="resources/img/infoImg/iam.png">
				<img src="resources/img/infoImg/match.png">
			</div>
		</div>
	</div>
</body>
</html>
