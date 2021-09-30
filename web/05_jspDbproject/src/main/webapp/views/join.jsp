<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. view에서 넘어온 값 추출
    	Member member = new Member();
    	member.setMemberId(request.getParameter("memberId"));
    	member.setMemberPw(request.getParameter("memberPw"));
    	member.setMemberName(request.getParameter("memberName"));
    	member.setPhone(request.getParameter("phone"));
    	member.setAddress(request.getParameter("address"));
    	// 3. 비즈니스로직
    	MemberService service = new MemberService();
    	int result = service.insertMember(member);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 결과</h1>
	<hr>
	<%if(result > 0) {%>
		<h2>회원가입 성공</h2>
		<a href="/views/loginFrm.jsp">로그인하러 가기</a>
	<%}else { %>
		<h2>회원가입 실패</h2>
		<a href="/">메인페이지로 돌아가기</a>
	<%} %>
</body>
</html>