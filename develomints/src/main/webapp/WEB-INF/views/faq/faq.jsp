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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="right_contents section_contents">
				<h3 class="title_cs font-mss">FAQ <span>자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<ul class="mypage_type">
	                <li><a href="/faq.do?category=12">주문 결제</a></li>
					<li><a href="/faq.do?category=11">배송 안내</a></li>
					<li><a href="/faq.do?category=10">주문취소</a></li>
					<li><a href="/faq.do?category=8">교환</a></li>
					<li><a href="/faq.do?category=9">환불</a></li>
					<li><a href="/faq.do?category=13">상품 관련</a></li>
					<li><a href="/faq.do?category=14">포인트 · 적립금</a></li>
					<li><a href="/faq.do?category=17">이벤트</a></li>
					<li><a href="/faq.do?category=15">회원 관련</a></li>
					<li><a href="/faq.do?category=21">무탠픽업</a></li>
					<li><a href="/faq.do?category=16">기타</a></li>
	            </ul>
				<!-- //탭버튼 -->
				<!-- 콘텐츠 -->
				<table class="table_basic">
				   <colgroup>
					   <col width="8%">
					   <col width="">
				   </colgroup>
				   <thead>
					   <tr>
						   <th scope="col">번호</th>
						   <th scope="col">내용</th>
					   </tr>
				   </thead>
				   <tbody>
				   		<!-- 출력 -->
				   </tbody>
			  	</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>