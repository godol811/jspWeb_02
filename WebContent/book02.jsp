<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>예약 내용</h3>

	<script type="text/javascript">
	
	function cardCheck(){
		theForm = document.book02;
		
		if(theForm.cardInfo.value.trim()==0){
			alert("카드번호를 입력주세요.");
			return false;
			
		} else if(theForm.cardInfoDetail01.value.trim()==0){
			alert("카드 만료일 입력해주세요.");
			return false;
			
		} else if(theForm.cardInfoDetail02.value.trim()==0){
			alert("카드 CVC 입력해주세요.");
			
		} else{
			alert("예약이 완료되었습니다.");
			return true;
			
		}
		
	}
	</script>


	<form name="book02" action="bookInsert.room" method="post" onsubmit="return cardCheck()">
		<table>
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td><input type="text" id="checkinTime" name="checkinTime" class="form-control" value="${roomView.roomCheckIn }" style="width:100px; font-size: 10px;"></td>
				<td><input type="text" id="checkoutTime" name="checkoutTime" class="form-control" value="${roomView.roomCheckOut }"  style="width:100px; font-size: 10px;"></td>
			</tr>
			<tr>
				<td>인원</td>
			</tr>
			<tr>
			<!--  수정 필요(앞에서 roomCapa 값 가져오기) -->
				<td align="center"><input type="number" name="guest" id="guest" max="${dto.roomCapa}" min="1" step="1" value="${dto.roomCapa}"/> 명 </td>
			</tr>
			<tr>
				<!--  수정 필요 -->
				<td>가격/ 박</td><td>₩</td>
			</tr>
			<tr>
				<!--  수정 필요 -->
				<td>합 계</td><td>₩ <%-- <%=roomPrice*(checkinTime - checkoutTime) --%></td>
			</tr>
			<tr>
				<td>결제수단</td>
			</tr>
			<tr>
				<td>카드번호</td><td><input type="text" name="cardInfo" placeholder="0000 0000 0000 0000"></td>
			</tr>
			<tr>
				<td>만료일</td><td><input type="text" name="cardInfoDetail01" placeholder="MM / YY"></td>
			</tr>
			<tr>
				<td>CVC</td><td><input type="text" name="cardInfoDetail02" placeholder="123"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인 및 결제하기" >
			</tr>
			
		</table>
	</form>	
</body>
</html>