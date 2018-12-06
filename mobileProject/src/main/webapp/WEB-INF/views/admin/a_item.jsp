<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anima-mundi admin page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap-theme.min.css">
<style type="text/css">
#iTB{
	margin: 10px;
	width: 100%;
}
#iTB thead{
	background-color: #F6DDDF;
	text-align: center;
	font-weight: bold;
}
#iTB tbody td{
	vertical-align:middle;
}
tbody td img{
	width:50px;
	height:50px;
	margin-right:5px;
}
.container a{
	margin-top:10px;
}
.detailI{
	width:150px;
	height:150px;
	margin-right:10px;
}
.form-check{
	margin-top:10px;
	margin-bottom: 5px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	var eB=0
	var hB=0
	var pB=0
	
	$("#chatI").hide()
	$("#letterI").hide()
	$("#fixD").append('<button class="btn btn-info" data-toggle="modal"  data-target="#insertM">아이템 등록</button>');
	$("#iD").addClass("activeD")
	$.getJSON("listItem.do",function(data){
		$.each(data,function(i,item){
			var info=item.info;
			if(info.length>40){
				info=info.substring(0,40)+"..."
			}
			var tr=$("<tr><td>"+item.item_key+"</td><td><img src='resources/item/"+item.item_image+"'>"+item.item_name+"</td><td>"+info+"</td><td>"+item.point+"</td><td>"+item.chatDate+"</td><td>"+item.letter+"</td></tr>")
			$(tr).click(function(){
				$("#modalBody").html("<table><tr><td rowspan='5'><img src='resources/item/"+item.item_image+"' class='detailI'></td></tr><tr><td><h3><b>"+item.item_name+"</b>("+item.item_key+")</h3></td></tr>"+
				"<tr><td>"+item.point+" point</td></tr><tr><td> : "+item.info+"</td></tr><tr><td>[채팅 "+item.chatDate+"회 / 쪽지 "+item.letter+"회] </td></tr></table>");
				var updateBtn=$('<button type="button" class="btn btn-primary">Edit</button>');
				$("#detailM .modal-footer").html(updateBtn)
				var delBtn=$('<button type="button" class="btn btn-dark">Delete</button>');
				$("#detailM .modal-footer").append(delBtn)
				$("#detailM .modal-footer").append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>')
				$("#detailM").modal("show");
				$(updateBtn).click(function(){
					$("#detailM").modal("hide")
					$("#updateM").modal("show")
					$("#updateM input[name='chatDate']").hide()
					$("#updateM input[name='letter']").hide()
					var ct=""
					if((item.item_key).substring(0,1)=='E'){
						ct="장비"
					}
					if((item.item_key).substring(0,1)=='H'){
						ct="도우미"
					}
					if((item.item_key).substring(0,1)=='P'){
						ct="행성"
					}
					$("#editKey").val(item.item_key)
					$("#updateM #iC").html(ct)
					$("#udpateM #nameI").val(item.item_name)
					$("#updateM #pointI").val(item.point)
					$("#updateM textarea").html(item.info)
					if(parseInt(item.chatDate)>0){
						$("#updateM #inlineCheckbox3").checked("checked")	
						$("#updateM input[name='chatDate']").show()
						$("#udateM input[name='chatDate']").val(item.chatDate)
					}
					if(parseInt(item.letter)>0){
						$("#updateM #inlineCheckbox4").checked("checked")		
						$("#updateM input[name='letter']").show()
						$("#udateM input[name='letter']").val(item.letter)
					}
					
					$("#updateM .dropdown-item").click(function(){
						var x = $(this).html()
						$("#updateM #iC").html(x)
					})
				})
				$(delBtn).click(function(){
					if(confirm(item.item_name+"을 삭제하시겠습니까?")==1){
						$.ajax({url:"deleteItem.do",data:{key:item.item_key},success:function(data){
							if(data=='SUCCESS'){
								alert("아이템을 삭제했습니다!")
								location.href="adminP.do"
							}else{
								alert("아이템 삭제에 실패했습니다ㅜㅠ");
							}
						}})
					}
				})
			})
			$("#tbody").append(tr)
			
			if((item.item_key).substring(0,1)=='E')
			{eB=parseInt((item.item_key).substring(1,(item.item_key).length))}
			
			if((item.item_key).substring(0,1)=='H')
			{hB=parseInt((item.item_key).substring(1,(item.item_key).length))}
			
			if((item.item_key).substring(0,1)=='P')
			{pB=parseInt((item.item_key).substring(1,(item.item_key).length))}
		})
	})
	$("#insertM .dropdown-item").click(function(){
		var x = $(this).html()
		$("#insertM #iCategory").html(x)
		if($(this).attr("id")=='eB'){
			$("#insertM #iCategory").val(eB)
		}
		if($(this).attr("id")=='pB'){
			$("#insertM #iCategory").val(pB)
		}
		if($(this).attr("id")=='hB'){
			$("#insertM #iCategory").val(hB)
		}
	})
	
	$("#inlineCheckbox1").click(function(){
		$("#chatI").toggle()
	})
	$("#inlineCheckbox2").click(function(){
		$("#letterI").toggle()
	})
	$("#inlineCheckbox3").click(function(){
		$("#updateM input[name='chatDate']").toggle()
	})
	$("#inlineCheckbox4").click(function(){
		$("#updateM input[name='letter']").toggle()
	})
});
</script>
</head>
<body>
<jsp:include page="a_menu.jsp"></jsp:include>
<div class="container">

