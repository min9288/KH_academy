<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container>h1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
	margin-bottom: 200px;
	margin-top: 100px;
}

.g-sa-wrap h4 {
	font-weight: 900;
	color: rgb(78, 205, 196);
	margin-top: 100px;
	margin-bottom: 100px;
	font-size: 40px;
}

.container>div>div>div table td {
	padding: 10px;
	text-align: center;
}

.container>div>div>div table td>span {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
}

.container>div>div>div table a {
	margin-top: 20px;
	width: 200px;
	margin-bottom: 20px;
}

.container>div>div>div {
	border: 1px solid rgb(160, 160, 160);
	width: 400px;
	padding-left: 20px;
	padding-right: 20px;
	margin: 70px;
	box-shadow: rgba(0, 0, 0, 0.4) 2PX 2PX 2PX 2PX;
	background-color: white;
}

.container>div>div {
	display: flex;
	flex-wrap: wrap;
}

.container>div>div>div table img {
	border-radius: 50%;
	box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;
	height: 80px;
	width: 80px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	padding: 20px;
}

.review-one p {
	padding: 10px;
	margin: 0;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}

.g-margin {
	margin-top: 50px;
	margin-bottom: 50px;
	display: flex;
	margin: 0 auto;
	width: 1080px;
}
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do?reqPage=1">요청서</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do?reqPage=1">견적서</a>
			</div>
		</c:if>
		<h1>나의 현황</h1>
		<hr>
		<p style="margin-bottom: 100px; color: gray;">신청하신 전체 내역을 확인하실 수
			있습니다.</p>
		<div class="g-sa-wrap">
			<h4>신청한 내역</h4>
			<div class="g-margin">
				<c:choose>
					<c:when test="${not empty gosuTalkList }">
						<c:forEach items="${gosuTalkList }" var="gtl" varStatus="i">
							<c:choose>
								<c:when test="${gtl.feedbackNum eq 3  }">

									<div style="background-color: #f6f6f6;">
								</c:when>
								<c:otherwise>

									<div>
								</c:otherwise>
							</c:choose>
							<table>
								<tr style="font-size: small;">
									<c:if test="${gtl.feedbackNum eq 1 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: blue;">진행 전</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 2 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: red;">진행 중</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 3 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: gray;">진행 완료</b></td>
									</c:if>

									<td style="padding-right: 0;">${gtl.feedbackDate }</td>
								</tr>
								<tr>
									<td><b>${gtl.feedbackTitlePlus2 }</b></td>
									<td rowspan="2" style="padding-right: 0;"><c:if
											test="${empty gtl.gosuImg }">
											<img src="/resources/img/gosu/g_img_basic.png">
											<br>
											<span
												style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.gosuId }</span>
										</c:if> <c:if test="${not empty gtl.gosuImg  }">
											<img src="/resources/upload/member/${gtl.gosuImg  }">
											<br>
											<span
												style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.gosuId }</span>
										</c:if></td>
								</tr>
								<tr>
									<td><span style="height: 50px; width: 245px;">${gtl.feedbackContent }</span></td>
								</tr>
								<tr>
									<td colspan="2"><c:choose>
											<c:when test="${gtl.feedbackNum eq 3 }">
												<a
													style="margin-top: 0; font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;"
													href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-outline-primary">자세히 보기</a>
											</c:when>
											<c:otherwise>
												<a
													style="margin-top: 0; font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;"
													href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-primary">자세히 보기</a>
											</c:otherwise>
										</c:choose></td>
								</tr>

							</table>
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<span
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
					신청한 내역이 없습니다!</span>
			</c:otherwise>
			</c:choose>
		</div>

		<c:if test="${sessionScope.m.memberType eq 2}">
			<h4>신청받은 내역</h4>
			<div class="g-margin">
				<c:choose>
					<c:when test="${not empty gosuTalkList2 }">
						<c:forEach items="${gosuTalkList2 }" var="gtl" varStatus="i">
							<c:choose>
								<c:when test="${gtl.feedbackNum eq 3  }">

									<div style="background-color: #f6f6f6;">
								</c:when>
								<c:otherwise>

									<div>
								</c:otherwise>
							</c:choose>

							<table>
								<tr style="font-size: small;">
									<c:if test="${gtl.feedbackNum eq 1 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: blue;">진행 전</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 2 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: red;">진행 중</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 3 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: gray;">진행 완료</b></td>
									</c:if>

									<td style="padding-top: 20px; padding-right: 0;">${gtl.feedbackDate }</td>
								</tr>
								<tr>
									<td><b>${gtl.feedbackTitlePlus2 }</b></td>
									<td rowspan="2" style="padding-right: 0;"><c:if
											test="${empty gtl.memberImg }">
											<img src="/resources/img/gosu/g_img_basic.png">
											<br>
											<span
												style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.memberId }</span>
										</c:if> <c:if test="${not empty gtl.memberImg  }">
											<img src="/resources/upload/member/${gtl.memberImg  }">
											<br>
											<span
												style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.memberId }</span>
										</c:if></td>
								</tr>
								<tr>
									<td><span style="height: 50px; width: 245px;">${gtl.feedbackContent }</span></td>
								</tr>
								<tr>
									<td colspan="2"><c:choose>
											<c:when test="${gtl.feedbackNum eq 3 }">
												<a href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-outline-secondary"
													style="font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;">자세히
													보기</a>
											</c:when>
											<c:otherwise>
												<a href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-secondary"
													style="font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;">자세히
													보기</a>
											</c:otherwise>
										</c:choose></td>
								</tr>

							</table>
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise>

				<span
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
					신청받은 내역이 없습니다!</span>
			</c:otherwise>
			</c:choose>
	</div>
	</c:if>
	<h4>작성한 리뷰</h4>

	<c:choose>
		<c:when test="${not empty grList }">
			<c:forEach items="${grList }" var="grl" varStatus="i">
				<div style="display: flex; justify-content: center;">
					<div class="review-one" style="width: 80%; margin: 20px;">
						<ul>
							<li><b><span style="color: rgb(78, 205, 196);">
										고수 </span>${grl.gosuId }</b></li>
							<li><c:if test="${grl.reviewNum eq 1 }">
									<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
								</c:if> <c:if test="${grl.reviewNum eq 2 }">
									<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
								</c:if> <c:if test="${grl.reviewNum eq 3 }">
									<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
								</c:if> <c:if test="${grl.reviewNum eq 4 }">
									<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
								</c:if> <c:if test="${grl.reviewNum eq 5 }">
									<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
								</c:if></li>
							<li style="color: gray">${grl.reviewDate }</li>
						</ul>
						<br>
						<div style="display: flex; justify-content: center;">
							<p>${grl.reviewContentBr }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="g-margin">
				<span
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
					작성하신 리뷰가 없습니다!!</span>
			</div>
		</c:otherwise>
	</c:choose>

	<c:if test="${sessionScope.m.memberType eq 1 }">
		<h4>작성한 후기</h4>

		<c:choose>
			<c:when test="${not empty grrList }">
				<c:forEach items="${grrList }" var="grl" varStatus="i">

					<div style="display: flex; justify-content: center;">
						<div class="review-one" style="width: 80%; margin: 20px;">
							<ul>
								<li><b><span style="color: rgb(78, 205, 196);">
											고수 </span>${grl.gosuId }</b></li>
								<li style="color: gray">${grl.requestReviewDate }</li>
							</ul>
							<br>
							<div style="display: flex; justify-content: center;">
								<p>${grl.requestReviewContentBr }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="g-margin">
					<span
						style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
						작성하신 후기가 없습니다!</span>
				</div>
			</c:otherwise>
		</c:choose>


	</c:if>
	<h4>요청서를 통한 고수 매칭</h4>
	<div class="g-margin">
		<c:choose>
			<c:when test="${empty grpsList }">
				<c:choose>
					<c:when test="${sessionScope.m.memberType eq 1}">
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">요청서를
							작성해보세요!!</span>
					</c:when>
					<c:when test="${sessionScope.m.memberType eq 2}">
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">상단의
							요청서 버튼을 눌러 견적서를 보내보세요!</span>
					</c:when>
					<c:otherwise>
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">일반회원과
							고수회원이 이용할 수 있습니다.</span>

					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:forEach items="${grpsList }" var="grl" varStatus="i">
					<c:choose>
						<c:when test="${grl.requestProjectSubNum eq 3 }">

							<div class="g-left" style="background-color: #f6f6f6;">
						</c:when>
						<c:otherwise>

							<div class="g-left">
						</c:otherwise>
					</c:choose>

					<table>
						<tr style="font-size: small;">

							<c:if test="${grl.requestProjectSubNum eq 1 }">
								<td style="text-align: left; padding-top: 20px;"><b
									style="color: red;">개발 진행</b></td>
							</c:if>
							<c:if test="${grl.requestProjectSubNum eq 3 }">
								<td style="text-align: left; padding-top: 20px;"><b
									style="color: gray;">진행 완료</b></td>
							</c:if>
							<td style="padding-top: 20px;">${grl.requestProjectSubDate }</td>
						</tr>
						<tr>
							<td><c:if test="${sessionScope.m.memberType eq 1 }">
									<b><span style="color: rgb(78, 205, 196); font-size: 20px;">고수</span></b>

								</c:if> <c:if test="${sessionScope.m.memberType eq 2 }">
									<b><span style="color: rgb(78, 205, 196); font-size: 20px;">질문자</span></b>
								</c:if></td>
							<td rowspan="2"><c:if
									test="${sessionScope.m.memberType eq 1 }">
									<c:if test="${empty grl.gosuImg}">
										<img src="/resources/img/gosu/g_img_basic.png">
									</c:if>
									<c:if test="${not empty grl.gosuImg}">
										<img src="/resources/upload/member/${grl.gosuImg  }">
									</c:if>

								</c:if> <c:if test="${sessionScope.m.memberType eq 2 }">
									<c:if test="${empty grl.requestWriterImg}">
										<img src="/resources/img/gosu/g_img_basic.png">
									</c:if>
									<c:if test="${not empty grl.requestWriterImg}">
										<img src="/resources/upload/member/${grl.requestWriterImg  }">
									</c:if>

								</c:if></td>
						</tr>
						<tr>
							<td style="font-size: 25px; width: 255px;"><b> <c:if
										test="${sessionScope.m.memberType eq 2 }">
												${grl.requestWriterId  }

											</c:if> <c:if test="${sessionScope.m.memberType eq 1 }">
												${grl.gosuId  }

											</c:if>
							</b></td>
						</tr>
						<tr>
							<td colspan="2"><c:choose>
									<c:when test="${grl.requestProjectSubNum eq 3 }">
										<a href="/gosuProject.do?rpsNo=${grl.requestProjectSubNo }"
											class="btn btn-outline-info"
											style="font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;">자세히
											보기</a>
									</c:when>
									<c:otherwise>
										<a href="/gosuProject.do?rpsNo=${grl.requestProjectSubNo }"
											class="btn btn-info"
											style="font-weight: 900; box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;">자세히
											보기</a>
									</c:otherwise>
								</c:choose></td>
						</tr>

					</table>
	</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>

	</div>
	</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>