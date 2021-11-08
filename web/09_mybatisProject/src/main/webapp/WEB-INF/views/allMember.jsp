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
	<h1>전체회원정보</h1>
	<hr>
	<table border="1">
		<tr>
			<th>회원번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>회원등급</th><th>가입일</th>
		</tr>
		<c:forEach items="${list }" var="member">
			<tr>
				<td>${member.memberNo }</td>
				<td>${member.memberId }</td>
				<td>${member.memberPw }</td>
				<td>${member.memberName }</td>
				<td>${member.phone }</td>
				<td>${member.address }</td>
				<td>${member.memberLevel }</td>
				<td>${member.enrollDate }</td>
			</tr>		
		</c:forEach>
	</table>
	<a href="/">메인으로 이동</a>
</body>
</html>