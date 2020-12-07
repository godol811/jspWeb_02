<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup.css"> 
<title> 아이디 찾기</title>

 <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.userName.value)
            {
                alert("이름을 입력하세요");    
                inputForm.userName.focus();
                return false;
            }
            if(!inputForm.userTel.value)
            {
                alert("전화번호를 입력하세요");    
                inputForm.userTel.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<h1>Email을 찾기위해 이름과 전화번호를 입력해주세요</h1>
<form action="findIdAction.room" method="post" onsubmit="return checkValue()">

<div class="wrap">
<table>
<tr>
<th colspan="2">이름</th>
<td></td>
</tr>
<tr>
<td colspan="2"><input type="text" id="userName"  name="userName"  style="width:400px;height:40px;font-size:15px;"></td>
<td></td>
</tr>
<tr>
<th colspan="2">전화번호</th>
<td></td>
</tr>
<tr>
<td colspan="2"><input type="text" id="userTel" name="userTel" style="width:400px;height:40px;font-size:15px;"></td>
<td></td>
</tr>
<tr>
<td><input type="submit" id="input_submit"
	        class="input_field" value="찾기"></td>
<td><input type="button" id="input_submit"
	        class="input_field" value="돌아가기" onclick="location.href='login.jsp'"></td>
</tr>
</table>
</div>
</form>


</body>
</html>