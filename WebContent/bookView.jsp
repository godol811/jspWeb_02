<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
</head>
<body>

		<table>
			<colgroup>
				<col width="100px"/>
				<col width="100px"/>
			</colgroup>
			<tr>
				<td colspan="2"><img width="500px" height="500px" src="${pageContext.request.contextPath}/upload/${bookView.roomImage}"></td>
			</tr>
			<tr>
				<td colspan="2">${bookView.roomTitle }</td>
			</tr>
			<tr>
				<td>체크인 : ${bookView.bookCheckInDate }</td><td>체크아웃 : ${bookView.bookCheckOutDate }</td>
			</tr>
			<tr>
				<td colspan="2">${bookView.roomContent }</td>
			</tr>
			<tr>
				<td colspan="2">총 합계 : ${bookView.roomPriceTotal }</td>
			</tr>
			<tr>
				<td colspan="2">주소 : ${bookView.roomAddress } &nbsp; ${bookView.roomAddressDetail }  </td>
			</tr>
			<tr>
				<td colspan="2"><a href="HostMessage.room?userId=${bookView.userId }&bookId=${BOOKID}&roomuserId=${bookView.roomuserId}">호스트에게 연락하기 </a></td>
			</tr>
			<tr>
				<td><input type="button" value="이전" onClick="history.go(-1)" style="align-items: right"></td>
					
			</tr>
		</table>
		
</body>
</html>