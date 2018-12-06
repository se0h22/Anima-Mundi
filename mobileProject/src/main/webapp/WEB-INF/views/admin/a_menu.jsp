<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.mBtn{
	text-align: center;
	color: black;
	border-radius: 2px;
	background-color: #D9D9D9;
	padding-bottom: 5px;
}
.mBtn img{
	width:10%;
	margin: 5px;

}
.activeD{
	background-color: white;
}
#fixD{
	position: fixed;
	left:2%;
	top:30%;
	padding:10px;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$("#iD").click(function(){
		location.href="adminP.do"
	})
	$("#sD").click(function(){
		location.href="adminS.do"
	})
	$("#bD").click(function(){
		location.href="adminB.do"
	})
	$("#logout").click(function(){
		if(confirm("관리자 페이지를 로그아웃하시겠습니까?")==1){
			location.href="index.do"
		}
	})
});
</script>

<table>
	<tr>
		<td><div class="mBtn" id='iD'><img src="resources/img/cloud.png"><br>아이템 관리</div></td>
		<td><div class="mBtn" id='sD'><img src="resources/img/test.png"><br>심리테스트 관리</div></td>
		<td><div class="mBtn" id='bD'><img src="resources/img/chat.png"><br>문의게시판 관리</div></td>
	</tr>
</table>
<div id="fixD">
	<button class="btn" id="logout">로그아웃</button><br><br>
</div>