<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.header{
		height: 500px;
		background-image: url("/resources/img/how/background.jpg");
		text-align: center;
	}
	.headerText{
		margin-top: 200px;
		color: white;
	}
	.how{
		
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header">
		<div class="headerText">
			<h1 class="headerTitle" style="color: white; font-size: bold;">디벨로민트를 통해 어떤 일이든 해결하세요</h1>
			<p class="headerContent"> 프로젝트와 고수를 통한 피드백, 구인구직, 공모전까지 모두 디벨로민트에서! </p>
		</div>
	</div>
	<div class="container">
		<h2 class="how">숨은 고수 찾기는 어떻게 이루어질까요?</h2>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>