<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" 
          content="width=device-width, height=device-height, 
                     minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    <title>Insert title here</title>
    <style>
    body {
        width: 100%;
        /* height: 630px; */

    }
    div.left {
        width: 25%;
        float: left;
       /*  height : 100%;   */    
        background: lightgray;
    }
    div.right {
        width: 75%;
        float: right;
        height : 500px;
        background: lightpink;
        overflow-y: scroll;
    }
    </style>
</head>
 
<body>


        <div class="left"><%@include file="userList.jsp" %></div>
        <div class="center"><%@include file="sendMessage.jsp" %></div>
        <div class="right"><%@include file="messageList.jsp" %></div>
    
</body>
</html>


