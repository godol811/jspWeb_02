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
		<th>숙소 이름</th>
		<th>숙소 내용</th>
		<th>숙소 가격</th>
		<th>숙소 인원</th>
		<th>숙소 주소</th>
		<th>숙소 체크인</th>
		<th>숙소 체크아웃</th>
		<th>숙소 이미지</th>
		<th>숙소 삭제날짜</th>
		<th>숙소 수정</th>
		<th>숙소 삭제</th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.roomId }</td>
		<td>${dto.roomTitle }</td>
		<td>${dto.roomContent }</td>
		<td>${dto.roomPrice }</td>
		<td>${dto.roomCapa }</td>
		<td>${dto.roomAddress }</td>
		<td>${dto.roomCheckIn }</td>
		<td>${dto.roomCheckOut }</td>
		<td>${dto.roomImage }</td>
		<td>${dto.roomDeleteDate }</td>
		<td><a href="AdminRoomModifyList.room?
		roomId=${dto.roomId}"> 수정 </a></td>
		<td><a href="AdminRoomDelete.room?roomId=${dto.roomId}"> 삭제 </a></td>
	</tr>
	</c:forEach>
	</table>
		<button type="button" onclick="location.href='adminCheck.jsp' ">돌아가기</button>
</body>
</html>
