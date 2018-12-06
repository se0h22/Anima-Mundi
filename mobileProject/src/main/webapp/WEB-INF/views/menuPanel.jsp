<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.ui-page {
  background: url(resources/img/mbg.png) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
}
#menuP{
	background-color:#0A1825;
	text-shadow: none;
	color: white;
	width:80%;
}
#menuP a{
	background-color: gray;
	text-shadow: none;
	color: white;
	margin-bottom: 20px;
}
#point{
	color: white;
	text-shadow: none;
	text-align: right;
	background:#222A35;
	padding:10px;
}
#panelgo{
	margin:10px;
}
.ui-header .ui-btn, .ui-header .ui-icon, .ui-header .ui-btn-inner {
    width: 35px;
    height: 35px;
}
</style>
<script type="text/javascript">
$(function(){
	var id=$("#userId").val()
	if(id==null || id==''){
		alert("세션이 만료되어 자동 로그아웃되었습니다. 다시 로그인해주세요!")
		location.href="index.do"
	}
	$("#lo").click(function(){
    	if(confirm("로그아웃하시겠습니까?")==1){
			$(location).attr("href","index.do");
		}
    })
    $("#gotoHome").click(function(){
    	location.href="main.do"
    })
})
</script>
<input type="hidden" value="${user.id }" id="userId">
<div data-role="panel" data-position="left" data-display="overlay" id="menuP">
	<table width="100%"> 
		<tr>
			<td><br>${user.nickname }님(${user.id }) 환영합니다.<Br><br></td>
		</tr> 
	</table>
   	<a href="main.do" data-role="button" class="btn-lg" data-ajax="false">메  인</a>
   	<a href="testList.do" data-role="button" class="btn-lg" data-ajax="false">심리테스트</a>
   	<a href="store.do" data-role="button" class="btn-lg" data-ajax="false">상점</a>
   	<a href="letter.do" data-role="button" class="btn-lg" data-ajax="false">쪽지</a>
   	<a href="matching.do" data-role="button" class="btn-lg" data-ajax="false">매칭</a>
  	<a href="myPage.do" data-role="button" class="btn-lg" data-ajax="false">마이페이지</a>
  	<a href="boardList.do" data-role="button" class="btn-lg" data-ajax="false">문의게시판</a>
  	<a href="info.do" data-role="button" class="btn-lg" data-ajax="false">사용설명서</a>
    <a href="#" data-role="button" id="lo" class="btn-lg" data-ajax="false">로그아웃</a>
</div>
<div data-role="header" style="border: none;">
	<a id="panelgo" href="#menuP" data-role="button" data-icon="grid" data-iconpos="notext"></a>
	<div id="point">Point:${user.point}</div>
</div>