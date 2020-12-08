
<%@page import="javax.print.DocFlavor.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="UTF-8">

<style type="text/css">
	.banner{
		background-image: url("./images/mainBackground.jpg");
		background-size: 100% 700px;
		width: auto;
		height: 700px;
		text-align: center;
		padding-top:10px;
		
		
	  .faq{
  	padding-bottom: 10px;
  }
  
  .faq ul {
  	text-align: center;
   	 color: Black;
  }
  .faq ul li {
  	text-align: left;
    cursor: default;
  }
   .faq ul li.active {
    background: white;
    color: black;
  }
  span {
    /* color:red; */
  }
  
  #head{
  	font-weight: bold;
  	font-size: 25px;
  	margin-bottom: 20px;
  	margin-left:32%;
  	margin-right: atuo;
  	text-align: left;
  	list-style-type: none;
  
  }
  
  #content{
  	font-size: 20px;
  	color:#4269e1;
  	margin-bottom: 20px;
  	margin-left:35%;
  	margin-right: atuo;
  	text-align: left;
  	list-style-type: none;
  	
  }
		
		
	}
	
</style>

	<title>Main Page</title>
	<link rel="stylesheet" href="./css/date.css">
	<link rel="stylesheet" href="./css/common.css">
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script> 
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	<script src="./js/subMenu.js"></script>
	

	<!-- 연결 확인 후 삭제  --> 
<!-- 	 	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-u
	i.js"></script> -->
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
	
		 /* 검색 시 공란 체크 */  
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
</head>


<body>
<div class=banner>
 	<div id="mainMenuBox">
 	<nav role="navigation">
     	<ul id="mainMenuBoxItem">
             <li class="menuItemHover"><a href="#"><img height="20px" align="middle" src="./images/menuBar.svg"></a>
			     <div id="subMenuBox">
			         <ul id="subMenuItem">
			            <c:choose>
			              <c:when test = "${empty sessionScope.USERID}">
		             	    <li><a href="login.jsp">로그인</a></li>
		             	    <li><a href="SignUp.jsp">회원가입</a></li>
		             	    <li><a href="login.jsp">숙소 호스트 되기</a></li>
			              </c:when>
			              <c:otherwise>
			              	<li><a href="logout.room">로그아웃</a></li>
			              	<li><a href="bookList.room">예약목록</a></li>
			              </c:otherwise>
			            </c:choose>
			         </ul>
			    </div>
			 </li>
     		<c:choose>
      		<c:when test = "${empty sessionScope.USERSTATE}">
              	<li><a href="login.jsp">호스트 되기</a></li>
               </c:when>
      		<c:when test = "${sessionScope.USERSTATE == '호스트'}">
              	<li><a href="hostRoomList.room">호스트 모드 전환</a></li>
              	
              	
            </c:when>
            <c:when test = "${sessionScope.USERSTATE == '회원'}">
              	<li><a href="hostRegisterRoom01.jsp">호스트 되기</a></li>
            </c:when>
            <c:when test = "${sessionScope.USERSTATE == '관리자'}">
              	<li class="menuItemHover"> <a href="AdminCheck.room">관리자 메뉴</a></li>
              		<div id="subMenuBox">
				         <ul id="subMenuItem">
		             	    <li><a href="AdminUserList.room">회원 관리</a></li>
		             	    <li><a href="AdminRoomList.room">숙소 관리</a></li>
		             	    <li><a href="AdminNotifyList.room">공지사항</a></li>
				         </ul>
			    	</div>
            </c:when>
             </c:choose>
         </ul>
         </nav>
     </div>
     
   
	    
	 <!-- 검색창 -->   
	<div class="box">
		<form action="roomSearch.room" method="post" name="search" onsubmit="return searchCheck()">
		<table style="margin-top: 200px; margin-left: auto; margin-right: auto; text-align: center;">
		<colgroup>
			<col width="100px"/>
			<col width="100px"/>
			<col width="30px"/>
			<col width="100px"/>
			<col width="50px"/>
		</colgroup>
		
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
			<td><a href="roomSearchDirect.room?location=부산"><img src="./images/busan.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=부산">부산 <br>차로 5시간 거리</a></td>
			<td><a href="roomSearchDirect.room?location=강원도"><img src="./images/jeonju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=강원">강원<br>차로 3시간 거리</a></td>
			<td><a href="roomSearchDirect.room?location=양양"><img src="./images/yangyang.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=양양">양양군<br>차로 2.5시간 거리</a></td>
			<td><a href="roomSearchDirect.room?location=속초"><img src="./images/cho.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=속초">속초시<br>차로 2.5시간 거리</a></td>
		</tr>
		<tr>
			<td><a href="roomSearchDirect.room?location=대구"><img src="./images/daegu.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=대구">대구<br>차로 4시간 거리</a></td>
			<td><a href="roomSearchDirect.room?location=경상북도"><img src="./images/wanju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=경상북도">경상북도<br>차로 2.5시간 거리</a></td>
			<td><a href="roomSearchDirect.room?location=강릉"><img src="./images/gangneung.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearch.room?location=강릉">강릉시</a><br>차로 3시간 거리</td>
			<td><a href="roomSearchDirect.room?location=경주"><img src="./images/gyeongju.jpg" width="70px" height="70px"></a></td>
			<td></td>
			<td align="left"><a href="roomSearchDirect.room?location=경주">경주시<br>차로 4시간 거리</a></td>
		</tr>
		
		</table>
	</div>
	
	
	
	<div id="notice">
		
		 <h1 style="font-size: 40px; margin-bottom: 20px; margin-top: 200px; text-decoration: underline;" >예약에 대해 자주 묻는 질문 (FAQ)</h1> <br>
	
		 <%@include file="FAQ.jsp"%>  
		<br> <br>
		<%--  <%@include file="FAQ.jsp"%> --%>
<%-- 		<br> <br>
>>>>>>> refs/remotes/origin/master
		<br> <br>
		<br> <br>
		<h1 align="center">공지사항 </h1>
<<<<<<< HEAD
=======
		<table style="margin-top: 100px; margin-left: auto; margin-right: auto; text-align: left;">
	<tr>
		<th>게시판 ID</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>작성자</th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td><input type="text" name="boardId" value="${dto.boardId }" readonly="readonly"></td>
		<td><input type="text" name="boardTitle" value="${dto.boardTitle }" readonly="readonly"></td>
		<td><textarea rows="3" cols="10"  readonly="readonly">${dto.boardContent }</textarea></td>
		<td><input type="text" name="boardInsertDate" value="${dto.boardInsertDate }" readonly="readonly"></td>
		<td><input type="text" name="userId" value="${dto.userInfo_userId }" readonly="readonly"></td>
	</tr>
	</c:forEach>
	</table> --%>

	</div>
	
	<div id="bottom">
		OWNER. 고종찬 & 박경미 &nbsp; TEL. 1500-2020 &nbsp; ADDRESS. 서울 서초구 강남대로 441 <br> 
		Copyright 2020. 고종찬 박경미 All pictures cannot be copied without permission.
	
	</div>
	
	
</body>
</html>