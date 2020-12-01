<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사진 업로드 -->
	
	<form action="hostRegister.room" method="post" enctype="multipart/form-data">
		
	
		<input type="file" name="file" /><br><br>
		<input type="button" value="이전" onClick="history.go(-1)"> 
		<input type="submit" name="submit" value="다음"/>
	</form>
	
	
	
	
</body>
</html>.