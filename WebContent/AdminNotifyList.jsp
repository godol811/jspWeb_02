<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 10px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	.wrap{
		padding: 50px;
		
	}
	
	.sub_news{
		width: 80%;
		border-top: 2px solid #999;
		/* border-bottom: 1px solid #999;
		color: #666;
		font-size: 12px;
		table-layout: fixed; */
	}
	.sub_news tr{
		border-bottom: 1px solid #999;
	}
	
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 14px;
	}
	
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 1px #999;
		border-bottom: solid 1px #b2b2b2;
		background-color: #f1f1f4;
		color: #333;
		font-weight: bold;
		line-height: 20px;
		vertical-align: top;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .room{
		text-align: left;
		padding-left: 15px;
		font-size: 13px;
		
	}
	.sub_news .room :hover{
		text-decoration: underline;
		
	}
	h1 {
	  text-align: center;
	  margin-top: 40px;
	  margin-bottom: 20px;
	}

	#btn1 {
       margin-left: 85%;
       width: 84px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
       margin-top: 50px;
       margin-bottom: 10px;
	   padding: 10px;
	}

	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}


	#btn {
       margin-left: 85%;
       width: 84px;
       height: 45px;   
       font-size:14px;
       font-weight:700;
       margin-top: 50px;
       margin-bottom: 10px;
	   padding: 10px;
	}
	
	 .btn2{
		margin-left: 10%;
		margin-right:auto;
		width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 30px;
       margin-bottom: 10px;
	   padding: 0px;
	}

</style>



</head>
<body>
<div class ="wrap">
<h1>공지사항 </h1>
	<button id="btn" type="button" onclick="location.href='AdminNotifyInsert.jsp'">글쓰기</button>
	<table class="sub_news">   
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>작성자</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach items="${list}" var="dto"  varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${dto.boardTitle }</td>
		<td><textarea rows="6" cols="20"  readonly="readonly">${dto.boardContent }</textarea></td>
		<td>${dto.boardInsertDate }</td>
		<td>${dto.userInfo_userId }</td>
<%-- 		<td><a href="AdminNotifyModify.room?boardId=${dto.boardId}"> 수정 </a></td>
		<td><a href="AdminNotifyDelete.room?boardId=${dto.boardId}"> 삭제 </a></td> --%>
		<td><input class ="registerBtn"  type="button" onclick="location.href='AdminNotifyModify.room?boardId=${dto.boardId}'" value="수정"></td>
		<td><input class ="registerBtn"  type="button" onclick="location.href='AdminNotifyDelete.room?boardId=${dto.boardId}'" value="삭제"></td>
	</tr>
	</c:forEach>
	</table>
		
		<button class = "btn2" type="button" onclick="location.href='mainPage.jsp' ">돌아가기</button>
	</div>
</body>
</html>


