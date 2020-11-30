	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Review.css" />
<meta charset="UTF-8">
<title>평점</title>
</head>
<body>

	<table style="margin-top: 100px; margin-left: auto; margin-right: auto;">
	<tr>
		<th>ID</th>
		<th>호텔</th>
		<th>제목</th>
		<th>내용</th>
		<th>평점</th>
		<th>날짜</th>
		<th></th>
	</tr>
	<c:forEach items="${rate}" var="dto">
	<tr>
		<td>${dto.userinfo_Userid }</td>
		<td>${dto.room_Roomid }</td>
		<td>${dto.reviewTitle }</td>
		<td>${dto.reviewContent }</td>
		<td>${dto.reviewRate }</td>
		<td>${dto.reviewDate }</td>
	</c:forEach>
		<tr><td colspan="3"><button  type="button" onclick="location.href='Rating_write.room'"  style="margin-top: 100px; margin-left: auto; margin-right: auto;">평점 남기기</button></td></tr>
	</table>
</body>
</html>