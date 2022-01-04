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
	.nav-item{
		
	}
	.navigation {
  width: 100%;
  /* border-bottom: 3px solid #ccd7d7; */
  font-family: "Pathway Gothic One", sans-serif;
  /* font-size: 22px; */
}

.menu {
  display: flex;
  justify-content: center;
  max-width: 1150px;
  margin: 0 auto;
  padding-left: 0;
}

.menu__item {
  display: inline-block;
  white-space: nowrap;
  margin: auto 12px;
}
@media screen and (max-width: 480px) {
  .menu__item:nth-child(n+3) {
    display: none;
  }
  .menu__item:nth-child(2) .menu__link {
    border-right: 0;
  }
}
@media screen and (max-width: 768px) {
  .menu__item:nth-child(n+4) {
    display: none;
  }
  .menu__item:nth-child(3) .menu__link {
    border-right: 0;
  }
}
@media screen and (max-width: 992px) {
  .menu__item:nth-child(n+5) {
    display: none;
  }
  .menu__item:nth-child(4) .menu__link {
    border-right: 0;
  }
}
.menu__item:last-child .menu__link {
  border-right: 0;
}

.menu__link {
  display: block;
  padding: 6px 30px 3px;
  /* border-right: 2px dotted #ccd7d7; */
}
.menu__link:hover .menu__first-word, .menu__link:focus .menu__first-word {
  transform: translate3d(0, -105%, 0);
}
.menu__link:hover .menu__second-word, .menu__link:focus .menu__second-word {
  transform: translate3d(0, 105%, 0);
}
@media screen and (min-width: 768px) {
  .menu__link {
    padding: 6px 40px 3px;
  }
}

.menu__title {
  display: inline-block;
  overflow: hidden;
}

.menu__first-word,
.menu__second-word {
  display: inline-block;
  position: relative;
  transition: transform 0.3s;
}
.menu__first-word::before,
.menu__second-word::before {
  position: absolute;
  content: attr(data-hover);
}

.menu__first-word {
  color: rgba(0, 0, 0, 0.3);
}
.menu__first-word::before {
  top: 105%;
  color: #626262;
}

.menu__second-word {
  color: rgba(0, 0, 0, 0.3);
}
.menu__second-word::before {
  bottom: 105%;
  color: #4ecdc4;
  font-weight: bold;
}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid" style="padding-left: 300px;">
    <a class="navbar-brand mx-auto" href="/"><img src="/resources/img/logo/Develomint_logo.png" style="height: 50px"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse navigation" id="navbarColor01" >
      <ul class="navbar-nav me-auto menu" style="font-size: 18px;margin-left: 30px;font-weight: bold;">
        <li class="nav-item menu__item">
          <a class="nav-link menu__link" href="/recruitTeamMember_mainPage.do?reqPage=1" style="width: 88px;">
	          <span class="menu__title">
	          	<span class="menu__first-word" data-hover="팀원">팀원</span><span class="menu__second-word" data-hover="모집">모집</span>
	          </span>
          </a>
        </li>
        <li class="nav-item menu__item">
         	<a class="nav-link menu__link" href="/shareList.do?reqPage=1&type=1" style="width: 124px;">
     	    	<span class="menu__title">
	          		<span class="menu__first-word" data-hover="개발지식">개발지식</span><span class="menu__second-word" data-hover="공유">공유</span>
	          	</span >
        	</a>
        </li>
        <li class="nav-item menu__item">
         	<a class="nav-link menu__link" href="/jobSearchList.do?reqPage=1" style="width: 88px;">
				<span class="menu__title">
	          		<span class="menu__first-word" data-hover="구인">구인</span><span class="menu__second-word" data-hover="구직">구직</span>
	          	</span >			
			</a>
        </li>
        <li class="nav-item menu__item">
          <a class="nav-link menu__link" href="/gosuMain.do" style="width: 150px;">
          	<span class="menu__title">
	          		<span class="menu__second-word" data-hover="'고수'">'고수'</span><span class="menu__first-word" data-hover="의 노하우">의 노하우</span>
	        </span >
          </a>
        </li>
        <li class="nav-item menu__item">
          <a class="nav-link menu__link" href="/contestMain.do" style="width: 70px;">
			<span class="menu__title">
	          		<span class="menu__second-word" data-hover="공모">공모</span><span class="menu__first-word" data-hover="전">전</span>
	        </span >
		  </a>
        </li>
      </ul>
       <ul class="navbar-nav float-end me-3" style="text-align: left;">
    	<c:choose>
			<c:when test="${empty sessionScope.m }">
				<li class="nav-item" style="width: 85px;">
					<a type="button" class="btn btn-secondary btn-lg" href="/loginFrm.do" style="font-size: medium;font-weight: bold;">로그인</a>
		        </li>
				<li class="nav-item"  style="width: 100px;">
					<a type="button" class="btn btn-link btn-lg join-link-text" href="/joinFrm.do" style="font-size: medium;font-weight: bold;">회원가입</a>
		        </li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${not empty sessionScope.m && sessionScope.m.memberType eq 9 }">
						<jsp:include page="/WEB-INF/views/dm/alarm.jsp"/>
						<li class="nav-item dropdown float-end me-5">
				          <a class="nav-link dropdown-toggle active margin-right" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="padding: 0;">
				          <img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 40px;height: 40px;border-radius: 30px;margin-right: 10px;"></i> 
				          ${sessionScope.m.memberId } 님</a>
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
								<li class="nav-item dropdown float-end me-5" style="width: 165px;">
						          <a class="nav-link dropdown-toggle active margin-right" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						          	<c:choose>
										<c:when test="${sessionScope.m.filepath eq null }">
											<img src="/resources/img/member/user.png" style="width: 40px;height: 40px;border-radius: 30px;margin-right: 10px;">				
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 40px;height: 40px;border-radius: 30px;margin-right: 10px;">
										</c:otherwise>
									</c:choose>
							      	 ${sessionScope.m.memberName } 님
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