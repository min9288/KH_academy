<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. 화면에서 보낸 값 추출
    	String data1 = request.getParameter("data1");
    	String data2 = request.getParameter("data2");
    	// 3. 비즈니스 로직
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>data1 : <%=data1 %></h3>
	<h3>data1 : <%=data2 %></h3>
</body>
</html>