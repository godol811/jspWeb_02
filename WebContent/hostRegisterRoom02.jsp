<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	padding-top:5px;
	/* margin-top: 5px; */
	
}

.all {
	grid-template-columns: 1fr;
    margin-left: 800px;
    margin-right: auto;
    padding-top:10px;
  }
.head {
	grid-template-columns: 1fr;
    margin-left: 800px;
    margin-right: auto;
    padding-top:10px;
  }

.head_table tr, .head_table td{
	text-align: center;
}


	#btnIndex{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 1%;
		width: 80px;
		
	} 

	#btnIndex1{
		margin-top: 80px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 20%;
		width: 80px;
		
	} 
.all .one{

	margin-bottom: 10px;

}

</style>

</head>
<body>
<div class="head">
	<table class="head_table">
		<tr>
			<th style="font-size: 40px; font-weight: bold; ">숙소 등록 시작하기</th>
		</tr>
		<tr>
			<td style="font-weight: bold; text-align: left; font-size: 30px; color: gray;">2단계</td><td></td>
		</tr>	
	</table>
</div>

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
		<table class="all">
			<colgroup>
				<col width="500px"/>
			</colgroup>
			
		<c:choose>
			<c:when test="${empty sessionScope.ROOMID}">
				<form name="load" method="post" enctype="multipart/form-data" action="hostRegister.room" onsubmit="return uploadCheck()">
			</c:when>
			<c:otherwise>
				<form name="load" method="post" enctype="multipart/form-data" action="hostRoomRevise.room" onsubmit="return uploadCheck()">
			</c:otherwise>
		</c:choose>
			<tr >
				<td colspan="2" style="font-weight: bold;">1. 숙소의 제목을 만드세요.</td>
			</tr>
			<tr >
				<td colspan="2" class="one"><input type="text" name="roomTitle" placeholder="50자 이내" value="<%=roomTitle%>"/></td>
			</tr>
			<tr >
				<td colspan="2" style="font-weight: bold;">2. 게스트에게 숙소에 대해 설명해주세요.</td>
			</tr>
			<tr ><td colspan="2" class="one"><textarea rows="40" cols="70" name="roomContent" > <%=roomContent%></textarea></td>
			</tr>
			<tr >
				<td colspan="2" style="font-weight: bold;">3. 멋진 사진으로 숙소가 돋보이게 해주세요.</td>
			</tr>
			<tr >
				<td colspan="2" class="one"><input type="file" name="roomImage01" value="<%=roomImage %>"/></td><td><input type="hidden" name="originImage" value="<%=roomImage %>" readonly="readonly"> </td>
			</tr>
			<tr>
				<td><input type="button" id="btnIndex" value="이전" onClick="history.go(-1)" style="align-items: right"></td>
				<c:choose>
					<c:when test="${empty sessionScope.ROOMID}">
						<td><input id="btnIndex1" type="submit" value="등록"/></td>
						</form>
					</c:when>
					<c:otherwise>
					<!-- 	<td><input type="button" value="수정" enctype="multipart/form-data" onclick="location.href='hostRoomRevise.room'"></td> -->
						<td><input id="btnIndex1" type="submit" value="수정" /></td>
						</form>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>

</body>
</html>