<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.form-wrap{
		width: 300px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
	.joinBtn{
		margin-top: 50px;
	}
	#joinBtn{
		width: 100%;	
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="form-wrap">
				    <div class="form-group">
				      <label for="oldPw" class="form-label mt-4">기존 비밀번호</label>
				      <input type="password" class="form-control" id="oldPw" placeholder="현재 비밀번호를 입력해주세요">
				      <span class="expResult"></span>
				    </div>
				<form action="/chanePw.do">
					<input type="hidden" name="memberId" id="memberId" value="${sessionScope.m.memberId }">
				    <div class="form-group">				    
				      <label for="memberPw" class="form-label mt-4">새로운 비밀번호</label>
				      <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="영문+숫자 최소 8자를 조합해주세요">
				      <span class="expResult"></span>
				    </div>
				    <div class="form-group">
				      <label for="memberPwRe" class="form-label mt-4">새로운 비밀번호 확인</label>
				      <input type="password" class="form-control" id="memberPwRe" name="memberPwRe" placeholder="영문+숫자 최소 8자를 조합해주세요">
				      <span class="expResult"></span>
				    </div>
				    <div class="joinBtn">
				      <button type="button" class="btn btn-primary" id="joinBtn">정보변경</button>
				    </div>
				</form>			
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/js/member/changePwFrm.js"></script>
</body>
</html>