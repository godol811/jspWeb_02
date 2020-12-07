<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	
	table{
		border-collapse: collapse;
		margin-top: 10px;
		margin-left: auto;
  	  	margin-right: auto;
		
	}
	
	a{
		text-decoration: none;
		color: inherit;
	}
	
	h1 {
	  text-align: center;
	  margin-bottom: 20px;
	}
		
	.wrap{
		padding: 30px;
		
	}
	
	.wrap .registerBtn{
		margin-bottom: 10px;
		padding: 10px;
		
	}
	
	.sub_news{
		width: 50%;
	
	}
	
	.sub_news #trtr{
		border-bottom: 1px solid #999;
	
	}
	
	.sub_news th, .sub_news td{
		padding: 20px;
		font-size: 15px;
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
	}
	
	.sub_news .thth{
		border-right: solid 1px #999;
	}
	.sub_news .title{
		border-top: solid 2px #999;
		border-bottom: solid 2px #999;
		text-align: left;
	}
	
	.sub_news td{
		text-align: center;
	}
	
	.sub_news .tdtd{
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
	
	#btn {
       margin-left: 25%;
       width: 84px;
       height: 40px;   
       font-size:14px;
       font-weight:700;
       margin-top: 10px;
       margin-bottom: 10px;
	   padding: 0px;
	}

</style>
</head>
<body>
<div class ="wrap">
		<table class="sub_news">
			<colgroup>
				<col width="150px"/>
				<col width="150px"/>
			</colgroup>
			<tr>
				<td class="title" style="font-weight: bold; font-size: 30px;" colspan="2">${bookView.roomTitle }</td>
			</tr>
			<tr>
				<td class="img" colspan="2"><img width="500px" height="300px" src="${pageContext.request.contextPath}/upload/${bookView.roomImage}"></td>
			</tr>
			<tr>
				<td colspan="2">${bookView.roomContent }</td>
			</tr>
			<tr>
				<td class="bold" id="bold1">체크인</td> <td>체크아웃</td> 
			</tr>
			<tr>
				<td id="bold1" class="bold2"> ${bookView.bookCheckInDate }</td><td class="bold2"> ${bookView.bookCheckOutDate }</td>
			</tr>
			<tr>
				<td id="bold1" class="bold2">총 합계</td><td class="bold2">${bookView.roomPriceTotal } 원</td>
			</tr>
			<tr>
				<td id="bold1" class="bold2">주소</td><td class="bold2"> ${bookView.roomAddress } &nbsp; ${bookView.roomAddressDetail }  </td>
			</tr>
			<tr>
				<td colspan="2"><a href="#"> 문의 사항은 전화 문의 주세요! </a></td>
				<!-- HostMessage.room?userId=${bookView.userId }&bookId=${BOOKID}&roomuserId=${bookView.roomuserId} -->
			</tr>
		</table>
				<input id="btn" type="button" value="닫기" onClick="history.go(-1)">
</div>	
</body>
</html>