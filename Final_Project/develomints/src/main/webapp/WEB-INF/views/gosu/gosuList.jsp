<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int itest = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
	margin-bottom: 100px;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
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

.gosu {
	display: flex;
	justify-content: center;
	margin-bottom: 70px;
}

.gosu>button {
	box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
}

.gosu:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}

.upbtn:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
btn-primary:hover {
-webkit-transform: scale(1.03);
    transform: scale(1.03);
}
.gosu table {
	width: 100%;
}

.gosu img {
	text-align: center;
	width: 200px;
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

.gosu-search {
	display: flex;
	justify-content: right;
	margin-top: 50px;
	margin-bottom: 50px;
}

.gosu-search * {
	padding: 10px;
}

.gosu-search input {
	width: 350px;
}

.gosu button:hover {
	background-color: rgb(223, 245, 235);
}

#pageNavi {
	display: flex;
	justify-content: center;
}

.gosu-write-wrap {
	position: fixed;
	z-index: 1000;
	margin-left: 1200px;
}

.gosu-write {
		box-shadow: 0px 0 15px 0px rgb(0 0 0 / 15%);
	padding: 40px;
	text-align: center;
	justify-content: right;
	background-color: white;
}
.gosu-write a {
	margin-top: 20px;
	padding: 10px;
	width: 200px;
}

.gosu li {
	list-style-type: none;
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

.gtitle {
	font-size: 30px;
	font-weight: 900;
}

.talk-sub {
	display: flex;
	justify-content: center;
}
.op-st:focus{outline:none;}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다
		</h3>
		<div class="g-msg">
			고수에게 피드백을 신청해보세요!<br> 당신의 작품을 평가해줍니다. 마음껏 질문하세요!
		</div>

	
		<div class="gosu-search">
			<input type="text" id="search-content" placeholder="내용을 입력해주세요" class="form-control">
			<select name="type" class="nav-link dropdown-toggle op-st" style="border:1px solid #78c2ad;border-radius: 10px;">
				<option class="dropdown-item" value="" selected disabled hidden>선택</option>
				<option class="dropdown-item" value="title" style="color:#78c2ad;">제목</option>
				<option class="dropdown-item" value="content" style="color:#78c2ad;">내용</option>
			</select>
			<button type="button" class="btn btn-primary form-control" 
				style="padding: 7px; margin-left: 15px; width: 50px;"
				onclick="getSearchList();">검색</button>
		</div>
		<c:if test="${sessionScope.m.memberType eq 2}">

			<c:forEach items="${gList2 }" var="g" varStatus="i">
				<c:if test="${g.gsouNo eq sessionScope.m.memberNo  }">
					<%
						itest++;
					%>

				</c:if>

			</c:forEach>
			<%
				if (itest == 0) {
			%>
			<div class="gosu-write-wrap">
				<div class="gosu-write card border-light mb-3">
					<h5 style="font-size: 15px; color: #3c3c3c;">
						고수님의 능력을<br> 마음껏 펼쳐주세요!
					</h5>
					<a href="/gosuWriteFrm.do" class="btn btn-primary form-control upbtn" style="
		box-shadow: rgba(0, 0, 0, 0.4) 1PX 1PX 1PX 1PX;"
						>작성하기</a>
				</div>
			</div>
			<%
				}
			%>

		</c:if>

		<div class="gosu-wrap">
			<c:choose>
				<c:when test="${empty gList }">


					<div class="talk-sub" style="margin-bottom: 100px;">
						<div style="text-align: center;">
							<img src="/resources/img/member/user.png"
								style="border-radius: 50%; width: 70px; margin-top: 70px;">
							<h2 style="font-weight: 900; color: #cacaca; margin: 30px;">게시글을
								찾을 수 없습니다.</h2>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<c:forEach items="${gList }" var="g" varStatus="i">
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


										<td style="width: 750px;"><a
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
											<li><b>비용</b>&nbsp;&nbsp;<b style="color: red;"> ${g.gosuCost }</b>&nbsp;원</li>
										</td>
									</tr>
									<tr>
										<td style="text-align: center; font-weight: bold;"><span
											style="color: rgb(78, 205, 196);">고수</span> ${g.gosuId }</td>
										<td><c:if test="${empty g.reviewAvg }">
												<span style="color: gray; font-size: small;">아직 등록된
													리뷰가 없습니다.</span>
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
													<c:when test="${g.reviewAvg>= 1}">
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
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</div>
		<div id="pageNavi">${pageNavi }</div>
	</div>
	<script>
		function getSearchList() {

			var searchContent = $("input[id=search-content]").val();
			var type = $("select[name=type]").val();

			location.href = "/gosuList2.do?reqPage=1&keyword=" + searchContent
					+ "&type=" + type;
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>