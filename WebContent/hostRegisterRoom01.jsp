<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE
 html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type = "text/css">
.ui-timepicker { font-size:9pt !important}
</style>

<script type="text/javascript">
		$(function() {
		    $("#checkinTime").timepicker({
		        timeFormat: 'H:mm',
		        interval: 60,
		        minTime: '01:00',
		        maxTime: '23:00',
		        defaultTime: '14',
		        startTime: '01:00',
		        dynamic: false,
		        dropdown: true,
		        scrollbar: true        
		    });
		    
		    $("#checkoutTime").timepicker({
		        timeFormat: 'H:mm',
		        interval: 60,
		        minTime: '01:00',
		        maxTime: '23:00',
		        defaultTime: '11',
		        startTime: '01:00',
		        dynamic: false,
		        dropdown: true,
		        scrollbar: true        
		    });
		    
		    $("#roomPrice").on('focus', function(){
		    	var val = $("#roomPrice").val();
		    	if(!isEmpty(val)){
		    		val = val.replace(/,/g,'');
		    		$("#roomPrice").val(val);
		   	 	}
		    });
		    
		    $("#roomPrice").on('blur', function(){
		    	var val = $("#roomPrice").val();
		    	if(!isEmpty(val) && isNumeric(val)){
		    		val = currencyFormatter(val);
		    		$("#roomPrice").val(val);
		   	 	}
		    });
		    
		    
		});
		
</script>


<body>
	<h2>숙소 등록 시작하기</h2>

		<h5>1단계</h5> <br>
	
		<h3>1. 등록하시려는 숙소의 유형을 선택하세요</h3>
	<form action="hostRegisterRoom02.jsp
	" method="post">	
		<div class="combo">
			<select name="roomType">
				<option value="allRoom" selected="selected">집 전체 </option>
				<option value="personalRoom">개인실</option>
				<option value="groupRoom">다인실</option>
			</select> 
			
			<select name="roomCapa">
				<option value="1">최대 1명 숙박 가능</option>
				<option value="2">최대 2명 숙박 가능</option>
				<option value="3">최대 3명 숙박 가능</option>
				<option value="4" selected="selected">최대 4명 숙박 가능</option>
				<option value="5">최대 5명 숙박 가능</option>
				<option value="6">최대 6명 숙박 가능</option>
				<option value="7">최대 7명 숙박 가능</option>
				<option value="8">최대 8명 숙박 가능</option>
				<option value="9">최대 9명 숙박 가능</option>
				<option value="10">최대 10명 숙박 가능</option>
				<option value="11">최대 11명 숙박 가능</option>
				<option value="12">최대 12명 숙박 가능</option>
				<option value="13">최대 13명 숙박 가능</option>
				<option value="14">최대 14명 숙박 가능</option>
				<option value="15">최대 15명 숙박 가능</option>
				<option value="16">최대 16명 숙박 가능</option>
			</select> <br><br>
	
	<p>	
		<h3>2. 이용시간을 선택하세요.</h3>
		<table>
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td><input type="text" id="checkinTime" name="checkinTime" class="form-control" style="width:100px; font-size: 10px;"></td>
				<td><input type="text" id="checkoutTime" name="checkoutTime" class="form-control" style="width:100px; font-size: 10px;"></td>
			</tr>
		</table>
	</p>
	
			
		</div>
		<p>
		 <h3>3. 숙소 위치를 알려주세요.</h3> <br>
		<table>
			<tr>
				<td>시</td>
				<td>구</td>
			</tr>
			<tr>
				<td><input type="text" name="addressCity" width="60"
				></td>
				<td><input type="text" name="addressPart" width="60"></td>
			</tr>
			<tr>
				<td>도로명</td>
			</tr>
			<tr>
				<td colspan="2"><a href="login.jsp"><input type="text" name="address" width="100"></a></td>
			</tr>
			<tr>
				<td>동호수(선택사항)</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="addressDetail" width="100"></td>
			</tr>
		
		</table>
		</p>
		
		<script>
		
		function checkNum(){
			val keyVal = window.event.keyCode;
			
			if(((keyVal>=48) && (keyVal <= 57))){
				return true;
			}
			else{
				alert("숫자만 입력가능합니다.");
				return false;
			}
		}
		</script>
		
		
		<h3>4. 숙소 요금을 알려주세요.</h3> <br>
		<input type="text" name="roomPrice" id="roomPrice" onkeypress="return checkNum()" style="text-align: :right;padding-right: 10px">원 
		
		<input type="submit" value="다음">
	</form>
	
</body>

</html>