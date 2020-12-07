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
	 <h1 style="" align="Center">후기 목록</h1>
	<table style="margin-top: 100px; margin-left: auto; margin-right: auto;">
			<tr>
			<th>사용자 Id</th> <th>작성일</th><th>후기내용</th><th>평점</th>
			
			</tr>
		<c:forEach items="${reviewList}" var="dto2">	
			<tr>
				<td>${dto2.userinfo_Userid}</td><td> ${dto2.reviewDate}</td>
				<td>${dto2.reviewContent}</td><td>${dto2.reviewRate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>