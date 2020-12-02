package com.room.bbc.command;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.UserDao;
import com.room.bbc.dto.UserJoinDto;

public class JoinCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPw = request.getParameter("userPw");
		String userPwCheck = request.getParameter("userPwCheck");
		String userTel = request.getParameter("userTel");
		String userAddress = request.getParameter("userAddress");
		String idChkMsg="";//사용가능아이디 일때 (((사용가능 메세지))) 계속출력 
		String pwChkMsg="";// 비밀번호가 일치할때 (((비밀번호일치 메세지))) 계속출력
		String pwCheckmessage=""; // 비밀번호가 불일치할때 (((불일치메세지))) 계속출력
		String pwCheckField="";// 비밀번호가 일치할때 (((비밀번호확인 텍스트필드 값 유지 불일치할땐 공백값))) 
		String fieldCheckmessage="";//필드체크메세지
		String ageCheck="";
		String useremail="";// ?
		String emailP= "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		String telP = "^\\d{3}-\\d{3,4}-\\d{4}$";
		String telMsg="";
		String telMsgEx="";
		String joinCheck = "ok";// ok일때 로그인
		UserDao dao = new UserDao();
		

		if(userAddress.length()==0) {
			fieldCheckmessage="주소를 입력해 주세요.";
			joinCheck="1";
		}
		
		if(userName.length()==0) {
			fieldCheckmessage="전화번호를 입력해 주세요.";
			joinCheck="1";	
		}
		
		if(userName.length()==0) {
			fieldCheckmessage="이름을 입력해 주세요.";
			joinCheck="1";		
		}		
		if(userPw.length()==0) {
			fieldCheckmessage="비밀번호를 입력해 주세요.";
			joinCheck="1";			
		}
		if(userPw.length()==0) {
			joinCheck="1";		
		}
		if(userPw.equals(userPwCheck)) {}else {
			pwCheckmessage="비밀번호가 일치하지 않습니다.";
			joinCheck="1";
		}
		
		if(userId.length()==0) {
			fieldCheckmessage="아이디를 입력해 주세요.";
			joinCheck="1";		
		}
		
			if(dao.joinIdCheck(userId)>0) {
					fieldCheckmessage="중복된 아이디 입니다.";
					joinCheck="1";   
				}else if(Pattern.matches(emailP, userId)){
					idChkMsg = "사용가능한 아이디 입니다.";
				
			}else {
				
				fieldCheckmessage="올바른 아이디(이메일)가 아닙니다."; 
				joinCheck="1";	
			}
		
		
		if(userPw.length()>0&&userPw.equals(userPwCheck)) {
			pwChkMsg="비밀번호가 일치합니다.";
			pwCheckField=userPwCheck; // 일치할때만 패스워드텍스트창값 유지
		}
		
		
		if(userTel.length()>0) {
			if(Pattern.matches(telP, userTel)) {}else {
				telMsg="올바른 전화번호가 아닙니다.";
				telMsgEx=" ex)010-1111-2222";
				joinCheck="1";	
			}
		}
		
		
		if(Pattern.matches(emailP, userId)) {}else {fieldCheckmessage="올바른 아이디(이메일)가 아닙니다."; }
		request.setAttribute("PWCMSG", pwCheckmessage);//비밀번호불일치 메세지
		request.setAttribute("PWCFIELD", pwCheckField);//비밀번호확인 값이 일치할경우 비밀번호확인값 유지
		request.setAttribute("PWC", pwChkMsg);//비밀번호일치 메세지
		request.setAttribute("IDC",idChkMsg );//사용가능한아이디 메세지
		request.setAttribute("JOIN", joinCheck);//로그인 성공여부
		request.setAttribute("telMsg", telMsg); //전화번호 정규식
		request.setAttribute("telMsgEx", telMsgEx);// 전화번호 ex
	
		UserJoinDto userDto = new UserJoinDto(userName, userId, userPw, userPwCheck, useremail, userTel, userAddress, fieldCheckmessage);
		request.setAttribute("joinfield", userDto);
		
		
		
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