<table id="iTB" class="table table-hover">
	<thead>
	<tr>
		<td>KEY</td>
		<td>NAME</td>
		<td>INFO</td>
		<td>POINT</td>
		<td>CHATDATE</td>
		<td>LETTER</td>
	</tr>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>
</div>

<!-- 아이템 상세창 -->
<div class="modal" id="detailM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이템 상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalBody">
        
      </div>
      <div class="modal-footer">
        
        
      </div>
    </div>
  </div>
</div>

<!-- 아이템 등록창 -->
<div class="modal" id="insertM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이템 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalBody">
        <form>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="iCategory" name="item_key">아이템 종류</button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="#" id="eB">장비</a>
		      <a class="dropdown-item" href="#" id="pB">행성</a>
		      <a class="dropdown-item" href="#" id="hB">도우미</a>
		    </div>
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="아이템명을 입력하세요" name="item_name">
		</div>
       	<div class="input-group mb-3">
        	<div class="input-group-prepend">
    			<span class="input-group-text" id="basic-addon1">포인트</span>
  			</div>
  			<input type="text" class="form-control" placeholder="포인트를 입력하세요" aria-label="Username" aria-describedby="basic-addon1" name="point">
        </div>
        <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text">설명</span>
		  </div>
		  <textarea class="form-control" aria-label="With textarea" placeholder="아이템 설명을 입력하세요" name="info"></textarea>
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroupFileAddon01">이미지</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name="upload">
		    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
		  </div>
		</div>	
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
		  <label class="form-check-label" for="inlineCheckbox1">채팅</label>
		  <input type="number" name="chatDate" placeholder="채팅기간을 입력하세요" id="chatI">
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
		  <label class="form-check-label" for="inlineCheckbox2">쪽지</label>
		  <input type="number" name="letter" placeholder="쪽지회수를 입력하세요" id="letterI">
		</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Insert</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 아이템 수정창 -->
<div class="modal" id="updateM" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이템 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalBody">
        <form>
        <input type="hidden" value="-1" id="editKey">
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="iC" name="item_key">아이템 종류</button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="#">장비</a>
		      <a class="dropdown-item" href="#">행성</a>
		      <a class="dropdown-item" href="#">도우미</a>
		    </div>
		  </div>
		  <input type="text" class="form-control" id="nameI" aria-label="Text input with dropdown button" placeholder="아이템명을 입력하세요" name="item_name">
		</div>
       	<div class="input-group mb-3">
        	<div class="input-group-prepend">
    			<span class="input-group-text" id="basic-addon1">포인트</span>
  			</div>
  			<input type="text" class="form-control" id="pointI" placeholder="포인트를 입력하세요" aria-label="Username" aria-describedby="basic-addon1" name="point">
        </div>
        <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text">설명</span>
		  </div>
		  <textarea class="form-control" aria-label="With textarea" placeholder="아이템 설명을 입력하세요" name="info"></textarea>
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroupFileAddon01">이미지</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name="upload">
		    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
		  </div>
		</div>	
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option1">
		  <label class="form-check-label" for="inlineCheckbox3">채팅</label>
		  <input type="number" name="chatDate" placeholder="채팅기간을 입력하세요">
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option2">
		  <label class="form-check-label" for="inlineCheckbox4">쪽지</label>
		  <input type="number" name="letter" placeholder="쪽지회수를 입력하세요">
		</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Edit</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>