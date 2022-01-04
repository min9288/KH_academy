<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고수의 노하우</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container>h1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.container {
	min-width: 1200px;
	margin-bottom: 200px;
}

.container>.g-msg {
	margin: 50px;
	display: flex;
	justify-content: center;
	color: rgb(153, 153, 153);
	text-align: center;
	font-size: 13px;
	font-weight: bold;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	text-align: right;
	font-weight: bold;
	margin: 20px;
}

.container .g-plus:hover {
	color: rgb(144, 209, 180);
}

.gosu {
	display: flex;
	justify-content: center;
	margin: 70px;
}

.gosu table {
	width: 100%;
}

.gosu>button {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}
.gosu>button:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
	
.gosu img {
	text-align: center;
	width: 200px;
}

.gosu li {
	list-style-type: none;
}

.gosu td {
	padding: 10px;
	padding-right: 30px;
	padding-left: 30px;
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
}

.gosu hr {
	max-width: 100%;
	font-weight: bold;
	background-color: black;
	height: 3px;
}

.gosu-person-wrap {
	margin-top: 50px;
	margin-bottom: 50px;
	background-color: rgb(223, 245, 235);
	left: 0;
	padding: 50px;
	overflow: hidden;
}

.gtitle {
	font-size: 30px;
	font-weight: 900;
}

.gtitle:hover, .underhover:hover, .underhover2:hover {
	color: #78c2ad;
}

.underhover:hover {
	cursor: pointer;
}

.gosu-person>h3, .gosu-notice>h3, .gosu-status>h3 {
	font-size: 30px;
	font-weight: 900;
	margin-left: 40px;
}

.gosu-one {
	text-align: center;
	font-weight: bold;
}

.gosu-one img {
	width: 225px;
	height: 225px;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.gosu-one img:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
.gosu button:hover {
	background-color: rgb(223, 245, 235);
}

.g-act {
	display: flex;
	justify-content: right;
	color: gray;
	text-align: right;
	font-weight: bold;
	margin: 20px;
}

.g-gall {
	width: 100%;
	display: flex;
	justify-content: center;
}

ul#gallery {
	display: flex;
	flex-wrap: wrap;
	margin-top: 30px;
	list-style: none;
	padding: 0;
	margin: 0 auto;
	width: 1140px;
}

ul#gallery>a>li {
	position: relative;
	width: 300px;
	height: 300px;
	margin: 40px;
	overflow: hidden;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

ul#gallery>a>li:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
ul#gallery>a>li::after {
	box-sizing: border-box;
	position: absolute;
	display: block;
	top: 50%;
	left: 50%;
	width: 87%;
	height: 87%;
	padding-top: 80px;
	transform: translate(-50%, -50%);
	text-align: center;
	transition: 0.4s;
}

ul#gallery>a>li>img {
	width: 100%;
	height: 100%;
	transition: 0.4s ease-in-out;
}

ul#gallery>a>li:hover img {
	transform: scale(1.18);
}

.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.container .active, .container .dot:hover {
	background-color: rgb(78, 205, 196);
}

.gosu-status {
	margin-top: 100px;
	padding: 50px;
}

.gosu-status hr {
	margin-bottom: 80px;
}

.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
.g-status-border {
	border: 1px solid #78c2ad;
	border-radius: 30px;
	padding: 40px;
}

.g-status-border>h4 {
	font-size: 30px;
	font-weight: 900;
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 40px;
}

.g-statusContent {
	display: flex;
	width: 1100px;
	margin: 0 auto;
	flex-wrap: wrap;
}

.g-statusContent>a {
	width: 350px;
	margin-right: 100px;
	margin-left: 100px;
	margin-bottom: 50px;
	margin-top: 50px;
	border-width: 2px;
}

.g-statusContent .g-sc-tbl * {
	padding-left: 30px;
	padding-right: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 16px;
}

.g-sc-tbl:hover {
	border: 1px solid #78c2ad;
}

.g-statusContent button {
	border: none;
	background-color: transparent;
}

.g-sc-tbl td, .g-sc-tbl td>a {
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
}

