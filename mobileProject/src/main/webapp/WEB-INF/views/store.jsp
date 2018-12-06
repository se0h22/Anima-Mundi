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
#myTabContent{
	width:100%;
	height:90%;
	margin-bottom:20px;
	overflow:hidden;
}
.tab-pane{
	height:100%;
	text-align: center;
	overflow: scroll;
}
#myTab li{
	background-color: #34495E;
}
#myTab li a{
	text-decoration: none;
	text-shadow: none;
}
#myTab .active{
	background-color: #0F1822;
}
.itemD{
	float:left;
	border:1px solid #41719C;
	background-color: #3A3B3C;
	padding:5px;
	text-align:center;
	margin:10px;
	width:90%;
	height:100%;
	color:white;
}
.itemD div{
	width:100%;
	height:150px;
	margin-bottom:20px;
	text-align: center;
}
.itemD img {
	width:100%;
	height:100%;
}
.infoD{
	width:100%;
	height:100%;
	font-size:14px;
	text-align: center;
	font-style: normal;
	text-shadow: none;
}
.itemD button{
	color:black;
	margin-left:5px;	
	margin-right:5px;	 
}
.userItem{
	float:left;
}
.c{
	float:clear;
}
.txt{
	text-shadow:none;
	opacity:70%;
	margin-bottom:5px;
	color: white;
	text-align: center;
	font-size: 14px;
}
</style>
<script type="text/javascript">
$(function() {
	var gridArr=new Array('ui-block-a','ui-block-b');

	var etr=0;
	var ptr=0;
	var htr=0;
	var utr=0;
	
	var haveItem=[];
	
	$(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
	
	$.getJSON("userItemList.do",function(data){
		var now = new Date();
		var year = now.getUTCFullYear();
		var month = now.getUTCMonth();
		var day = now.getUTCDate();
		//당일 날짜 받아옴
		var todayCompare = new Date(year,month,day);
		if(data[0].item_key.length<0){
			$("#stab4").html("<h2 align='center'>구매한 내역이 없습니다.</h2>");
			return;
		}
		$.each(data,function(i,item){
			haveItem.push(item.item_key);
			var buydate = (new Date(item.buy_date)).toISOString();
			var bd=new Date(todayCompare.getTime()-(new Date(item.buy_date)).getTime()).getUTCDate();
			var div = $("<div></div>");
			var imgD = $("<div></div>");
			var img = $("<img src='resources/item/"+item.item_image+"'>");
			var lcountMent="";
			if(item.letter>0){
				lcountMent="("+item.lcount+"회 남음)";
			}else{
				lcountMent="";
			}
			var info=$("<p><b>"+ item.item_name+ " ("+item.point+"point)</b><br>"+lcountMent+"</p>");	
			//채팅기간이 만료된 경우
			if(((item.item_key).substring(0, 1) == 'E')&&(item.chatDate>0)&&(bd>item.chatDate)){
				info = $("<p><b>"+ item.item_name+ "(만료) ("+item.point+"point)</b><br>"+lcountMent+"</p>");
			}
			var buyBtn = $("<button class='btn btn-secondary'  data-mini='true' data-inline='true' data-ajax='false'>재구매</button>");
			var setBtn = $("<button class='btn btn-secondary' data-mini='true' data-inline='true' data-ajax='false'>장 착</button>");
			var delBtn = $("<button class='btn btn-secondary' data-mini='true' data-inline='true' data-ajax='false'>삭 제</button>");
			$(imgD).append(img);
			$(imgD).append(info);
			$(img).show();
			$(info).hide();
			$(info).addClass("infoD");
			$(info).append("<br>");
			//장비가 아닌 아이템들만 장착 버튼 
			if (((item.item_key).substring(0, 1) == 'P')||((item.item_key).substring(0, 1) == 'H')) {
				if(item.now=='false'){
					$(info).append(setBtn);
				}
			}else{ //장비만 재구매 버튼
				$(info).append(buyBtn);				
			}
			$(div).append(imgD);
			$(imgD).click(function(){
				$(img).toggle();
				$(info).toggle();
			})
			
			$(div).append("<span>"+buydate.substring(0,10)+"</span>");					
			$(div).append(delBtn);
			$(div).addClass("itemD");
			//재구매
			$(buyBtn).click(function() {
				if(confirm(item.item_name+"을(를) 재구입하시겠습니까?")==1){
					if(eval($("#userPoint").val())-item.point<0){
						alert("포인트가 부족하여 구매할 수 없습니다.")
						return;
					}
					//구입시 해당 item_key갖고 구입으로보내야함 
					//item_key는지금 갖고있음 반복문안이라서
					$.ajax({url : "insertCustom.do",
							data : {item_key : item.item_key,
									lcount: item.letter,
									point:item.point,
									now : "false" },
							success : function(data) {
								var re = data
								if (re == "SUCCESS") {
									alert("아이템을 구입했습니다.\n마이페이지에서 확인하실 수 있습니다.");
									location.href="store.do"
								} else {
									alert("오류가 발생하여 아이템 구입을 실패했습니다. \n문의게시판에 문의해주세요.");
								}
							}
						})
				}
			})
			//장착
			$(setBtn).click(function() {
				if(confirm(item.item_name+"을(를) 장착하시겠습니까?")==1){
					$.ajax({url : "updateCustom.do",
							data : {item_key : item.item_key,
									now : "true" },
							success : function(data) {
								var re = data
								if (re == "SUCCESS") {
									alert("해당 아이템을 장착했습니다.");
									location.href="store.do"
								} else {
									alert("오류가 발생했습니다. \n문의게시판에 문의해주세요.");
								}
							}
						})
				}
			})
			//삭제
			$(delBtn).click(function() {
				if(confirm(item.item_name+"을(를) 삭제하시겠습니까?")==1){
					$.ajax({url : "deleteCustom.do",
							data : {no : item.no},
							success : function(data) {
								var re = data
								if (re == "SUCCESS") {
									//장착중이던 아이템 삭제시 
									if(item.now=='true'){
										var k=(item.item_key).substring(0, 1)
										$.ajax({url : "updateCustom.do",
											data : {item_key : (k+'default'), //해당하는 행성 또는 도우미 기본으로 장착
													now : "true" },
											success : function(data) {
												var re = data
												if (re == "SUCCESS") {
													alert("아이템을 구매내역에서 삭제했습니다.");
													location.href="store.do"
												}
											}
										})
									}
									
								} else {
									alert("오류가 발생하여 삭제를 실패했습니다. \n문의게시판에 문의해주세요.");
								}
							}
						})
				}
			})
			if(utr>=2){
				utr=0;
			}
			var ed=$("<div class="+gridArr[utr]+"></div>");
			$(ed).append(div);
			$("#uui").append(ed); 
			utr++;
		});
	});
	  
	$.getJSON("listItem.do",function(data) {
		$.each(data,function(i, item) {
			 	if((item.item_key).substring(1,(item.item_key).length)=='default'){//기본아이템은 리스트에X
			 		return true;
			 	}
				//동적노드생성
				var div = $("<div></div>");
				var imgD = $("<div></div>");
				var img = $("<img src='resources/item/"+item.item_image+"' width='100px'>");
				var info = $("<p>"+ item.item_name+ "<br>"+ item.info+"</p>") 
				var buyBtn = $("<button class='btn btn-secondary' data-mini='true' data-inline='true' data-ajax='false'>구 매</button>");
				$(imgD).append(img);
				$(imgD).append(info);
				$(img).show();
				$(info).hide();
				$(info).addClass("infoD");
				$(div).append(imgD);
				$(imgD).click(function(){
					$(img).toggle();
					$(info).toggle();
				})
				$(div).append(item.point + "point");
				$(div).append(buyBtn);
				$(div).addClass("itemD");
				$(buyBtn).click(function() {
					var n = "true";
					if ((item.item_key).substring(0,1) == 'E') {
						n = "false";
					}
					if(confirm(item.item_name+"을(를) 구입하시겠습니까?")==1){
						var checkB=false //중복체크
						if(eval($("#userPoint").val())-item.point<0){
							alert("포인트가 부족하여 구매할 수 없습니다.")
							return;
						}
						
						$.each(haveItem,function(k,v){ //이미 있는 행성이나 도우미 구매시 막도록
							if(item.item_key==v && ((item.item_key).substring(0, 1) != 'E')){
								checkB=true;
							} 
						})
						if(checkB==true){
							alert('이미 구매한 아이템입니다.')
							return;
						}else{ //중복된 행성이나 도우미가 아닌 경우 구매가능
							//구입시 해당 item_key갖고 구입으로보내야함 
							//item_key는지금 갖고있음 반복문안이라서
							$.ajax({url : "insertCustom.do",
									data : {item_key : item.item_key,
											lcount: item.letter,
											point:item.point,
											now : n },
									success : function(data) {
										var re = data
										if (re == "SUCCESS") {
											alert("아이템을 구입했습니다.\n마이페이지에서 확인하실 수 있습니다.");
											location.href="store.do"
										} else {
											alert("오류가 발생하여 아이템 구입을 실패했습니다. \n문의게시판에 문의해주세요.");
										}
									}
								})
						}
					}
				})
				
				//장비의 경우
				if ((item.item_key).substring(0, 1) == 'E') {
					if(etr>=2){
						etr=0;
					}
					var ed=$("<div class="+gridArr[etr]+"></div>");
					$(ed).append(div);
					$("#eui").append(ed); 
					etr++;
				}
				//행성의 경우
				else if ((item.item_key).substring(0, 1) == 'P') {
					if(ptr>=2){
						ptr=0;
					}
					var ed=$("<div class="+gridArr[ptr]+"></div>");
					$(ed).append(div);
					$("#pui").append(ed); 
					ptr++;
				}
				//도우미의 경우
				else if ((item.item_key).substring(0, 1) == 'H') {
					if(htr>=2){
						htr=0;
					}
					var ed=$("<div class="+gridArr[htr]+"></div>");
					$(ed).append(div);
					$("#hui").append(ed); 
					htr++;

				}
			})
	});
	
	if($("#tabD").val()=="true"){
		$("#stab1").removeClass("active in")
		$("#stab4").addClass("active in")
		$("#myTab li[class='active']").removeClass("active")
		var lis = $("#myTab").find("li")
		$(lis[3]).addClass("active")
		$("#stab1-tab").attr("aria-expanded","false")
		$("#stab4-tab").attr("aria-expanded","true") 
	}
	
	$("#myTab li a").click(function(){
		$(".infoD").hide()
		$(".itemD img").show()
	}) 
});
</script>  
</head>
<body>
<input type="hidden" value="${tab }" id="tabD">
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
           <div class="txt">이미지를 누르면 상세 설명이 나와요!</div>
          		<input type="hidden" value="${user.point }" id="userPoint">
           		 <ul id="myTab" class="nav nav-tabs" role="tablist">
					  <li role="presentation" class="active"><a data-target="#stab1" id="stab1-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">장비</a></li>
					  <li role="presentation" class=""><a data-target="#stab2" role="tab" id="stab2-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">행성</a></li>
					  <li role="presentation" class=""><a data-target="#stab3" role="tab" id="stab3-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">도우미</a></li>
					  <li role="presentation" class=""><a data-target="#stab4" role="tab" id="stab4-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">구매내역</a></li>
				  </ul>
			      <div id="myTabContent" class="tab-content">
					  <div role="tabpanel" class="tab-pane fade active in" id="stab1" aria-labelledby="e-tab">
					  	<div class="ui-grid-a" id="eui">
					  	</div>
					  </div>
					  <div role="tabpanel" class="tab-pane fade" id="stab2" aria-labelledby="p-tab">
					  	<div class="ui-grid-a" id="pui">
					  	</div>
					  </div>
					  <div role="tabpanel" class="tab-pane fade" id="stab3" aria-labelledby="h-tab">
					  	<div class="ui-grid-a" id="hui">
					  	</div>
					  </div>
					  <div role="tabpanel" class="tab-pane fade" id="stab4" aria-labelledby="u-tab">
					  	<div class="ui-grid-a" id="uui">
					  	</div>
					  </div>
				  </div>
           </div>
     </div>
</body>
</html>
