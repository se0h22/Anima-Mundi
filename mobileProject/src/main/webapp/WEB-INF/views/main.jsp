<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Welcome to AnimaMundi</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
     <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#pImg{
	position: absolute;
	left:10%;
	top:45%;
}
#hImg{
	position: absolute;
	left:45%;
	top:27%; 
}
#mentImg{
	position: absolute;
	left:10%;
	top:10%;
}
</style>
<script type="text/javascript">
     $(function(){
    	 $("#main").enhanceWithin(); 
     })
</script>
</head>
<body>
     <div data-role="page" id="main" data-fullscreen="true"> 
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
           		<img src="resources/img/helpMent.png" id="mentImg" width="45%">
           		<img src="resources/item/${pImg }" id="pImg" width="80%">
				<img src="resources/item/${hImg }" id="hImg" width="40%">
           </div>
     </div>
</body>
</html>
