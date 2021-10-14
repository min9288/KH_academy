<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이름 : ${requestScope.name }</h2>
	<h2>나이 : ${requestScope.age }</h2>
	<h2>주소 : ${requestScope.addr }</h2>
	<hr>
	<h2>이름 : ${sessionScope.name }</h2>
	<h2>나이 : ${sessionScope.age }</h2>
	<h2>주소 : ${sessionScope.addr }</h2>
	<hr>
	<h2>str1 : ${requestScope.str1 }</h2>
	<h2>str2 : ${sessionScope.str2 }</h2>
</body>
</html>