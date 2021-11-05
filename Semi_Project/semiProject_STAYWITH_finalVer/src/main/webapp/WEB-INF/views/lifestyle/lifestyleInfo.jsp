<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/lifestyle-info.css">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
		<div class="main-left-box">
			<h2>라이프스타일</h2>
			<ul>
				<c:forEach items="${categoryList}" var="cl" varStatus="i">
					<li><span>${cl.lfCategory }</span>
						<ul class="subnavi">
							<c:forEach items="${list }" var="l" varStatus="i">
								<c:if test="${cl.lfCategory eq l.lfCategory }">
									<c:choose>
										<c:when test="${l.lfNo eq lf.lfNo }">
											<li><a href="/lifestyleInfo?lfNo=${l.lfNo }"
												class="select activeSelect">${l.lfTitle }<span>&gt;</span></a></li>
										</c:when>
										<c:otherwise>
											<li><a href="/lifestyleInfo?lfNo=${l.lfNo }"
												class="select">${l.lfTitle }<span>&gt;</span></a></li>
										</c:otherwise>
									</c:choose>

								</c:if>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
		</div>
		<!-- 메인 콘텐츠 -->
		<div>
			<div class="main-content">
				<c:if
					test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1}">
					<a href="/updateLifestyle?lfNo=${lf.lfNo }" class="btn btn-light"
						id="updateBtn">수정하기</a>
				</c:if>
				<c:if test="${lf.lfCategory eq '피트니스' }">
					<c:if test="${not empty sessionScope.m}">
						<a href="/resLifestyle?lfNo=${lf.lfNo }" class="btn btn-light"
							id="resBtn">예약하기</a>
					</c:if>
					<c:if test="${empty sessionScope.m}">
						<div id="loginGo">
							<button  class="btn btn-light"><a href="/loginFrm">로그인 후
								예약하기</a></button>
						</div>
					</c:if>
				</c:if>
				<p>${lf.lfContent }</p>
				<br> <br>
			</div>
			<!-- 리뷰보기  -->
			<c:if test="${lf.lfCategory eq '피트니스' }">
				<a class="btn btn-outline-secondary" id="reviewBtn">리뷰보기</a>
				</c:if>
				<div class="review">
					<a class="btn btn-outline-secondary" id="closeBtn">리뷰닫기</a> <br>
					<c:choose>
						<c:when test="${not empty review }">
							<div id="page">
								<c:forEach items="${review }" var="re" varStatus="i">
									<div class="reviewInfo">
										<div class="reTitle">
											<p class="usedFitness">이용한 피트니스 : ${re.lifeName }</p>
											<p class="star">
												별점 : ${re.star }
												<c:forEach var="i" begin="1" end="${re.star }">
											★
										</c:forEach>
											</p>
											<p class="usedDate">이용 날짜 : ${re.resDate }</p>
										</div>
										<div class="reContent">
											<p class="reWriter">작성자 : ${re.reviewWriter }</p>
											<p class="writeContent">작성 내용 : ${re.reviewContent }</p>
											<p class="writeDate">작성한 날짜 : ${re.reviewDate }</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<p id="noReview">등록 된 리뷰가 없습니다.</p>
						</c:otherwise>
					</c:choose>

				</div>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<style>
.subnavi a.activeSelect>span {
	display: inline;
}

.activeSelect {
	background-color: #d6c6a5;
}
</style>
	<script>
		$(function() {
			$(".review").hide();
			$("#closeBtn").hide();
			$("#reviewBtn").click(function() {
				$(".review").show();
				$("#closeBtn").show();
				$("#reviewBtn").hide();
			});
			$("#closeBtn").click(function() {
				$(".review").hide();
				$("#closeBtn").hide();
				$("#reviewBtn").show();
			});
		});
	</script>
</body>
</html>