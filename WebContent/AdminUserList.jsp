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


<table border="1">   
	<tr>
		<th>ID</th>
		<th>암호</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>등록일</th>
		<th>상태</th>
		<th>탈퇴일</th>
		<th>탈퇴</th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.userId }</td>
		<td>${dto.userPw }</td>
		<td>${dto.userName }</td>
		<td>${dto.userAddress }</td>
		<td>${dto.userTel }</td>
		<td>${dto.userInsertDate }</td>
		<td>${dto.userState }</td>
		<td>${dto.userDeleteDate }</td>
		<td><a href="AdminUserDelete.room?userId=${dto.userId}"> 삭제 </a></td>
	</tr>
	</c:forEach>
	</table>
		<button type="button" onclick="location.href='adminCheck.jsp' ">돌아가기</button>
</body>
</html>
