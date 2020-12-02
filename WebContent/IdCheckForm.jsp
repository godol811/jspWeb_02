<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>아이디 중복 체크</title>
	
</head>
<body></body>
<div id="wrap">
			<%String check = request.getParameter("check");
			%>
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		 <form method="post" action="userIdCheck.room" name="userInfo" ></form>
			<input type="text" name="userId" id="userId">
			<input type="submit" value="중복확인"><%=check%>
		</form>
		<div id="msg"></div>
		<br>
		<input id="useBtn" type="button" value="확인" onclick="location.href='userSignUp.room'">
	</div>
</div>	
</body>
</html>