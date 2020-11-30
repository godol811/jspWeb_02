<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

    <head>
    <meta charset="UTF-8"/>
  	</head>
    
  <body>
    <div id="wrap">
      <br><br>
      <b><font size="6" color="gray">회원가입</font></b>
      <br><br><br>
      
      
      <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
      <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
      <form method="post" action="signUp.room" name="userInfo" 
              onsubmit="return checkValue()">
          <table>
            <tr>
              <td id="title">Email</td>
              <td>
                  <input type="text" name="userId" id="email" maxlength="50" oninput="emailValidation();">
              
              </td>
          </tr>
                      
              <tr>
                  <td id="title">비밀번호</td>
                  <td>
                      <input type="password" name="userPw" id="pw" maxlength="50" onchange="check_pw();"/>
                  </td>
              </tr>
              
              <tr>
                  <td id="title">비밀번호 확인</td>
                  <td>
                      <input type="password" name="userPw2" id="pw2" maxlength="50" onchange="check_pw()"/>&nbsp;&nbsp;<span id="check"></span></td>
              </tr>
              <tr>
                  
			</tr>
              <tr>
                  <td id="title">이름</td>
                  <td>
                      <input type="text" name="userName" maxlength="50">
                  </td>
              </tr>
                  
               <tr>
                  <td id="title">주소</td>
                  <td>
                      <input type="text" size="50" name="userAddress"/>
                  </td>
              </tr>
            <tr>
              <td id="title">전화번호</td>
              <td>
                  <input type="text" name="userTel" maxlength="13">
              </td>
          </tr>
            
          </table>
          <br>
          <input type="submit" value="가입"/>  
          <input type="button" value="취소" onclick="location.href='login.room'" >
      </form>
  </div>



  </body>
  
  <script>


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



    
    function checkValue(){     	
                            



    /* 
      if(!form.id.value){
        alert("아이디를 입력하세요.")
        return false
    }
    if(!form.idDuplication.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.")
        return false
    } */


    if(!form.password.value){
        alert("비밀번호를 입력하세요.")
        return false
    }
    if(form.password.value != form.passwordcheck.value) {
        alert("비밀번호를 동일하게 입력해주세요.")
        return false;
    
    }

    if(!form.name.value){
        alert("이름을 입력하세요.")
        return false;
    }
  }
    function check_pw(){
    	 
        var pw = document.getElementById('pw').value;

        if(pw.length < 6 || pw.length>16){
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pw').value='';
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
    }
    
    
    /*이메일 체크 형식  */
    
    
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
</html>
