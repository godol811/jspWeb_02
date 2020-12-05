<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6b0e5912a916d84d9376f42ee803fb4."></script>
</head>
<body>		



<!-- ------------------------------- -->

	
		<table border="1">
			<c:forEach items = "${list }" var = "dto" begin="${beginNum}" end="${endNum }">
			<script>
			
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(${list.roomGpsx}, ${list.roomGpsy}),
						level: 3
					};
			
					var map = new kakao.maps.Map(container, options);
			</script>		
	
		
		
		 -->
		<colgroup>
			<col width="60%">
		</colgroup>
			<tr>
			<td rowspan="6"><img width="120px" height="120px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td><td colspan="2"><a href="bookPage.room?roomId=${dto.roomId }">${dto.roomTitle }</a></td>
			
			</tr>
			<tr>
			<td colspan="2">최대 인원 ${dto.roomCapa }명</td>
			</tr>
			<tr>
			<td colspan="2">체크인 : ${DATE1} </td>
			</tr>
			<tr>
			<td colspan="2">체크아웃 : ${DATE2} </td>
			</tr>
			<tr>
			<td colspan="2">${dto.roomContent }</td>
			</tr>
			<tr>
			<td colspan="2" align="right">가격 : ${dto.roomPrice } <br></td>
			</tr>
			<tr>
			<td id="map" style="width:500px;height:400px;"></td>
			
			</tr>
			</c:forEach>
			
			
			
			<tr>
			<td colspan="7" width="50" align="center" >
			<c:forEach  begin="1" end="${totalPage}" varStatus="status"> 
			
			<c:choose>
				<c:when test ="${empty sessionScope.DATE1 }">
				<a href="roomSearchPagingDirect.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>">[${status.count}]</a></c:when>
				<c:when test ="${not empty sessionScope.DATE1 }" >
				<a href="roomSearchPaging.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>&guest=<%=session.getAttribute("GUEST")%>">[${status.count}]</a></c:when>
			</c:choose>
			
				
			</c:forEach></td>
			
			</tr>
			</table>

			
			
		<script>
			 
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
      
    function check(){
    	theForm = document.book;
		
		if(theForm.date1.value.trim()==0){
			alert("체크인 날짜를 선택해주세요.");
			return false;
			
		} else if(theForm.date2.value.trim()==0){
			alert("체크아웃 날짜를 선택해주세요.");
			return false;
		} 
    } 
      
      
    </script>



</body>
</html>