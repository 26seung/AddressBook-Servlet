<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 주소 추가</title>
</head>
<body>

	<h1>주소록 Servlet</h1>
	<h3>새 주소 등록</h3>
	
	<form action="<%=request.getContextPath() %>/book" method="POST">
		<fieldset style= "Width:200px">
			<input type="hidden" name="action" value="insert" />
			
			<label for="name">이름</label><br>
			<input type="text" name="name"><br>
			<label for="hp">휴대전화</label><br>
			<input type="text" name="hp"><br>
			<label for="tel">집전화</label><br>
			<input type="text" name="tel"><br><br>
		
			<div style="text-align:right;">
			<input type="submit" value="주소 등록" /></div>
		</fieldset>
	</form>

	<p>
		<a href="<%= request.getContextPath() %>/book?a=index">목록 보기</a>  
	</p>


</body>
</html>