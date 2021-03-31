<%@page import="book.BookData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니 프로젝트</title>
</head>
<body>

	<h1>주소록 Servlet</h1>
	<br>
	<h2>목록</h2>
	
	<form action="<%= request.getContextPath() %>/book" method="GET">
	<input type="hidden" name="a" value="search">
	<label for="search">검색어</label>
	<input type="text" name="name" id="name">
	
	<input type="submit" value="검색" />
	
	</form>
	
	<style>
		table {width: 700px; height: 100px; text-align: center;}
		th, td {padding: 10px 5px;}
		th {background-color:lightgray;}
	</style>

	<table border=1>
		<tr>
			<th>이름</th>
			<th>휴대전화</th>
			<th>집전화</th>
			<th>도구</th>
		</tr>
		<tr>
			<%
			List<BookData> list = (List<BookData>)request.getAttribute("list");
			
			for (BookData data : list) {
				pageContext.setAttribute("data", data);			//	el 방식을 사용하기 위해 (page)저장소에 담음
			%>	
			<td>${data.name }</td>
			<td>${data.hp }</td>
			<td>${data.tel }</td>
			<td colspan="2">
				<form action="<%= request.getContextPath() %>/book">
					<input type="hidden" name="a" value="delete" />
					<input type="hidden" name="no" value="${data.id }"/>
					<input type="submit" value="삭제" />
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
		
	
	
	
	<p>
		<a href="<%= request.getContextPath() %>/book?a=form">새 주소 추가</a>
	</p>
	
</body>
</html>