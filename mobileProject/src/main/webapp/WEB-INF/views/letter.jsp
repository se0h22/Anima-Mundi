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
#letterMain{
	font-size: 15px;
	overflow:scroll;
    -ms-overflow-style: none;
    height:auto;
    pading:1px;
}
#letterList{
 width: 100%;
 text-align:left;
 background-color:#0A1825;
 color:white;
 padding: 30px;
 font-size: 18px;
 text-shadow: none;
}
#letterD{
 background-color:#0A1825;
 color:white;
 padding-left: 30px;
 padding-bottom: 30px;
 padding-top: 0px;
 font-size: 18px;
 text-shadow: none;
}
#letterS{
 background-color:#0A1825;
 padding-left: 30px;
 padding-bottom: 30px;
 padding-top: 0px;
 font-size: 18px;
}
#receiver{
background-color:#0A1825;
color: white;
border: 0px;
text-shadow: none;
}
.btn{

  font-size: 15px;
}
.btl{
  background-color:#0A1825;
  border: none;
  color: white;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 23px;
  width: 80%;
  text-shadow: none;
}
</style>
<script type="text/javascript">
     $(function(){
         var myid = {"id":$("#userId").val()};
    	 
         //쪽지권 사용 함수
    	 var ltchange = function(){
    					$.getJSON("useChat.do", myid, function(d){});	
    					};
    	
    	//쪽지 리스트
    	var letterL = function() {
    		$.getJSON("chatList.do", function(d){
    			if(d==""){
    				$("#lettertb").html("<tr><td>받은 쪽지가 없어요</td></tr>");
    			}
    			if(d!=""){
    				$("#lettertb").html("");    			
    			$.each(d, function(i,l){
    				var td1 = $("<td></td>").html(l.id);
    				var con =l.contents;
    				
    				var conbtn = $("<input type='button'>").attr({
  					  value:con,
  					  id:l.no
  				    });
    				
    				if(con != null && con.length > 7)
    				{
    					var con2 = con.substring(0,6);
    					$(conbtn).val(con2+"...");
    				}
    				
    				$(conbtn).attr("class","btl");
    				var td2 = $("<td></td>").html(conbtn);
    				var cDate=l.chatdate;
				    var cdate = cDate.split('-');
				     
				    var cMon = cdate.toString().substring(5,7);
				    var cday = cdate.toString().substring(8,10);
				      
				    var td3 = $("<td></td>").html(cMon+"/"+cday);
				      
    				var tr = $("<tr></tr>").append(td1, td2,td3);
    				$("#lettertb").append(tr);
    				
    				 $("#"+l.no).bind("tap",function(event){
    					 $("#lettertD").empty();
    					 $("#lettertb").hide();
    					 $("#letterS").hide();
    					 $("#lettertD").show();
    					   
    			    		var no = {"no":l.no};
    			    		
    			    		$.getJSON("getChat.do",no, function(d){
    			    			var from = $("<span></span>").html("From. ");
    			    			var fromW = $("<span></span>").html(d.id);
    			    			var cont = $("<span></span>").html(d.contents);

    			    			var btnba=$("<input type='button'>").val("쪽지함");
    			    			$(btnba).attr("class","btn");
    			    			$(btnba).bind("tap",function(event){
    			    				location.href="letter.do";   			    			
    			    			});
    			    			var btnRe=$("<input type='button'>").val("답장");
    			    			$(btnRe).attr("class","btn");
    			    			$(btnRe).attr("data-toggle","modal");
    						    $(btnRe).attr("data-target","#senModal");
    						    
    						    
                                $(btnRe).bind("tap",function(event){
    								
                                          			  
              					  $.getJSON("haveL.do", myid, function(d){   
              						if(d.count==0)
                					  {
                						location.href="letter.do";
                						alert("쪽지권이 부족합니다")
                					  }	  		 
              					  });
              					
              					  
    		    					$("#letterS").empty();
    		    					$("#lettertD").hide();
    		    					$("#lettertb").hide();
    		    					$("#letterS").show();
    								
    								var fd = d.id;
    								var receiver= $("<input type='text' style='width:50%;'>").val(fd);
    								$(receiver).attr("readonly",true);//받는사람 아이디 수정할 수 없게 고정
    								receiver.attr("name","receiver");
    								receiver.attr("id","receiver");
    								
    								var ri =$("#userId").val();    								
    								var id= $("<input type='hidden'>").val(ri);
    								id.attr("name","id");
    							    id.attr("id","sdid");
    							    
    								var contents = $("<textarea style='width:80%;' rows='5'>").attr("name","contents");
    								contents.attr("id","contents");
    								var send = $("<input type='button'>").val("전송");
    								$(send).attr("class","btn");
    								$(send).attr("id","letterSd");
    								var br = $("<br>");
    								var ty = $("<span></span>").html("To. ");
    								var cc = $("<input type='button'>").val("취소");
    								var sac=$("<span></span>").html(" ");
    								
    								$(cc).attr("class","btn");
    								$("#letterS").append(id,ty,receiver,contents,br,send,sac,cc);
    								
    								$(cc).bind("tap",function(event){
    									$("#letterS").hide();
    								});
    								
    								$("#letterSd").bind("tap",function(event){
    									
    									var id = $("#userId").val();
    									var contents = $("#contents").val();
    									var receiver = $("#receiver").val();
    									
    									 var data = {"id":id,"contents":contents,"receiver":receiver}
    									 $.getJSON("insertChat.do", data, function(d){
    										 
    										 if(d.result == "1")
    										 {
    											 ltchange();
    											 location.href="letter.do"; 
    										 }
    										 else
    										 {
    											 alert("에너지가 부족해서 답장에 실패했어요ㅠㅠ 관리자에게 문의해주세요");
    										 }				 
    									 });
    								}); 
    							});
    						    
    						    var btnDel=$("<input type='button'>").val("삭제");
    						    $(btnDel).attr("class","btn");
    						    
    						    $(btnDel).bind("tap",function(event){
    						    	
    						    	var n={"no":l.no}
    						    	$.getJSON("deleteChat.do", n, function(dd){
										 
										 if(dd.result == "1")
										 {
											 location.href="letter.do"; 
										 }			 
									 });

    							});
    						    var p1 = $("<p></p>");
    						    var p2 = $("<p></p>");
    						    var sa1=$("<span></span>").html(" ");
    						    var sa2=$("<span></span>").html(" ");
    						    
    						    $("#letterD").append(from,fromW,p1,cont,p2,btnba,sa1,btnRe,sa2,btnDel);
    			    					 			 
    						 });
    			    		
    			    	});//내용탭시 디테일화면
    			});	
    			}
			 });
    	}
    	
   	
    	letterL();
    	
$("#me").bind("tap",function(event){
    		
    		$("#lettertb").empty();
    		$("#letter2tb").html("<tr><td>보낸 쪽지가 없어요</td></tr>");
    		$("#letter2tb").show();
        	$("#lettertb").hide();
        	$("#letterS").empty();
        	$("#letterD").empty();
        	
        	$.getJSON("fromMe.do",myid, function(d){
        		if(d!=null||d!=""){
        			$("#letter2tb").empty();
        		
    			$.each(d, function(i,l){  
    				var td1 = $("<td></td>").html(l.receiver);
    				var con =l.contents;
    				
    				var conbtn = $("<input type='button'>").attr({
  					  value:con, 
  					  id:l.no 
  				    });
    				
    				if(con != null && con.length > 7)
    				{
    					var con2 = con.substring(0,6);
    					$(conbtn).val(con2+"...");
    				}
    				
    				$(conbtn).attr("class","btl");
    				var td2 = $("<td></td>").html(conbtn);
    				
    				var cDate=l.chatdate;
				    var cdate = cDate.split('-');
    				var cMon = cdate.toString().substring(5,7);
				    var cday = cdate.toString().substring(8,10);
				      
				    var td3 = $("<td></td>").html(cMon+"/"+cday);
    				var tr = $("<tr></tr>").append(td1, td2,td3);
    				$("#letter2tb").append(tr);
    				
    				 $("#"+l.no).bind("tap",function(event){
    					 
    					 $("#lettertD").empty();
    					 $("#letter2tb").hide();
    					 $("#letterS").hide();
    					 $("#lettertD").show();
    					   
    			    		var no = {"no":l.no};
    			    		
    			    		$.getJSON("getChat.do",no, function(d){
    			    			var from = $("<span></span>").html("To. ");
    			    			var fromW = $("<span></span>").html(d.receiver);
    			    			
    			    			
    			    			var sa1=$("<span></span>").html(" "); 
    			    			var cont = $("<span></span>").html(d.contents);
    			    			
    						    var p1 = $("<p></p>");
    						    var p2 = $("<p></p>");
    						    
    						    $("#letterD").append(from,fromW,p1,cont,p2);
    			    					 			 
    						 });
    			    		
    			    	});//내용탭시 디테일화면
    			});	
        		}
			 });
    	
    	});
    	$("#to").bind("tap",function(event){
    	    
    		$("#lettertb").empty();
    		$("#letter2tb").empty();
    		$("#letterS").empty();
        	$("#letterD").empty();
    		$("#lettertb").show();
        	$("#letter2tb").hide();
        	letterL();
    	});
     })
</script>
</head>
<body>
     <div data-role="page" id="letter" data-fullscreen="true">
	    <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content" id="letterMain">
           		<input type="hidden" value="${user.id }" id="userId">           		
           		<div id="letterList">
           		 <h4><a href="#letter2tb" title="click하고 보낸 쪽지 확인" id="me"><img src="resources/img/msen.png"></a>&nbsp;&nbsp;<a href="#lettertb" title="click하고  받은 쪽지 확인" id="to"><img src="resources/img/msen2.png"></a></h4>
           		 <div>
           		   <table id="lettertb" style="width: 90%; height: 100%">
           		   	<tr><td>받은 쪽지가 없어요</td></tr>
           		   </table>
           		   <table id="letter2tb" style="width: 90%; height: 100%">
           		   </table>
           		 </div>
           		</div>
           		
           		<div id="letterD">
           		</div>
           		
           		<div id="letterS">
           		</div>
           </div>
     </div>
</body>
</html>
