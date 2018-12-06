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
#matching{
 width: 100%;
 text-align:center;
 background-color:#0A1825;
 padding: 30px;
}
#clickId{
 background-color: gray;
 color: white;
 padding: 10px;
 font-size: 20px;
}
#clickLetter{
  background: url("resources/img/letterbg.png");
  padding: 17px;
  color: white;
}
.btn{
  color: black;
  width: 40%;
  font-size: 17px;
}
.tdc{
  text-align:center;
  color: white;
  font-size: 20px;
}
.bt{
  background-color:#0A1825;
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 23px;
  width: 80%;
}
.bts{
 color: black;
}
</style>
<script type="text/javascript">
$(function(){
 //$("#match").listview("refresh");
 // $("#match").enhancedWithin();
 	 var myid = {"id":$("#userId").val()}; 
 	 var list=[];
 	//user_custom의 lcount를 쪽지전송시 1씩 감소
 	var ltchange = function(){
 		$.getJSON("useChat.do", myid, function(d){});	
 	};

		//로그인한 사용자가 참여한 심리테스트 총 갯수 
		$.getJSON("getMyCount.do",myid,function(d){
			var total = d.count;
					
			//로그인한 사용자가 참여한 심리테스트에 동일결과를 갖고 있는 id와 그 갯수
			$.getJSON("testR_con.do",myid,function(m){
				if(m!=""){
					if(m.length>=2){ //동일결과의 회원이 2명 이상일 경우 정렬
						m.sort(function(a,b){
							return b.count - a.count;
					})
					}
				$("#tb").empty();
				
				$.each(m,function(i,mm){
						
				  var tr = $("<tr></tr>")	
				  var friend = mm.id;
				  var count = mm.count;
				  var per = Math.floor((100/total)*count);
				  
				  if(per>100)
				  {
					  per=100;
				  }
				  
				  var fd = {"id":friend};
				  var img=$("<img></img>");
				  var td1=$("<td></td>").attr("class","tdc");
				  var td2=$("<td></td>").attr("class","tdc");
				  var td3=$("<td></td>").attr("class","tdc");
				  $(td3).html(per+" %");
				  
				  //행성이미지 가져오기
				  $.getJSON("getP.do",fd,function(pn){
					 
					 $(img).attr({
							src:"resources/item/"+pn,
							width:"33",
							height:"33",
							id:"imgp"
						});
				  });

				  var bt = $("<input type='button'>").attr({
					  value:friend,
					  id:friend
				  });

				  $(bt).attr("class","bt");
				  $(bt).attr("data-toggle","modal");
				  $(bt).attr("data-target","#modalChat");
				  
				  var p=$("<p></p>");
					  
				  $(td1).append(img);
				  $(td2).append(bt);
				  $(tr).append(td1,td2,td3);
				  
				  $("#tb").append(tr,p);
				  
				  //아이디 탭
				  $("#"+friend).bind("tap",function(event){
					  
					  $("#modalChat").modal({backdrop: false});
					  
					  $("#clickId").empty();
					  
					  var to = $("<p></p>").html(friend+"님께");
					  var s1 =$("<span style='text-shadow:none;'></span>");
					  var l=0;
					  
					  $.getJSON("haveL.do", myid, function(d){  
						      l = d.count;
							  $(s1).html("쪽지(보유쪽지"+l+"회)를 보내시겠습니까?");					 
					  });
					  
					  var btchat1 = $("<input type='button'>").val("yes");
					  $(btchat1).attr("class","btn");
					  //$(btchat1).attr("data-transition","pop");
					  $(btchat1).attr("data-toggle","modal");
					  $(btchat1).attr("data-target","#modalLetter");
					  $(btchat1).attr("id","yletter");
					  var btchat2 = $("<input type='button'>").val("no");
					  $(btchat2).attr("class","btn");
				  $(btchat2).attr("data-dismiss","modal");
				  var spa=$("<span></span>").html(" ");
				  var p2=$("<p></p>");
					  $("#clickId").append(to,s1,p2,btchat1,spa,btchat2);
					  
					  
					  $("#yletter").bind("tap",function(event){
						  
						    if(l==0)
			        {
					 alert("쪽지권이 부족해요")
					 location.href="matching.do"; 
			        }
						   
						  $("#clickLetter").empty();
		      $("#modalChat").show();
		      $("#modalLetter").hide();
		      $("#modalChat").modal({backdrop: false});
    							
    						    var to = $("<span></span>").html("To ")
    							var receiver= $("<span></span>").html(friend);
    							$(receiver).attr("readonly",true);
    							receiver.attr("name","receiver");
    							receiver.attr("id","receiver");
    							var ri = $("#userId").val();
    							var id= $("<input type='hidden'>").val(ri);
    						    id.attr("name","id");
    						    id.attr("id","sdid");
    							var contents = $("<textarea cols='20' rows='5' style='background-color:transparent'>").attr("name","contents");
    							contents.attr("id","contents");
    							var send = $("<input type='button'>").val("전송");
    							$(send).attr("class","bts");
    							$(send).attr("id","letterSend");
    							var ca = $("<input type='button'>").val("취소");
    							$(ca).attr("class","bts");
    							$(ca).attr("data-dismiss","modal");
    							var sa=$("<span></span>").html(" ");
    							var p3=$("<p></p>");
    							var p4=$("<p></p>");
    							
    							$("#clickLetter").append(id,to,receiver,p3,contents,p4,send,sa,ca);
    							
    								$("#letterSend").bind("tap",function(event){
    									var id = $("#userId").val();
    									var contents = $("#contents").val();
    									var receiver = $("#receiver").html();
    									
    									 var data = {"id":id,"contents":contents,"receiver":receiver}
    									 $.getJSON("insertChat.do", data, function(d){
    										 
    										 if(d.result == "1")
    											{
    											 $(".modal").modal({refresh:true});
    											 $(".modal").modal("hide");
    											 ltchange();
    										    }
    											else
    											{
    											 alert("에너지가 부족해서 전송에 실패했어요ㅠㅠ 관리자에게 문의해주세요");
    										    }				 
    									 });
    								});//전송버튼 클릭
						    
						    
						  
					  });
				  });
				
				});//each문 종료
 			}	
				
			});//testR_con 종료
		});//getMyCount 종료
})
</script>
</head>
<body>
     <div data-role="page" id="match" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
           		    <div id="matching">
	                <input type="hidden" id="userId" value="${user.id }">
	                <h3 style="color:white;">${user.id }님과 맞는 우주인</h3><br>                
	           		<table id="tb" style="width: 100%; height: 100%">
	           			<tr><td style="text-decoration: none; color:white;">아직 맞는 상대가 없어요ㅠㅠ<br>심리테스트를 더 많이 해주세요!</td></tr>
			        </table>
                 </div>  
                 
                 <!-- 아이디 클릭시 모달창 -->      
		        <div id="modalChat" class="modal fade" role="dialog">
		          <div class="modal-dialog modal-sm">
		            <div class="modal-content" id="clickId">
		            </div>
		         </div>
		       </div>
		       <!-- 쪽지하기 클릭 모달창 -->      
				<div id="modalLetter" class="modal fade" role="dialog">
		          <div class="modal-dialog modal-sm">
		            <div class="modal-content" id="clickLetter">
		            </div>
		         </div>
		       </div>
           </div>
     </div>
</body>
</html>
