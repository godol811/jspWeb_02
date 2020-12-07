<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	.roomlist_wrap{
		padding: 50px;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
	
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

<title>호스트 등록 숙소 리스트</title>
</head>
<body>
<div class ="roomlist_wrap">
<input type="button" name="insertRoom" onclick="location.href='hostRegisterRoom01.jsp'" value="숙소등록">
	<form action="hostRoomDelete.room?roomId=${dto.roomId}" method="post">
	<table class="sub_news">
	  <colgroup>
			<col width="80px">
			<col width="80px">
			<col width="80px">
			<col width="300px">
			<col width="50px">
			<col width="50px">
			<col width="50px">
		</colgroup>
		<tr>
			<th colspan="2" scope="col">숙소</th><th colspan="2" scope="col">상세항목</th><th scope="col"></th><th scope="col"></th><th scope="col"></th><th scope="col"></th>
		</tr>
		<c:forEach items="${hostRoomList}" var="dto">
			<tr>
				<td rowspan="4"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td rowspan="4">${dto.roomTitle }</td>
				<td ></td>
				<td rowspan="4"><input type="button" name="detail" value="예약현황" onclick="location.href='hostRoomReservation.room?roomId=${dto.roomId}'"></td>
				<td rowspan="4"><input type="button" name="revise" value="수정" onclick="location.href='roomListView.room?roomId=${dto.roomId}'"></td>
				<td rowspan="4"><input type="button" name="delete" value="삭제" onclick="location.href='hostRoomDelete.room?roomId=${dto.roomId}'"></td>
			</tr>
			<tr>
				<td>숙소설명</td><td>${dto.roomContent }</td>
			</tr>
			<tr>
				<td>체크인 / 체크아웃 </td> <td>${dto.roomCheckIn } / ${dto.roomCheckOut }</td>				
			</tr>				
			<tr>
				<td>주소</td><td>${dto.roomAddress } &nbsp; ${dto.roomAddressDetail }</td>
			</tr>
				
		</c:forEach>
	</table>
	</form>
</div>
</body>
</html>