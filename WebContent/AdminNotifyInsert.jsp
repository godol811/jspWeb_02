<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력</title>

<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 20px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	h1 {
	  text-align: center;
	  margin-bottom: 20px;
	  margin-top: 50px;
	}
		
	.wrap{
		padding: 50px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
		border-bottom: 2px solid #999;
	
	}
	.sub_news tr{
		border-bottom: 1px solid #999;
	}
	
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 14px;
	}
	
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 1px #999;
		border-bottom: solid 1px #b2b2b2;
		background-color: #f1f1f4;
		color: #333;
		font-weight: bold;
		line-height: 20px;
		vertical-align: top;
		text-align: center;
	}
	
	.sub_news .thth{
		border-right: solid 1px #999;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .tdtd{
		text-align: center;
		border-right: solid 1px #999;
	}
	
	.sub_news .one{
		border-top: 2px solid #999;
	}
	.sub_news .bot{
		border-bottom: 2px solid #999;
	}
	
	#btn {
       margin-left: 85%;
       width: 84px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
       margin-top: 100px;
       margin-bottom: 10px;
	   padding: 10px;
	}

		.btn2{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 10%;
		width: 80px;
		
	} 

	.btn1{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 70%;
		width: 80px;
		
	} 
</style>
	

</head>
<body>
<script type="text/javascript">
	function check(){
		the Form = document.input;
		
		if(theForm.boardTitle.value.trim().length==0){
			alert("제목을 입력해주세요.");
			theForm.boardTitle.focus();
			return false;
			
		if(theForm.boardContent.value.trim().length==0){
			alert("내용을 입력해주세요.");
			theForm.boardContent.focus();
			return false;
			
		alert("입력이 완료되었습니다.");
	}

</script>
<h1>공지사항 작성</h1>
<form name="input" action="AdminNotifyInsert.room" method="post" onsubmit="return check()">
<table class="sub_news">   
	
	<tr>
		<td style="text-align:center; font-weight: bold; font-size: 18px;">제목</td><td><input width="100px" type="text" name="boardTitle"></td>
	</tr>
	<tr>
		<td style="text-align:center; font-weight: bold; font-size: 18px;">작성자</td><td><input type="text" value="${USERID }" name="userId" readonly="readonly"></td>
	</tr>
	<tr>
		<td style="text-align:center; font-weight: bold; font-size: 18px;">내용</td><td><textarea rows="40" cols="70" name="boardContent"></textarea></td>
	</tr>
	</table>
		<button class="btn2" type="button" type="button" onclick="location.href='AdminNotifyList.room'">돌아가기</button>
		<input class="btn1" type="submit" value="입력">
	</form>




</body>
</html>