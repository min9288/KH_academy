<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. view에서 보내준 값 추출
    	Member m = new Member();
    	m.setMemberPw(request.getParameter("memberPw"));
    	m.setMemberName(request.getParameter("memberName"));
    	m.setPhone(request.getParameter("phone"));
    	m.setAddress(request.getParameter("address"));
    	m.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
    	// 3. 비즈니스로직처리
    	int result = new MemberService().update(m);
		// 4. 화면처리 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	<%if(result > 0) {%>
		alert("정보변경 성공!");
	<%} else {%>
		alert("정보변경 실패!");
	<%} %>
		location.href="/";
	</script>
</body>
</html>