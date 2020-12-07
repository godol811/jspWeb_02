<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup.css"> 
<title> 암호 찾기</title>

 <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.userId.value)
            {
                alert("ID를 입력하세요");    
                inputForm.userId.focus();
                return false;
            }
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
<form action="FindPwAction.room" method="post" onsubmit="return checkValue()">

<div class="wrap">
ID<br>
<input type="text" id="userId"  name="userId"  style="width:400px;height:40px;font-size:15px;"> <br>
회원이름<br>
<input type="text" id="userName" name="userName" style="width:400px;height:40px;font-size:15px;"><br>
전화번호<br>
<input type="text" id="userTel" name="userTel" style="width:400px;height:40px;font-size:15px;"><br>
<input type="submit" id="input_submit"
	        class="input_field" value="찾기"><br>
<input type="button" id="input_submit"
	        class="input_field" value="돌아가기" onclick="location.href='FindIDPWSELECT.jsp'"><br>
<input type="button" id="input_submit"
	        class="input_field"value="창 닫기" onclick="window.close()"><br>
</div>
</form>


</body>
</html>