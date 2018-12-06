<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
#addA{
	display: inline-block;
}
#addR{
	display: inline-block;
} 
label{
	color:white;
	text-shadow:none;
}
.tt{
	color:white;
	text-shadow:none;
}
.imgD{
	text-align: center;
}
#a, #r{
	margin-top:5px;
}  
#a{
	margin-bottom:10px;
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
		var tck=false;
		$("#a").html("<input type='text' class='form-control' placeholder='1번 문항을 써주세요.'><input type='text' class='form-control' placeholder='2번 문항을 써주세요.'>");
		$("#r").html("<input type='text' class='form-control' placeholder='1번의 결과를 써주세요.'><input type='text' class='form-control' placeholder='2번의 결과를 써주세요.'>");
		$("#tableName").keyup(function(event){ 
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		});
		
		$("#addA").click(function(){
			var num=parseInt($("#a").attr("class"))+1;
			$("#a").append("<input type='text' class='form-control' placeholder='"+num+"번 문항을 써주세요.'>")
			$("#a").attr("class",num)
		})
		
		$("#addR").click(function(){
			var num=parseInt($("#r").attr("class"))+1;
			$("#r").append("<input type='text' class='form-control' placeholder='"+num+"번의 결과를 써주세요.'>")
			$("#r").attr("class",num)
		})
		
		$("#delA").click(function(){
			var num=parseInt($("#a").attr("class"));
			if(num==2){
				alert("최소 2개의 항목이 있어야 합니다.") 
				return;
			}
			$("#a").attr("class",num-1)
			var del=$('#a').children().last();
			$(del).remove();
		})
		
		$("#delR").click(function(){
			var num=parseInt($("#r").attr("class"));
			if(num==2){
				alert("최소 2개의 항목이 있어야 합니다.")
				return;
			}
			$("#r").attr("class",num-1)
			var del=$('#r').children().last();
			$(del).remove();
		})
		
		$("#pointI").keyup(function() {
          var max = parseInt($(this).attr('max'));
          var min = parseInt($(this).attr('min'));
          if (parseInt($(this).val()) > max) 
          {
              $(this).val(max);
          }
          else if (parseInt($(this).val()) < min)
          {
              $(this).val(min);
          }       
        }); 
		
		$("#addTestBtn").click(function(){
			var ac=parseInt($("#a").attr("class"))
			var rc=parseInt($("#r").attr("class"))
			if(ac!=rc){ 
				alert("항목수와 결과수가 같아야 합니다.")
				return;
			}
			if(tck==false){ 
				alert("심리테스트명을 중복확인해주세요!") 
				return;
			}
			var data1={testTable_name:$("#tableName").val(),
					test_name:$("#testName").val(),
					point:$("#pointI").val()}
			var data={question:$("#question").val()}
			$("#a").find("input").each(function(i, a){  
			    data["a"+(i+1)]=$(this).val();
			});
			$("#r").find("input").each(function(i, r){
				data["r"+(i+1)]=$(this).val();
			});
			var finalChk=true;
			$(data).each(function(k,v){
				if(v==null || v==""){
					alert("모든 항목을 채워주세요.")
					finalChk=false;
					return;
				}
			})	
			if(finalChk==true){
				
				var s={}
				s[$("#tableName").val()]=data
				x=JSON.stringify(s)
				console.log(x)
				$.ajax({
					url:"customAddTestJ.do",
					data:{str:x},
					success:function(){
					}
				})
				
				$.ajax({
					url:"customAddTest.do",
					data:data1,
					success:function(data){
						if(data=='SUCCESS'){
							alert("심리테스트가 등록되었습니다!")
							location.href="testList.do"
						}
					}
				})
				
			}
		})
		
		$("#chkBtn").click(function(){
			var tn=$("#tableName").val()
			if(tn==null || tn==""){
				alert("심리테스트명을 입력해주세요!")
				return;
			}
			$.getJSON("test_main.do",function(data){
				var ck="사용 가능한 이름입니다."
				tck=true;
				$.each(data, function(i,t){
					var tablename = t.testTable_name;
					if(tablename==tn){
						ck="이미 해당 이름의 심리테스트가 있습니다.";
						tck=false;
						return; 
					}
				})
				alert(ck);
			})
		})
	})
</script>
</head>
<body>
	<div data-role="page" id="main" data-fullscreen="true"> 	
	     <jsp:include page="menuPanel.jsp"></jsp:include>
         <div data-role="content" class="tt">
         	<div class="imgD">
	       		<img src="resources/img/makeTest.png" width="80%">
         	</div>
	        <div class="form-group">
			    <label for="tableName">심리테스트명</label>
			    <div class="row"> 
			    <div class="col-8">  
			      <input type="text" class="form-control-lg" id="tableName" placeholder="영어로 써주세요.">
			    </div>
			    <div class="col">
			      <button class="btn btn-sm" id="chkBtn">중복확인</button>
			    </div> 
			  </div> 
			 </div>
			 <div class="form-group">  
			    <label for="pointI">심리테스트 포인트</label>
			    <input type="text" class="form-control" id="pointI" min="0" max="500" placeholder="원하는 포인트를 써주세요.(최대 500)">
			 </div>
	       	 <div class="form-group">
			    <label for="testName">심리테스트 제목</label>
			    <input type="text" class="form-control" id="testName" placeholder="목록에 나올 제목을 써주세요.">
			 </div>
	       	 <div class="form-group">
			    <label for="question">심리테스트 문제</label>
			    <textarea class="form-control" id="question" rows="3" placeholder="심리테스트의 문제를 써주세요."></textarea>
			 </div>
			문항(숫자없이 바로 보기를 써주세요) <img id="addA" src="resources/img/add.png" width="5%"> <img id="delA" src="resources/img/minus.png" width="5%">
			 <div id="a" class='2'>
			 </div>
			 결과 <img id="addR" src="resources/img/add.png" width="5%"> <img id="delR" src="resources/img/minus.png" width="5%"> 
			 <div id="r" class='2'>
			 </div>
			 <div class="imgD">
				 <button class="btn" id="addTestBtn">심리테스트 만들기</button>  
			 </div>
         </div>
	</div>
</body>
</html>