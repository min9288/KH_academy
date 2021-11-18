<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<hr>
	<form action="/pwChange1.do" method="post">
		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		현재 비밀번호 입력 : <input type="password" name="oldPassword"><br>
		새 비밀번호 입력 : <input type="password" name="newPassword"><br>
		<input type="submit" value="변경하기">
	</form>
</body>
</html>