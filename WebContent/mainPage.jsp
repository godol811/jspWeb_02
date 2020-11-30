<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
<!-- 	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	
	<link rel="stylesheet" href="date.css">
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
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
	<style>
	#nav { font-family:'arial'; margin-right: auto;}
	#nav ul{ width:50%; margin:0; padding:0; }
	#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:20px;}
	#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:100px; text-indent:30px; color:#000; font-weight:bold; text-decoration:none; }
	#nav ul.menu li a:hover{ background:#eee; }
	#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:#ccc; }
	#nav ul.menu li .sub a:hover{ background:#444; color:#fff; }
	</style>
</head>

<script>
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			/* $("ul",this).slideToggle("fast"); */
			$("ul",this).slideDown();
			$("ul",this).slideUp();
		});
	});
</script>


<body>
	<div id="nav">
		<ul class="menu">
			<li><a href="#"><img src="./images/menuBar.svg"></a>
				<ul class="sub">
					<li><a href="#">메시지</a></li>
					<li><a href="#">저장목록</a></li>
				</ul>
			</li>
		</ul>
	</div>



	<div class="box">
		<form action="test1.jsp" method="get">
		<table style="margin-top: 100px; margin-left: auto; margin-right: auto;">
		<tr>
			<td align="center"><h4>위치</h4></td>
			<td align="center"><h4>체크인</h4></td>
			<td></td>
			<td align="center"><h4>체크아웃</h4></td>
			<td align="center"><h4>인원</h4></td>
		</tr>
		<tr>
			<td align="center"><input type="text" name="location" id="location" placeholder="어디로 여행가세요?"/></td>
			<td align="center"><input type="text" name="date1" id="date1" placeholder="날짜 추가" readonly="readonly"/></td>
			<td align="center">~</td>
			<td align="center"><input type="text" name="date2" id="date2" placeholder="날짜 추가" readonly="readonly"/> </td>
			<td align="center"><input type="text" name="guest" id="guest" placeholder="게스트 추가" readonly="readonly"/> </td>
			<td align="center"><input type="submit" value="검색"></td>
		</tr>
		</table>
		</form>
	</div>
</body>
</html>