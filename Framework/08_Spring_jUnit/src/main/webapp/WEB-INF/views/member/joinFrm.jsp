<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form action="/join.do" method="post">
		아이디 : <input type="text" name="memberId"><br>
		비밀번호 : <input type="password" name="memberPw"><br>
		이름 : <input type="text" name="memberName"><br>
		나이 : <input type="text" name="memberAge"><br>
		<input type="submit" value="회원가입">
		<input type="reset" value="초기화">
	</form>
</body>
</html>