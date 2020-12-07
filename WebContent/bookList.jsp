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
	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 100px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	h1 {
	  text-align: center;
	  margin-top: 40px;
	  margin-bottom: 20px;
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	.booklikst_wrap{
		padding: 50px;
		
	}
	
	.sub_news .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
       width: 100px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
		/* border-bottom: 1px solid #999;
		color: #666;
		font-size: 12px;
		table-layout: fixed; */
	}
	.sub_news tr{
		border-bottom: 1px solid #999;
	}
	
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 14px;
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
		text-align: center;
	}
	
	.sub_news .room{
		text-align: left;
		padding-left: 15px;
		font-size: 13px;
		
	}
	.sub_news .room :hover{
		text-decoration: underline;
		
	}
	
	
	
</style>

</head>
<body>
	<div class ="booklikst_wrap">
		<h1>여행 예약</h1>
		<table class="sub_news">
			<colgroup>
				<col width="30"/>
				<col width="60"/>
				<col width="70" />
				<col width="200" />
				<col width="50" />
			</colgroup>
			<tr>
				<th scope="col">No</th><th colspan="2" scope="col">숙소</th><th scope="col">여행 기간</th><th scope="col">리뷰</th>
			</tr>
			<c:forEach items="${roomReservationList }" var = "dto" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td class="image"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
					<td class="room"><a href="bookView.room?bookId=${dto.bookId }"> ${dto.roomTitle }</a></td>
					<td class="stay">${dto.bookCheckInDate } ~ ${dto.bookCheckOutDate }</td>
					<td><input type="button" class ="registerBtn" value="리뷰 작성하기" onclick="window.open('Rating_write.jsp?bookId=${dto.bookId }&roomId=${dto.roomId}&roomImage=${dto.roomImage}&roomTitle=${dto.roomTitle }','','width=800, height=800, scrollbars=yes')"></td>
				</tr>
			</c:forEach>
		</table>
			<!-- <input class="btn" type="button" value="목록보기" onClick="history.go(-1)" style="align-items: right"> -->
	</div>
</body>
</html>