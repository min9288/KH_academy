<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//Servlet에서 등록한 데이터 꺼내는 작업
    	String msg = (String)request.getAttribute("msg");
    	String loc = (String)request.getAttribute("loc");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("<%=msg%>");
		location.href="<%=loc%>";
	</script>
</body>
</html>