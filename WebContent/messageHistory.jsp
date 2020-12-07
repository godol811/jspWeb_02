<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 기록</title>
</head>
<body><table>
	
		<c:forEach items="${messageHistory}" var="dto"> <!--setAttribute에서 선언된 list -->
		<tr>
			<td> </td>	
			<td>${dto.messageContent}</td>
		</tr>
		<tr>
			<td>입력시간</td>
			<td>${dto.messageInsertDate }</td>
		</tr>
		
		</c:forEach>

	</table>
</body>
</html>