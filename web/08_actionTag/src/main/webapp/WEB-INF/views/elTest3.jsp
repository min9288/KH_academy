<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리스트출력</h1>
	<hr>
	<h2>첫번째회원</h2>
	<h3>이름 : ${list[0].name }</h3>
	<h3>나이 : ${list[0].age }</h3>
	<h3>주소 : ${list[0].addr }</h3>
	<hr>
	<h2>두번째회원</h2>
	<h3>이름 : ${list[1].name }</h3>
	<h3>나이 : ${list[1].age }</h3>
	<h3>주소 : ${list[1].addr }</h3>
</body>
</html>