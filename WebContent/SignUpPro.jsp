<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="userDao" class="com.room.bbc.dao.UserDao"/>

<% request.setCharacterEncoding("utf-8"); %>

<% String userId = request.getParameter("userId"); %>

<% boolean b = userDao.checkId(userId); %>


<html>

<head >
<script type="text/javascript" src="logincheck.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

<meta charset="UTF-8">

<title>id 중복 검사</title>

</head>

<body>

<b><%=userId %></b>

<%

	if(b){

%>

		는(은) 이미  사용중인 Email 입니다.<p/>

		<a href="#" onclick = "opener.document.regForm.id.focus(); window.close();">닫기</a>

		<!-- opener : window.open으로 현재 창을 호출한 부모 페이지 -->

<%

	} else {

%>

		는(은) 사용 가능 합니다.<p/>

		<a href="#" onclick = "opener.document.regForm.pass.focus(); window.close();">닫기</a>

<%	} %>

</body>

</html>
