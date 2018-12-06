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

</style>
<script type="text/javascript">
$(function(){
    $.getJSON("testR_history.do",function(data){
    	if(data.length>0){	
    		$("#testHistory").empty()
    		$.each(data,function(i,t){ //히스토리 하나씩 가져옴
    		 	$.getJSON("testDetail.do", {"tablename":t.testTable_name}, function(d){ 
    		    	var oneD=$("<div data-role='collapsible' data-collapsed-icon='carat-d'  data-expanded-icon='carat-u' data-iconpos = 'right' data-theme='b' data-content-theme='b'></div>");
    				$(oneD).appendTo("#testHistory");
    				 var title = d[t.result];   
    				 $(oneD).append("<h3><span style='float:left;'>'"+title.substring(0,12)+"..</span><span style='float:right;'>"+(t.testdate).substring(0,10)+"</span></h3>"); 
    				 var pp=$("<p></p>")
    				 $(pp).append(title+"<br><br><hr>"+d['question']+"<br><br>");
    				 $.each(d,function(k,v){
    						if(k.substring(0,1)=='a'){  
    							if((t.result.substring(1,2))==k.substring(1,2)){
    								$(pp).append(k.substring(1,2)+") "+v+"☜<br>");
    							}else{
    								$(pp).append(k.substring(1,2)+") "+v+"<br>");
    							}
    							}
    						})
    				 $(oneD).append(pp);	 		  
    		    	$("#testHistory").trigger("create"); 
    			});		  
        	}) 
    	}
    })     
})
</script>
</head> 
<body>
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
	           <div style="text-align: center;">
	            	<img src="resources/img/mysimte.png" width="90%">
	            </div> 
             	<div data-role="collapsibleset" id="testHistory" data-collapsed="true">
             		<div style="text-align: center;  text-shadow: none; color:white;background-color:#707F8C; border-radius: 10px; margin:30px; padding:10px;">
	            		아직 심리테스트 한 내역이 없어요
	            	</div>
             	</div>
           </div>
     </div>
</body>
</html>
