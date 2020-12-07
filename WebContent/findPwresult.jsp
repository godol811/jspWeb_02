<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW 찾기 결과</title>
</head>
<body>
<c:forEach items = "${list }" var = "dto">
	당신의 PW는 ${dto.userPw } 입니다.
</c:forEach>


</body>
</html>