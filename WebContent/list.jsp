<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징  </title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td>${dto.bTitle}</td>
				<td>${dto.bDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table>
	<table>
			<tr>
				<c:if test="${startPage!=1}">
					<a href="./list.do?page=${startPage-1}">[이전]</a>
				</c:if>
				
			   <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="cnt">
			       <a href="./list.do?page=${i}">[
			        <font color="#000000" />
			          <c:if test="${currentPage == i}">
			          <font color="#bbbbbb" />
			        </c:if>
			        ${i}
			       </font>]
			       </a>
			   </c:forEach>
			
				<c:if test="${endPage!=totalPage}">
					<a href="./list.do?page=${endPage+1}">다음 ▶</a>
				</c:if>
			</tr>
		
		</table>
	
</body>
</html>