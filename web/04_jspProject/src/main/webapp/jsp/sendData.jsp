<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. 화면에서 보낸 데이터 추출
    	String name = request.getParameter("name");
    	int age = Integer.parseInt(request.getParameter("age"));
    	String addr = request.getParameter("addr");
    	// 3. 비즈니스 로직
    	// 4. 화면처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<h3>주소 : <%=addr %></h3>
</body>
</html>