<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</style>
</head>
<body>

<div class ="wrap">
<table class="sub_news">   

 		<colgroup>
		 	<col width="30px">
			<col width="300px">
			<col width="100px">
			<col width="200px">
			<col width="600px">
			<col width="300px">
			<col width="250px">
			<col width="250px">
			<col width="250px">
			<col width="250px">
			<col width="250px">
			<col width="250px">
			<col width="250px">
		</colgroup>
	<tr>
	<!-- 	<th>No</th> -->
		<th>ID</th>
		<th>숙소 이름</th>
		<th>숙소 내용</th>
		<th>숙소 가격</th>
		<th>숙소 인원</th>
		<th>숙소 주소</th>
		<th>숙소 체크인</th>
		<th>숙소 체크아웃</th>
		<th>숙소 이미지</th>
		<th>숙소 삭제날짜</th>
		<th>숙소 수정</th>
		<th>숙소 삭제</th>
	</tr>
	<c:forEach items = "${list }" var = "dto" begin="${beginNum}" end="${endNum }">
	<tr>
<%-- 		<td>${status.count}</td> --%>
		<td>${dto.roomId }</td>
		<td>${dto.roomTitle }</td>
		<td>${dto.roomContent }</td>
		<td>${dto.roomPrice }</td>
		<td>${dto.roomCapa }</td>
		<td>${dto.roomAddress }</td>
		<td>${dto.roomCheckIn }</td>
		<td>${dto.roomCheckOut }</td>
		<td>${dto.roomImage }</td>
		<td>${dto.roomDeleteDate }</td>
		<td><a href="AdminRoomModifyList.room?
		roomId=${dto.roomId}"> 수정 </a></td>
		<td><a href="AdminRoomDelete.room?roomId=${dto.roomId}"> 삭제 </a></td>
	</tr>
	</c:forEach>
		<tr class="page">
				<td colspan="13" width="50" align="center" >
				<c:forEach  begin="1" end="${totalPage}" varStatus="status"> 
						<a href="AdminRoomListPaging.room?page=${status.count}">[${status.count}]</a>
				</c:forEach>
				</td>
			</tr>
	</table>
		<button type="button" onclick="location.href='adminCheck.jsp' ">돌아가기</button>
</div>
</body>
</html>
