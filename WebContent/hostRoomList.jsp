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

	<table border="1">
	    <colgroup>
			<col width="80px">
			<col width="200px">
			<col width="50px">
			<col width="50px">
		</colgroup>
		
		<c:forEach items="${hostRoomList}" var="dto"> <!--setAttribute에서 선언된 list -->
			<tr>
				<td rowspan="2"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td>${dto.roomTitle }</td>
				<td rowspan="2"><input type="button" name="revise" value="수정" onclick="location.href='hostRegisterRoom01.jsp?roomId=${dto.roomId}&
				roomtitle=${dto.roomTitle}&roomcontent=${dto.roomContent}&roomprice=${dto.roomPrice}&roomcapa=${dto.roomCapa}&
				roomaddress=${dto.roomAddress}&roomcheckin=${dto.roomCheckIn}&roomcheckout=${dto.roomCheckOut}&roomimage=${dto.roomImage}&roomimagereal=${dto.roomImageReal}'"></td>
				<td rowspan="2"><input type="button" name="delete" value="삭제" onclick="location.href='hostRoomDelete.room?roomId=${dto.roomId}'"></td>
			</tr>
			<tr>
				<td>${dto.roomContent }</td>
			</tr>
			
		</c:forEach>
		<tr>
	</table>
</body>
</html>