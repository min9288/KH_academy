<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--사용해야하는 클래스를 import할때 지시자 태그 사용--%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지시자 태그</h1>
	<hr>
	<h3>JSP페이지 전체에 영향을 미치는 정보를 기술할때 사용하는 태그</h3>
	<%-- 작성된 jsp나 html을 해당 페이지로 포함시키는 기능 --%>
	<%@include file="/jsp/test.jsp"%>
	<button onclick="func1();">클릭</button>
</body>
</html>