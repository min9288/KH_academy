<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 작성</h1>
	<hr>
	<form action="/boardWrite1.do">
		<fieldset>
			제목 : <input type="text" name="boardTitle"><br>
			작성자 : ${sessionScope.m.memberId }<br>
			내용 : <textarea rows="3" cols="10" name="boardContent"></textarea><br>
			<input type="hidden" name="boardWriter" value="${sessionScope.m.memberId }">
			<input type="submit" value="작성">
		</fieldset>
	</form>
</body>
</html>