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
table{
	text-align:center;
}
td{
	text-align: center;
} 
#chkPwd{
	margin-left:10px;
}
#mypagemenu tr td{
	text-align: center;
	vertical-align: middle;
}
#mypagemenu img{ 
	margin-top:10px;
	margin-bottom:10px;
	width:80%;
} 
</style>
<script type="text/javascript">
     $(function(){
           $("#buyBtn").click(function(){
        		location.href="myBuy.do?tab=true";  
           });
           $("#chkBtn").click(function(){ 
        	   if($("#chkPwd").val()==$("#pwd").val()){
        		   location.href="editMyPage.do"
        	   }else{
        		   alert("비밀번호가 틀립니다.")
        	   }
           })
           $("#m3").click(function(){
        	   location.href="history.do"
           })
           $("#bye").click(function(){
				if(confirm("정말 탈퇴하실건가요?ㅠㅜ")==1){
					$.ajax({
						url:"bye.do",
						success:function(re){
							if(re=='SUCCESS'){
								alert("즐거운 여행이었습니다. 안녕히가세요  -Animamundi");
								location.href="index.do"
							}else{
								alert("탈퇴를 실패했습니다. 문의게시판에 문의해주세요.")
							}
						}
					
				})
			}
           })
     })
</script>
</head>
<body> 
	<input type="hidden" id="pwd" value="${user.pwd }">
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
           	<br>
           		<table width='100%' id="mypagemenu">
           			<tr>
						<td rowspan="3"><img src="resources/img/mypM1.png" data-toggle="modal" data-target="#chkM"></td>
           			</tr>
           			<tr></tr>
           			<tr>
           				<td rowspan="3"><img src="resources/img/mypM2.png" id="buyBtn" data-ajax='false'></td>
           			</tr>
           			<tr></tr>
           			<tr>
           				<td rowspan="3"><img src="resources/img/mypM3.png" id="m3" data-ajax='false'></td>
           			</tr>
           			<tr></tr> 
           			<tr>
           				<td rowspan="3"><img src="resources/img/mypM4.png" id="bye" data-ajax='false'></td>
           			</tr>
           		</table>
           </div>
	</div>
	<div class="modal" tabindex="-1" id="chkM" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header"> 
	        <h5 class="modal-title">비밀번호 확인</h5> 
	      </div>
	      <div class="modal-body">
	     	 <div class="row">  
			    <div class="col-6"> 
	        		<input type="password" id="chkPwd"  class="form-control">
	        	</div>
	        	<div class="col">
	        		<button type="button" class="btn btn-info" id="chkBtn">비밀번호 확인</button>
	        	</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
