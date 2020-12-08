<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 숙소 수정</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 20px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	h1 {
	  text-align: center;
	  margin-bottom: 20px;
	  margin-top: 50px;
	}
		
	.wrap{
		padding: 50px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
		border-bottom: 2px solid #999;
	
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
		text-align: center;
	}
	
	.sub_news .thth{
		border-right: solid 1px #999;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .tdtd{
		text-align: center;
		border-right: solid 1px #999;
	}
	
	.sub_news .one{
		border-top: 2px solid #999;
	}
	.sub_news .bot{
		border-bottom: 2px solid #999;
	}
	
	input[type="text" i] {
		width: 500px;
	}
	
	#btn {
       margin-left: 85%;
       width: 84px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
       margin-top: 100px;
       margin-bottom: 10px;
	   padding: 10px;
	}

		.btn2{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 10%;
		width: 80px;
		
	} 

	.btn1{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 70%;
		width: 80px;
		
	} 
	
</style>

</head>
<body>
<h1>숙소 수정</h1>
 <form name="RoomModify" method="get" action="AdminRoomModify.room">
<table class="sub_news">   
<c:forEach items="${list}" var="dto">

	<tr>
		<td style="font-weight: bold;">숙소 이름</td> <td><input type="text" value="${dto.roomTitle }" name="roomTitle" style="text-align: left;"></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">숙소 내용</td> <td><textarea rows="30" cols="70" value="${dto.roomContent }" name="roomContent" style="text-align: center;"></textarea></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">숙소 가격</td> <td><input type="text" value="${dto.roomPrice }" name="roomPrice" style="text-align: right;"> &nbsp; 원 </td>
	</tr>
	<tr>
		<td style="font-weight: bold;">숙소 인원</td> <td> <input type="text" value="${dto.roomCapa }" name="roomCapa" style="text-align: right;">&nbsp;명 </td>
	</tr>
	<tr>
		<td class="a" style="font-weight: bold;">숙소 주소</td> <td><input type="text" value="${dto.roomAddress }" name="roomAddress" style="text-align: center;"> </td>
	</tr>
	<tr>
		<td style="font-weight: bold;">숙소 체크인</td> <td><input type="text" value="${dto.roomCheckIn }" name="roomCheckIn" style="text-align: center;"> </td>
	</tr>
	<tr>
		<td style="font-weight: bold;">숙소 체크아웃</td> <td><input type="text" value="${dto.roomCheckOut }" name="roomCheckOut" style="text-align: center;"> </td>
	</tr>
<%-- 	<tr>
		<td>숙소 이미지</td> <td><input type="text" value="${dto.roomImage }" name="roomImage"> </td>
	</tr>
	<tr>
		<td>roomImageReal</td> <td>${dto.roomDeleteDate }</td>
	</tr> --%>
		
	</c:forEach>
</table>
		<button class="btn2" type="button" onclick="location.href='AdminRoomList.room'">돌아가기</button>
		<input class="btn1" type="submit" value="수 정">
</form> 
</body>
</html>