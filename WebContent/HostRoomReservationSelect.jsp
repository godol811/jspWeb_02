<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 현황</title>

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.min.css" />
<script type="text/javascript" src="<c:url value='/js/fullcalendar.min.js'/>"></script>
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
	
	.wrap{
		padding: 50px;
		margin-left: auto;
		margin-right: auto;
		
	}
	
	#btnIndex{
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
		margin-left: 85%;
		
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




</style>
<script type="text/javascript">
	$(function(){
	 calendarEvent();
	});
	function calendarEvent(eventData){
	 $("#calender").html("");
	 var date = new Date();
	 var d = date.getDate();
	 var m = date.getMonth();
	 var y = date.getFullYear();
	 var calendar = $('#calender').fullCalendar({
	  header: {
	   left: "",
	   center: "title",
	//    right: "month,basicWeek,basicDay"
	   right: "today prev,next"
	   },
	   editable: true,
	   titleFormat: {
	   month: "yyyy년 MMMM",
	   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
	   day: "yyyy년 MMM d일 dddd"
	   },
	   allDayDefault: false,
	   defaultView: "month",
	   editable: false,
	   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	   dayNamesShort: ["일","월","화","수","목","금","토"],
	   buttonText: {
	   today : "오늘",
	   month : "월별",
	   week : "주별",
	   day : "일별",
	   },
	   events : eventData,
	   timeFormat : "HH:mm",
	 });
</script>

</head>
<body>
	<!--  수정 필요 -->
<div class="wrap">
	<form action="hostRoomReservation.room?roomId=<%=request.getParameter("roomId") %>" method="post">
	<table class="search">
			<tr >
				<td><select name="search">
					<option value="bookcheckindate" selected="selected">월</option>
					<option value="userinfo_userid">예약자</option>
				</select></td>
				<td><input type="text" name="reservationSearch"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	<table class="sub_news">
			<tr class="one">
				<th >예약 기간</th><th>예약자</th><th>예약인원</th><th>예약 결제 금액</th>
			</tr>
			<c:forEach items="${hostRoomReservationList }" var = "dto" >
			<tr>
				<td>${dto.bookCheckInDate } ~ ${dto.bookCheckOutDate }</td>
				<td>${dto.userId } </td>
				<td>${dto.bookCapa } </td>
				<td>${dto.roomPriceTotal }</td>
			</tr>
		
			</c:forEach>
	</table>
			<input id="btnIndex" type="button" value="목록보기" onClick="history.go(-1)" style="align-items: right">
	</form>
	
</div>
</body>
</html>