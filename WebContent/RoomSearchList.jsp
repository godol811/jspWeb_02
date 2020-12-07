<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 검색</title>
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
	  text-align: center;
	  margin-bottom: 20px;
	}
		
	.wrap{
		padding: 50px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
	
	}
	.sub_news tr{
		/* border-bottom: 1px solid #999; */
	}
	.sub_news #trtr{
		border-bottom: 1px solid #999;
	
	}
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 14px;
	}
	
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 2px #999;
		border-bottom: solid 2px #b2b2b2;
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
		text-align: left;
	}
	
	.sub_news .one{
		border-top: 2px solid #999;
	}
	.sub_news .bot{
		border-bottom: 2px solid #999;
	}
	
	.sub_news .page{
		border-bottom: 0;
		border-top: 2px solid #999;
	}
	
	.sub_news .page a{
		font-size: 18px;
		padding-right: 10px;
	
	}
	
	#btn {
       margin-left: 85%;
       width: 84px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
       margin-top: 100px;
       margin-bottom: 10px;
	   padding: 10px;
	}

</style>

</head>
<body>

<!-- ------------------------------- -->
<div class ="wrap">
		<table class="sub_news">
			<tr>
				<th colspan="2">숙소</th><th>가격</th>
			</tr>
			<c:forEach items = "${list }" var = "dto" begin="${beginNum}" end="${endNum }">
			<colgroup>
				<col width="200px">
				<col width="500px">
				<col width="100px">
			</colgroup>
			<tr>
				<td rowspan="4" id="trtr"><img width="150px" height="150px" src="${pageContext.request.contextPath}/upload/${dto.roomImage}"></td>
				<td class="tdtd"><a href="bookPage.room?roomId=${dto.roomId }">${dto.roomTitle }</a></td>
				<td rowspan="4"id="trtr"> ${dto.roomPrice } / 박 </td>
			</tr>
			<tr>
				<td class="tdtd">${dto.roomContent }</td>
			</tr>
			<tr>
				<td class="tdtd">최대 인원 ${dto.roomCapa }명</td>
			</tr>
			<%-- <tr>
				<td colspan="2">체크인 : ${DATE1} </td>
			</tr> 
			<tr>
				<td colspan="2">체크아웃 : ${DATE2} </td>
			</tr> --%>
			<tr>
				<td class="tdtd" id="trtr">평점  ${dto.roomReviewRate} 점</td>
			</tr>
			</c:forEach>
			<tr class="page">
				<td colspan="3" width="50" align="center" >
				<c:forEach  begin="1" end="${totalPage}" varStatus="status"> 
					<c:choose>
						<c:when test ="${empty sessionScope.DATE1 }">
						<a href="roomSearchPagingDirect.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>">[${status.count}]</a></c:when>
						<c:when test ="${not empty sessionScope.DATE1 }" >
						<a href="roomSearchPaging.room?page=${status.count}&location=<%=session.getAttribute("LOCATION")%>&guest=<%=session.getAttribute("GUEST")%>">[${status.count}]</a></c:when>
					</c:choose>
				</c:forEach>
				</td>
			</tr>
	  </table>
</div>
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