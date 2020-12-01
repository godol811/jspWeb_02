<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
input::-webkit-input-placeholder { font-size: 50%; }
input::-moz-placeholder { font-size: 50%; }
input:-ms-input-placeholder { font-size: 50%; }
input:-moz-placeholder { font-size: 50%; }
input::placeholder { font-size: 50%; }

<%
	request.setCharacterEncoding("utf-8");
%>
</style>
<title>Insert title here</title>
</head>
<body>
<c:set var="fieldCheck" value="${joinfield.fieldCheckmessage}"></c:set>

<form action="joincheck.do" method="post">
<center>
	<table >
		<!--  아이디 입력창       -->
		<tr>
			<td colspan="2">아이디</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="userid" value="${joinfield.userid }" placeholder="아이디를 입력해주세요." style="width:400px;height:40px;font-size:18px;"></td>
		</tr>
		<tr>
			<td colspan="2"><c:if test="${fieldCheck eq '아이디를 입력해 주세요.'||fieldCheck eq '중복된 아이디 입니다.'}" ><font size="2" color="red"><c:out value="${fieldCheck }"></c:out></font></c:if></td>
			<td><input type="submit" value="중복확인"></td>
		</tr>
		<!--  아이디 입력창       -->
		
		
		<!--  비밀번호 입력창       -->
		<tr>
			<td colspan="2">비밀번호</td>
		</tr>
		<tr>
			<td colspan="2"><input type="password" name="userpw" value="${joinfield.userpw }" placeholder="비밀번호를 입력해주세요." style="width:400px;height:40px;font-size:18px;"></td>
		</tr>
		<tr>
			<td colspan="2"><c:if test="${fieldCheck eq '비밀번호를 입력해 주세요.'}" ><c:out value="${fieldCheck}"></c:out></c:if></td>
		</tr>
		<!--  비밀번호 입력창       -->
			
		<!--  비밀번호 확인창       -->
		<tr>
			<td colspan="2">비밀번호 확인</td>
		</tr>
		<tr>
			<td colspan="2"><input type="password" name="userpwCheck" value="${joinfield.userpwCheck }" placeholder="비밀번호 확인." style="width:400px;height:40px;font-size:18px;"></td>
		</tr>
		<tr>
			<td colspan="2"><c:if test="${fieldCheck eq '비밀번호가 일치하지 않습니다.'}" ><c:out value="${fieldCheck}"></c:out></c:if></td>
		</tr>
		
		<!--  비밀번호 확인창       -->
		
		<!--  이름입력       -->
		
		<tr>
			<td colspan="2">이름</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="username" value="${joinfield.username }" placeholder="이름을 입력해주세요." style="width:400px;height:40px;font-size:18px;"></td>
		</tr>
		<tr>
			<td colspan="2"><c:if test="${fieldCheck eq '이름을 입력해 주세요.'}" ><c:out value="${fieldCheck }"></c:out></c:if></td>		
		</tr>
		
		<!--  이름입력       -->
		
		<tr>
			<td>성별          나이</td>
		</tr>
		<!--  성별 체크       -->
		<tr>
			<td>
				<select name="usergender">
					<option value="">선택안함</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			
			
			
				<input type="text" name="userage" size="3">
			</td>
		</tr>
		
		
		<!-- 전화번호 입력 -->
		<tr>
			<td>전화번호</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="text" name="usertel" style="width:400px;height:40px;font-size:18px;">
			</td>
		</tr>
		
		<!-- 전화번호 입력 -->
		
		<!-- 주소 입력 -->
		<tr>
			<td>주소 입력</td>
		</tr>
		<tr>	
			<td><input type="text" name="useraddress" style="width:400px;height:40px;font-size:18px;"></td>
		</tr>
		<!-- 주소 입력 -->
		
		<tr>
			<td>생일</td>
		</tr>
		<tr>
			<td><input type="text" name="userbday"></td>
		</tr>
		
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="회원가입 완료"></td>
		</tr>
		
		
		
		
		
		
		
	</table>
</form>
</center>
</body>
</html>