<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 서블릿에서 request영역에 등록해놓은 데이터를 추출
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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