<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String memberId = (String)request.getAttribute("memberId");
    boolean result = (Boolean)request.getAttribute("result");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
	<div class = "check-container">
		<%if(result) {%>
		찾으시는 아이디는[<span><%=memberId %></span>]입니다.
		<br><br>
		<a class="navbar-brand" href="/">닫기</a>
		<%} else { %>
		해당하는 회원정보가 없습니다.
		<br><br>
		<form action="/searchId" method="post">
			<input type="text" name="memberName" placeholder="이름을 입력하세요"><br>
			<input type="text" name="phone" placeholder="전화번호를 입력하세요"><br>
			<input type="submit" value="확인">
		</form>
		<%} %>
	</div>
	
</body>
</html>