<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	<hr />
	<input/>
	<br/>
	<img/>
	<%@ include file = "/WEB-INF/views/test1.jsp" %>
	<jsp:include page="/WEB-INF/views/test1.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/test1.jsp"/>
	<h3><a href="/forwardTest">jsp:forward 테스트</a></h3>
	<h3><a href="/elTest1">elTest1(기본형)</a></h3>
	<h3><a href="/elTest2">elTest2(객체)</a></h3>
	<h3><a href="/elTest3">elTest3(list(배열도 동일))</a></h3>
	<h3><a href="/elTest4">elTest4(연산자)</a></h3>
	<hr>
	<h3><a href="/jstlTest1">jstlTest1(JSTL 기초)</a></h3>
	<h3><a href="/jstlTest2">jstlTest2(JSTL if)</a></h3>
	<h3><a href="/jstlTest3">jstlTest3(JSTL choose)</a></h3>
	<h3><a href="/jstlTest4">jstlTest4(JSTL foreach)</a></h3>
	<form action="/jstlTest5">
		<input type="text" name="data">
		<input type="submit" value="데이터전송">
	</form>
</body>
</html>