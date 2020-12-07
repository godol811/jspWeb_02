<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="Review.css" />
 -->
 <meta charset="UTF-8">
<title>리뷰 작성</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 10px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	h3 {
	  margin-top: 10px;
	  text-align: center;
	  margin-bottom: 20px;
	}
		
	.wrap{
		padding: 30px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 50%;
	
	}
	
	.sub_news #trtr{
		border-bottom: 1px solid #999;
	
	}
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 15px;
	}
	
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 2px #999;
		border-bottom: solid 2px #b2b2b2;
		background-color: #f1f1f4;
		color: #333;
		font-weight: bold;
		line-height: 20px;
		vertical-align: top;
	}
	
	.sub_news .thth{
		border-right: solid 1px #999;
	}
	.sub_news .title{
		border-bottom: solid 2px #999;
		text-align: left;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .tdtd{
		text-align: left;
	}
	

	.sub_news .content{
		border-bottom: 2px solid #999;
	}
	
	.sub_news .bold{
		border-top: 1px solid #999;
	}
	
	.sub_news #bold1{
		border-right: 1px solid #999;
	}
	.sub_news .bold2{
		border-bottom: 1px solid #999;
	}
	
	.sub_news .img{
		padding-bottom: 40px;
	}
	
	.sub_news .page a{
		font-size: 18px;
		padding-right: 10px;
	
	}
	
	#btn {
       margin-left: 60%;
       width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 30px;
       margin-bottom: 10px;
	   padding: 0px;
	}


</style>

</head>
<body>
<script type="text/javascript">
	function check(){
		the Form = document.input;
		
		if(theForm.reviewRate.value.trim().length==0){
			alert("평점을 입력해주세요.");
			theForm.reviewRate.focus();
			return false;
			
		if(theForm.reviewContent.value.trim().length==0){
			alert("내용을 입력해주세요.");
			theForm.reviewContent.focus();
			return false;
			
		alert("입력이 완료되었습니다.");
	}

</script>
	<h3>리뷰 작성</h3>
		<form name="input" action="Rating_InsertAction.room" method="post" onsubmit="return check()">
		<table class="sub_news">
			<colgroup>
				<col width="50px;" />
				<col width="200px;" />
			</colgroup>
			<tr>
				<td class="content"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/<%=request.getParameter("roomImage")%>"></td>
				<td class="content"><%=request.getParameter("roomTitle") %></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userinfo_UserId" size="30" value="<%=session.getAttribute("USERID") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="display: none">RoomID</td>
				<td style="display: none"><input type="text" name="room_Roomid" value="<%=request.getParameter("roomId") %>" size="30" value=18 readonly="readonly"></td>
				<td style="display: none">bookID</td>
				<td style="display: none"><input type="text" name="bookId" value="<%=request.getParameter("bookId") %>" size="30" value=18 readonly="readonly"></td>
			</tr>
			<tr>
				<td>평점</td>
				<td><input type="number" step="0.5" max="5" min="0" size="30" name="reviewRate" placeholder="0-5 사이를 입력하세요">
			</tr>	
			<tr>
			<tr>
				<td>내용</td>
				<td><textarea name="reviewContent" rows="20" cols="40"></textarea></td>
			</tr>
		</table>
				<input id="btn" type="submit" value="입력" name="submit">
		</form>
</body>
</html>