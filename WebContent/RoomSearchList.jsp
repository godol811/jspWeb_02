<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- ------------------------------- -->

	
		<table border="1">
			<c:forEach items = "${list }" var = "dto" begin="${beginNum}" end="${endNum }">
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
			</c:forEach>
			<tr>
			<td colspan="7" width="50" align="center" >
			<c:forEach  begin="1" end="${totalPage}" varStatus="status"> 	
			<a href="roomSearchPaging.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>&guest=<%=session.getAttribute("GUEST")%>">[${status.count}]</a>
			</c:forEach></td>
			
			</tr>
			</table>
			
			
			
			
			  <script>

    function initialize() {
        var mapLocation = new google.maps.LatLng('36.322473', '127.412501'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('36.322473', '127.412501'); // 마커가 위치할 위도와 경도
         
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: '근처' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "이 근처에 위치하고 있습니다."; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
      
      
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