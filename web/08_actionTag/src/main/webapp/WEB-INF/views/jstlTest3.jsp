<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test = "${num == 100 }">
			<h1>100입력</h1>
		</c:when>
		<c:when test = "${num == 50 }">
			<h1>50505050</h1>
		</c:when>
		<c:when test = "${num == 1}">
			<h1>1111111</h1>
		</c:when>
		<c:otherwise>
			<h2>아무것도 해당되지 않으면 실행</h2>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${not empty m2 }">
			<h2>${m2.name }</h2>
		</c:when>
		<c:otherwise>
			<h2>m2 비어있음</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>