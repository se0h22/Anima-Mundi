<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
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
.t{
	text-shadow: none;
	color: white;
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
	
		$("#editN").keyup(function(){
			var phone=$(this).val()
			$(this).val(phone.replace("-",""))
		})
		 
		$("#eidtBtn").click(function(){
			var dt={id:$("#id").val(),
					pwd:$("#editP").val(),
					nickname:$("#editN").val(),
					phone:$("#editPh").val()}
			
			$.ajax({url:"updateUserMain.do", 
				data:dt,
				type : "POST", 
				success:function(result){
					if(result == "SUCCESS")
				 	{
				 		alert("수정되었습니다!");
				 		
						$(location).attr("href","myPage.do");
					}
				 	else
				 	{
				 		alert("수정을 실패했습니다. 문의게시판에 문의해주세요.");
				 	}
			}})
		});
	})
</script>
</head>
<body>
	<div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
	           <br><br><h3 align="center" class="t">회원정보 수정</h3><br>
	           <form id="f">
	           		<input type="hidden" id="id" value="${user.id }"> 
	           		<input type="password" class="form-control-lg" placeholder="변경할 비밀번호를 입력해주세요" id="editP" name="pwd"><br>
	           		<input type="text" class="form-control-lg" placeholder="변경할 닉네임을 입력해주세요" id="editN" name="nickname"><br>
	           		<input type="tel" class="form-control-lg" placeholder="변경할 핸드폰 번호를 -없이 입력해주세요" id="editPh" name="phone">
	           </form><br>
	           <button class="btn" id="eidtBtn">수정하기</button>
           </div>
	</div>
</body>
</html>