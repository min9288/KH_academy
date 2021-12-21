<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 기본 css  -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 부트스트랩 minty CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- 글꼴적용(NotoSans 폰트) -->
<link rel="stylesheet" href="/resources/css/font.css">
<!-- jQuery라이브러리 추가(2개) -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- 부트스트랩용 jQuery cdn방식-->
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<!-- favicon css-->
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<style>
	.margin-right{
	display: flex;
    align-items: center;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid" style="margin-left: 300px;">
    <a class="navbar-brand mx-auto" href="/"><img src="/resources/img/logo/Develomint_logo.png" style="height: 50px"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto" style="font-size: 18px;margin-left: 20px;font-weight: bold;">
        <li class="nav-item">
          <a class="nav-link " href="/recruitTeamMember_mainPage.do?reqPage=1">팀원모집
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/shareList.do?reqPage=1&type=1" >개발지식공유</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/jobSearchList.do?reqPage=1">구인구직</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/gosuMain.do">'고수'의 노하우</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/contestMain.do">공모전</a>
        </li>
      </ul>
       <ul class="navbar-nav float-end me-3">
    	<c:choose>
			<c:when test="${empty sessionScope.m }">
				<li class="nav-item">
					<a type="button" class="btn btn-secondary btn-lg" href="/loginFrm.do" style="font-size: medium;font-weight: bold;">로그인</a>
		        </li>
				<li class="nav-item">
					<a type="button" class="btn btn-link btn-lg join-link-text" href="/joinFrm.do" style="font-size: medium;font-weight: bold;">회원가입</a>
		        </li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${not empty sessionScope.m && sessionScope.m.memberType eq 9 }">
						<li class="nav-item dropdown float-end me-5">
				          <a class="nav-link dropdown-toggle active margin-right" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="padding: 0;"><i class="bi bi-person-circle" style="font-size: 2.5rem;"></i> ${sessionScope.m.memberId } 님</a>
				          <div class="dropdown-menu">
				            <a class="dropdown-item" href="/adminPage.do">관리자 페이지</a>
				            <div class="dropdown-divider"></div>
				            <a class="dropdown-item" href="/logout.do">로그아웃</a>
				          </div>
				        </li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
					      	<jsp:include page="/WEB-INF/views/dm/alarm.jsp"/>
								<li class="nav-item dropdown float-end me-5">
						          <a class="nav-link dropdown-toggle active margin-right" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						          	<c:choose>
										<c:when test="${sessionScope.m.filepath eq null }">
											<img src="/resources/img/member/user.png" style="width: 40px;height: 40px;border-radius: 30px;margin-right: 10px;">				
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 40px;height: 40px;border-radius: 30px;margin-right: 10px;">
										</c:otherwise>
									</c:choose>
							      	 ${sessionScope.m.memberId } 님
						          </a>
						          <div class="dropdown-menu">
						          	<c:if test="${sessionScope.m.memberType eq 1 }">
							            <a class="dropdown-item" href="/mypage.do">마이페이지</a>
						          	</c:if>
						          	<c:if test="${sessionScope.m.memberType eq 2}">
									    <a class="dropdown-item" href="/mypageGosu.do">마이페이지</a>	
									</c:if>
						          	<c:if test="${sessionScope.m.memberType eq 3}">
									    <a class="dropdown-item" href="/mypageCom.do">마이페이지</a>	
									</c:if>
						            <div class="dropdown-divider"></div>
						            <a class="dropdown-item" href="/logout.do">로그아웃</a>
						          </div>
						        </li>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		</ul>
    </div>
  </div>
</nav>