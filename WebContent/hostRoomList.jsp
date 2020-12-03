<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 등록 숙소 리스트</title>
</head>
<body>

 	<input type="button" name="insertRoom" onclick="location.href='hostRegisterRoom01.jsp'" value="숙소 등록">

	<table border="1">
	    <colgroup>
			<col width="80px">
			<col width="80px">
			<col width="500px">
			<col width="50px">
			<col width="50px">
		</colgroup>
		
		<c:forEach items="${hostRoomList}" var="dto"> <!--setAttribute에서 선언된 list -->
			<tr>
				<td rowspan="5"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td>숙소명</td><td>${dto.roomTitle }</td>
				<td rowspan="5"><input type="button" name="revise" value="수정" onclick="location.href='roomListView.room?roomId=${dto.roomId}'"></td>
				<td rowspan="5"><input type="button" name="delete" value="삭제" onclick="location.href='hostRoomDelete.room?roomId=${dto.roomId}'"></td>
			</tr>
			<tr>
				<td>숙소설명</td><td>${dto.roomContent }</td>
			</tr>
			<tr>
				<td>체크인</td><td>${dto.roomCheckIn }</td>
			</tr>
			<tr>
				<td>체크아웃</td><td>${dto.roomCheckOut }</td>
			</tr>
			<tr>
				<td>주소</td><td>${dto.roomAddress } &nbsp; ${dto.roomAddressDetail }</td>
			</tr>
			
		</c:forEach>
		<tr>
	</table>
</body>
</html>