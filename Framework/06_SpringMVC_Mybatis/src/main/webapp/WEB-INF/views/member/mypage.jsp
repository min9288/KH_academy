<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h1>${m.memberName }님의 마이페이지</h1>
	<hr>
	<form action="/updateMember.do" method="post">
		<table>
			<tr>
				<th>아이디</th><th>이름</th><th>주소</th>
			</tr>
			<tr>
				<td><input type="text" name="memberId" value="${m.memberId }" readonly> </td>
				<td><input type="text" name="memberName" value="${m.memberName }" readonly></td>
				<td><input type="text" name="address" value="${m.address }"></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center"><input type="submit" value="수정하기" ></td>
			</tr>
		</table>
	</form>
	<a href="/">메인으로</a>
</body>
</html>