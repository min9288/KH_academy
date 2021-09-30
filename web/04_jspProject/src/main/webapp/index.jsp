<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp 프로젝트</h1>
	<hr>
	<%@include file="/jsp/test.jsp" %>
	<h3><a href="/jsp/directiveTag.jsp">1. 지시자 태그</a></h3>
	<h3><a href="/jsp/scriptletTag.jsp">2. 스크립틀릿 태그</a></h3>
	<h3><a href="/jsp/expressionTag.jsp">3. 표현식 태그</a></h3>
	<h3><a href="/jsp/declarationTag.jsp">4. 선언식 태그</a></h3>
	<h3><a href="/jsp/errorTest.jsp">5. 지시자태그를 이용한 에러처리</a></h3>
	<hr>
	<h3><a href="/jsp/sendData.jsp?name=정민우&age=20&addr=서울">jsp로 데이터 전송</a></h3>
	<form action="/jsp/sendData2.jsp" method="get">
		<input type="text" name="data1"><br>
		<input type="text" name="data2"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>