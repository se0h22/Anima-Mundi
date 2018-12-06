<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Welcome to AnimaMundi</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
     <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<style type="text/css">
#simteMenuTable tr td{
	text-align: center;
	vertical-align: middle;
}
#simteMenuTable img{
	margin-top:10px;
	margin-bottom:10px;
} 
</style>
<script type="text/javascript"> 
     $(function(){
    		$("#m1").click(function(){ 
    			location.href="testList2.do"
    		})
    		$("#m2").click(function(){
    			location.href="testList3.do"
    		})
    		$("#m3").click(function(){
    			location.href="history.do"
    		})
    		$("#m5").click(function(){
    			location.href="makeTest.do"
    		})
    		
    		$("#wc").on('show.bs.modal', function () {
    			$.getJSON("testR_history.do",function(data){
    				if(data.length>0){
    					$.ajax({ 
    	    				url:"wordCloud.do",
    	    				success:function(wcData){
    	    					$(".modal-body").html("<img src='resources/json/"+wcData+"' width='100%'>")
    	    				}
    	    			})	
    				}else{
    					$(".modal-body").html("수집할 심리테스트 데이터가 없어요!<br> 심리테스트를 실행해주세요~")
    				}
    			}) 
    			 
    			 });
    		 
    		
     })
</script>
</head>
<body>
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">  
            <input type="hidden" value="${user.id }" id="userId">
            <table width='100%' id="simteMenuTable"> 
           			<tr>
           				<td rowspan="3"><img src="resources/img/simteM1.png" width="60%" id="m1" data-ajax='false'></td>
           				<td></td>
           			</tr>
           			<tr>
           				<td rowspan="3"><img src="resources/img/simteM2.png" width="60%" id="m2" data-ajax='false'></td>
           			</tr>
           			<tr></tr>
           			<tr>  
           				<td rowspan="3"><img src="resources/img/simteM3.png" width="60%" id="m3" data-ajax='false'></td>
           			</tr>
           			<tr>
           				<td rowspan="3"><img src="resources/img/simteM4.png" width="60%" data-toggle="modal" data-target="#wc"></td>
           			</tr>
           			<tr></tr>
           			<tr>
           				<td rowspan="3"><img src="resources/img/simteM5.png" width="60%" id="m5" data-ajax='false'></td>
           			</tr>
           		</table>
            <div class="modal" tabindex="-1" id="wc" role="dialog">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">내 성향 한눈에 보기! WordCloud</h5>
			      </div>
			      <div class="modal-body"> 
			        	잠시만 기다려주세요.
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
     </div>
</body>
</html>
