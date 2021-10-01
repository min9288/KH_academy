<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member member = (Member)session.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MVC2 프로젝트</h1>
	<hr>
	<%if(member == null) {%>
		<h3><a href="/views/loginFrm.jsp">1. 로그인</a></h3>
		<h3><a href="/views/joinFrm.jsp">2. 회원가입</a></h3>
	<%} else {%>
		<h3>[<%=member.getMemberName() %>]님</h3>
		<h3><a href="/allMember">1. 전체회원조회</a></h3>
		<h3><a href="/logout">2. 로그아웃</a></h3>
	<%} %>
</body>
</html>