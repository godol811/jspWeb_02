<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="./css/signup.css"> 

<%

	request.setCharacterEncoding("utf-8");
%>

<title>회원가입</title>
</head>
<body>
<script type="text/javascript">
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp","pop","width=50,height=50, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadAddrPart1, addrDetail){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
	
}

</script>
<c:set var="fieldCheck" value="${joinfield.fieldCheckmessage}"></c:set>

<form id="form" name="form" action="SignUpCheck.room" method="post">
<div class="wrap">
    <h1>회원가입</h1>
	<table> 
		<!--  아이디 입력창       -->
		<tr>
			<td colspan="3">아이디</td>
		</tr>
		<tr>
			<td colspan="3"><input type="text" name="userId" value="${joinfield.userId}" placeholder="아이디를 입력해주세요." style="width:400px;height:40px;font-size:15px;"></td>
		</tr>
		<tr>
			<td colspan="3">
				<c:if test="${fieldCheck eq '아이디를 입력해 주세요.'||fieldCheck eq '중복된 아이디 입니다.' ||fieldCheck eq '올바른 아이디(이메일)가 아닙니다.'}" ><font size="2" color="red"><c:out value="${fieldCheck }"></c:out></font></c:if>
				<font size="2" color="green">${IDC}</font>
			</td>
		</tr>
		<!--  아이디 입력창       -->
		
		
		<!--  비밀번호 입력창       -->
		<tr>
			<td colspan="3">비밀번호</td>
		</tr>
		<tr>
			<td colspan="3"><input type="password" name="userPw" value="${joinfield.userPw}" placeholder="비밀번호를 입력해주세요." style="width:400px;height:40px;font-size:15px;"></td>
		</tr>
		<tr>
			<td colspan="3"><c:if test="${fieldCheck eq '비밀번호를 입력해 주세요.'}" ><font size="2" color="red"><c:out value="${fieldCheck}"></c:out></font></c:if></td>
		</tr>
		<!--  비밀번호 입력창       -->
			
		<!--  비밀번호 확인창       -->
		<tr>
			<td colspan="3">비밀번호 확인</td>
		</tr>
		<tr>
			<td colspan="3"><input type="password" name="userPwCheck" value="${PWCFIELD}" placeholder="비밀번호 확인을 위해 다시 입력해주세요." style="width:400px;height:40px;font-size:15px;"></td>
		</tr>
		<tr>
			<td colspan="3"><font size="2" color="red">${ PWCMSG}</font>
			<font size="2" color="green">${PWC}</font>
			</td>
		</tr>
		
		<!--  비밀번호 확인창       -->
		
		<!--  이름입력       -->
		
		<tr>
			<td colspan="3">이름</td>
		</tr>
		<tr>
			<td colspan="3"><input type="text" name="userName" value="${joinfield.userName }" placeholder="이름을 입력해주세요." style="width:400px;height:40px;font-size:15px;"></td>
		</tr>
		<tr>
			<td colspan="3"><c:if test="${fieldCheck eq '이름을 입력해 주세요.'}" ><font size="2" color="red"><c:out value="${fieldCheck }"></c:out></font></c:if></td>		
		</tr>
		
		<tr>
			<td>전화번호  <font size="2">( - 포함해서 적어주세요.)</font></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="text" name="userTel" value="${joinfield.userTel}" style="width:400px;height:40px;font-size:15px;" placeholder="010-0000-0000">
			</td>
		</tr>
		<tr>
			<td><font size="2" color="red">${telMsg}</font><font size="2">${telMsgEx }</font></td>
		</tr>
		
		<!-- 전화번호 입력 -->
		
		<!-- 주소 입력 -->
		<tr>
			<td>주소 입력</td>
		</tr>
		<tr>
			<td colspan="2"><input placeholder="도로명 주소" type="text" style="width:400px;height:40px;font-size:15px;" id="roadAddrPart1"  name="userAddress" readonly="readonly"  onClick="goPopup();" value="${joinfield.userAddress}"/>
			</td>
			<td>
			<input type="button" onClick="goPopup();" value="주소 찾기" style="width:70px;height:30px;font-size:14px;"/>
			</td>
		</tr>
		<tr>
			<td>상세 주소</td>
		</tr>
		<tr>
			<td colspan="3"><input placeholder="상세주소" type="text" style="width:400px;height:40px;font-size:15px;" id="addrDetail" value="${joinfield.userAddressDetail }"  name="userAddressDetail" style="width:500px;" /></td>
		</tr>
		<!-- 주소 입력 -->
		<tr>
			<td><input type="button" value="이 전" 
			id="input_submit"
	        class="input_field"
	        onClick="history.go(-1)" style="width:100px; height:30px;">
	        </td>
			<td align="right"><input type="submit" value="완 료" 
			id="input_submit"
	        class="input_field"
	        style="width:100px; height:30px;">
	        </td>
			<td></td>
		</tr>
	</table>
</div>
</form>
</body>
</html>