<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<h1>아이디를 찾기위해 이름과 전화번호를 입력해주세요</h1>
<form action="findIdAction.room" method="post" onsubmit="return checkValue()">

<table>
<tr>
<th>이름</th>
<td></td>
</tr>
<tr>
<td><input type="text" id="userName"  name="userName"></td>
<td></td>
</tr>
<tr>
<th>전화번호</th>
<td></td>
</tr>
<tr>
<td><input type="text" id="userTel" name="userTel"></td>
<td></td>
</tr>
<tr>
<td><input type="submit" value="찾기"></td>
<td><input type="button" value="돌아가기" onclick="location.href='login.jsp'"></td>
</tr>
</table>
</form>


</body>
</html>