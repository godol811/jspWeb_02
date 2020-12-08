<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 숙소 리스트</title>
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
		margin-left: 10%;
		margin-right:auto;
		width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 30px;
       margin-bottom: 10px;
	   padding: 0px;
	}
	

</style>
</head>
<body>

<div class ="wrap">
<h1>등록 숙소 리스트</h1>
<table class="sub_news">   
 		<colgroup>
		 	<col width="30px">
			<col width="200px">
			<col width="300px">
			<col width="30px">
			<col width="30px">
			<col width="200px">
			<col width="80px">
			<col width="80px">
			<col width="80px">
			<col width="80px">
			<col width="80px">
		</colgroup>
	<tr>
		<th>No</th>
		<th>숙소 이름</th>
		<th>숙소 내용</th>
		<th>숙소 가격</th>
		<th>숙소 인원</th>
		<th>숙소 주소</th>
		<th>체크인 시간 / 체크아웃 시간</th>
		<th>숙소 이미지</th>
		<th>숙소 삭제날짜</th>
		<th>숙소 수정</th>
		<th>숙소 삭제</th>
	</tr>
	<c:forEach items="${list}" var="dto"  varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${dto.roomTitle }</td>
		<td>${dto.roomContent }</td>
		<td>${dto.roomPrice }</td>
		<td>${dto.roomCapa }</td>
		<td>${dto.roomAddress }</td>
		<td>${dto.roomCheckIn } / ${dto.roomCheckOut }</td>
		<td><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
		<td>${dto.roomDeleteDate }</td>
		<td><input class ="registerBtn"  type="button" onclick="location.href='AdminRoomModifyList.room?roomId=${dto.roomId}'" value="수정"></td>
		<td><input class ="registerBtn"  type="button" onclick="location.href='AdminRoomDelete.room?roomId=${dto.roomId}'" value="삭제"></td>
<%-- 		<td><a href="AdminRoomModifyList.room?roomId=${dto.roomId}"> 수정 </a></td>
		<td><a href="AdminRoomDelete.room?roomId=${dto.roomId}"> 삭제 </a></td> --%>
	</tr>
	</c:forEach>
	</table>
		<input class="btn2" type="button" value="이 전" onClick="location.href='mainPage.room'">
</div>
</body>
</html>
