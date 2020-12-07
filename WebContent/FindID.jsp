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
<form action="FindIdAction.room" method="post" onsubmit="return checkValue()">

<div class="wrap">
  회원이름<br>
<input type="text" id="userName"  name="userName"  style="width:400px;height:40px;font-size:15px;"><br>
  전화번호<br>
<input type="text" id="userTel" name="userTel" style="width:400px;height:40px;font-size:15px;"><br>
<input type="submit" id="input_submit"
	        class="input_field" value="찾기"><br>
<input type="button" id="input_submit"
	        class="input_field" value="돌아가기" onclick="location.href='FindIDPWSELECT.jsp'"><br>
</div>
</form>


</body>
</html>