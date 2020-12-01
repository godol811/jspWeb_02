/**
 * 
 */


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

	function goFirstForm() {
			location.href="MainForm.do";
		}	
		
		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
	
	