<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립틀릿 태그</h1>
	<hr>
	<h3>_jspService 메소드의 수행내용을 작성할때 사용</h3>
	<% 
		int age = 10;
	%>
	<%if(age >= 20){%>
		<h2>성인입니다.</h2>
	<%}else{ %>
		<h2>미성년자입니다.</h2>
	<%} %>
</body>
</html>