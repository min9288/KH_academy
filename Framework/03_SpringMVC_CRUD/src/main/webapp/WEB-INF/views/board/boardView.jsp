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
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${b.boardNo }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${b.boardTitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${b.boardWriter }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${b.boardDate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${b.boardContent }</td>
		</tr>
	</table>
	<a href="/">메인으로</a>
</body>
</html>