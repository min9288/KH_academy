<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>
.container * {
	text-decoration: none;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	color: black;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.gosu-content-wrap {
	width: 900px;
}

.gosu {
	display: flex;
	justify-content: center;
}

.gosu img {
	border-radius: 50%;
}

.gosu td {
	width: 500px;
	font-weight: bold;
	font-size: 35px;
}

.gosu td>span {
	color: rgb(78, 205, 196);
}

.gosu-photos ul li {
	list-style-type: none;
	margin: 10px;
}

.gosu-photos ul li img {
	width: 100px;
	height: 100px;
}

.container>div>div>div {
	margin-top: 100px;
	margin-bottom: 200px;
}

.container>div>div>div>div a {
	padding: 10px;
	width: 150px;
	margin-top: 30px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	margin: 10px;
	font-size: 12px;
}

.review-avg table td {
	padding: 10px;
}

.g-photo-one button {
	border: none;
	background-color: transparent;
}

#gProject {
	padding: 0;
}

.g-photo-one * {
	width: 200px;
}

.g-photo-one {
	padding: 10px;
	box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);
}

.g-photo-one img {
	height: 200px;
}

.g-photo-one .g-b {
	height: 30px;
	overflow: hidden;
	display: block;
	text-overflow: ellipsis;
	text-align: center;
}

.g-photo-one .g-p {
	text-align: center;
	display: block;
	height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.g-photo-wrap {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
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

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

.hrm-content img {
	width: 80%;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

#hrm-modal h3 {
	background-color: #78c2ad;
	padding: 30px;
	font-weight: 900;
	text-align: center;
}

#hrm-modal {
	background-color: white;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.hrm-content b {
	font-size: 20px;
	margin-right: 50px;
	margin-bottom: 100px;
	margin-left: 50px;
}

.hrm-content textarea {
	width: 800px;
	padding: 10px;
}

.hrm-content input {
	padding: 10px;
	margin-bottom: 50px;
	width: 800px;
}

#gimage_container {
	text-align: center;
}

#gimage_container img {
	width: 300px;
}

.gphs {
	display: flex;
	justify-content: center;
}

.gosu-photos ul {
	flex-wrap: wrap;
	display: flex;
	width: 800px;
	margin: 0 auto;
}

.g-style {
	text-align: center;
	margin: 10px;
	padding: 30px;
	display: flex;
	justify-content: center;
}

.gphs ul {
	padding: 0;
}

.gphs img {
	height: 120px;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: gray;
	position: fixed;
	z-index: 10000;
	background: rgba(0, 0, 0, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}

.upbtn>button {
	box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);
}

