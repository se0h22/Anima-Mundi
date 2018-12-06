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
<script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
     <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.bDiv{
	text-decoration: none;
	text-shadow: none;
}
.bDiv div{
	margin: 15px;
	background-color: #3A3B3C;
	padding: 10px;
	color:white;
}
.bDiv div:hover{
	background: #555;
}
#detailT{
	border:1px solid #F6F6F6;
	width:100%;
	margin-bottom: 5px;
}
#detailT td{
	padding:5px;
}
.c{
	height:50%;
}
.h{
	text-shadow:none;
	background: #F6F6F6;
	width:20%;
}
.btn{
	margin: 10px;
}
#insertT{
	margin: 5px;
	padding:5px;
}
fieldset label{
	font-size: 12px;
}
.insertTd{
	color: white;
	text-shadow: none;
	width:20%;
	text-align: center;
}
textarea.ui-input-text { height: inherit !important}
#updateS{
	color: white;
	text-shadow: none;
	text-decoration: blink;
}
</style>
<script type="text/javascript">
     $(function(){
           $.getJSON("qaBoardList.do",function(data){
        	   $.each(data,function(i,g){	   
        		   var bd=$("<a href='#' data-toggle='modal' data-target='#detailB'><div><p align='right'>"+g.writeDate+"</p><h4>["+g.category+"] "+g.title+"</h4></div></a>")
        		   $(bd).click(function(){
        			   $(".modal-body").html("<table id='detailT'></table>");
        				$("#detailT").append("<tr><td class='h'>구분</td><td>"+g.category+"</td></tr>")
        				$("#detailT").append("<tr><td class='h'>제목</td><td>"+g.title+"</td></tr>")
        				$("#detailT").append("<tr><td class='h'>작성일</td><td>"+g.writeDate+"</td></tr>")
        				$("#detailT").append("<tr><td colspan=2 class='c'>"+g.content+"</td></tr>")
        				if(g.filename=='파일이 없습니다.'){
	        				$("#detailT").append("<tr><td class='h'>첨부</td><td>"+g.filename+"</td></tr>")        					        					
        				}else{
	        				$("#detailT").append("<tr><td class='h'>첨부</td><td><a href='resources/upload/"+g.filename+"'>"+g.filename+"</a></td></tr>")        					
        				}
        				var udtBtn=$("<a href='#updateB' data-role='button' class='btn'>수정</button>")
        				var delBtn=$("<button class='btn'>삭제</button>")
        				udtBtn.click(function(){
        					$("#detailB").modal("hide");
        					$("#updateF input[value='"+g.category+"']").attr('checked', 'checked');
                            $("#updateF input[name=title]").val(g.title);
                            $("#updateF textarea").html(g.content);
                            $("#updateS").html(g.filename);
                            $("#updateF input[name=filename]").val(g.filename);
                            $("#bnoU").val(g.bno);
        				})
        				delBtn.click(function(){
        					if(confirm("정말 삭제하시겠습니까?")==1){
	        					$.ajax({url:"qaBoardDelete.do",
	        						data:{bno:g.bno},
	        						success:function(data){
	        			       		if(data=="SUCCESS"){
	        			       			location.href='boardList.do'
	        			            }else{
	        			                alert("삭제에 오류가생겼습니다.");
	        			            }
	        					}})        						
        					}
        				})
        				$(".modal-body").append(udtBtn)
        				$(".modal-body").append(delBtn)
        		   })
        		   $(bd).addClass("bDiv");
	        	   $("#boardT").append(bd);
        	   })
           })
           
           $("#insertBtn").click(function(){
        	   $("#insertF").ajaxForm({
               	success:function(data){
                        if(data=='SUCCESS'){
                        	location.href='boardList.do'
                        }else{
                            alert("등록에 오류가생겼습니다.");
                        }
               	}
               })
           })
           
           $("#updateBtn").click(function(){
        	   $("#updateF").ajaxForm({
                  	success:function(data){
                           if(data=='SUCCESS'){
                           	location.href='boardList.do'
                           }else{
                               alert("수정에 오류가생겼습니다.");
                           }
                  	}
                  })
              })
           
     })
