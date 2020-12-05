<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>


<table border="1">   
	<tr>
		<th>게시판 ID</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>작성자</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td><input type="text" name="boardId" value="${dto.boardId }" readonly="readonly"></td>
		<td>${dto.boardTitle }</td>
		<td>${dto.boardContent }</td>
		<td>${dto.boardInsertDate }</td>
		<td>${dto.userInfo_userId }</td>
		<td><a href="AdminNotifyModify.room?
		boardId=${dto.boardId}"> 수정 </a></td>
		<td><a href="AdminNotifyDelete.room?boardId=${dto.boardId}"> 삭제 </a></td>
	</tr>
	</c:forEach>
	</table>
		<button type="button" onclick="location.href='AdminNotifyInsert.jsp'">글쓰기</button>
		<button type="button" onclick="location.href='adminCheck.jsp' ">돌아가기</button>
</body>
</html>


