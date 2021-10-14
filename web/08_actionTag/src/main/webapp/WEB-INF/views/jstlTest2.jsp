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
	<h2>m1 : ${m1 }</h2>
	<h2>m2 : ${m2 }</h2>
	<c:if test="${not empty m1 }">
		<h3>${m1.name }</h3>
	</c:if>
	<c:if test="${empty m1 }">
		<h3>m1 데이터가 없습니다.</h3>
	</c:if>
	<c:if test="${not empty m2 }">
		<h3>${m2.name }</h3>
	</c:if>
	<c:if test="${empty m2 }">
		<h3>m2 데이터가 없습니다.</h3>
	</c:if>
	
</body>
</html>