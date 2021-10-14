<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th><th>이름</th><th>나이</th><th>주소</th>
		</tr>
		<%--
			for(Member m : list){
				
			}
		 --%>
		<c:forEach items="${list }" var="m" varStatus="i">
			<tr>
				<td>${i.index+1 }</td>
				<td>${m.name }</td>
				<td>${m.age }</td>		
				<td>${m.addr }</td>
			</tr>
		</c:forEach>
	</table>
	<%--
		for(int i = 1; i <= 10; i++)
	 --%>
	<c:forEach begin="1" end="10" step="1" varStatus="i">
		<h3>${i.count }</h3>
	</c:forEach>
</body>
</html>