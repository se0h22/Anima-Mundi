<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
.ui-page {
  background-color: #222A35 !important;
}
#logo{
text-align: center;
margin-bottom:30px;
}
#logo img{
	margin-bottom:30px;
	width:100%;
}
#ment{
	color: white;
	text-shadow: none;
}
#joinA{
	display: inline; 
}
#findA{
	display: inline; 
}
.anotherMenu{
	margin-top:10px;
	text-align:center;
	font-size: 18px;
}
.anotherMenu a:hover{
	color:blue;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<title>Welcome to AnimaMundi</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="resources/css/style.css" media="screen" type="text/css" />
<script type="text/javascript">	
	$(function(){
		$("#phone").keyup(function(){
			var phone=$(this).val()
			$(this).val(phone.replace("-",""))
		})
		$("#phone1").keyup(function(){
			var phone=$(this).val()
			$(this).val(phone.replace("-",""))
		})
		$('#loginM').on('hidden.bs.modal', function () {
		   $("#log_id").val("")
		   $("#log_pwd").val("")		   
		 });
		$("#ment").each(function(){
				setInterval(function() { 
			        if ($("#ment").css('display') == 'none') {
			        	$("#ment").fadeIn();
			        } else {
			        	$("#ment").fadeOut();
			        }    
			    }, 1000)}
		);
		$("#findId").click(function(){
			$("#findM").modal("hide")
		})
		$("#findPwd").click(function(){
			$("#findM").modal("hide")
		})
		$("#btn_login").click(function(){
			var id = $("#log_id").val();
			var pwd = $("#log_pwd").val();
			
			if(id=="admin" && pwd=="admin"){
				location.href="adminP.do"
			}
			
			if(pwd==""||id==""){return;}
			
			var dt={"id":id,"pwd":pwd}
			
			$.getJSON("login.do",dt,function(d){
						if(d.result == "1"){
							location.href="main.do"
						}else{
							alert("아이디 또는 비밀번호를 확인 하세요");
						}					
				})					
		}) 

		$("#cp").click(function(){
			
			var phone = $("#phone").val();
			if(phone!= null && phone!="")
			{
				var dt = {"phone":phone}
				 
				$.getJSON("findId.do",dt,function(d){
					if(d!=null && d!="")
					{
						alert("당신의 아이디는 "+d+"입니다");
						$("#phone").val("");
					}
					else
					{
						alert("해당 정보로 아이디를 찾을 수 없습니다");
					}
						
			    });	
			}
			else
			{
				alert("핸드폰 번호를 입력하세요");
			}
		})
		$("#ce").click(function(){
			
			var email = $("#email").val();
			if(email != null && email!="")
			{
				var dt = {"email":email}
				
				$.getJSON("findId.do",dt,function(d){
					if(d!=null && d!="")
					{
						alert("당신의 아이디는 "+d+"입니다");
						$("#email").val("");
					}
					else
					{
						alert("해당 정보로 아이디를 찾을 수 없습니다");
					}
			    });	
			}
			else
			{
				alert("이메일을 입력하세요");
			}
		})
		
		$("#cpce").click(function(){
			
			var id = $("#pwdid").val();
			var phone = $("#phone1").val();
			var email = $("#email1").val();
			
			if(id!= null && id!="" && phone!= null && phone!="")
			{
				var dt = {"id":id,"phone":phone}
				
				$.getJSON("findPwd.do",dt,function(d){
					if(d!=null && d!="")
					{
						alert("당신의 비밀번호는 "+d+"입니다");
						$("#pwdid").val("");
						$("#phone1").val("");
						$(".modal").modal({refresh:true});
						$(".modal").modal("hide");
						$("#loginM").modal("show");
					}
					else{
						alert("정보를 찾을 수 없습니다 확인해주세요");
					}
						
						
			    });	
			}
			else if(id!= null && id!="" && email!= null && email!=""){
				var dt = {"id":id,"email":email}
				
				$.getJSON("findPwd.do",dt,function(d){
					if(d!=null && d!="")
					{
						alert("당신의 비밀번호는 "+d+"입니다");
						$("#pwdid").val("");
						$("#email1").val("");
						$(".modal").modal({refresh:true});
						$(".modal").modal("hide");
						$("#loginM").modal("show");
					}
					else{
						alert("정보를 찾을 수 없습니다 확인해주세요");
					}
						
						
			    });		
			} 
			else
			{
				alert("정보를 입력하세요");
			}
		})
		
	})
</script>
</head>
<body>
	<div data-role="page">
          <div data-role="content">
           	<div id="logo">
           		<img src="resources/img/logo.png" data-toggle="modal" data-target="#loginM">
           		<div id="ment">로고를 클릭해주세요</div>
	        </div>
	        
	        <!-- Login Modal -->
			<div id="loginM" class="modal fade lm" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-body login-card">
				    <h1>Log-in</h1><br>
				    <input type="text" name="log_id" id="log_id" placeholder="UserId">
				    <input type="password" name="pass" id="log_pwd" placeholder="Password">
				    <input type="button" class="login login-submit btn btn-block" id="btn_login" value="login">
					<div class='anotherMenu'>
					  <a href="join.do" id="joinA" data-ajax='false'>Join</a> / <a href="#" data-target="#findM" data-toggle="modal" id="findA">forget?</a>
					</div>
				  </div>
			       
			    </div>
			  </div>
			</div>
          </div>
          
	        <!-- find Modal -->
			<div id="findM" class="modal fade lm" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content"> 
			      <div class="modal-body login-card">
				    <h4 align='center'>Forget?</h4>
				    <button id="findId" class="btn" data-toggle="modal" data-target="#findIdM">Find ID</button><br><br>
				    <button id="findPwd" class="btn" data-toggle="modal" data-target="#findPwdM">Find PWD</button>
				  </div>
			    </div>
			  </div>
			</div>
			
	        <!-- findId Modal -->
			<div id="findIdM" class="modal fade lm" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-body login-card">
			       <h4 align='center'>아이디 찾기</h4><br>
				            핸드폰번호로 <input type="button" class="btn" id="cp" value="확인"><input type="tel" id="phone" name="phone" placeholder="전화번호를 -없이 입력해주세요">
				            이메일로 <input type="button" class="btn" id="ce" value="확인"><input type="email" id="email" name="email" placeholder="이메일을 입력해주세요">
				  </div>
			    </div>
			  </div>
			</div>
			
	        <!-- findPwd Modal -->
			<div id="findPwdM" class="modal fade lm" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-body login-card">
				    <h4 align='center'>비밀번호 찾기</h4><br>
				      <input type="text" id="pwdid" name="pwdid" placeholder="당신의 아이디를 입력해주세요">
				            핸드폰번호로 찾으실 건가요?<input type="tel" id="phone1" name="phone1" placeholder="전화번호를 -없이 입력해주세요">
				            이메일로 찾으실 건가요?<input type="email" id="email1" name="email1" placeholder="이메일을 입력해주세요">
				      <input type="button" class="btn" id="cpce" value="확인">
				  </div>
			    </div>
			  </div>
			</div>
          
     </div>
</body>
</html>