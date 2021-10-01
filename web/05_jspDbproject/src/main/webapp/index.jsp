<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// session은 여러 객체를 저장하는 공간으로 Object로 처리
    	// Object는 모든 클래스의 조상 클래스로 다형성으로 처리가 가능
    	// session에서 가져온 데이터 또한 Object 즉, 다운캐스팅 후 사용해야함
    	// sessiongetAttribute("키") -> 키값이 존재하지 않으면 null 리턴
    	Member member = (Member)session.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원관리</h1>
	<hr>
	<%if(member == null) {%>
		<h3><a href="/views/joinFrm.jsp">1. 회원가입</a></h3>
		<h3><a href="/views/loginFrm.jsp">2. 로그인</a></h3>
	<%} else { %>
		<h3><a href="/views/logout.jsp">1. 로그아웃</a></h3>
		<%if(member.getMemberLevel() == 1) {%>
		<h3><a href="/views/allMember.jsp">2. 전체회원조회</a></h3>
		<%} %>
		<h3><a href="/views/mypage.jsp">2. 마이페이지-1</a></h3>
		<h3><a href="/views/mypage2.jsp?memberNo=<%=member.getMemberNo()%>">3. 마이페이지-2</a></h3>
	<%} %>
</body>
</html>