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
<link rel="stylesheet" href="/resources/css/notice/qnalist.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><a href="/nonMember_CounselList.do" class="text-hover">비회원 전용 Q&A 게시판</a><span> > </span><span>내 질문 보기</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents" style="padding: 20px;">
				<div class="title" style="border-bottom: none;padding: 0;">
					<h2 style="display: inline-block;">Counsel Save</h2>
				</div>
				<div class="qna-contents" style="padding: 20px 0 0 0;border-bottom: none;">
					<!-- 불러온 글제목 -->
					<h4 style="font-weight: bold;border-bottom: 1px solid #ddd;">${nq.type } > ${nq.qnaTitle } </h4>
					<!-- 작성일, 읽은 수(테이블 컬럼 추가 해야함) -->
					<span>문의 작성일 : ${nq.regDate } </span>
					<div class="contents-box">
						<!-- 이미지 있으면 이미지 출력, 내용잇으면 내용 출력 -->
						${nq.qnaContent }
					</div>
				</div>
			</div>
			<div class="contents" style="padding: 20px;text-align: right;border-top: 5px solid #ddd;">
				<div class="title" style="border-bottom: none;padding: 0;">
					<h2 style="display: inline-block;">Counsel Answer</h2>
				</div>
				<div class="qna-contents answer" style="padding: 20px 0 0 0;border-bottom: none;">
					<!-- 불러온 글제목 -->
					<h4 style="font-weight: bold;border-bottom: 1px solid #ddd;"> RE : ${nq.qnaTitle} < ${nq.type }</h4>
					<c:choose>
						<c:when test="${not empty nq.qnaAnswer }">
							<span>답변일 : ${nq.answerDate } </span>
							<div class="contents-box">
								<!-- 이미지 있으면 이미지 출력, 내용잇으면 내용 출력 -->
								${nq.qnaAnswer }
							</div>
							<div class="qna_comment text-danger" style="margin: 30px 0 30px 0;">
								<small>※ 대부분의 질문은 FAQ 통해 답변을 얻으실 가능성이 높습니다. <a href="/faq.do?category=7">바로가기</a></small>
							</div>
						</c:when>
						<c:otherwise>
							<div style="padding: 20px; text-align: center; margin-top: 20px;">
								<img src="/resources/img/member/user.png" style="border-radius: 50%; width: 70px; margin-top: 70px;">
								<h2 style="color: gray; font-size: 20px; font-weight: 900; line-height: 100px;">현재 작성된 답변이 없습니다.</h2>
							</div>
							<div class="qna_comment text-danger" style="margin: 30px 0 30px 0;">
								<small>※ 대부분의 질문은 FAQ 통해 답변을 얻으실 가능성이 높습니다. <a href="/faq.do?category=7">바로가기</a></small>
							</div>
						</c:otherwise>
					</c:choose>
					<a href="/nonMember_CounselList.do" class="btn btn-outline-primary">목록보기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>