</script>
</head>
<body>
     <div data-role="page" id="main" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
	     <input type='hidden' value="${user.id }" id="userId">
           <div data-role="content">
           		<br>
           		<a href="#insertB" data-role="button" data-theme="b" id="addBtn" class="btn" data-inline="true" data-icon="plus">글쓰기</a>
           		<div id="boardT">
           		</div>
           </div>
     </div>
     
     <!-- detail Modal -->
	<div id="detailB" class="modal fade lm" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body login-card">
		    <table id="detailT"></table>
		  </div>
	    </div>
	  </div>
	</div>
	
    <div data-role="page" id="insertB" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
			      <form action="qaBoardInsert.do" id="insertF" class="form-horizontal" method="post" enctype="multipart/form-data">
           		<table id="insertT">
		     	<tr>
			     <td class='insertTd'>
			            종류</td><td>
			            <fieldset form="insertF" data-role="controlgroup" data-theme="b" data-type="horizontal">
					        <input type="radio" name="category" id="r1" value="구매" checked="checked">
					        <label for="r1">구매</label>
					        <input type="radio" name="category" id="r2" value="심리테스트">
					        <label for="r2">심리테스트</label>
					        <input type="radio" name="category" id="r3" value="오류">
					        <label for="r3">오류</label>
					        <input type="radio" name="category" id="r4" value="기타">
					        <label for="r4">기타</label>
					        <input type="radio" name="category" id="r5" value="제안">
					        <label for="r5">제안</label>
					    </fieldset>
		           </td></tr>
		           <tr><td class='insertTd'>제목</td><td><input type="text" name="title" size="30"></td></tr>
		           <tr><td class='insertTd'>내용</td><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
		           <tr><td class='insertTd'>첨부</td><td><input type="file" name="upload"></td></tr>
		        	<tr><td colspan="2">
			        	<div class="ui-grid-a">
							<div class="ui-block-a"> 
					            <button id="insertBtn" class="btn" data-ajax='false'>글 등록</button>
							</div>
							<div class="ui-block-b"> 
					            <button class="btn" onclick="location.href='boardList.do'" data-ajax='false'>목록 보기</button>
							</div>
						</div>
			        </td></tr>
		     	</table> 
		        </form>
           </div>
     </div>
     
    <div data-role="page" id="updateB" data-fullscreen="true">
	     <jsp:include page="menuPanel.jsp"></jsp:include>
           <div data-role="content">
			      <form action="qaBoardUpdate.do" id="updateF" class="form-horizontal" method="post" enctype="multipart/form-data">
           			<input type="hidden" id="bnoU" name="bno" value="-1">
           		<table id="updateT">
		     	<tr>
			     <td class='insertTd'>
			            종류</td><td>
			            <fieldset form="updateF" data-role="controlgroup" data-theme="b" data-type="horizontal">
					        <input type="radio" name="category" id="r1_" value="구매" checked="checked">
					        <label for="r1_">구매</label>
					        <input type="radio" name="category" id="r2_" value="심리테스트">
					        <label for="r2_">심리테스트</label>
					        <input type="radio" name="category" id="r3_" value="오류">
					        <label for="r3_">오류</label>
					        <input type="radio" name="category" id="r4_" value="기타">
					        <label for="r4_">기타</label>
					        <input type="radio" name="category" id="r5_" value="제안">
					        <label for="r5_">제안</label>
					    </fieldset>
		           </td></tr>
		           <tr><td class='insertTd'>제목</td><td><input type="text" name="title" size="30"></td></tr>
		           <tr><td class='insertTd'>내용</td><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
		           <tr><td class='insertTd'>첨부</td><td><input type="file" name="upload"></td></tr>
		           <tr><td class='insertTd'>현재파일</td><td><span id="updateS"></span>
		           		<input type="hidden" name="filename" value=""></td></tr>
		        	<tr><td colspan="2">
			        	<div class="ui-grid-a">
							<div class="ui-block-a"> 
					            <button id="updateBtn" class="btn" data-ajax='false'>글 수정</button>
							</div>
							<div class="ui-block-b"> 
					            <button class="btn" onclick="location.href='boardList.do'" data-ajax='false'>목록 보기</button>
							</div>
						</div>
			        </td></tr>
		     	</table> 
		        </form>
           </div>
     </div>
</body>
</html>
