<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<hr>
	<form action="/updatePw.do" method="post">
		<fieldset>
			현재 비밀번호 입력 : <input type="password" name="exPw"><br>
			사용할 비밀번호 입력 : <input type="password" name="changePw">
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			<input type="submit" value="비밀번호 변경">
			<input type="reset" value="초기화">
		</fieldset>
	</form>
</body>
</html>