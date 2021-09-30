<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. view에서 전달한 데이터 추출
    	String memberId = request.getParameter("memberId");
    	String memberPw = request.getParameter("memberPw");
    	// 3. 비즈니스 로직
    	Member member = new MemberService().selectOneMember(memberId, memberPw);
    	// 로그인의 경우 로그인한 회원의 정보를 모든 페이지에서 사용할 수 있도록 session에 정보를 등록
    	if(member != null){
    		// 세선에 "member"라는 키로 로그인한 회원 정보를 저장
    		session.setAttribute("member", member);
    	}
		// 4. 화면처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인결과</h1>
	<hr>
	<%if(member != null) {%>
		<h3>[<%=member.getMemberName() %>]님 환영합니다.</h3>
	<%}else { %>
		<script>
			alert("아이이 또는 비밀번호를 확인해주세요.");
		</script>
		<a href="/views/loginFrm.jsp">로그인페이지로 가기</a>
	<%} %>
	<a href="/">메인페이지로 가기</a>
</body>
</html>