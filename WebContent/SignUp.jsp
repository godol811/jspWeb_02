<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="icon" 
      type="image/png" 
      href="/somewhere/myicon.png"/>
<meta charset="utf-8">
<script type="text/javascript" src="/WebContent/js/logincheck.js"></script>
<script type="text/javascript">

window.onload = function(){

	regForm.id.focus();

	document.getElementById("btnId").onclick = checkid();

	document.getElementById("btnZip").onclick = checkzip();

	document.getElementById("btnSubmit").onclick = inputCheck();

}
function emailValidation() 	{    
	var obEmail = document.getElementById("email");
	if (!obEmail.value) {             
		alert("이메일을 입력하세요!");
		obEmail.focus();	
		return;
	}               
	else{          
		if(!CheckEmail(obEmail.value))	{
			alert("이메일 형식이 잘못되었습니다");
			obEmail.focus();
			return;
		}                
	}                      
}  


function CheckEmail(str)
{                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}          
</script>

<title>Insert title here</title>
</head>


<table class="table">

<tr>

	<td align="center" valign="middle" style="background-color: #FFFFCC">

		<form name="regForm" method="post" action="SignUpAction.room">

			<table border="1">

				<tr align="center" style="background-color: #8899aa">

					<td colspan="2"><b style="color: #FFFFFF">회원 가입</b></td>

				</tr>

				<tr>

					<td width="16%">Email</td>

					<td width="57%"><input type="text" name="userId" size="15" onchange="emailValidation()">

						<input type="button" value="ID중복확인" id="btnId"></td>

				</tr>

				<tr>

					<td>패스워드</td>

					<td><input type="password" name="userPw" size="15"></td>

				</tr>

				<tr>

					<td>패스워드 확인</td>

					<td><input type="password" name="userPw2" size="15"></td>

				</tr>

				<tr>

					<td>이름</td>

					<td><input type="text" name="userName" size="15"></td>

				</tr>

				<tr>

					<td>전화번호</td>

					<td><input type="text" name="userTel" size="20"></td>

				</tr>


				<tr>

					<td>주소</td>

					<td><input type="text" name="userAddress" size="60"></td>

				</tr>


				<tr>

					<td colspan="2" align="center">

						<input type="button" value="회원가입" id="btnSubmit">

						&nbsp;&nbsp;&nbsp;&nbsp; 

						<input type="reset" value="다시쓰기">

					</td>

				</tr>

			</table>

		</form>

	</td>

</tr>

</table>




</body>
</html>