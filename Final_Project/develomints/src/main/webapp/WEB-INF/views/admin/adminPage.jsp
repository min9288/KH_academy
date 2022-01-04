<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 관리자 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
.container {
   min-width: 1200px; 
}
.adminImg>img{
	width:150px;
	height:150px;
}
.adminInfoBox{
	display:flex;
}
.adminInfo{
	flex-direction: column;
	margin-left: 20px;
}
.adminInfo span{
	font-size: 30px;
	 
}
.title{
	margin-top: 70px;
	font-size: 20px;
	font-weight: bold;
}
#mypage{
	font-size: 25px;
}
.bi{
	font-size:30px;
	
}
#cate{
	display:flex;
	border-bottom: 1px solid #e9e9e9;
	padding-bottom: 10px;
	padding-top: 10px;
}
#cate>a>span{
	line-height: 43px;
	margin-left : 20px;
	font-size : 17px;
}
#cate>a{
	text-decoration: none;
	color: black;
}
#cate:hover>a{
	color : #4ECDC4
}

.cateAtag{
	margin-left: auto;
}
</style>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="padding-left:150px;padding-right:150px;margin-bottom:100px">
		<div>
			<p id="mypage" style="font-weight:bold">마이페이지</p>
			<br><br><br>
			
			<%-- 관리자 정보 --%>
			<div class="adminInfoBox">
				<div class="adminImg">
					<img src="/resources/upload/member/${sessionScope.m.filepath }">
				</div>
				<div class="adminInfo">
					<span style="font-weight:bold">${sessionScope.m.memberName } </span><span>님</span>
					<p>${sessionScope.m.email } </p>
				</div>
			</div>
			
			<!-- 관리자페이지 카테고리 -->
			<p class="title">전체현황</p>
			<div id="cate">
				<i class="bi bi-clipboard-data" style="color:#4ECDC4;"></i>
				<a href="/dashboard.do"><span>대시보드</span></a>
				<a href="/dashboard.do" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			
			<p class="title">회원관리</p>
			<div id="cate">
				<i class="bi bi-list-ul" style="color:#4ECDC4;"></i>
				<a href="/allMemberList.do?reqPage=1&type=0&list=1"><span>전체 회원 조회</span></a>
				<a href="/allMemberList.do?reqPage=1&type=0&list=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-exclamation-circle" style="color:#4ECDC4;"></i>
				<a href="/reportMember.do?reqPage=1"><span>신고 회원 처리</span></a>
				<a href="/reportMember.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-person-dash-fill" style="color:#4ECDC4;"></i>
				<a href="/blockedMember.do?reqPage=1"><span>차단 회원 관리</span></a>
				<a href="/blockedMember.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			
			<p class="title">회사관리</p>
			<div id="cate">
				<i class="bi bi-building" style="color:#4ECDC4;"></i>
				<a href="/addCompany2.do"><span>제휴 회사 등록</span></a>
				<a href="/addCompany2.do" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-files" style="color:#4ECDC4;"></i>
				<a href="/affiliatesList.do?reqPage=1"><span>제휴 회사 목록</span></a>
				<a href="/affiliatesList.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-briefcase" style="color:#4ECDC4;"></i>
				<a href="/companyEnroll.do?reqPage=1"><span>회사 인증 처리</span></a>
				<a href="/companyEnroll.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			
			
			<p class="title">공모전</p>
			<div id="cate">
				<i class="bi bi-trophy" style="color:#4ECDC4;"></i>
				<a href="/contestEnrollList.do?reqPage=1"><span>공모전 등록 내역</span></a>
				<a href="/contestEnrollList.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-people-fill" style="color:#4ECDC4;"></i>
				<a href="/contestEnrollMember.do?reqPage=1&date=${today }"><span>공모전 신청 회원 보기</span></a>
				<a href="/contestEnrollMember.do?reqPage=1&date=${today }" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			
			<%-- 민주가 만든 공지사항, qna로 이동 --%>
			<p class="title">게시판 관리</p>
			<div id="cate">
				<i class="bi bi-layout-text-sidebar-reverse" style="color:#4ECDC4;"></i>
				<a href="/allBoardList.do?reqPage=1&type=1"><span>전체 게시판 조회</span></a>
				<a href="/allBoardList.do?reqPage=1&type=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-megaphone" style="color:#4ECDC4;"></i>
				<a href="/noticeList.do?reqPage=1"><span>공지사항</span></a>
				<a href="/noticeList.do?reqPage=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
			<div id="cate">
				<i class="bi bi-chat-dots" style="color:#4ECDC4;"></i>
				<a href="/adminCounsel.do?type=1"><span>QnA</span></a>
				<a href="/adminCounsel.do?type=1" class="cateAtag"><i class="bi bi-chevron-right" style="color:#4ECDC4;"></i></a>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>