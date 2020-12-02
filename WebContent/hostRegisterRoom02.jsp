<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숙소 등록 시작하기</h2>

		<h5>2단계</h5> <br>
	<%
	request.setCharacterEncoding("utf-8");
	
	String roomType = request.getParameter("roomType");
	String roomCapa = request.getParameter("roomCapa");
	String roomAddress = request.getParameter("address")+request.getParameter("addressDetail");
	String roomCheckIn = request.getParameter("checkinTime");
	String roomCheckOut = request.getParameter("checkoutTime");
	String roomPrice = request.getParameter("roomPrice");
	
	session.setAttribute("ROOMCAPA", roomCapa);
	session.setAttribute("ROOMPRICE", roomPrice);
	session.setAttribute("ROOMADDRESS", roomAddress);
	session.setAttribute("ROOMCHECKIN", roomCheckIn);
	session.setAttribute("ROOMCHECKOUT", roomCheckOut);
	
	%>
	
	<script type="text/javascript">
		function uploadCheck(){
			
			theForm = document.load;
			
			if(theForm.roomTitle.value.trim()==0){
				alert("제목을 입력해주세요.");
				theForm.roomTitle.focus();
				return false;
				
			} else if(theForm.roomContent.value.trim()==0){
				alert("내용을 입력해주세요.");
				theForm.roomContent.focus();
				return false;
			} else if(theForm.roomImage.value.trim()==0){
				alert("이미지를 업로드해주세요.");
				return false;
			}
			
		}
	
	</script>
	
		<!-- 사진 업로드 -->
	
	<form action="hostRegister.room" name="load" method="post" enctype="multipart/form-data" onsubmit="return uploadCheck()">
	<colgroup>
		<col width="500px"/>
	</colgroup>
		<table>
			<tr>
				<td colspan="2">1. 숙소의 제목을 만드세요.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="roomTitle" placeholder="50자 이내"/></td>
			</tr>
			<tr>
				<td colspan="2">2. 게스트에게 숙소에 대해 설명해주세요.</td>
			</tr>
			<tr><td colspan="2"><textarea rows="20" cols="50" name="roomContent"></textarea></td>
			</tr>
			<tr>
				<td colspan>3. 멋진 사진으로 숙소가 돋보이게 해주세요.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="roomImage" /></td>
			</tr>
			<tr>
				<td><input type="button" value="이전" onClick="history.go(-1)" style="align-items: right"></td>
				<td><input type="submit" value="등록"/></td>
			</tr>
		</table>
	</form>
	
</body>
</html>