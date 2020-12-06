<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<form name="input" action="AdminNotifyModifyAction.room" method="post" onsubmit="return check()">
<table border="1">   
	<tr>
		<th>제목</th>
		<th>내용</th>
		<th>작성날짜</th>
		<th>작성자</th>
		<th>게시판 ID</th>
		
		
	</tr>
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td><input type="text" name="boardTitle" value="${dto.boardTitle }"></td>
		<td><textarea name="boardContent">${dto.boardContent }</textarea></td>
		<td><input type="text" value="${dto.boardInsertDate }" readonly="readonly"></td> 
		<td><input type="text" name="userInfo_userID" value="${USERID }" readonly="readonly"></td>
		<td><input type="text" name="boardId" value="${dto.boardId }" readonly="readonly"></td>
	
		</tr></c:forEach>
	</tr>
	<tr><td><input type="submit" value="수정"></td>
		<td><button type="button" onclick="location.href='AdminNotifyList.room'">돌아가기</button></td>
	<tr>
	
	</table>
	</form>




</body>
</html>