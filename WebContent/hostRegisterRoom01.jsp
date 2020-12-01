<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숙소 등록 시작하기</h2>
	
	

		<h5>1단계</h5> <br>
		<h3>등록하시려는 숙소의 유형을 선택하세요</h3>
	
	<form action="hostRegisterRoom02.jsp" method="post">	
		<div class="combo">
			<select name="roomType">
				<option value="allRoom" selected="selected">집 전체 
						 <!-- <h5> 게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다.<br>
							게스트 전용 출입구가 있고 공용 공간이 없습니다.<br>
							일반적으로 침실, 욕실, 부엌이 포함됩니다.
						</h5> -->
				</option>
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
			
			
			<select name="roomLocation">
				<option value="seoul" selected="selected">서울</option>
				<option value="daejeon">대전</option>
				<option value="busan">부산</option>
				<option value="ulsan">울산</option>
				<option value="daegu">대구</option>
				<option value="gyeonggi">경기</option>
				<option value="gangwon">강원</option>
				<option value="incheon">인천</option>
				<option value="chungcheong">충청</option>
				<option value="jeolla">전라</option>
				<option value="gwangju">광주</option>
				<option value="jeju">제주</option>
			</select> <br><br>
			
		</div>
		<input type="submit" value="계속">
	</form>
	
</body>
</html>