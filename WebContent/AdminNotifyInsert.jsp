<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력</title>
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

<form name="input" action="AdminNotifyInsert.room" method="post" onsubmit="return check()">
<table border="1">   
	<tr>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
	</tr>
	<tr>
		<td><input type="text" name="boardTitle"></td>

		<td><input type="text" name="boardContent"></td>
		<td><input type="text" value="${USERID }" name="userId"></td>
	</tr>
	<tr><td><input type="submit" value="입력"></td>
		<td><button type="button" onclick="location.href='AdminNotifyList.room'">돌아가기</button></td>
	<tr>
	
	</table>
	</form>




</body>
</html>