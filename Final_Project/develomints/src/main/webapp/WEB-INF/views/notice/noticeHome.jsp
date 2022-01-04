<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/noticeHome.css">
</head>
<style>
	.cs_notice ul li a:before {
    content: "-";
    padding-right: 5px;
}
.cs_notice ul{
	list-style : none;
	padding: 0;
	margin-top: 30px;
}
.cs_notice ul li a{
	text-decoration: none;
}
.muted-h:hover{
	color: #78c2ad;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<!-- FQA 리스트 뽑기 20개만뽑기(조회수순? 아니면 많이 묻는질문 탑20? 기준 정해야함)-->
		<!-- 공지사항 최신 7개 글만뽑기 -->
		<div class="area">
			<!-- 상단 로케이션 -->
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a></div>
			<div class="title" style=""><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<!-- 고객센터메뉴 -->
			<div class="cs_menu">
				<div class="cs_center">
					<p class="cs_number"><span>Tel.</span>2163-8560</p>
					<div class="cs_center_txt">
						- 평일 9:20~18:30(점심 12:20~13:30)<br> - 토, 일, 공휴일 휴무
					</div>
				</div>
			</div>
			<div class="center_tap2">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:20~18:30(점심 12:20~13:30)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
					<li><a href="/noticeList.do?reqPage=1" class="text-hover">공지사항<br><span class="last-span">공지사항</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<h3 class="title_cs font-mss">FAQ <span >자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<div class="center_tap3">
					<ul class="mypage_type">
		                <li><a href="/faq.do?category=8">로그인관련</a></li>
						<li><a href="/faq.do?category=9">고수 안내</a></li>
						<li><a href="/faq.do?category=10">환불관련</a></li>
						<li><a href="/faq.do?category=11">공모전관련</a></li>
						<li><a href="/faq.do?category=12">구인잡관련</a></li>
						<li><a href="/faq.do?category=13">커뮤니티관련</a></li>
						<li><a href="/faq.do?category=14">고수관련</a></li>
						<li><a href="/faq.do?category=15">팀프로젝트 관련</a></li>
						<li><a href="/faq.do?category=40">기타 문의</a></li>
						<li><a href="/faq.do?category=22">신고</a></li>
						<li><a href="/faq.do?category=21">기능/작동 오류</a></li>
						<li><a href="/faq.do?category=20">이벤트</a></li>
		            </ul>
				</div>
				<!-- //탭버튼 -->
				<!-- 콘텐츠 -->
			</div>
			<!-- //고객센터 콘텐츠 -->
			<!-- 공지사항 & 이용방법 -->
			<div class="contents cs_notice">
				<h3 class="title_cs font-mss">Notice <span>공지사항</span></h3>
				<div class="cs_notice">
					<!-- ul리스트 출력 -->
					<ul>
						<c:forEach items="${nlist }" var="n" varStatus="i">
							<li class="text-muted">
								<a href="noticeView.do?noticeNo=${n.noticeNo }" class="text-muted muted-h">${n.noticeTitle }</a>	
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- //공지사항 & 이용방법 -->
			<!--// 컨텐츠 영역 -->
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>