<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- ------------------------------- -->
	<table border="1" class="noticeTable">
		<tr>
			<td colspan="2" align="center"> 숙소 사진 </td>
			<td align="center">  </td>
			<td align="center"> 내용 </td>
			<td align="center"> 가격 </td>
			<td align="center"> 가능인원 </td>
			<td align="center"> 주소 </td>
			<td align="center"> 체크인 시간 </td>
			<td align="center"> 체크아웃 시간 </td>
			<td></td>
			
			
		</tr>
		
	<c:forEach items = "${list }" var = "dto" begin="${beginNum}" end="${endNum }">
		<tr>
			<td  align="center" colspan="2"><img width="80px" height="80px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
			<td  align="center"> ${dto.roomTitle }</td>
			<td  align="center">${dto.roomContent}</td>
			<td  align="center">${dto.roomPrice }</td>		
			<td  align="center">${dto.roomCapa }</td>		
			<td  align="center">${dto.roomAddress } ${dto.roomAddressDetail }</td>		
			<td  align="center">${dto.roomCheckIn } </td>		
			<td  align="center">${dto.roomCheckOut } </td>	
			<td></td>
		</tr>
		
		
		</c:forEach>
		
		<tr>
		
		
		<td colspan="7" width="50" align="center" >
		<c:forEach  begin="1" end="${totalPage}" varStatus="status"> 
		<a href="roomSearchPaging.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>&guest=<%=session.getAttribute("GUEST")%>">[${status.count}]</a>
		</c:forEach></td>
		
		</tr>
</table>




</body>
</html>