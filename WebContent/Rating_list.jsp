	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Review.css" />
<meta charset="UTF-8">
<title>후기 보기</title>
</head>
<body>

	<table style="margin-top: 100px; margin-left: auto; margin-right: auto;">
	
		<c:forEach items="${reviewList}" var="dto2">	
			<tr>
				<td>${dto2.userinfo_Userid}</td><td> ${dto2.reviewDate}</td>
			</tr>
			<tr>
				<td>${dto2.reviewContent}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>