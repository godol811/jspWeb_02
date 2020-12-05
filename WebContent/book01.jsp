<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세정보</title>
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDf8xHbNpqFI-ieqhvn0ZpXDoevDQ91Ua0&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
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
    function reviewWindow(){
        var url="Rating_list.jsp";
        window.open(url,"","width=400,height=400,left=600");
    }
      
    </script>
</head>
	
<body>

<form name="book" action="bookPage2.room?roomId=<%=session.getAttribute("ROOMID") %>" method="post" onsubmit="return check()">
	<table border="1">
		<c:forEach items = "${list }" var = "dto">
		<colgroup>
			<col width="80%">
		</colgroup>
			<tr>
				<td colspan="2">${dto.roomTitle }</td>
			</tr>
			
			<tr>
				<td colspan="2">최대 인원 ${dto.roomCapa }명</td>
			</tr>
			<tr>
				<td colspan="2">${dto.roomContent }</td>
			</tr>
			<tr>
				<td colspan="2">체크인 : ${dto.roomCheckIn }</td>
			</tr>
			<tr>
				<td colspan="2">체크아웃 : ${dto.roomCheckOut }</td>
			</tr>
			
			<tr>
				<td colspan="2"><div id="map-canvas" style="width: 100%; height: 400px"></div></td>
			</tr>
			<tr>
				<td colspan="2"><a href="#">호스트에게 연락하기 </a></td>
			</tr>
			<tr>
				<td colspan="2">숙박 기간을 선택하세요.</td>
			</tr>
			<tr>
				<td>체크인</td><td>체크아웃</td>
			</tr>
			<tr>
			<c:choose>
				<c:when test ="${empty sessionScope.DATE1 }">
				<td align="center"><input type="text" name="date1" id="date1" value="체크인 날짜를 입력하세요" placeholder="" readonly="readonly"/></td>
				<td align="center"><input type="text" name="date2" id="date2" value="체크아웃 날짜를 입력하세요" placeholder="" readonly="readonly"/></td></c:when>
				
				<c:when test ="${not empty sessionScope.DATE1 }" >
				<td align="center"><input type="text" name="date1" id="date1" value="<%=session.getAttribute("DATE1")%>" placeholder="" readonly="readonly"/></td>
				<td align="center"><input type="text" name="date2" id="date2" value="<%=session.getAttribute("DATE2")%>" placeholder="" readonly="readonly"/></td></c:when>
			</c:choose>
			
			</tr>
			</c:forEach>
			
			
			
			
			<tr>
			<!-- -------------------------------- -->
			<!--  수정 해야되는 부분 -->
			<c:choose>
				<c:when test ="${empty sessionScope.DATE1 }">
				<td align="left" colspan="2">게스트<input type="number" name="guest" id="guest" value=""									  placeholder="인원수를 입력하세요" max="${dto.roomCapa} " min="1" step="1"/> 명 </td></c:when>
				<c:when test ="${not empty sessionScope.DATE1 }" >
				<td align="left" colspan="2">게스트<input type="number" name="guest" id="guest" value="<%=session.getAttribute("GUEST") %>" placeholder="인원수를 입력하세요" max="${dto.roomCapa} " min="1" step="1"/> 명 </td></c:when>
			</c:choose>	
			
			
			</tr>
			<tr>
				<c:choose>
					<c:when test="${empty sessionScope.USERID}">
						<td colspan="2"><input type="button" onclick="location.href='login.jsp'" value="예약하기"></td>
					</c:when>
					<c:otherwise>
						<td colspan="2"><input type="submit" value="예약하기"></td>

					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="2">후기</td>
			</tr>
			<c:forEach items="${reviewList}" var="dto2" begin="0" end="4" step="1">
				<tr>
					<td>${dto2.userinfo_Userid}</td><td> ${dto2.reviewDate}</td>
				</tr>
				<tr>
					<td>${dto2.reviewContent}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><input type="button" value="모든 후기 보기" onclick="location.href='Rating_list.room?roomId=${dto2.room_Roomid}'"> </td>
			</tr>
 	</table>
 </form>
</body>
</html>