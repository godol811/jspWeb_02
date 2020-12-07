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
	
	.roomlist_wrap .registerBtn{
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
       margin-bottom: 10px;
	   padding: 10px;
	}

</style>

<title>호스트 등록 숙소 리스트</title>
</head>
<body>
<div class ="roomlist_wrap">
	<input id="btn" type="button" name="insertRoom" onclick="location.href='hostRegisterRoom01.jsp'" value="숙소 등록">
	<form action="hostRoomDelete.room?roomId=${dto.roomId}" method="post">
	<table class="sub_news">
	  <colgroup>
			<col width="80px">
			<col width="100px">
			<col width="200px">
			<col width="600px">
			<col width="80px">
			<col width="80px">
			<col width="80px">
		</colgroup>
		<tr>
			<th class="thth" colspan="2" scope="col">숙소</th><th class="thth" colspan="2" scope="col">상세 항목</th><th scope="col">예약 현황</th><th scope="col">숙소 수정</th><th scope="col">숙소 삭제</th>
		</tr>
		<c:forEach items="${hostRoomList}" var="dto">
			<tr class="one">
				<td  rowspan="4" ><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td class="tdtd" rowspan="4">${dto.roomTitle }</td>
				<td class="tdtd">숙소설명</td><td class="tdtd">${dto.roomContent }</td>
				<td  rowspan="4"><input class ="registerBtn" type="button" name="detail" value="예약현황" onclick="location.href='hostRoomReservation.room?roomId=${dto.roomId}'"></td>
				<td  rowspan="4"><input class ="registerBtn" type="button" name="revise" value="수정" onclick="location.href='roomListView.room?roomId=${dto.roomId}'"></td>
				<td rowspan="4"><input type="button" class ="registerBtn" name="delete" value="삭제" onclick="location.href='hostRoomDelete.room?roomId=${dto.roomId}'"></td>
			</tr>
			<tr>
				<td class="tdtd">체크인 / 체크아웃 </td> <td class="tdtd">${dto.roomCheckIn } / ${dto.roomCheckOut }</td>				
			</tr>				
			<tr class="bot">
				<td class="tdtd">주소</td><td>${dto.roomAddress } &nbsp; ${dto.roomAddressDetail }</td>
			</tr>
			<tr>
			</tr>
				
		</c:forEach>
	</table>
	</form>
</div>
</body>
</html>