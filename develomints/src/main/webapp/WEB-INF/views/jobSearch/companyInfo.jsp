<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소개</title>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0b0a9f222f0ab356e278f15c5fdc64&libraries=services"></script>
</head>
<style>
.contain {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

.companyInfoHeader {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
	display: flex;
	justify-content: center;
}

.companyImg {
	display: inline-block;
	line-height: 32px;
}

.companyImg>img {
	width: 120px;
	height: 36px;
}

.companyTitle {
	display: inline-block;
	margin-left: 15px;
	font-size: 24px;
	font-weight: 900;
}

.companyTitle>p {
	margin-bottom: 0px;
}

.intro {
	margin-left: 20px;
	color: rgb(78, 205, 196);
	font-weight: 900;
}

.announce>p {
	font-size: 11px;
	margin-left: 30px;
}

.announceBox {
	width: 800px;
	margin: 0 auto;
	padding: 20px;
	padding-left: 35px;
	border: 1px solid rgb(108, 108, 108);
}

.status {
	display: inline-block;
}

.status>p {
	display: inline-block;
	width: 70px;
	color: white;
	padding: 3px 5px;
	background-color: rgb(78, 205, 196);
	text-align: center;
}

.companyName, .companyName>p {
	display: inline-block;
	font-size: 14px;
	color: blue;
	margin-left: 10px;
	position: relative;
	top: -1px;
}
em {
	font-style: normal;
	font-weight: 900;
	font-size: 20px;
	margin-bottom: 15px;
}
b {
	font-style: normal;
	font-weight: 900;
	font-size: 20px;
	margin-bottom: 15px;
	margin: 30px 0px;
	display: block;
}

.resumeInfo1 {
	margin-bottom: 0;
}

.resumeInfo1, .resumeInfo2 {
	width: 900px;
	overflow: hidden;
}

.resumeInfo1>li, .resumeInfo2>li {
	color: rgb(158, 158, 158);
	list-style: none;
	overflow: hidden;
}

.resumeInfo1>li>div, .resumeInfo2>li>div {
	float: left;
}

.resumeInfoImg {
	width: 40px;
}

.resumeInfoImg>img {
	width: 20px;
}

.resumeInfoData {
	margin-left: 30px;
}

.money, .career {
	width: 280px;
	display: inline-block;
}

.workForm {
	width: 280px;
	display: inline-block;
}

.workPlace {
	width: 280px;
	display: inline-block;
}

.announceTitle {
	margin-left: 20px;
	margin-bottom: 15px;
}

.announceTitle>a {
	text-decoration: none;
	font-size: 24px;
	font-weight: 900;
	color: black;
}

.announcing {
	font-size: 13px;
	background-color: rgb(78, 205, 196);
	color: white;
	border-radius: 10px;
	margin-left: 30px;
	width: 70px;
	text-align: center;
	padding: 3px 5px;
}
.announce{
	overflow: hidden;
	
}
.info{
	overflow: hidden;
	float: left;
	list-style: none;
}
.info>li{
	height: 50px;
}
.info1{
	color: #888888;
}
.info2{
	margin-left: 30px;
	color: #222222;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<div class="companyInfoHeader">
			<div class="companyImg">
				<!-- 공고 1개만 가능하면 걍 두고 여러개 가능하면 forEach로 여러개 해줘야댐 -->
				${com.filepath }
			</div>
			<div class="companyTitle">
				<p>${com.companyName }</p>
			</div>
		</div>
		<div class="intro">
			<p>기업소개</p>
		</div>
		<hr>
		<div class="announce">
			<c:choose>
				<c:when test="${empty com }">
					<div class="emptyResume">
						<p>등록된 채용공고가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>

					<p class="announcing">채용중 공고</p>
					<div class="announceBox">
						<%-- <c:choose>
					<c:when test="${현재날짜 > a.endDate }" var="a">	<!-- 현재날짜보다 길면 모집마감으로 변경 이거 어캐하지 -->
						<p>모집마감</p>
					</c:when>
					<c:otherwise>
						<div class="status">
							<p>모집중</p>
						</div>
					</c:otherwise>
				</c:choose> --%>
						<div class="status">
							<p>모집중</p>
						</div>

						<div class="companyName">
							<p>${com.companyName }</p>
							<i
								style="color: #999999; font-style: normal; margin-left: 15px; font-size: 12px;">${com.writeDate }</i>
						</div>
						<div class="announceTitle">
							<a href="/announceView.do?announceNo=${com.announceNo }">${com.announceTitle }</a>
						</div>

						<ul class="resumeInfo1">
							<li class="career">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/career.PNG"
										style="height: 22px; margin-left: 2px;">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">경력 : </em>
									<c:if test="${com.career eq 1 }">
										<!-- 1 -> 신입 -->
										<span>신입</span>
									</c:if>
									<c:if test="${com.career eq 2 }">
										<!-- 2 -> 경력 -->
										<span>경력</span>
									</c:if>
								</div>
							</li>
							<li class="money">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workPlace.png">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">희망지역 : </em>
									<c:if test="${com.workPlace eq 1 }">
										<span>서울</span>
									</c:if>
									<c:if test="${com.workPlace eq 2 }">
										<span>경기</span>
									</c:if>
									<c:if test="${com.workPlace eq 3 }">
										<span>인천</span>
									</c:if>
									<c:if test="${com.workPlace eq 4 }">
										<span>강원</span>
									</c:if>
									<c:if test="${com.workPlace eq 5 }">
										<span>충남</span>
									</c:if>
									<c:if test="${com.workPlace eq 6 }">
										<span>충북</span>
									</c:if>
									<c:if test="${com.workPlace eq 7 }">
										<span>경북</span>
									</c:if>
									<c:if test="${com.workPlace eq 8 }">
										<span>부산</span>
									</c:if>
									<c:if test="${com.workPlace eq 9 }">
										<span>경남</span>
									</c:if>
									<c:if test="${com.workPlace eq 10 }">
										<span>전북</span>
									</c:if>
									<c:if test="${com.workPlace eq 11 }">
										<span>전남</span>
									</c:if>
									<c:if test="${com.workPlace eq 12 }">
										<span>제주</span>
									</c:if>
								</div>
							</li>
						</ul>
						<ul class="resumeInfo2">
							<li class="workPlace">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/school.PNG"
										style="width: 18px; height: 23px; margin-left: 2px;">
								</div>
								<div class="resumeInfoData">
									<em style="font-size: 16px; font-weight: normal;">학력 : </em>
									<c:if test="${com.school eq 1 }">
										<span>초졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 2 }">
										<span>중졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 3 }">
										<span>고졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 4 }">
										<span>대졸 이상</span>
									</c:if>
									<c:if test="${com.school eq 5 }">
										<span>학력무관</span>
									</c:if>
								</div>
							</li>
							<li class="workForm">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workFromWhite.PNG">
								</div>
								<div class="resumeInfoData">
									<!-- r.resumeWorkForm -->
									<em style="font-size: 16px; font-weight: normal;">희망 근무형태 : </em>
									<c:if test="${com.workForm eq 1 }">
										<!-- 1 -> 정규직 -->
										<span>정규직</span>
									</c:if>
									<c:if test="${com.workForm eq 2 }">
										<!-- 2 -> 계약직 -->
										<span>계약직</span>
									</c:if>
									<c:if test="${com.workForm eq 3 }">
										<!-- 3 -> 아르바이트 -->
										<span>아르바이트</span>
									</c:if>
									<c:if test="${com.workForm eq 4 }">
										<!-- 4 -> 인턴 -->
										<span>인턴</span>
									</c:if>
									<c:if test="${com.workForm eq 5 }">
										<!-- 5 -> 프리랜서 -->
										<span>프리랜서</span>
									</c:if>
								</div>
							</li>
						</ul>
					</div>
					<b>기업개요</b>
					<!-- 사진같은거 넣을지말지 고민좀 -->
					<ul class="info info1">
						<li>업종</li>
						<li>대표자명</li>
						<li>홈페이지</li>
						<li>사업내용</li>
						<li>기업주소</li>
					</ul>
					<ul class="info info2">
						<li>${com.category }</li>
						<li>${com.ceo }</li>
						<li><a href="#" style="text-decoration: none; color: #222222;">http://www.homepage.co.kr</a></li>
						<li>내용내용</li>
						<li style="height: 400px;">
							${com.address }<br>
						<div id="map" style="width:500px;height:400px; margin-top: 30px;"></div>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		
		<br><br>
		<hr>
		<p>회사에 대한 댓글을 남겨주세요!</p>
		<%--댓글 입력 창(로그인했을 때 띄우기) --%>
		<c:if test="${not empty sessionScope.m.memberId }">
			<form action="/insertCompanyComment.do" method="post">
				<div class="commentBox">
					<div class="userInfoBox">
						<c:choose>
							<c:when test="${sessionScope.m.filepath eq null }">
								<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 60px; height:60px; margin-left:10px;">
							</c:otherwise>
						</c:choose>
						<p>${sessionScope.m.memberId }</p>
					</div>
					<div class="textBox" >
						<textarea class="form-control textareaBox" name="commentContent"></textarea>
					</div>
					<div>
						<input type="submit" value="등록" class="btn btn-outline-primary commentBtn" style="height: 100px; width: 100px; font-weight: bold">
					</div>
				</div>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${com.companyNo }">
				<input type="hidden" name="boardType" value="4">
				<input type="hidden" name="commentType" value="1">
			</form>
		</c:if>
		
		
		<%--댓글리스트 --%>
		<div class=comentListBox>
			<c:choose>
			<%--댓글이 있는경우 --%>
			<c:when test="${not empty cl }">
				<c:forEach items="${cl }" var="cl" varStatus="i">
					<div style="margin-bottom: 20px;">
						<c:if test="${cl.commentType eq 1 }">
							<div class="comentView">
								<div class="commentImgBox">
									<c:choose>
										<c:when test="${cl.memberImg eq null }">
											<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${cl.memberImg }" style="width: 60px; height:60px; border-radius: 50%">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="iddate">
									<p>${cl.memberId }</p>
									<p>${cl.regDate }</p>
									<%--로그인했을 때만 보여주기 --%>
									<c:if test="${not empty sessionScope.m }">
										<%--내가 쓴 댓글일 경우만 보여주기 --%>
										<c:if test="${cl.memberId eq sessionScope.m.memberId }">
										<%--댓글 수정  --%>
											<a href="#" data-bs-toggle="modal" data-bs-target="#updateComment${i.index }">수정</a>
												
												<%--댓글 수정  Modal --%>
												<div class="modal fade" id="updateComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog  modal-dialog-centered">
												    <div class="modal-content">
												      <div class="modal-body">
												      	<form action="/updateCompanyComment.do" method="post">
												      	<textarea class="form-control reText" name="commentContent">${cl.commentContent }</textarea>
												      	<input type="hidden" value="${cl.commentNo }" name="commentNo">
												      	<input type="hidden" value="${cl.boardNo }" name="boardNo">
												      	<div style="text-align: right; ">
												      	<button type="submit" class="btn btn-primary">수정</button>
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
												        </div>
												        </form>
												      </div>
												    </div>
												  </div>
												</div>
											
											<%--댓글 삭제 --%>
											<form action="/deleteCompanyComment.do" method="post" class="delForm" style="display: inline;">
												<a href="javascript:void(0);" class="delComment">삭제</a>
												<input type="hidden" value="${cl.commentNo }" name="commentNo">
												<input type="hidden" value="${cl.boardNo }" name="boardNo">
											</form>
										</c:if>
									</c:if>
								</div>
								<span>
									${cl.commentContent }
									<a href="javascript:void(0)" class="reComentBtn"><i class="bi bi-chat-dots-fill" style="font-size: 20px"></i></a>
								</span>
							</div>
							
							
		<%---------------------------------------------------------------------------- --%>
		
							<%--대댓글 작성 창 --%>
							<form action="/insertCompanyComment.do" method="post">
								<div class="recomentBox">
									<textarea class="form-control reText textareaBox" name="commentContent"></textarea>
									<c:choose>
										<c:when test="${not empty sessionScope.m }">
											<input type="submit" value="등록" class="btn btn-outline-primary" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
										</c:when>
										<c:otherwise>
											<input type="button" value="등록" class="btn btn-outline-primary noMember" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
										</c:otherwise>
									</c:choose>
									<input type="reset" value="취소" class="btn btn-outline-secondary cancelBtn" style="height: 100px; width: 80px; font-weight: bold">
									<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
									<input type="hidden" name="boardNo" value="${com.companyNo }">
									<input type="hidden" name="boardType" value="4">
									<input type="hidden" name="commentType" value="2">
									<input type="hidden" name="commentRef" value="${cl.commentNo }">
								</div>
							</form>
							</c:if>
							
		<%---------------------------------------------------------------------------- --%>
							<%--대댓글 리스트 --%>
							<c:forEach items="${list.commentList }" var="rl" varStatus="j">
								<c:if test="${rl.commentType eq 2 && cl.commentNo eq rl.commentRef}">
									<div class="reComentView">
									<i class="bi bi-arrow-return-right" style="margin-left:50px; color:#4ECDC4;"></i>
										
										<div class="recommentImgBox">
											<c:choose>
												<c:when test="${rl.memberImg eq null }">
													<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
												</c:when>
												<c:otherwise>
													<img src="/resources/upload/member/${rl.memberImg }" style="width: 60px; height:60px; border-radius: 50%">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="iddate">
											<p>${rl.memberId }</p>
											<p>${rl.regDate }</p>
											<%--로그인했을 때만 보여주기 --%>
											<c:if test="${not empty sessionScope.m }">
												<%--내가 쓴 댓글일 경우만 보여주기 --%>
												<c:if test="${rl.memberId eq sessionScope.m.memberId }">
												<%--댓글 수정  --%>
													<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#updateReComment${j.index }" class="updateBtn">수정</a>
													
													<%--댓글 수정  Modal --%>
													<div class="modal fade" id="updateReComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog  modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-body">
													      	<form action="/updateCompanyComment.do" method="post">
													      	<textarea class="form-control reText textareaBox" name="commentContent">${rl.commentContent }</textarea>
													      	<input type="hidden" value="${rl.commentNo }" name="commentNo">
													      	<input type="hidden" value="${rl.boardNo }" name="boardNo">
													      	<div style="text-align: right; ">
													      	<button type="submit" class="btn btn-primary">수정</button>
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													        </div>
													        </form>
													      </div>
													    </div>
													  </div>
													</div>
													
													<%--댓글 삭제 --%>
													<form action="/deleteCompanyComment.do" method="post" class="delForm" style="display: inline;">
														<a href="javascript:void(0);" class="delComment">삭제</a>
														<input type="hidden" value="${rl.commentNo }" name="commentNo">
													    <input type="hidden" value="${rl.boardNo }" name="boardNo">
													</form>
												</c:if>
											</c:if>
										</div>
										<span>
										${rl.commentContent }
										</span>
										
									</div>
								</c:if>
							</c:forEach>
						</div>
				</c:forEach>	
			</c:when>
			<%--댓글이 없는경우 --%>
			<c:otherwise>
				<div style="text-align: center">
					<p><i class="bi bi-chat-square-dots" style="font-size: 35px; display:inline-block; color:#4ECDC4;"></i></p>
					<p style="font-weight: bold">등록된 댓글이 없습니다. 댓글을 남겨보세요!</p>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<style>
		.commentBox{
	margin-top:30px;
	border: 1px solid #d9d9d9;
	padding:20px;
	display: flex;
	align-items: center;
}
.userInfoBox{
	width: 80px;
}
.userInfoBox>p{
	text-align: center;
	margin-top: 5px;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 0px;
}
.textBox{
	margin-left: 10px;
	margin-right: 10px;
}
.textBox>textarea{
	width: 780px;
	height: 100px;
	resize: none;
}
.comentListBox{
	margin-top:30px;
	border: 1px solid #d9d9d9;
	padding:30px;
	padding-bottom: 20px;
}

