<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 현황</title>
</head>
<body>
	<!--  수정 필요 -->
	<table border="1">
			<tr>
			<form action="hostRoomReservation.room" method="post">
				<td><select name="search">
					<option value="bookcheckindate" selected="selected">월</option>
					<option value="userid">예약자</option>
				</select></td>
				<td><input type="text" name="reservationSearch"></td>
				<td><input type="submit" value="검색"></td>
				</form>
			</tr>
			<tr>
				<td>예약 기간</td><td>예약자</td><td>예약인원</td><td>예약 결제 금액</td>
			</tr>
			<c:forEach items="${hostRoomReservationList }" var = "dto" >
			<tr>
				<td>${dto.bookCheckInDate } ~ ${dto.bookCheckOutDate }</td>
				<td>${dto.userId } </td>
				<td>${dto.bookCapa } </td>
				<td>${dto.roomPriceTotal }</td>
			</tr>
		
			</c:forEach>
		<tr>
			<td><input type="button" value="목록보기" onClick="history.go(-1)" style="align-items: right"></td>
		</tr>
	</table>
</body>
</html>