<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.applyResume{
		overflow: hidden;
		border: 3px solid rgb(78, 205, 196);
		border-radius: 30px;
		padding: 30px 20px;
	}
	.applyResume>div{
		float: left;
	}
	#pageNavi{
		display: flex;
		justify-content: center;
		margin: 50px 0px;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container" style="margin-top:50px;margin-bottom:100px;">
			<div class="mainCate">
				<span style="font-weight:bold">지원내역</span>
			</div>
			<br><br>
			<p id="unprocessed">입사 지원 수 : <span style="color: rgb(78, 205, 196);">${count }</span> 건</p>
			<c:forEach items="${list }" var="a" varStatus="i">
			<!-- table로 구성해도 될라나 -->
				<div class="applyResume">
					<div class="resumeTitle">
						${a.resumeTitle }
					</div>
					<div class="memberName">
						<%-- ${a.memberName } --%> 이슬기
					</div>
					<div class="applyDate">
						${a.applyDate }
					</div>
				</div>
			</c:forEach>
			<div id="pageNavi">${pageNavi }</div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>