<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 및 결제화면</title>
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
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
		margin-top:40px;
	  text-align: center;
	  margin-bottom: 40px;
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
	
	.btn1{
		margin-left: 67%;
		margin-right:8%;
		width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 30px;
       margin-bottom: 10px;
	   padding: 0px;
	}
	
	 .btn2{
		margin-left: 10%;
		width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 30px;
       margin-bottom: 10px;
	   padding: 0px;
	}

</style>	
	
</head>
<body>
<h1>예약 확인 및 결제 진행</h1>
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
			alert("결제 및 예약이 완료되었습니다.");
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

	  	function goBack(){
			window.history.back();
		  	}
	      
	</script>
	<form name="book02" action="bookInsert.room" method="post" onsubmit="return cardCheck()">
		<table class="sub_news">
			<c:forEach items = "${list }" var = "dto">
			<tr>
				<td style="font-weight: bold; border-right:1px solid #999; background-color: #f1f1f4;">체크인</td>
				<td style="font-weight: bold; background-color: #f1f1f4;">체크아웃</td>
			</tr>
			<tr>
						<c:choose>
							
							<c:when test ="${empty sessionScope.DATE1 }">
							<td style="border-right:1px solid #999;"><input style="text-align: center;" type="text" name="date1" value="${DATE1direct}" readonly="readonly"> ${dto.roomCheckIn }</td>
							<td><input style="text-align: center;" type="text" name="date2" value="${DATE2direct}" readonly="readonly">  ${dto.roomCheckOut }</td>
								<fmt:parseDate value="${DATE1direct}" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${DATE2direct}" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber></c:when>
							
							<c:when test ="${not empty sessionScope.DATE1 }" >
							<td style="border-right:1px solid #999;">${DATE1} <br>${dto.roomCheckIn }</td>
							<td>${DATE2}<br>  ${dto.roomCheckOut }</td>
								<fmt:parseDate value="${DATE1}" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${DATE2}" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber></c:when>
						</c:choose>
			</tr>
			<tr>
				<td colspan="2" style="border-top: 2px solid #999; font-weight: bold; background-color: #f1f1f4;">인&nbsp;원</td>
			</tr>
			<tr>
			<!--  수정 필요(앞에서 roomCapa 값 가져오기) -->
						<c:choose>
							<c:when test ="${not empty sessionScope.DATE1 }">
							<td colspan="2"><%=session.getAttribute("GUEST")%> &nbsp; 명 </td></c:when>
							<c:when test ="${empty sessionScope.DATE1 }">
 							<td colspan="2"><input style="text-align: center;" style="text-align: right;" type="text" name="roomCapa" value="${GUESTdirect}">명 </td></c:when> 
						</c:choose>
			</tr>
			<tr>
				<td colspan="2" style="border-top: 2px solid #999; font-weight: bold;">총  &nbsp; ${endDate - strDate }박</td>
				
			</tr>
			<tr>
				<!--  수정 필요 -->
				<td colspan="2">1박  /  ₩ ${dto.roomPrice} <%-- <%=roomPrice*(checkinTime - checkoutTime) --%></td>
			</tr>
			<tr> 
				<!--  수정 필요 -->
				<td colspan="2" style="font-weight: bold; font-size: 18px; background-color: #f1f1f4;">합&nbsp; 계 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;₩ &nbsp; ${dto.roomPrice*(endDate - strDate) } <%-- <%=roomPrice*(checkinTime - checkoutTime) --%></td>
			</tr>
			<tr>
				<td style="border-top: 2px solid #999; border-right: 1px solid #999; font-weight: bold;">결제수단</td>
				<td style="border-top: 2px solid #999;"><select id="search_select" name="card">
					<option selected="selected">신한</option>
					<option>국민</option>
					<option>삼성</option>
					<option>롯데</option>
					<option>농협</option>
				</select></td>
			</tr>
			<tr>
				<td style="font-weight: bold; border-right: 1px solid #999;">카드번호</td><td><input type="text" name="cardInfo" placeholder="0000 0000 0000 0000"></td>
			</tr>
			<tr>
				<td style="font-weight: bold; border-right: 1px solid #999;">만료일</td><td><input type="text" name="cardInfoDetail01" placeholder="MM / YY"></td>
			</tr>
			<tr>
				<td style="font-weight: bold; border-right: 1px solid #999;">CVC</td><td><input type="text" name="cardInfoDetail02" placeholder="123"></td>
			</tr>
			</c:forEach>
		</table>
				<input class="btn2" type="button" value="이 전" onclick="goBack();">
				<input class="btn1" type="submit" value="결 제" >
	</form>	
</body>
</html>