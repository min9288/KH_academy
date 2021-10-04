<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String memberPw = (String)request.getAttribute("memberPw");
    boolean result = (Boolean)request.getAttribute("result");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = "check-container">
		<%if(result) {%>
		찾으시는 비밀번호는[<span><%=memberPw %></span>]입니다.
		<br><br>
		<a class="navbar-brand" href="/">닫기</a>
		<%} else { %>
		해당하는 회원정보가 없습니다.
		<br><br>
		<form action="/searchPw" method="post">
			<input type="text" name="memberId" placeholder="아이디를 입력하세요"><br>
			<input type="text" name="phone" placeholder="전화번호를 입력하세요"><br>
			<input type="submit" value="확인">
		</form>
		<%} %>
	</div>
</body>
</html>