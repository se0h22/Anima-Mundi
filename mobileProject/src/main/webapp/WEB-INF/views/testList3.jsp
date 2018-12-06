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
#testMain{
 width: 100%;
 color: white;
 background-color:#0A1825;
 font-size: 15px;
 text-shadow: none;
}
</style>
<script type="text/javascript">
     $(function(){
    	 
    	 var resultR=""
		 var re= ""
		 var sel= ""
    	//심리테스트 목록 불러올 메소드
    		var listTest = function() {
    			
    			$.getJSON("customList.do",function(data){
    				$.each(data, function(i,t){
    					
    					var tablename = t.testTable_name;
    					
    					var ttn = $("<input type='hidden'>").attr("value",t.point);
    					var tName = t.test_name;
    					var tl_li = $("<h3></h3>");
    					if(tName.length>15){
    						var stName = tName.substring(0,14);
    						$(tl_li).html("<span style='float:left;'>"+stName+"..</span><span style='float:right;'>"+t.point+"point</span>");
    					}else{
    						$(tl_li).html("<span style='float:left;'>"+tName+"</span><span style='float:right;'>"+t.point+"point</span>");
    					}									
    					$(ttn).attr("id",tablename);
    					
    					var idd = {"id":$("#userId").val()};
    					//ttn에 임시로 day속성 만들어서 날짜 담음
    					$.getJSON("testR_history.do",idd,function(da){
    						$.each(da, function(i,h){
    							var htn  = h.testTable_name;
    							
    							if(tablename.indexOf(htn)>-1)
    							{
    								$(ttn).attr("day",h.testdate);
    							}
    						});
    					});	
    					
    					detailTest(tl_li,ttn,tablename,tName);
    				});
    			});
    		};
    		
    		listTest();
    		
    		var detailTest = function(ttn,tl_li,tablename,tName){
    			
    			var data = {"tablename":tablename};
    			
    			//json에서 tablename에 해당하는 json배열만 가져옴
    			$.getJSON("testDetail.do", data, function(d){
    				var divList=$("<div data-role='collapsible' data-collapsed-icon='carat-d'  data-expanded-icon='carat-u' data-iconpos = 'right' data-theme='a' data-content-theme='c'></div>");
    				$(divList).attr("data-collapsed","true");
    				
    				var pdiv = $("<div></div>");
    				$("<p></p>").html(tName).appendTo(pdiv);
    				$("<p></p>").html(d.question).appendTo(pdiv);
    				var length = Object.keys(d).length;
    				var arcount = (length-1)/2;
    				var span = $("<span></span>")
    				var p0 = $("<p></p>")
    				var ff = $("<form><fieldset data-role='controlgroup'></fieldset></form>")
    				
    				$.each(d, function(k, v){
    					
    					var inputA = $("<input type='radio'>");
    					//inputA.removeClass();
    					//key값이 a1,a2 형식인것만 라디오버튼으로 만듬
    					if(k.match("a"))
    					{
    					  var label =$("<label></label>").html(v);
    					  label.attr("for","answer");
    					  label.attr("value",v);
    					  
    					  inputA.attr({
    						  "id" : k,
    						  "nm" : v,
    						  "name" : "answer", //동일 이름으로 그룹처리
    					  });
    					  
    					  $(label).append(inputA);
    					  $(ff).append(label);
    					  $(span).append(ff);
    					  
    					}//if문 종료
    					
    					//a1에 대응하는 r1의 값을 차례대로 value로 담아둠
    					for(var i=1; i<=arcount;i++)
    					{
    						if(k=="a"+i)
    						{
    							k = "r"+i;					    
    							inputA.attr("value",d[k]);
    						}
    					}
    						
    					$(inputA).change(function(){
    						re=$(this).attr("id");
    						sel=$(this).attr("nm");
			      			resultR=$(this).val();
		 				})
    				});//each문 종료
    				
    				
    				 $(pdiv).append(p0,span);

    				 var btr = $("<a href='#testResult' data-rel='popup' data-position-to='window' data-transition='pop' class='ui-btn ui-corner-all ui-btn-b'></a>").html("결과보기");
    				 $(btr).attr("id","result");
    				 $(btr).bind("tap",function(event){
    					 if(re=="" || resultR==""){
    						 alert("항목을 선택해주세요!");
    						 return;
    					 }else{
    						 
    						 var rid=re.substring(1);
    						 var reh = "r"+rid;
    						 var id = $("#userId").val();
    					 	resultTest(sel,resultR,tablename);
    					 	resultSave(id,tablename,reh);
    					 }
    				 })
    				 $("<p></p>").appendTo(span);
    				 $(btr).appendTo(pdiv);			 
    				 $(divList).append(ttn,tl_li,pdiv);
    				 $("#testMain").append(divList);
    				 $("#testMain").trigger("create");
    			});//json종료
    		};//detailTest메소드종료
    		
    		var resultTest = function(sel,result,tablename){
    			$("#testR").html("");
    			var point = $("#"+tablename).val();
    			$("<p></p>").html(sel+" 결과<br><br>"+result).appendTo("#testR");
    			var btnlist = $("<a href='#' class='ui-btn ui-corner-all ui-btn-b'></a>").html("확인");
    			$(btnlist).bind("tap",function(event){
    				alert(point+"point가 추가되었습니다");
    				location.href="testList.do";
				 })
    			$(btnlist).appendTo("#testR");
    		};
    		
    		var resultSave = function(id,tablename,reh){
    			
    			var point = $("#"+tablename).val();
    			
    			var p ={"id":id,"point":point};
    		
    			var dt = {"id":id,"testTable_name":tablename,"result":reh};		
    			
    			$.getJSON("testR_insert.do",dt,function(ll){
    				
    			});
    			
    			$.getJSON("point_up.do",p,function(re){	
    				
    			});		
    			
    		};
    		
    		$("#hB").click(function(){
    			location.href="history.do"
    		})
    		
    		$("#wB").click(function(){
    			location.href="wordCloud.do"
    		})
     })
</script>
</head>
<body>
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">  
            <input type="hidden" value="${user.id }" id="userId">
            <div style="text-align: center;">
            	<img src="resources/img/customLogo.png" width="90%">
            </div>
             <div data-role="collapsible-set" id="testMain" class="info" data-collapsed="true">
             </div>
             <!-- 해당되는 테스트 결과 불러오고 저장하기 -->
				<div id="testResult" data-role="popup" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:300px">
					   <div data-role="header" data-theme="a"><h2>테스트 결과</h2><p></div>
				       <div data-role="main" class="ui-content" id="testR"></div>
				</div>
           </div>
     </div>
</body>
</html>
