<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 중요빼먹지말것!!!!! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table style="border-right:none; border-left:none;border-top:none;border-bottom:none">

		<c:forEach items="${userList}" var="dto2"> <!--setAttribute에서 선언된 list -->
		<tr>	
			<td><a href="messageList.room?roomUserId=${dto.room_userId}&userId=${USERID}">${dto.room_userId}</a></td>
			<td> <font size=0.3>${dto.messageDate}</font></td>
		</tr>
		
		</c:forEach>

	</table>

</body>
</html>

