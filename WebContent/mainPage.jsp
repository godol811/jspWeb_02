<%@page import="javax.print.DocFlavor.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Main Page</title>
	<link rel="stylesheet" href="./css/date.css">
	<link rel="stylesheet" href="./css/common.css">
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	
	<script src="js/subMenu.js"></script>

	<!-- 연결 확인 후 삭제  --> 
<!-- 	 	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script type="text/javascript">

	// 입력란 클릭하여 날짜 선택
	//<![CDATA[
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
	
	//]]> */
	</script>

</head>



<body>
<!-- 
	<div class="guestSelect">
	   	    <label for="spinner">인원 </label>
 			 <input type="text" id="spinner" max="16" min="1" step="1" name="guest"><br>
 			 <h6>만 13세 이상</h6>
	   	    <label for="spinnerChild">어린이 </label>
 			 <input type="text" id="spinnerChild" max="5" min="0" step="1" name="child">
 			 <h6>12세 이하</h6>
	</div>
	 -->
	
	<div id="wrap">
 		<div id="header">
        	<div id="mainMenuBox">
            	<ul id="menuItem">
                    <li><a href="hostRegisterRoom01.jsp">호스트되기</a></li>
                    <li class="menuItemHover"><a href="#"><img src="./images/menuBar.svg"></a></li>
                </ul>
            </div>
            <div id="subMenuBox">
                <div class="subMenuItem" id="subMenuItem1">
                	<ul>
                    	<li><a href="#">메세지</a></li>
                    	<li><a href="#">저장목록</a></li>
                   	 <c:choose>
	                    <c:when test = "${empty sessionScope.USERID}">
	                   	    <li><a href="login.jsp">로그인</a></li>
	                   	    <li><a href="userSignUp.room">회원가입</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li><a href="#">로그아웃</a></li>
	                    </c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </div>
	   
	   
	 <!-- 검색 시 공란 체크 -->  
	<script type="text/javascript">
	function searchCheck(){
		theForm = document.search;
		
		if(theForm.location.value.trim().length==0){
			alert("지역을 입력해주세요.");
			theForm.location.focus();
			return false;
			
		}
		if(theForm.date1.value.trim().length==0){
			alert("체크인 날짜를 선택해주세요.");
			theForm.date1.focus();
			return false;
		}
		if(theForm.date2.value.trim().length==0){
			alert("체크아웃 날짜를 선택해주세요.");
			theForm.date2.focus();
			return false;
		}
		
		if(theForm.guest.value.trim().length==0){
			alert("인원을 입력해주세요.");
			theForm.guest.focus();
			return false;
		}
		
	}
	</script>   
	    
	 <!-- 검색창 -->   
	<div class="box">
		<form action="test1.jsp" method="post" name="search" onsubmit="return searchCheck()">
		<table style="margin-top: 100px; margin-left: auto; margin-right: auto; text-align: center;">
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
			<td align="center"><input type="number" name="guest" id="guest" max="16" min="1" step="1" placeholder="게스트 추가" /> </td>
			<td align="center"><input type="submit" value="검색"></td>
		</tr>
		</table>
		</form>
	</div>
	
	
	
	<!-- ---------------페이지 구분------------------- -->
	<!-- 지역 추천 -->
	<div class="hrefLocation">
		<table style="margin-top: 100px; margin-left: auto; margin-right: auto; text-align: left;">
		
		<colgroup>
			<col width="70px"/>
			<col width="20px"/>
			<col width="150px" />
			<col width="70px" />
			<col width="20px"/>
			<col width="150px"/>
			<col width="70px" />
			<col width="20px"/>
			<col width="150px" />
			<col width="70px" />
			<col width="20px"/>
			<col width="150px"/>
		</colgroup>
		
		<tr>
			<td><a href="login.jsp?location=%ed%95%9c%ea%b8%80%0d%0a"><img src="./images/busan.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=%ed%95%9c%ea%b8%80%0d%0a">부산 <br>차로 5시간 거리</a></td>
			<td><a href="login.jsp?location=전주"><img src="./images/jeonju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=전주">전주시<br>차로 3시간 거리</a></td>
			<td><a href="login.jsp?location=양양"><img src="./images/yangyang.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=양양">양양군<br>차로 2.5시간 거리</a></td>
			<td><a href="login.jsp?location=속초"><img src="./images/cho.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=속초">속초시<br>차로 2.5시간 거리</a></td>
		</tr>
		<tr>
			<td><a href="login.jsp?location=대구"><img src="./images/daegu.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=대구">대구<br>차로 4시간 거리</a></td>
			<td><a href="login.jsp?location=완주"><img src="./images/wanju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=완주">완주군<br>차로 2.5시간 거리</a></td>
			<td><a href="login.jsp?location=강릉"><img src="./images/gangneung.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=강릉">강릉시</a><br>차로 3시간 거리</td>
			<td><a href="login.jsp?location=경주"><img src="./images/gyeongju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="login.jsp?location=경주">경주시<br>차로 4시간 거리</a></td>
		</tr>
		
		</table>
	</div>
	
	</div>
</body>
</html>