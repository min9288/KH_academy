<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	// 2. view에서 전달한 값 추출
    	// 3. 비즈니스 로직
    	ArrayList<Member> list = new MemberService().allMember();
    	// 4. 화면처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<h1>전체회원 정보 출력</h1>
	<hr>
	<%if(list.isEmpty()) {%>
		<h2>회원 정보가 없습니다.</h2>
	<%} else { %>
		<table border="1">
			<tr>
				<th>회원번호</th><th>아이디</th><th>비밀번호</th><th>이름</th>
				<th>전화번호</th><th>주소</th><th>회원등급</th><th>가입일</th>
			</tr>
			<%for(Member m : list){ %>
			<tr>
				<td><%=m.getMemberNo() %></td>
				<td><%=m.getMemberId() %></td>
				<td><%=m.getMemberPw() %></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getMemberLevel() %></td>
				<td><%=m.getEnrollDate() %></td>
			</tr>
			<%} %>
		</table>
	<%} %>
</body>
</html>