<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 리스트</title>
</head>
<body>

	<table border="1">
		<colgroup>
			<col width="30">
			<col width="80">
			<col width="30">
		</colgroup>
		
		<c:forEach items="${hostRoomList}" var="dto"> <!--setAttribute에서 선언된 list -->
			<tr>
				<td><img alt="이미지없음" src="${dto.roomImage}"></td>
				<td>${dto.roomTitle }</td>
				<td><a href="content_view.do?bId=${dto.bId}&bName=${dto.bName }&bTitle=${dto.bTitle}&bContent=${dto.bContent }">${dto.bTitle }</a></td>
				<td></td>
			</tr>
		</c:forEach>
		<tr>
	</table>
</body>
</html>