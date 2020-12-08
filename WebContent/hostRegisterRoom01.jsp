<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
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

.head_table th td{
	text-align: center;
}

h3 {
	margin-top: 30px;
   margin-bottom: 10px;
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
		margin-left: 25%;
		width: 80px;
		
	} 

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
<div class="head">
	<table class="head_table">
		<tr>
			<th style="font-size: 40px; font-weight: bold; ">숙소 등록 시작하기</th>
		</tr>
		<tr>
			<td style="font-weight: bold; text-align: left; font-size: 30px; color: gray;">1단계</td><td></td>
		</tr>	
	</table>
</div>
<div class="all">	
		<h3>1. 숙박 가능 인원을 선택하세요</h3>
	<form id="form" name="form" action="hostRegisterRoom02.jsp?roomTitle=${roomView.roomTitle }&roomContent=${roomView.roomContent }&roomImage=${roomView.roomImage }&roomImageReal=${roomView.roomImageReal }" method="post" onsubmit="return registerCheck()">	
		<div class="combo">
			<select name="roomCapa" >
				<option value="1" <c:if test="${roomView.roomCapa == 1}">selected</c:if>>최대 1명 숙박 가능</option>
				<option value="2" <c:if test="${roomView.roomCapa == 2}">selected</c:if>>최대 2명 숙박 가능</option>
				<option value="3" <c:if test="${roomView.roomCapa == 3}">selected</c:if>>최대 3명 숙박 가능</option>
				<option value="4" <c:if test="${roomView.roomCapa == 4}">selected</c:if>>최대 4명 숙박 가능</option>
				<option value="5" <c:if test="${roomView.roomCapa == 5}">selected</c:if>>최대 5명 숙박 가능</option>
				<option value="6" <c:if test="${roomView.roomCapa == 6}">selected</c:if>>최대 6명 숙박 가능</option>
				<option value="7" <c:if test="${roomView.roomCapa == 7}">selected</c:if>>최대 7명 숙박 가능</option>
				<option value="8" <c:if test="${roomView.roomCapa == 8}">selected</c:if>>최대 8명 숙박 가능</option>
				<option value="9" <c:if test="${roomView.roomCapa == 9}">selected</c:if>>최대 9명 숙박 가능</option>
				<option value="10" <c:if test="${roomView.roomCapa == 10}">selected</c:if>>최대 10명 숙박 가능</option>
				<option value="11" <c:if test="${roomView.roomCapa == 11}">selected</c:if>>최대 11명 숙박 가능</option>
				<option value="12" <c:if test="${roomView.roomCapa == 12}">selected</c:if>>최대 12명 숙박 가능</option>
				<option value="13" <c:if test="${roomView.roomCapa == 13}">selected</c:if>>최대 13명 숙박 가능</option>
				<option value="14" <c:if test="${roomView.roomCapa == 14}">selected</c:if>>최대 14명 숙박 가능</option>
				<option value="15" <c:if test="${roomView.roomCapa == 15}">selected</c:if>>최대 15명 숙박 가능</option>
				<option value="16" <c:if test="${roomView.roomCapa == 16}">selected</c:if>>최대 16명 숙박 가능</option>
			</select> <br><br>
	
		<h3>2. 이용시간을 선택하세요.</h3>
		<table>
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td><input type="text" id="checkinTime" name="checkinTime" class="form-control" value="${roomView.roomCheckIn }" style="width:100px; font-size: 10px;"></td>
				<td><input type="text" id="checkoutTime" name="checkoutTime" class="form-control" value="${roomView.roomCheckOut }"  style="width:100px; font-size: 10px;"></td>
			</tr>
		</table>
			
		</div>

		 <h3>3. 숙소 위치를 알려주세요.</h3> <br>
		<table>
			<tr>
				<td>도로명 주소</td>
			</tr>
			<tr>
				<td><input placeholder="도로명 주소" type="text"  style="width:500px;" id="roadAddrPart1"  name="address" readonly="readonly" onClick="goPopup();" value="${roomView.roomAddress}"/>
				&nbsp;
				<input type="button" onClick="goPopup();" value="주소 찾기"/>
				</td>
			</tr>
			<tr>
				<td>상세 주소</td>
			</tr>
			<tr>
				<td><input placeholder="상세주소" type="text"  style="width:500px;" id="addrDetail"  name="addressDetail" value="${roomView.roomAddressDetail }"/></td>
			</tr>
		
		</table>
	
		
		
		<h3>4. 숙소 요금을 알려주세요.</h3> <br>
		<input type="text" name="roomPrice" id="roomPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="text-align: right;padding-right: 10px" value="${roomView.roomPrice }">원  <br>
		
		<input id="btnIndex" onClick="history.go(-1)" type="button" value="뒤로가기"><input id="btnIndex1" type="submit" value="다음">
	</form>
</div>	
</body>

</html>