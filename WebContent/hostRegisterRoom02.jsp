<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String roomType = request.getParameter("roomType");
	String roomCapa = request.getParameter("roomCapa");
	String roomLocation = request.getParameter("roomLocation");
	%>
	
	<form action="hostRegisterRoom03.jsp" method="post">		
		<!-- <h3>등록하실 숙소 종류는 무엇인가요?</h3> -->
		
	
			<!-- <h4>숙소의 건물 유형을 선택해주세요.</h4> <br>
			<select name="roomTypeDetail">
				<option value="allRoom" selected="selected">아파트</option>
				<option value="personalRoom">주택</option>
				<option value="groupRoom">별채</option>
				<option value="groupRoom">부티크 호텔</option>
			</select> <br><br>
			아파트: 일반적으로 다세대가 거주하는 건물 또는 여러 사람이 함께 거주하는 단지를 의미합니다.<br><br>
			 -->
			
			<!-- <h4>숙소의 건물 유형을 선택해주세요.</h4> <br>
			<select name="roomTypeDetail">
				<option value="allRoom" selected="selected">아파트</option>
				<option value="personalRoom">공동주택</option>
				<option value="groupRoom">레지던스</option>
			</select> <br><br>
			아파트: 아파트와 공동주택이란 일반적으로 다세대가 거주하는 건물 또는 여러 사람이 함께 거주하는 단지를 의미합니다.
			<a href="#">설명 모두 검토하기</a>
			
			<h4>게스트만 사용하도록 만들어진 숙소인가요?</h4> <br>
			<input type="radio" name="roomPossible" value="guestRoom" checked="checked">
			 예. 게시트용으로 따로 마련된 숙소입니다.	<br>
			<input type="radio" name="roomPossible" value="ownRoom">
			 아니요. 제 개인 물건이 숙소에 있습니다.
			 <br><br><br> -->

			 
	 <h3>숙소 위치를 알려주세요.</h3> <br>
		<table>
			<tr>
				<td>시</td>
				<td>구</td>
			</tr>
			<tr>
				<td><input type="text" name="addressCity" width="60" value="<%=roomLocation %>"></td>
				<td><input type="text" name="addressPart" width="60"></td>
			</tr>
			<tr>
				<td>도로명</td>
			</tr>
			<tr>
				<td colspan="2"><a href="login.jsp"><input type="text" name="address" width="100"></a></td>
			</tr>
			<tr>
				<td>동호수(선택사항)</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="addressDetail" width="100"></td>
			</tr>
			
		
		</table>
			 
			 
			 
		<input type="button" value="이전" onClick="history.go(-1)"> 
		<input type="submit" value="다음">
			 
	</form>
	
</body>
</html>