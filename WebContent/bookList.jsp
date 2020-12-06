<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<style type="text/css">
	.sub_news, .sub_news th, .sub_news td{
		border:0;
	}
	.sub_news a{
		text-decoration: none;
	}
	
	.sub_news{
		width: 100%;
		border-bottom: 1px solid #999;
		color: #666;
		font-size: 12px;
		table-layout: fixed;
	}
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 1px #999;
		border-bottom: solid 1px #b2b2b2;
		background-color: #f1f1f4;
		color: #333;
		font-weight: bold;
		line-height: 20px;
		vertical-align: top;
	}
	
	.sub_news td{
		padding: 8px 0 9px;
		border-bottom: solid 1px #d2d2d2;
		text-align: center;
		line-height: 18px;
	}
	
	.sub_news .room{
		text-align: left;
		padding-left: 15px;
		font-size: 13px;
	}
	.sub_news
	
	
</style>

</head>
<body>
	
	<table class="sub_news" border="1" cellspacing="0" >
		<colgroup>
			<col width="80"/>
			<col width="200" />
			<col width="40" />
		</colgroup>
		<tr>
			<th colspan="2" scope="col">숙소</th><th scope="col">여행 기간</th>
		</tr>
		<c:forEach items="${roomReservationList }" var = "dto" varStatus="status">
			<tr>
				<td class="image" rowspan="2"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td class="room"><a href="bookView.room?bookId=${dto.bookId }"> ${dto.roomTitle }</a></td>
				<td class="stay">${dto.bookCheckInDate } ~ ${dto.bookCheckOutDate }</td>
			</tr>
			<tr>
				<td rowspan="2"><input type="button" value="리뷰 작성하기" onclick="location.href='Rating_write.jsp?bookId=${dto.bookId }&roomId=${dto.roomId}&roomImage=${dto.roomImage}&roomTitle=${dto.roomTitle }'"></td>
			</tr>
		</c:forEach>
	</table>
			<td><input type="button" value="목록보기" onClick="history.go(-1)" style="align-items: right"></td>
	
</body>
</html>