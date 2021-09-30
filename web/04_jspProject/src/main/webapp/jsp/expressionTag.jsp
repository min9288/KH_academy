<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%	
    	System.out.println("테스트 문장");
    	ArrayList<String> nameList = new ArrayList<String>();
    	nameList.add("정민우1");
    	nameList.add("정민우2");
    	nameList.add("정민우3");
    	nameList.add("정민우4");
    	nameList.add("정민우5");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>표현식 태그</h1>
	<hr>
	<h3>자바의 데이터를 HTML의 데이터로 표현하기 위해 사용하는 태그</h3>
	<hr>
	<%for(int i=0; i< nameList.size();i++){ %>
	<h3><%=(i+1) %>. <%=nameList.get(i) %></h3>
	<%} %>
	<%--
		out.println("<h3>"+"(i+1)+". "+nameList.get(i)"+"</h3>");
	 --%>
</body>
</html>