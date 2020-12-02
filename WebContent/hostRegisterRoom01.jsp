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
		/* 미입력 항목 체크 */
		function registerCheck(){
			
			theForm = document.form;
			
			if(theForm.roadAddrPart1.value.trim()==0){
				alert("도로명 주소를 입력해주세요.");
				theForm.roadAddrPart1.focus();
				return false;
				
			} else if(theForm.roomPrice.value.trim()==0){
				alert("요금을 입력해주세요.");
				theForm.roomPrice.focus();
				return false;
			} 
			
		}
	
		function goPopup(){
	    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    	var pop = window.open("jusoPopup.jsp","pop","width=50,height=50, scrollbars=yes, resizable=yes"); 
	    	
	    	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	    }

	    function jusoCallBack(roadAddrPart1, addrDetail){
	    	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	    	document.form.roadAddrPart1.value = roadAddrPart1;
	    	document.form.addrDetail.value = addrDetail;
	    	
	    }
		
</script>


<body>
	<h2>숙소 등록 시작하기</h2>

		<h5>1단계</h5> <br>
	
		<h3>1. 숙박 가능 인원을 선택하세요</h3>
	<form id="form" name="form" action="hostRegisterRoom02.jsp" method="post" onsubmit="return registerCheck()">	
		<div class="combo">
			<select name="roomCapa">
				<option value="1">최대 1명 숙박 가능</option>
				<option value="2" selected="selected">최대 2명 숙박 가능</option>
				<option value="3">최대 3명 숙박 가능</option>
				<option value="4">최대 4명 숙박 가능</option>
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
				<td>도로명 주소</td>
			</tr>
			<tr>
				<td><input placeholder="도로명 주소" type="text"  style="width:500px;" id="roadAddrPart1"  name="address" readonly="readonly" onClick="goPopup();" />
				&nbsp;
				<input type="button" onClick="goPopup();" value="주소 찾기"/>
				</td>
			</tr>
			<tr>
				<td>상세 주소</td>
			</tr>
			<tr>
				<td><input placeholder="고객입력 상세주소" type="text"  style="width:500px;" id="addrDetail"  name="addressDetail" /></td>
			</tr>
		
		</table>
		</p>
		
		
		<h3>4. 숙소 요금을 알려주세요.</h3> <br>
		<input type="text" name="roomPrice" id="roomPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="text-align: right;padding-right: 10px">원 
		
		<input type="submit" value="다음">
	</form>
	
</body>

</html>