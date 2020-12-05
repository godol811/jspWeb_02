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
	<table border="0">
	
		<c:forEach items="${messageList}" var="dto"> <!--setAttribute에서 선언된 list -->
		<tr>
			<td>$(dto.userInfo_userId) %></td>	
			<td> <font size=0.3>${dto.messageDate }</font></td>
		</tr>
		<tr>
			<td colspan=2>${dto.messageContent }</td>
		</tr>
		</c:forEach>

	</table>
</body>
</html>