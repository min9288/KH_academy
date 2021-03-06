<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
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
	font-size: 30px;
	padding:20px;
}

.con1>div>div>div table td {
	padding: 10px;
	text-align: center;
}

.con1>div>div>div table td>span {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
}

.con1>div>div>div table a {
	margin-top: 20px;
	width: 200px;
	margin-bottom: 20px;
}

.con1>div>div>div {
	border: 1px solid rgb(160, 160, 160);
	width: 400px;
	padding-left: 20px;
	padding-right: 20px;
	margin: 70px;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
	background-color: white;
}
.con1>div>div>div table a:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}

.con1>div>div {
	display: flex;
	flex-wrap: wrap;
}

.container>div>div>div table img {
	border-radius: 50%;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
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
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}
.g-margin>span{
	padding-left: 30px;
}
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container con1">
		
		<h1>?????? ??????</h1>
		<hr>
		<p style="margin-bottom: 100px; color: gray;">???????????? ?????? ????????? ???????????? ???
			????????????.</p>
		<div class="g-sa-wrap">
			<h4>????????? ????????? ??????</h4>
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
											style="color: blue;">?????? ???</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 2 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: red;">?????? ???</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 3 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: gray;">?????? ?????? &nbsp;&nbsp;
											
										<c:if test="${gtl.reviewNum eq 1 }">
										<span style="color:red;">?????? ?????? ??????</span>
										</c:if>
										<c:if test="${gtl.reviewNum eq 2 }">
										?????? ?????? ??????
										</c:if>	
											</b></td>
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
													style="margin-top: 0; font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);"
													href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-outline-primary">????????? ??????</a>
											</c:when>
											<c:otherwise>
												<a
													style="margin-top: 0; font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);"
													href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-primary">????????? ??????</a>
											</c:otherwise>
										</c:choose></td>
								</tr>

							</table>
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<span
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
					????????? ????????? ????????????.</span>
			</c:otherwise>
			</c:choose>
		</div>

		<c:if test="${sessionScope.m.memberType eq 2}">
			<h4>???????????? ????????? ??????</h4>
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
											style="color: blue;">?????? ???</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 2 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: red;">?????? ???</b></td>
									</c:if>
									<c:if test="${gtl.feedbackNum eq 3 }">
										<td style="text-align: left; padding-top: 20px;"><b
											style="color: gray;">?????? ??????</b></td>
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
													style="font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);">?????????
													??????</a>
											</c:when>
											<c:otherwise>
												<a href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
													class="btn btn-secondary"
													style="font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%)">?????????
													??????</a>
											</c:otherwise>
										</c:choose></td>
								</tr>

							</table>
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise>

				<span
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
					???????????? ????????? ????????????.</span>
			</c:otherwise>
			</c:choose>
	</div>
	</c:if>
	<h4>????????? ????????? ??????</h4>

	<c:choose>
		<c:when test="${not empty grList }">
			<c:forEach items="${grList }" var="grl" varStatus="i">
				<div style="display: flex; justify-content: center;">
					<div class="review-one" style="width: 80%; margin: 20px;">
						<ul>
							<li><b><span style="color: rgb(78, 205, 196);">
										?????? </span>${grl.gosuId }</b></li>
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
					style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
					???????????? ????????? ????????????.</span>
			</div>
		</c:otherwise>
	</c:choose>

	<c:if test="${sessionScope.m.memberType eq 1 }">
		<h4>????????? ?????? ?????? ??????</h4>

		<c:choose>
			<c:when test="${not empty grrList }">
				<c:forEach items="${grrList }" var="grl" varStatus="i">

					<div style="display: flex; justify-content: center;">
						<div class="review-one" style="width: 80%; margin: 20px;">
							<ul>
								<li><b><span style="color: rgb(78, 205, 196);">
											?????? </span>${grl.gosuId }</b></li>
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
						style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
						???????????? ????????? ????????????.</span>
				</div>
			</c:otherwise>
		</c:choose>


	</c:if>
	<hr style="margin-top: 100px;margin-bottom: 100px;">
	
	<h4 class="text-info">???????????? ?????? ?????? ??????</h4>
	<div class="g-margin">
		<c:choose>
			<c:when test="${empty grpsList }">
				<c:choose>
					<c:when test="${sessionScope.m.memberType eq 1}">
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">????????????
							??????????????????.</span>
					</c:when>
					<c:when test="${sessionScope.m.memberType eq 2}">
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">?????????
							????????? ????????? ?????? ???????????? ???????????????.</span>
					</c:when>
					<c:otherwise>
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">???????????????
							??????????????? ????????? ??? ????????????.</span>

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
									style="color: red;">?????? ??????</b></td>
							</c:if>
							<c:if test="${grl.requestProjectSubNum eq 3 }">
								<td style="text-align: left; padding-top: 20px;"><b
									style="color: gray;">?????? ?????? &nbsp;&nbsp;
										<c:if test="${sessionScope.m.memberType eq 1 }">
										<c:if test="${grl.reviewNum eq 1 }">
										<span style="color:red;">?????? ?????? ??????</span>
										</c:if>
										<c:if test="${grl.reviewNum eq 2 }">
										?????? ?????? ??????
										</c:if>	
									</c:if>
									</b></td>
							</c:if>
							<td style="padding-top: 20px;">${grl.requestProjectSubDate }</td>
						</tr>
						<tr>
							<td><c:if test="${sessionScope.m.memberType eq 1 }">
									<b><span style="color: rgb(78, 205, 196); font-size: 20px;">??????</span></b>

								</c:if> <c:if test="${sessionScope.m.memberType eq 2 }">
									<b><span style="color: rgb(78, 205, 196); font-size: 20px;">?????????</span></b>
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
											style="font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);">?????????
											??????</a>
									</c:when>
									<c:otherwise>
										<a href="/gosuProject.do?rpsNo=${grl.requestProjectSubNo }"
											class="btn btn-info"
											style="font-weight: 900; box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);">?????????
											??????</a>
									</c:otherwise>
								</c:choose></td>
						</tr>

					</table>
	</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>

	</div>
		<c:if test="${sessionScope.m.memberType eq 2 }">
			<hr style="margin-bottom: 100px;margin-top: 100px;">
				<h4 class="text-success">??????????????? ?????? ??????</h4>
					<c:choose>
						<c:when test="${empty greviewList }">
							<div class="g-margin">
							<c:if test="${ggosuNoEmpty eq 0 }">
							<span
						style="font-size: 30px;font-weight:900; width:100%; text-align:center;padding-left:0; margin-top: 50px; margin-bottom: 50px;" class="text-danger">
						?????? ?????? ???????????? ???????????????!<br>
						?????? ?????? ???????????? ???????????? ?????? ????????? ????????????!</span>
							</c:if>
							<c:if test="${ggosuNoEmpty ne 0 }">
							<span
						style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
						????????? ????????? ????????????.</span>
							</c:if>
						</div>
						</c:when>
						<c:otherwise>
							<div style="display: flex;justify-content: center;">
							<div style="width: 1080px;margin: 0;padding: 40px;">
								<div class="review-avg" >
									<table>
										<tr style="width: 100px;">
											<td rowspan="3" style="font-size: 40px; font-weight: bold;"><span style="color:red;">${grAVG.reviewAvg }<span style="color:black;">&nbsp;???</span> </span></td>
										</tr>
										<tr>
											<td  style="padding-bottom: 0;"><c:choose>
													<c:when test="${grAVG.reviewAvg eq 5}">
														<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
													</c:when>
													<c:when test="${grAVG.reviewAvg eq 4}">
														<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
													</c:when>

													<c:when test="${grAVG.reviewAvg eq 3}">
														<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
													</c:when>
													<c:when test="${grAVG.reviewAvg eq 2}">
														<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
													</c:when>
													<c:when test="${grAVG.reviewAvg eq 1}">
														<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
													</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="font-size: small;text-align: left;padding-top: 0;">${grAVG.reviewCount } ?????? ??????</td>
										</tr>
									</table>
								</div>
								<hr>
								<c:forEach items="${greviewList }" var="grl" varStatus="i">
									<div class="review-one">
										<ul>
											<li class="text-info" style="font-weight: 900;">${grl.writer }</li>
											<li><span
												style="float: left; font-size: small; margin-right: 5px;line-height: 25px;">${grl.reviewNum}
													???</span> <c:if test="${grl.reviewNum eq 1 }">
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
											<li style="color: gray;">${grl.reviewDate }</li>

										</ul>
										<br>
										<div>
											<p
												style="padding: 5px; padding-left: 50px; padding-right: 30px;">${grl.reviewContent}</p>
										</div>
									</div>
								</c:forEach>
							</div>
</div>
						</c:otherwise>
					</c:choose>



				<h4 class="text-success">?????? ???????????? ?????? ??????</h4>
				<c:choose>
					<c:when test="${empty grrList2 }">
						<div class="g-margin">
					<span
						style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">
						????????? ????????? ????????????.</span>
				</div>
						</c:when>
					<c:otherwise>
						<div style="display: flex;justify-content: center;">
							<div style="width: 1080px;margin: 0;padding: 40px;">
								<div class="review-avg">
									<span style="font-size: 30px; font-weight: bold;padding-left: 20px;"><span style="color:blue;">${grrCount}</span>&nbsp;??????
										??????</span>
								</div>
								<hr>
								<c:forEach items="${grrList2 }" var="grl" varStatus="i">
									<div class="review-one">
										<ul>
											<li class="text-info" style="font-weight: 900;">${grl.memberId }</li>
											<li style="color: gray;">${grl.requestReviewDate }</li>
										</ul>
										<br>
										<div>
											<p
												style="padding: 5px; padding-left: 50px; padding-right: 30px;">
												${grl.requestReviewContent }</p>
										</div>
									</div>
								</c:forEach>

							</div>

					</div>
					</c:otherwise>
				</c:choose>

			
		</c:if>
	</div>
	</div>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>