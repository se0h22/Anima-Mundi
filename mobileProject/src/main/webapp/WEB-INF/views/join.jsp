<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
.ui-page {
  background-color: #222A35 !important;
}
#f{
	text-shadow: none;
	color: white;
}
.chk{
	background-color: #FF7457; 
}
.input-group{
	width:100%;
}
#idI{
	ime-mode:disabled;
}
h3{
	color:white;
	text-shadow: none;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<title>Welcome to AnimaMundi</title>

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(function(){
		var id_check = false;
		$("#pwdChk").change(function(){
			alert("ok");
			if($("#pwd").val()==$("#pwdChk").val()){ 
				$("#ment").html("비밀번호가 일치합니다.");			
			}else{				
				$("#ment").html("비밀번호가 일치하지 않습니다.");
			}
		});
		
		$("#idI").keyup(function(event){ 
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		});

		$("#id_btn").click(function() {
			var c=true
			var id=$("#idI").val();
			if(id.length<6){
				alert("아이디를 6자이상 영문+숫자 조합으로 입력해주세요.")
				c=false
			}
			var data={id:id}
			if(c==true){
				$.ajax({
					url:"id_nic.do",
					data:data,
					success:function(data){
						var d = eval("("+data+")")
						if(d.result == "1")
						{
							alert("사용가능한 아이디 입니다.");
							id_check = true;
					    }
						else
						{
							alert("이미 사용중인 아이디 입니다.");
							id_check = false;
							$("#id").val("");
					    }
					}
				})
			}
		});
		
		$("#btn_join").click(function() {
			console.log("중복확인 : "+id_check)
			if(!id_check){
				alert("중복 인증을 진행 하세요 ");
				return;
			}
			
			var dt={id:$("#idI").val(),
					pwd:$("#pwd").val(),
					nickname:$("#nickname").val(),
					phone:$("#phone").val(),
					email:$("#email").val()}
			
			$.ajax({url:"join.do",
				data:dt,
				type : "POST",
				success:function(result){
					if(result == "SUCCESS")
				 	{
				 		alert("가입완료!");
				 		var d={email:$("#email").val()}
				 		$.getJSON("mailSending.do",d,function(){})
						
						$(location).attr("href","index.do");
					}
				 	else
				 	{
				 		alert("가입실패!");
				 	}
			}})
		})
		
		$("#pwdck").keyup(function(){
			if($("#pwd").val()!=$(this).val()){
				$("#pwdck").css({"background-color": "#EB9F99"})
				$("#chk").html("비밀번호가 일치하지 않습니다!")
			}
			if($("#pwd").val()==$(this).val()){
				$("#pwdck").css({"background-color": "#FFFFFF"})		
				$("#chk").html("비밀번호가 일치합니다.")
			}
		})
		
		$("#phone").keyup(function(){
			var phone=$(this).val()
			$(this).val(phone.replace("-",""))
		})
		
		$("#btn_back").click(function(){
			$(location).attr("href","index.do");
		});
	})
</script>
</head>
<body>
	<div data-role="page">  
           <div data-role="content">
           <div align="center"><br> 
	           <img src="resources/img/logo2.png" width=80%>
           </div>
          		 <table align="center" width="90%">
	          		 <tr><td width="70%">
						   <input type="text" class="form-control-lg" placeholder="ID는 6자 이상, 영문+숫자" name='id' id='idI'>
						 </td>
						 <td>
						  <button class="btn btn-outline-secondary btn-sm" id="id_btn" data-ajax='false'>중복확인</button>
						</td>
	          		 </tr>
	          		 <tr>
		          		<td colspan="2">
		          			 <input type="password" class="form-control-lg" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요"> 	
						</td>
	          		 </tr>
	          		 <tr>
	          		 	<td colspan="2">
		          			 <input type="password" class="form-control-lg" id="pwdck" placeholder="비밀번호 다시 입력해주세요"> 	
		          			 <small id="chk" class="form-text text-muted"></small>
						</td>
	          		 </tr>
	          		 <tr>
	          		 	<td colspan="2">
		          			 <input type="text" class="form-control-lg" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요"> 	
						</td>
	          		 </tr>
	          		 <tr>
	          		 	<td colspan="2">
		          			 <input type="tel" class="form-control-lg" name="phone" id="phone" placeholder="전화번호를 -없이 입력해주세요"> 	
						</td>
	          		 </tr>
	          		 <tr>
	          		 	<td colspan="2">
		          			 <input type="email" class="form-control-lg" name="email" id="email" placeholder="이메일을 입력해주세요"> 	
						</td>
	          		 </tr>
	          		 <tr>
	          		 	<td colspan="2">
	          		 		<div style="text-align:center;">
			           			<input type="button" style="margin:10px auto;" class="btn btn-info" id="btn_join" value="회원가입" data-ajax='false'>&nbsp;&nbsp;
								<input type="reset" style="margin:10px auto;" class="btn btn-info" value="취소">&nbsp;&nbsp;
								<input type="button" style="margin:10px auto;" class="btn btn-info" id="btn_back" value="첫화면" data-ajax='false'>
		           			</div>
	          		 	</td>
	          		 </tr>
          		 </table>
           </div>
     </div>
</body>
</html>