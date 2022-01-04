<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/viewPages.css">
<link rel="stylesheet" href="/resources/css/member/crewList.css">
</head>
<style>
	.crewtable *{
		vertical-align: middle;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="page-wrap">
				<div class="page-top">
					<div class="page-topImg">
						<span style="text-align: left; font-family: NotoBold; font-size: 30px;">내 프로젝트</span>
						<img src="/resources/img/member/multiple-users-silhouette.png" style="width: 50px; height: 50px; margin-left: 10px;">					
					</div>
					<c:choose>
						<c:when test="${sessionScope.m.memberType eq 2 }">
							<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>															
						</c:when>
						<c:otherwise>
							<a href="/mypage.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="page-select">
					<ol class="breadcrumb projectSelect">
						<c:choose>
							<c:when test="${type eq 0}">
								 <li class="breadcrumb-item actives">신청 프로젝트</li>
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=1">개설 프로젝트</a></li>
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=2">찜한내역</a></li>							
							</c:when>
							<c:when test="${type eq 1 }">
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=0">신청 프로젝트</a></li>
								 <li class="breadcrumb-item actives">개설 프로젝트</li>
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=2">찜한내역</a></li>							
							</c:when>
							<c:when test="${type eq 2 }">
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=0">신청 프로젝트</a></li>
								 <li class="breadcrumb-item"><a href="/crewList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1&type=1">개설 프로젝트</a></li>
								 <li class="breadcrumb-item actives">찜한내역</li>							
							</c:when>						
						</c:choose>
					</ol>					
				</div>
				<c:choose>
					<c:when test="${type eq 0 }">
						<table class="table table-hover crewtable">
							<tr class="table-primary">
								<th>번호</th><th>프로젝트명</th><th>모집시작일</th><th>지원결과</th><th>프로젝트 관리</th>
							</tr>
							<c:forEach items="${list }" var="crew" varStatus="i">
								<tr>
									<td>${start+i.index }</td>
									<td>
										<a href="/selectOneNotice.do?projectNo=${crew.projectNo }&memberNo=${sessionScope.m.memberNo}">${crew.recruitTitle }</a>
									</td>
									<td>${crew.applyDate }</td>
									<c:choose>
										<c:when test="${crew.entryStatus eq 1 }">
											<td class="text-info">확인중</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 2 }">
											<td class="text-danger">탈락</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 3 }">
											<td class="text-warning">최종대기</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 4 }">
											<td class="text-success">최종선발</td>
										</c:when>																													
									</c:choose>
									<td>
										<c:choose>
											<c:when test="${crew.entryStatus eq 4 and crew.projectStatus ne 1 }">
												<a class="btn btn-success" href="/enterMyProject.do?projectNo=${crew.projectNo }&memberNo=${sessionScope.m.memberNo}">관리</a>
											</c:when>
											<c:otherwise>
												<span class="text-info">모집진행중</span>
											</c:otherwise>										
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>			
					</c:when>
					<c:when test="${type eq 1 }">
						<table class="table table-hover">
							<tr class="table-primary">
								<th>번호</th><th>프로젝트명</th><th>모집 마감일</th><th>지원자수</th><th>프로젝트 관리</th>
							</tr>
							<c:forEach items="${list }" var="crew" varStatus="i">
								<tr>
									<td>${start+i.index }</td>
									<td>
										<a href="/selectOneNotice.do?projectNo=${crew.projectNo }&memberNo=${session.m.memberNo}">${crew.recruitTitle }</a>
									</td>
									<c:choose>
										<c:when test="${crew.endDate eq '종료' }">
											<td class="text-danger">모집 마감</td>
										</c:when>
										<c:otherwise>
											<td>${crew.endDate }</td>
										</c:otherwise>
									</c:choose>
									<td>${crew.entryCount }</td>
									<td>
										<c:choose>
											<c:when test="${crew.projectStatus ne 1 }">
												<a class="btn btn-success" href="/enterMyProject.do?projectNo=${crew.projectNo }&memberNo=${sessionScope.m.memberNo}">관리</a>
											</c:when>
											<c:otherwise>
												<span class="text-info">모집진행중</span>
											</c:otherwise>										
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>						
					</c:when>
					<c:when test="${type eq 2 }">
						<table class="table table-hover">
							<tr class="table-primary">
								<th>번호</th><th>프로젝트명</th><th>모집 마감일</th>
							</tr>
							<c:forEach items="${list }" var="crew" varStatus="i">
								<tr>
									<td>${start+i.index }</td>
									<td>
										<a href="/selectOneNotice.do?projectNo=${crew.projectNo }&memberNo=${session.m.memberNo}">${crew.recruitTitle }</a>
									</td>
									<c:choose>
										<c:when test="${crew.endDate eq '종료' }">
											<td class="text-danger">종료</td>
										</c:when>
										<c:otherwise>
											<td>${crew.endDate }</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</table>							
					</c:when>
				</c:choose>
				<div id="pageNavi">
					${pageNavi }
				</div>		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>