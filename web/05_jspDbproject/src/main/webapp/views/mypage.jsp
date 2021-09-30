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
	<h1>마이페이지</h1>
	<hr>
	<form action="/views/update.jsp" method="post">
		<fieldset>
			<label for="memberNo">회원번호</label>
			<input type="text" name="memberNo" id="memberNo" value="<%=member.getMemberNo()%>" readonly><br>
			<label for="memberId">회원아이디</label>
			<input type="text" name="memberId" id="memberId" value="<%=member.getMemberId()%>" readonly><br>
			<label for="memberPw">비밀번호</label>
			<input type="password" name="memberPw" id="memberPw" value="<%=member.getMemberPw()%>"><br>
			<label for="memberName">이름</label>
			<input type="text" name="memberName" id="memberName" value="<%=member.getMemberName()%>"><br>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" value="<%=member.getPhone()%>"><br>
			<label for="address">주소</label>
			<input type="text" name="address" id="address" value="<%=member.getAddress()%>"><br>
			<label for="memberLevel">회원등급</label>
			<input type="text" name="memberLevel" id="memberLevel" value="<%=member.getMemberLevel()%>" readonly><br>
			<label for="enrollDate">가입일</label>
			<input type="text" name="enrollDate" id="enrollDate" value="<%=member.getEnrollDate()%>" readonly><br>
			<input type="submit" value="정보수정">
		</fieldset>
	</form>
	<a href="/">메인페이지로 가기</a>
</body>
</html>