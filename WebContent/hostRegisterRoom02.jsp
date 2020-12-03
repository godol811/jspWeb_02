<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    
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
	
	String roomCapa = request.getParameter("roomCapa");
	String roomAddress = request.getParameter("address");
	String roomAddressDetail = request.getParameter("addressDetail");
	String roomCheckIn = request.getParameter("checkinTime");
	String roomCheckOut = request.getParameter("checkoutTime");
	String roomPrice = request.getParameter("roomPrice");
	String roomTitle = request.getParameter("roomTitle");
	String roomContent = request.getParameter("roomContent");
	String roomImage = request.getParameter("roomImage");
	
	
	session.setAttribute("ROOMCAPA", roomCapa);
	session.setAttribute("ROOMPRICE", roomPrice);
	session.setAttribute("ROOMADDRESS", roomAddress);
	session.setAttribute("ROOMADDRESSDETAIL", roomAddressDetail);
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
			} else{
				if(<%=session.getAttribute("ROOMID") %> == null){
					alert("입력이 완료되었습니다.");
				return true;
				} else{
					alert("수정이 완료되었습니다.");
				return true;
				}
			}
			
		}
	
	</script>
	
		<!-- 사진 업로드 -->
	 <%=session.getAttribute("ROOMID") %>
	<form name="load" method="post" enctype="multipart/form-data" action="hostRegister.room" onsubmit="return uploadCheck()">
		<table>
			<colgroup>
				<col width="500px"/>
			</colgroup>
			
			<tr>
				<td colspan="2">1. 숙소의 제목을 만드세요.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="roomTitle" placeholder="50자 이내" value="<%=roomTitle%>"/></td>
			</tr>
			<tr>
				<td colspan="2">2. 게스트에게 숙소에 대해 설명해주세요.</td>
			</tr>
			<tr><td colspan="2"><textarea rows="20" cols="50" name="roomContent"><%=roomContent%></textarea></td>
			</tr>
			<tr>
				<td colspan="2">3. 멋진 사진으로 숙소가 돋보이게 해주세요.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="roomImage" value="<%=roomImage%>"/></td>
			</tr>
			<tr>
				<td><input type="button" value="이전" onClick="history.go(-1)" style="align-items: right"></td>
				<c:choose>
					<c:when test="${empty sessionScope.ROOMID}">
						<td><input type="submit" value="등록"/></td>
					</c:when>
					<c:otherwise>
						<td><input type="button" value="수정" onclick="hostRoomRevise.room?roomCapa=
						" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</form>
	
</body>
</html>