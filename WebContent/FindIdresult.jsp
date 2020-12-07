<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기 결과</title>
</head>
<body>
<c:forEach items = "${list }" var = "dto">
당신의 ID는 ${dto.userId } 입니다.
</c:forEach>




</body>
</html>