.upbtn:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
}
</style>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다!
		</h4>
		<div style="text-align: right; margin-top: 50px;">
			<span style="color: gray;">${gosu.gosuDate}</span>
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="gosu-content-wrap">
				<div class="gosu">
					<table>
						<tr>

							<c:if test="${empty gosu.gosuImg }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="/resources/img/gosu/g_img_basic.png"
									style="width: 250px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);"></th>
							</c:if>
							<c:if test="${not empty gosu.gosuImg }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="/resources/upload/member/${gosu.gosuImg }"
									style="width: 250px; height: 250px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%);"></th>
							</c:if>
						</tr>
						<tr>
							<td><span>고수</span> ${gosu.gosuId }</td>
						</tr>
						<tr>
							<td
								style="font-size: 25px; box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%); padding: 10px;">${gosu.gosuTitle }</td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td style="color: rgb(78, 205, 196);">한 줄 소개</td>
						</tr>
						<tr>
							<td style="font-size: 20px;">${gosu.gosuSelf }</td>
						</tr>
					</table>
				</div>
				<div>
					<h4>상세설명</h4>
					<div style="overflow: auto;">
						<p>${gosu.gosuExplainBr }</p>
					</div>

				</div>

				<div class="gosu-photos">
					<h4>사진</h4>
					<div class="gphs">
						<ul>
							<c:forEach items="${gphotoList }" var="gph" varStatus="i">

								<li
									style="box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%); height: 120px; line-height: 120px;"><a><img
										src="${gph.photoFilepath }"></a></li>
							</c:forEach>
						</ul>
					</div>

				</div>

				<div class="gosu-review">
					<h4>리뷰</h4>
					<div class="review-wrap">
						<c:choose>
							<c:when test="${empty greviewList }">
							작성된 리뷰가 아직 없습니다!
						</c:when>
							<c:otherwise>

								<div>
									<div class="review-avg">
										<table>
											<tr>
												<td rowspan="3" style="font-size: 40px; font-weight: bold;">${grAVG.reviewAvg }점</td>
											</tr>
											<tr>
												<td><c:choose>
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


													</c:choose></td>
											</tr>
											<tr>
												<td style="font-size: small;">${grAVG.reviewCount }개의
													리뷰</td>
											</tr>
										</table>
									</div>


									<hr>

									<c:forEach items="${greviewList }" var="grl" varStatus="i">
										<div class="review-one">
											<ul>
												<li>${grl.writer }</li>
												<li><span
													style="float: left; font-size: small; margin-right: 5px;">${grl.reviewNum}
														점</span> <c:if test="${grl.reviewNum eq 1 }">
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
												<li>${grl.reviewDate }</li>

											</ul>
											<br>
											<div>
												<p
													style="padding: 5px; padding-left: 50px; padding-right: 30px;">${grl.reviewContent}</p>
											</div>
										</div>
									</c:forEach>
								</div>

							</c:otherwise>
						</c:choose>


					</div>
				</div>

				<div class="gosu-review">
					<h4>개발후기</h4>
					<c:choose>
						<c:when test="${empty grrList }">
							작성된 후기가 아직 없습니다!
						</c:when>
						<c:otherwise>
							<div class="review-wrap">
								<div>
									<div class="review-avg">
										<span style="font-size: 30px; font-weight: bold;">${grrCount}개의
											후기</span>
									</div>
									<hr>
									<c:forEach items="${grrList }" var="grl" varStatus="i">
										<div class="review-one">
											<ul>
												<li style="font-weight: 900;">${grl.memberId }</li>
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

				</div>

				<div class="gosu-act">
					<h4>활동 및 자격</h4>
					<div style="overflow: auto;">
						<p>${gosu.gosuActBr }</p>
					</div>
				</div>
				<div class="gosu-project">
					<h4>프로젝트</h4>
					<div class="g-photo-wrap">
						<c:forEach items="${gprojectList }" var="gpr" varStatus="i">
							<div class="g-photo-one">
								<button type="button" id="gProject"
									onclick="pAjax(${gpr.gprojectNo});">
									<dl style="margin: 0;">
										<dt>
											<img src="${gpr.gprojectFilepath }">
										</dt>
										<dd>
											<b class="g-b" style="font-size: 19px;">${gpr.gprojectContent }</b>
										</dd>
										<dd>
											<p class="g-p" style="margin: 0;">${gpr.gprojectTitle }</p>
										</dd>
									</dl>
								</button>
							</div>
						</c:forEach>
					</div>

				</div>
				
				<div class="hrm-wrap" style="display: none; margin: 0;">
					<div id="hrm-modal">
						<h3 style="color: white;">프로젝트</h3>
						<div class="hrm-content">
							<div style="margin-top: 30px;">
								<b>메인사진</b>
							</div>
							<br>
							<div class="g-style">
								<img id="gprojectFilepath" style="width: 600px;">
							</div>
							<br> <b>제목</b><br>
							<div class="g-style">
								<p id="gprojectTitle"
									style="width: 500px; font-size: 25px; font-weight: 900; color: #56cc9d;"></p>
							</div>
							<br> <b>내용</b><br>
							<div class="g-style">
								<p id="gprojectContent" style="width: 500px; text-align: left;"></p>
							</div>

							<br>
						</div>
						<div class="hrm-btn-wrap">
							<a id="hrm-close" class="btn btn-outline-success upbtn">확인</a>
						</div>
					</div>
				</div>
			<c:if test="${not empty gnList }">
			<div>
				<h4><span class="text-success">${gosu.gosuId }</span>&nbsp;님이 작성한 노하우</h4>
				<table
					style="box-shadow: 0px 0 15px 0px rgb(0 0 0/ 15%); width: 100%">

					<c:forEach items="${gnList }" var="gnl" varStatus="i">
						
						<tr>
							<th
								style="text-align: center; padding: 20px;width:150px; font-size: 25px; font-weight: 900; "
								class="text-primary">${i.count }</th>
							<td style="text-align: center; padding: 20px;"><img
								src="${gnl.gnoticePhoto }"
								style="width: 100px; height: 100px; border-radius: 20px;"></td>
							<td style="padding: 20px; font-size: 20px;"><a href="/gosuNoticeContent.do?gnn=${gnl.gnoticeNo }">${gnl.gnoticeTitlePlus }</a></td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
				</c:if>
			<div class="gosu-feedback">

					<h4>
						<span style="margin-right: 100px;">피드백 비용 </span> <span
							style="color: red; font-size: 40px;">${gosu.gosuCost }
							&nbsp; &nbsp;</span>원
					</h4>

				</div>
	
			</div>
			
		</div>
		
		<div
			style="display: flex; justify-content: center; margin-bottom: 100px;">
			<c:if test="${not empty sessionScope.m.memberNo }">
				<c:if test="${sessionScope.m.memberNo ne gosu.gsouNo}">
					<a href="/gosuFeedback.do?ggNo=${gosu.ggsouNo }"
						class="btn btn-primary upbtn"
						style="width: 200px; margin: 100px; padding: 10px;"><b>피드백
							신청하기</b> </a>

				</c:if>

			</c:if>
			<a class="btn btn-info upbtn"
				style="width: 200px; margin: 100px; padding: 10px;"
				onclick="history.back();">뒤로가기</a>
		</div>
		<div class='bigPictureWrapper'>
			<div class='bigPicture'></div>
		</div>
	</div>
	<script>
	$(document).ready(function (e){
			$(document).on("click",".gphs img",function(){
				var path = $(this).attr('src')
				showImage(path);
			});//end click event
			
			function showImage(fileCallPath){
			    
			    $(".bigPictureWrapper").css("display","flex").show();
			    $('body').css("overflow", "hidden");
			    $('.bigPicture').css("overflow", "scroll");
			    $(".bigPicture")
			    .html("<img src='"+fileCallPath+"' >")
			    .animate({width:'100%', height: '100%'}, 0);
			    
			  }//end fileCallPath
			  
			$(".bigPictureWrapper").on("click", function(e){
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 0);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 10);
			    $('body').css("overflow", "scroll");
			  });//end bigWrapperClick event
			$(".bigPictureWrapper").on("click", function(e){
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 0);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 10);
			    $('body').css("overflow", "scroll");
			  });
		});
		$("#hrm-close").click(function() {

			$(".hrm-wrap").css("display", "none");
			$('body').css("overflow", "scroll");

		});
		function pAjax(pNo) {
			 $.ajax({
					url : "/gpAjax.do"
					, type : "post"
					, data : {"pNo":pNo}
					, success : function(data) {
						$("#gprojectTitle").empty();
						$("#gprojectContent").empty();
						$("#gprojectTitle").append(data.gprojectContent);
						$("#gprojectContent").append(data.gprojectTitleBr);
						$("#gprojectFilepath").attr("src", data.gprojectFilepath);
						$('body').css("overflow", "hidden");
						$('.hrm-wrap').css("overflow", "scroll");
						$(".hrm-wrap").css("display", "flex");
						
					}
			 });
		}
		
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>