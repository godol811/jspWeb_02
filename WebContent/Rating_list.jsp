	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 30px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	h2 {
	  margin-top: 70px;
	  text-align: center;
	  margin-bottom: 40px;
	}
		
	.wrap{
		padding: 30px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 80%;
	
	}
	
	.sub_news #trtr{
		border-bottom: 1px solid #999;
	
	}
	
	.sub_news th, .sub_news td{
		padding: 10px;
		font-size: 15px;
		text-align: left;
	}
	
	.sub_news th{
		padding: 5px 0 6px;
		border-top: solid 2px #999;
		border-bottom: solid 2px #b2b2b2;
		background-color: #f1f1f4;
		color: #333;
		font-weight: bold;
		line-height: 20px;
		vertical-align: top;
		text-align: center;
	}
	
	.sub_news .thth{
		border-right: solid 1px #999;
	}
	.sub_news .title{
		border-bottom: solid 2px #999;
		text-align: left;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .tdtd{
		text-align: left;
	}
	

	.sub_news .content{
		border-bottom: 2px solid #999;
		border-top: 2px solid #999;
	}
	
	.sub_news #con{
		border-bottom: 2px solid #999;
		border-top: 2px solid #999;
		text-align: left;
	}
	
	.sub_news .bold{
		border-top: 1px solid #999;
	}
	
	.sub_news #bold1{
		border-right: 1px solid #999;
	}
	.sub_news .bold2{
		border-bottom: 1px solid #999;
	}
	
	.sub_news .img{
		padding-bottom: 40px;
	}
	
	.sub_news .page a{
		font-size: 18px;
		padding-right: 10px;
	
	}
</style>
</head>
<body>
	<table class="sub_news">
			<colgroup>
				<col width="30px;" />
				<col width="30px;" />
				<col width="30px;" />
			</colgroup>
			<tr>
				<th>평점</th><th colspan="2">리뷰</th>
			</tr>
		<c:forEach items="${reviewList}" var="dto2">	
			<tr>
				<td rowspan="2" style="border-bottom: 1px solid #999;">${dto2.reviewRate }</td>
				<td style="font-size: 15px; text-align: left;">&nbsp;&nbsp;${dto2.userinfo_Userid}</td>
				<td style="font-size: 13px; color: gray; text-align: left;"> ${dto2.reviewDate}</td>
			</tr>
				<td colspan="2" style="font-size: 18px;text-align: left;border-bottom: 1px solid #999;">&nbsp;&nbsp;${dto2.reviewContent}</td>
			<tr>
			</tr>
		</c:forEach>
	</table>
</body>
</html>