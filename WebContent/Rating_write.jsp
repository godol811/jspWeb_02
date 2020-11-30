<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="date.css" />
<meta charset="UTF-8">
<title>글 작성</title>
</head>


		<form name="input" action="write.room" method="post" onsubmit="return check()">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userinfo_UserId" size="30" value="<%=session.getAttribute("ID") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td style="display:none">RoomID</td>
				<td style="display:none"><input type="text" name="room_Roomid" size="30" value=18 readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="reviewTitle" size="30"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="reviewContent" ></textarea></td>
			<tr>
				<td>평점</td>
				<td><input type="number" step="0.5" max="5" min="0" size="10" name="reviewRate" placeholder="0-5 사이를 입력하세요">
			</tr>	
			
			
			<tr>
				<td><input type="submit" value="입력" name="submit"></td><td>	<button type="button" onclick="location.href='Rating_list.room'">목록 보기</button></td>
			</tr>
		</table>
		</form>

</html>