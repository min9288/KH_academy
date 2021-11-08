<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아아디 / 비밀번호 찾기</h1>
	<hr>
	<form action="/idSearch">
		<fieldset>
			<legend>아이디 찾기</legend>
			이름 : <input type="text" name="memberName"><br>
			전화번호 : <input type="text" name="phone"><br>
			<input type="submit" value="아이디찾기">
		</fieldset>
	</form>
	<form action="/pwSearch">
		<fieldset>
			<legend>비밀번호 찾기</legend>
			아이디 : <input type="text" name="memberId"><br>
			전화번호 : <input type="text" name="phone"><br>
			<input type="submit" value="비밀번호 찾기">
		</fieldset>
	</form>
	<a href="/">메인으로</a>
</body>
</html>