<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.room.bbc.dao.UserDao" %>
<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String userId= request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        
        // DB에서 아이디, 비밀번호 확인
        UserDao dao = new UserDao();
        int check = dao.logincheck(userId, userPw);
        String userState = dao.userState(userId);
        
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        
        
        if(userState.equals("회원")){
        
        
		        if(check == 1)    // 로그인 성공
		        { 
		            // 세션에 현재 아이디 세팅
		            session.setAttribute("USERID", userId);
		            session.setAttribute("USERSTATE", userState);
		            msg = "mainPage.room";
		        }
		        else if(check ==-1)  // 아이디가 틀릴경우
		        {
		            msg = "login.jsp?msg=-1";
		        }
		         
		        else if(check == 0) // 비밀번호가 틀릴경우
		        {
		            msg = "login.jsp?msg=0";
		        }
        }
        
        else if(userState.equals("관리자")){
        	
        	
        	 if(check == 1)    // 로그인 성공
		        { 
		            // 세션에 현재 아이디 세팅
        		 session.setAttribute("USERID", userId);
             		msg = "adminCheck.jsp";
		        }
		        else if(check ==-1)  // 아이디가 틀릴경우
		        {
		            msg = "login.jsp?msg=-1";
		        }
		         
		        else if(check == 0) // 비밀번호가 틀릴경우
		        {
		            msg = "login.jsp?msg=0";
		        }
        	
        }
        
        
        else if(userState.equals("호스트")){
        	 // 세션에 현재 아이디 세팅
        	  if(check == 1)    // 로그인 성공
		        { 
		            // 세션에 현재 아이디 세팅
        		  session.setAttribute("USERID", userId);
                  session.setAttribute("USERSTATE", userState);
                  msg = "mainPage.room";
              	}
		        
		        else if(check ==-1)  // 아이디가 틀릴경우
		        {
		            msg = "login.jsp?msg=-1";
		        }
		         
		        else if(check == 0) // 비밀번호가 틀릴경우
		        {
		            msg = "login.jsp?msg=0";
		        }
        }
          

        else if(userState.equals("탈퇴")){
        	msg = "login.jsp?msg=2";
        	
        }
        
        
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
   
        
        %>
