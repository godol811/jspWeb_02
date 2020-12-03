<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 숙소 수정</title>
</head>
<body>
 <form name="RoomModify" method="get" action="AdminRoomModify.room">
<table border="1">   
<c:forEach items="${list}" var="dto">

	<tr>
		<td>숙소 ID</td> <td><input type="text" value="${dto.roomId }" name="roomId"></td>
	</tr>
	<tr>
		<td>숙소 이름</td> <td><input type="text" value="${dto.roomTitle }" name="roomTitle"></td>
	</tr>
	<tr>
		<td>숙소 내용</td> <td><input type="text" value="${dto.roomContent }" name="roomContent"> </td>
	</tr>
	<tr>
		<td>숙소 가격</td> <td><input type="text" value="${dto.roomPrice }" name="roomPrice"> </td>
	</tr>
	<tr>
		<td>숙소 인원</td> <td> <input type="text" value="${dto.roomCapa }" name="roomCapa"> </td>
	</tr>
	<tr>
		<td>숙소 주소</td> <td><input type="text" value="${dto.roomAddress }" name="roomAddress"> </td>
	</tr>
	<tr>
		<td>숙소 체크인</td> <td><input type="text" value="${dto.roomCheckIn }" name="roomCheckIn"> </td>
	</tr>
	<tr>
		<td>숙소 체크아웃</td> <td><input type="text" value="${dto.roomCheckOut }" name="roomCheckOut"> </td>
	</tr>
<%-- 	<tr>
		<td>숙소 이미지</td> <td><input type="text" value="${dto.roomImage }" name="roomImage"> </td>
	</tr>
	<tr>
		<td>roomImageReal</td> <td>${dto.roomDeleteDate }</td>
	</tr> --%>
	<tr>
		<td><td>
		<td><input type="submit" value="수정"></td>
		<td><button type="button" onclick="location.href='AdminRoomList.room'">돌아가기</button></td>
	</tr>
	</c:forEach>
</table>
</form> 
</body>
</html>