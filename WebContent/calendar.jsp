<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST HELLO WORLD</title>
<!-- 	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	
	<link rel="stylesheet" href="date.css">
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	<script type="text/javascript">
	
	// 버튼클릭하여 캘린더 생성
	//<![CDATA[
/* 	$(function(){
		
		$("#date2").datepicker({
			showOn: "button",
	        buttonImage: "./images/calendar.gif",
		    buttonImageOnly: true,
			buttonText: "Select date",
			numberOfMonths:[1,2],
			minDate:0
		});
		
	});
	//]]> */
	
	// 입력란 클릭하여 날짜 선택
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

</head>

<body>
	<div class="box">
		<form action="test1.jsp" method="get">
		<table>
		<tr>
			<td align="center"><h4>체크인</h4></td><td></td><td align="center"><h4>체크아웃</h4></td>
		</tr>
		<tr>
			<td align="center"><input type="text" name="date1" id="date1" placeholder="날짜 추가" readonly="readonly"/></td>
			<td align="center">~</td>
			<td align="center"><input type="text" name="date2" id="date2" placeholder="날짜 추가" readonly="readonly"/> </td>
			<td align="center"><input type="submit" value="검색"></td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>
