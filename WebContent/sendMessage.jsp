<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
		<form action="sendMessage.room" method="get">
	<table>
		
		
			<tr>
				<td>예약번호 </td>
				<td><input type="text" name="bookId" value="<%=request.getParameter("bookId") %>" readonly="readonly" size="30"></td>
			</tr>
			<tr>
				<td>보내는 사람 </td>
				<td><input type="text" name="userId" value="<%=request.getParameter("userId") %>" readonly="readonly" size="30"></td>
			</tr>
			<tr>
				<td>받는 사람 </td>
				<td><input type="text" name="roomUserId" value="<%=request.getParameter("roomuserId")%>" size="30"></td>
			</tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="messageContent"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력">
			</tr>
	</table>
		</form>
</body>

</body>
</html>