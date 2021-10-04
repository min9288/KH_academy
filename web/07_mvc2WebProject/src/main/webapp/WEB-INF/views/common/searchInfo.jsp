<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<form action="/searchId" method="post" name="searchInfoFrm">
			<legend>아이디 찾기</legend>
			<div class="form-group">
				<label class = "control-label" for="memberName">이름</label>
				<input type = "text" name="memberName" id="memberName" class="form-control">
			</div>
			<div class="form-group">
				<label class = "control-label" for="phone">전화번호</label>
				<input type = "text" name="phone" id="phone" class="form-control">
			</div>
			<button type="submit" class="btn btn-outline-primary btn-lg btn-block">아이디 찾기</button>
		</form>
		<form action="/searchPw" method="post" name="searchInfoFrm">
			<legend>비밀번호 찾기</legend>
			<div class="form-group">
				<label class = "control-label" for="memberId">아이디</label>
				<input type = "text" name="memberId" id="memberId" class="form-control">
			</div>
			<div class="form-group">
				<label class = "control-label" for="phone">전화번호</label>
				<input type = "text" name="phone" id="phone" class="form-control">
			</div>
			<button type="submit" class="btn btn-outline-primary btn-lg btn-block">비밀번호 찾기</button>
		</form>
	</div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>