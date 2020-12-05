<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
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

	   $(function(){
			
	  		$("#date1").datepicker({
	  			numberOfMonths:[1,2],
	  			minDate:0,
	  			nextText:"다음",
	  			prevText:"이전",
	  			onClose:function(selectedDate){
	  				$("#date2").datepicker("option","minDate", selectedDate);
	  			}
	  		
	  			
	  		});
	  		
	  		$("#date2").datepicker({
	  			numberOfMonths:[1,2],
	  			nextText:"다음",
	  			prevText:"이전",
	  			onClose:function(selectedDate){
	  				$("#date1").datepicker("option","maxDate", selectedDate);
	  			}
	  			
	  		});

	  	});
	      
	</script>
	<form name="book02" action="bookInsert.room" method="post" onsubmit="return cardCheck()">
		<table>
		<c:forEach items = "${list }" var = "dto">
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td> ${DATE1}  ${dto.roomCheckIn }</td>
				<td> ${DATE2}  ${dto.roomCheckOut }</td>
			</tr>
			
			<fmt:parseDate value="${DATE1}" var="strPlanDate" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
			<fmt:parseDate value="${DATE2}" var="endPlanDate" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
					


			
			
			<tr>
				<td colspan="2" align="center">총${endDate - strDate }박</td>
				
			</tr>
			<tr>
				<td>인원</td>
			</tr>
			<tr>
			<!--  수정 필요(앞에서 roomCapa 값 가져오기) -->
				<td><td align="center"><input type="number" name="guest" id="guest" max="${dto.roomCapa}" min="1" step="1" value="<%=session.getAttribute("GUEST")%>"> 명 </td>
			</tr>
			
			<tr>
				<!--  수정 필요 -->
				<td>1박 /</td><td>₩ ${dto.roomPrice} <%-- <%=roomPrice*(checkinTime - checkoutTime) --%></td>
			</tr>
			<tr>
				<!--  수정 필요 -->
				<td>합 계</td><td>₩ ${dto.roomPrice*(endDate - strDate) }<%-- <%=roomPrice*(checkinTime - checkoutTime) --%></td>
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
			</c:forEach>
		</table>
	</form>	
</body>
</html>