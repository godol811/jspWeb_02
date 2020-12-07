<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
    %>
    <title>로그인 화면</title>
    
    <!-- css 파일 분리 -->
 
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
 	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
 	crossorigin="anonymous"/>
	
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400" rel="stylesheet"/>
	<link rel="stylesheet" href="./css/login.css"> 
	
</head>

<body>

	    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    

    </script>

	<div id="form_wrapper">
	    <div id="form_left">
	      <img src="./images/login.png" alt="computer icon" />
	    </div>
	    
	    <div id="form_right">
	     <form name="loginInfo" method="post" action="loginPro.jsp" onsubmit="return checkValue()">
	      <h1>Login</h1>
	      <div class="input_container">
	        <i class="fas fa-envelope"></i>
	       
	        <input
	          placeholder="Email"
	          type="email"
	          name="userId"
	          id ="id"
	          class="input_field"
	          maxlength="50"
	        />
	      </div>
	      
	      <div class="input_container">
	        <i class="fas fa-lock"></i>
	        <input
	          placeholder="Password"
	          type="password"
	          name="userPw"
	          id="password"
	          class="input_field"
	          maxlength="50"
	        />
	      </div>
	      
	      <input
	        type="submit"
	        value="로그인"
	        id="input_submit"
	        class="input_field"
	      />
	      </form>
	      <span>Forgot <a style="font-size: 20px;" onclick="window.open('FindIDPWSELECT.jsp','','width=500, height=500,status=no,toolbar=no,scrollbars=no')"> Email / Password </a></span>
	      <span id="create_account">
	        <a href="SignUp.jsp">회원가입 ➡ </a>
	      </span>
	    </div>
	    
  </div>




    <!-- <div id="wrap">
        <form name="loginInfo" method="post" action="loginPro.jsp" 
                onsubmit="return checkValue()">
        
     
            <br><br>
            
            <table>
                <tr>
                    <td bgcolor="skyblue">아이디</td>
                    <td><input type="text" name="userId" id ="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">비밀번호</td>
                    <td><input type="password" name="userPw" id="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="로그인"/>
            <input type="button" value="회원가입" onclick="location.href='SignUp.jsp'">
            <input type="button" value="아이디찾기" onclick="location.href='FindID.jsp'">
        </form>
         -->
        <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='purple' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='green' size='5'>아이디를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("2"))
            {    
                out.println("<br>");
                out.println("<font color='blue' size='5'>이미 탈퇴된 회원입니다. 다시 가입 해주세요</font>");
            }
        %>    
    </div>    
</body>
</html>
<!-- <html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="95758107387-ml9r8m21qfm1crf1arfbkql9kr9pm75e.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  </head>
  <body>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
>>>>>>> branch 'master' of https://github.com/godol811/jspWeb_02.git

<<<<<<< HEAD

=======
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
  </body>
</html>
 -->