.g-sc-tbl {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.g-sc-tbl:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
.gosu-write-wrap {
	position: fixed;
	z-index: 1000;
	margin-left: 1200px;
}

.gosu-write {
	padding: 40px;
	text-align: center;
	justify-content: right;
	background-color: white;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
.gosu-write a {
	margin-top: 20px;
	padding: 10px;
	width: 200px;
}

.gosu-write * {
	font-weight: bold;
	line-height: 30px;
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

.gosuIntro {
	height: 100px;
	position: fixed;
	left: 0;
	margin-left: 40px;
	z-index: 1000;
}

.gosuIntro div a {
	color: #78c2ad;
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
	padding: 5px;
}

.gosuIntro div a:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
.gosuIntro div a:hover {
	color: #367463;
}

.gosuIntro div {
	font-weight: 900;
	animation: motion 0.3s linear 0s infinite alternate;
	height: 50px;
	font-size: small;
}

@keyframes motion { 0% {
	margin-top: 0px;}
100%{margin-top:5px;}}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosuIntro">
			<div>
				<a href="/gosuIntro.do">고수의 페이지가 어떤 곳인지 궁금하다면?</a>
			</div>
		</div>
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do?reqPage=1"> <c:if
						test="${ requestCount ne 0 }">
						<span>${ requestCount}</span>
					</c:if> 요청서
				</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do?reqPage=1"> <c:if
						test="${ costCount ne 0 }">
						<span>${ costCount}</span>
					</c:if> 견적서
				</a>
			</div>
		</c:if>
		<h1>
			<span style="color: rgb(78, 205, 196);">고수</span>의 노하우
		</h1>
		<div class="g-msg">
			고수에게 개발 요청서를 보내거나 <br> 작품에 대한 피드백을 받을 수 있습니다.<br>당신에게 맞는
			고수를 찾아보세요!
		</div>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-write-wrap ">
				<div class="gosu-write card border-light mb-3">
					<h5 style="font-size: 15px; color: #3c3c3c;">
						고수에게<br>개발을 요청하세요!
					</h5>
					<a href="/gosuRequest.do" class="btn btn-primary form-control upbtn"
						style="box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;">요청서
						작성하기</a>
				</div>
			</div>
		</c:if>
		<div class="g-plus">
			<a href="/gosuList.do?reqPage=1" style="color: rgb(78, 205, 196);">더보기</a>
		</div>
		<c:set var="i" value="0" />
		<c:set var="j" value="2" />
		<c:forEach items="${gList }" var="g">
			<c:if test="${i%j eq 0 }">
				<div class="gosu-wrap">
			</c:if>
			<a href="/gosuContent.do?gNo=${g.ggsouNo}">
				<div class="gosu">
					<button type="button" class="card border-primary mb-3"
						style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
						<table>
							<tr>
								<c:if test="${empty g.gosuImg }">
									<td rowspan="4" class="gosu_img"
										style="padding: 40px; text-align: center;"><img
										src="/resources/img/gosu/g_img_basic.png"
										style="border-radius: 50%; width: 200px; height: 200px;"></td>
								</c:if>
								<c:if test="${not empty g.gosuImg }">
									<td rowspan="4" style="padding: 40px; text-align: center;"><img
										src="/resources/upload/member/${g.gosuImg }"
										style="border-radius: 50%; width: 200px; height: 200px;"></td>
								</c:if>


								<td style="width: 600px;"><a
									href="/gosuContent.do?gNo=${g.ggsouNo}" class="gtitle">${g.gosuTitle }</a></td>
							</tr>
							<tr>
								<td><hr></td>
							</tr>
							<tr>

								<td>
									<li><b>한줄소개</b>&nbsp;&nbsp;${g.gosuSelf }</li>
								</td>
							</tr>
							<tr>
								<td>
									<li><b>비용</b>&nbsp;&nbsp;<b style="color: red;">
											${g.gosuCost }</b>&nbsp;원</li>
								</td>
							</tr>
							<tr>
								<td style="text-align: center; font-weight: bold;"><span
									style="color: rgb(78, 205, 196);">고수</span>&nbsp;&nbsp;${g.gosuId }</td>
								<td><c:if test="${empty g.reviewAvg  }">
										<span style="color: gray; font-size: small;">아직 등록된 리뷰가
											없습니다.</span>
									</c:if> <c:if test="${not empty g.reviewAvg }">
										<span>${g.reviewAvg } 점 &nbsp;&nbsp;</span>
										<c:choose>
											<c:when test="${g.reviewAvg eq 5}">
												<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
											</c:when>
											<c:when test="${g.reviewAvg >= 4}">
												<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
											</c:when>

											<c:when test="${g.reviewAvg >= 3}">
												<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
											</c:when>
											<c:when test="${g.reviewAvg >= 2}">
												<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
											</c:when>
											<c:when test="${g.reviewAvg >= 1}">
												<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
											</c:when>


										</c:choose>
									
									(${g.reviewCount }) 


								</c:if></td>
							</tr>
						</table>
					</button>
				</div>
			</a>
			<c:if test="${i%j eq j-1 }">
	</div>
	</c:if>
	<c:set var="i" value="${i+1 }" />
	</c:forEach>
	<c:if test="${fn:length(gList) % 2!=0}">
		<c:if test="${fn:length(gList) == i}">
	</div>
	</c:if>
	</c:if>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1); "></span> <span
			class="dot" onclick="currentSlide(2); "></span> <span class="dot"
			onclick="currentSlide(3); "></span>
	</div>
	<div class="gosu-person-wrap ">
		<div class="gosu-person ">
			<h3 style="margin-left: 0;">
				새로운 <span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다!
			</h3>
			<div class="g-act">
				활동 고수&nbsp;&nbsp;<span> ${gosuCount }</span>명
			</div>
			<div
				style="display: flex; justify-content: space-between; margin-top: 50px;">

				<c:forEach items="${newGosuList }" var="ngl" varStatus="i">

					<c:choose>
						<c:when test="${ngl.ggsouNo eq 0}">
							<a class="underhover">
						</c:when>
						<c:otherwise>
							<a href="/gosuContent.do?gNo=${ngl.ggsouNo}">
						</c:otherwise>
					</c:choose>

					<div class="gosu-one">
						<c:if test="${empty ngl.gosuImg }">
							<img src="/resources/img/member/user.png"
								style="border-radius: 50%;">
						</c:if>
						<c:if test="${not empty ngl.gosuImg }">
							<img src="/resources/upload/member/${ngl.gosuImg }"
								style="border-radius: 50%;">
						</c:if>

						<div style="margin-top: 20px;">
							<c:choose>
								<c:when test="${ngl.ggsouNo eq 0}">
									<a class="gtitle underhover" style="font-size: 15px;">${ngl.gosuId }</a>
								</c:when>
								<c:otherwise>
									<a href="/gosuContent.do?gNo=${ngl.ggsouNo}"
										class="gtitle underhover2" style="font-size: 15px;">${ngl.gosuId }</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="gosu-notice">

		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
		</h3>
		<div class="g-plus">
			<a href="/gosuNoticeList.do?reqPage=1"
				style="color: rgb(78, 205, 196);">더보기</a>
		</div>
		<div class="g-gall">
			<ul id="gallery">
				<c:forEach items="${gNoticeList }" var="gnl" varStatus="i">

					<a href="/gosuNoticeContent.do?gnn=${gnl.gnoticeNo }"><li
						style="border-radius: 10px;"><img src="${gnl.gnoticePhoto }"></li></a>
				</c:forEach>

			</ul>
		</div>

	</div>
	<c:if test="${not empty sessionScope.m }">
		<div class="gosu-status">
			<hr>
			<h3 style="text-align: center;">나의 현황</h3>
			<div class="g-plus">
				<a href="/gosuSituation.do" style="color: rgb(78, 205, 196);">자세히
					보기</a>
			</div>
			<div class="g-status-border">
				<h4 style="margin-top: 40px;">신청한 <span class="text-success">피드백</span> 내역</h4>
				<div class="g-statusContent">
					<c:choose>
						<c:when test="${not empty gosuTalkList }">
							<c:forEach items="${gosuTalkList }" var="gtl" varStatus="i">
								<a href="/gosuTalk.do?fbNo=${gtl.feedbackNo }">
									<table class="g-sc-tbl card bg-light mb-3">
										<tr>
											<th colspan="2" style="text-align: right; padding-right: 0;">
												<c:if test="${gtl.feedbackNum eq 1 }">
													<span style="color: blue; padding-right: 0;">진행 전</span>
												</c:if> <c:if test="${gtl.feedbackNum eq 2 }">
													<span style="color: red; padding-right: 0;">진행 중</span>
												</c:if> <c:if test="${gtl.feedbackNum eq 3 }">
													<span style="color: gray; padding-right: 0;">진행 완료</span>
												</c:if>
											</th>
										</tr>
										<tr class="card-header">
											<th style="color: #78c2ad;">고수</th>
											<td style="width: 197px;">${gtl.gosuIdPlus }</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>${gtl.feedbackTitlePlus }</td>
										</tr>
									</table>
								</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span style="margin: 100px;">아직 신청한 내역이 없습니다!</span>
						</c:otherwise>
					</c:choose>

				</div>

				<c:if test="${sessionScope.m.memberType eq 2}">
					<h4>신청받은 <span class="text-success">피드백</span> 내역</h4>
					<div class="g-statusContent">
						<c:choose>
							<c:when test="${not empty gosuTalkList2 }">
								<c:forEach items="${gosuTalkList2 }" var="gtl" varStatus="i">
									<a href="/gosuTalk.do?fbNo=${gtl.feedbackNo }">
										<table class="g-sc-tbl card bg-light mb-3">
											<tr>
												<th colspan="2" style="text-align: right; padding-right: 0;">
													<c:if test="${gtl.feedbackNum eq 1 }">
														<span style="color: blue; padding-right: 0;">진행 전</span>
													</c:if> <c:if test="${gtl.feedbackNum eq 2 }">
														<span style="color: red; padding-right: 0;">진행 중</span>
													</c:if> <c:if test="${gtl.feedbackNum eq 3 }">
														<span style="color: gray; padding-right: 0;">진행 완료</span>
													</c:if>
												</th>
											</tr>
											<tr class="card-header">
												<th style="color: #78c2ad; width: 150px;">질문자</th>
												<td style="width: 177px;">${gtl.memberIdPlus }</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>${gtl.feedbackTitlePlus }</td>
											</tr>
										</table>
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span style="margin: 100px;">아직 신청받은 내역이 없습니다!</span>
							</c:otherwise>
						</c:choose>

					</div>
				</c:if>
				<hr style="margin-top: 80px;">
				<h4>
					<span style="color: rgb(78, 205, 196)">요청서</span>를 통한 <span
						style="color: rgb(78, 205, 196)">고수</span> 매칭
				</h4>
				<div class="g-statusContent">
					<c:choose>
						<c:when test="${empty grpsList }">
							<c:choose>
								<c:when test="${sessionScope.m.memberType eq 1}">
									<span style="margin: 100px;">요청서를 작성해보세요!</span>
								</c:when>
								<c:when test="${sessionScope.m.memberType eq 2}">
									<span style="margin: 100px;">상단의 요청서 버튼을 눌러 견적서를 보내보세요!</span>
								</c:when>
								<c:otherwise>

									<span style="margin: 100px; color: gray;">일반회원과 고수회원이
										이용할 수 있습니다.</span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:forEach items="${grpsList }" var="grpsl" varStatus="i">
								<a href="/gosuProject.do?rpsNo=${grpsl.requestProjectSubNo }">
									<table class="g-sc-tbl card border-light mb-3">
										<tboay style="min-width:342px;max-width:342px;">
										<tr class="card-body">
											<th colspan="2" style="text-align: right; padding: 0;">
												<c:if test="${grpsl.requestProjectSubNum eq 1 }">
													<span style="color: red; padding-right: 0;">개발 진행</span>
												</c:if> <c:if test="${grpsl.requestProjectSubNum eq 3 }">
													<span style="color: gray; padding-right: 0;">진행 완료</span>
												</c:if>
											</th>
										</tr>
										<tr class="card-header">
											<c:if test="${sessionScope.m.memberType eq 1 }">

												<th class="text-info">고수</th>
												<td style="width: 197px;"><span>${grpsl.gosuIdPlus }</span></td>
											</c:if>
											<c:if test="${sessionScope.m.memberType eq 2 }">

												<th class="text-info"style=" width: 150px;">질문자</th>
												<td style="width: 177px;"><span>${grpsl.requestWriterIdPlus }</span></td>
											</c:if>

										</tr>

										</tboay>
									</table>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
	</c:if>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(".underhover").click(function() {
			swal({
				title : '',
				text : "고수님께서 소개글을 작성하지 않았습니다!",
				icon : ''
			});
		});
		var slideIndex2 = 1;
		showSlides2(slideIndex2);

		function plusSlides(n) {
			showSlides2(slideIndex2 += n);
		}

		function currentSlide(n) {
			showSlides2(slideIndex2 = n);
		}

		function showSlides2(n) {
			var i;
			var slides = document.getElementsByClassName("gosu-wrap");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex2 = 1
			}
			if (n < 1) {
				slideIndex2 = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex2 - 1].style.display = "block";
			dots[slideIndex2 - 1].className += " active";
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>