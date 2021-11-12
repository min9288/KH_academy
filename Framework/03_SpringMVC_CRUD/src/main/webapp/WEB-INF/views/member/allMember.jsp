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
	<h1>전체회원정보</h1>
	<hr>
	<table border="1">
		<tr>
			<th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>가입일</th>
		</tr>
		<c:forEach items="${list }" var="m" varStatus="i">
		<tr>
			<th>${i.count }</th>
			<th>${m.memberId }</th>
			<th>${m.memberPw }</th>
			<th>${m.memberName }</th>
			<th>${m.address }</th>
			<th>${m.enrollDate }</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>