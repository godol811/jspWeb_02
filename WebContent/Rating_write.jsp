<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Review.css" />
<meta charset="UTF-8">
<title>글 작성</title>
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
	
		<form name="input" action="Rating_InsertAction.room" method="post" onsubmit="return check()">
		<table style="margin-top: 100px; margin-left: auto; margin-right: auto;">
			<tr>
			<td ><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/<%=request.getParameter("roomImage")%>"></td>
			</tr>
			<tr>
				<td><%=request.getParameter("roomTitle") %></td>
			</tr>
			<tr>
				<td align="center">ID</td>
				<td></td>
				<td><input type="text" name="userinfo_UserId" size="30" value="<%=session.getAttribute("USERID") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="display: none">RoomID</td>
				<td style="display: none"><input type="text" name="room_Roomid" value="<%=request.getParameter("roomId") %>" size="30" value=18 readonly="readonly"></td>
				<td style="display: none">bookID</td>
				<td style="display: none"><input type="text" name="bookId" value="<%=request.getParameter("bookId") %>" size="30" value=18 readonly="readonly"></td>
			</tr>
			<tr>
				<td align="center">평점</td>
				<td></td>
				<td><input type="number" step="0.5" max="5" min="0" size="30" name="reviewRate" placeholder="0-5 사이를 입력하세요">
			</tr>	
			<tr>
				<td align="center">내용</td>
				<td></td>
				<td><textarea name="reviewContent" ></textarea></td>
			<tr>
				<td><input type="submit" value="입력" name="submit"></td>
			</tr>
		</table>
		</form>
</body>
</html>