<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Spring Project</h1>
	<hr>
	<form action="/dependency" method="get">
		<input type="radio" name="brand" value="samsung"> 삼성
		<input type="radio" name="brand" value="Lg"> LG
		<input type="submit" value="전송">
	</form>
	<a href="/xmlTest">xml로 객체 생성 테스트</a><br>
</body>
</html>