.commentImgBox{
	display:inline-block;
	width: 100px;
	text-align: center;
}
.iddate{
	display:inline-block;
	width: 100px;
	text-align: center;
	
}
.comentView{
	height: 73px;
	display: flex;
	align-items: center;
}
.iddate>p{
	margin : 0;
}
.iddate>p:first-child{
	font-weight: bold;
}
.iddate>p:nth-of-type(2){
	font-size: 14px;
}
.comentView>span:nth-of-type(1) {
	display:inline-block;
	width: 940px;
	margin-right: 50px;
	margin-left: 10px;
}

.iddate>a{
	text-decoration: none;
	color : black;
	font-size: 14px;
}
.iddate>form>a{
	text-decoration: none;
	color : black;
	font-size: 14px;
}
.recommentImgBox {
	font-weight: bold;
	display:inline-block;
	width: 100px;
	margin-left: 20px;
	text-align: center;
}
.reComentView>span:nth-of-type(1) {
	display:inline-block;
	width: 830px;
	margin-right: 60px;
	margin-left: 10px;
}

.reComentView>a{
	text-decoration: none;
	color : black;
}
.reComentView>form>a{
	text-decoration: none;
	color : black;
}
.reComentView{
	height: 73px;
	display: flex;
	align-items: center;
}
.recomentBox{
	display: flex;
	align-items: center;
}
.reText{
	margin-top:20px;
	margin-bottom:20px;
	resize: none;
	height: 100px;
}
.Modaltitle{
	font-size: 30px;
	font-weight: bold;
}

	</style>
<script>
	/* 카카오맵 API */
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
</body>
</html>