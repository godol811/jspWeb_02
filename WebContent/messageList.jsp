<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 중요빼먹지말것!!!!! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 리스트</title>
</head>
<body>
	<table>
	
		<c:forEach items="${messageList}" var="dto"> <!--setAttribute에서 선언된 list -->
		<tr>
			<td>숙소이름 </td>	
			<td><a href="messageHistory.room?bookId=${dto.bookId }">${dto.roomTitle}</a></td>
		</tr>
		<tr>
			<td>최근 일자</td>
			<td>${dto.messageInsertDate }</td>
		</tr>
		
		</c:forEach>

	</table>
</body>
</html>