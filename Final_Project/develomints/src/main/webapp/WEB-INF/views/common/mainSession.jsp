<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 js -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script> -->
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- 스위트알람 js -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 각 css 링크 경로 -->
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main/main.css">
<link rel="stylesheet" href="/resources/css/projectTeam/recruitMember.css">
<!-- slick CDN -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<style>
	* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  body {
    position: relative;
    max-width: 2560px;
    min-width: 1240px;
    margin: 0 auto;
}
.slick-prev:before, .slick-next:before {
    color: black;
}
#gotop_lick {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 66px;
    height: 65px;
    z-index: 99;
    background: ;
}
#gotop_lick .on {
  position: absolute;
  bottom: 350px;
}
</style>
<body>
	<div style="display: flex; justify-content: center;width: 1800px;">
	</div>
		<header >
		<!-- Carousel -->
		<div id="demo" class="carousel slide fixation" data-bs-ride="carousel">
	
			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>
	
			<!-- The slideshow/carousel -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/img/main/4.png" alt="Los Angeles" class="d-block w-100 h-50"
						style="width:100%;max-height: 80vh;">
					<div class="carousel-caption">
						<h4 class="text-black" style="font-weight: bold;">프로젝트에 지원하여 팀원으로 함께하세요!</h4>
						<p><a href="/recruitTeamMember_mainPage.do?reqPage=1" class="btn btn-my">팀원모집</a></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/img/main/1.png" alt="Chicago" class="d-block h-50 w-100"
						style="width: 100%;max-height: 80vh;">
					<div class="carousel-caption">
						<h4 class="text-white" style="font-weight: bold;">고수와 함께 개발을 해보세요!</h4>
						<p><a href="/gosuMain.do" class="btn btn-my2">'고수'의 노하우</a></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/img/main/3.png" alt="New York" class="d-block h-50 w-100" 
					style="width: 100%;max-height: 80vh;">
					<div class="carousel-caption">
						<h4 class="text-white" style="font-weight: bold;">지원하고, 구해보세요!</h4>
						<p><a href="jobSearchList.do?reqPage=1" class="btn btn-my3">구인구직</a></p>
					</div>
				</div>
			</div>
			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
		</header>
	
	<!-- Carousel 끝 -->
	<!-- main세션 -->
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3><a href="/recruitTeamMember_mainPage.do?reqPage=1" class="de-non subEngTitel">팀 프로젝트 모집</a></h3>
			<p style="padding: 0;margin: 0;">프로젝트 팀장이 될수도, 팀원이 될 수 있어요. </p>
			<p>프로젝트 팀장은 당신을 찾고있습니다! 필요한 언어를 선택하여 팀원으로 참가하세요.</p>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px;">
		<!-- 최신순 프로젝트 리스트 8개 출력 -->
		<div  style="margin: 30px auto;">
			<span class="subEngTitel">NEW</span> <span class="subTitel">최신 모집순</span><a href="/recruitTeamMember_mainPage.do?reqPage=1" style="padding-left: 20px;text-decoration: none;font-weight: bold;">더보기</a>
		</div>
		<div class="wrapPoject_wrap">
		<c:forEach items="${ptlist }" var="pt" varStatus="mi">
			<a href="/selectOneNotice.do?projectNo=${pt.projectNo }&memberNo=${sessionScope.m.memberNo}" style="text-decoration: none;">
			<ul class="wrapPoject">
				<li class="pojrect_item">
					<c:choose>
						<c:when test="${fn:length(pt.RTitle) > 10}">
							<c:set var="subTitle" value="${fn:substring(pt.RTitle,0,10)}"/>
							<h1>${subTitle }...</h1>
						</c:when>
						<c:otherwise>
							<h1>${pt.RTitle }</h1>
						</c:otherwise>
					</c:choose>
			        <ul class="subImgBox">
			         <c:forEach items="${pdLangList }" var="lI"  varStatus="i">
			         	<c:if test="${pt.projectNo eq lI.projectNo }">
			         		<li>
				         		<img class="langImg" src="${lI.langImg }">
					         	<p id="lnagName">${lI.langName }</p>
			         		</li>
			            	</c:if>
			         </c:forEach>
			        </ul>
			        <div class="countBox text-muted">
			            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/bubble-chat.png">
			            <span class="countText">${pt.commentCount }</span>
			            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
			            <span class="countText">${pt.viewCount }</span>
			            <img class="countImg" src="/resources/img/recruitTeamProject/common/full_hart.png" style="position: relative; top: 3px;">
			            <span class="countText ">${pt.dibCount }</span>
			        </div>
				</li>
			</ul></a>
		</c:forEach>
		</div>
	</div>
	<!-- 인기순 프로젝트 리스트 출력  끝 -->
	<!-- 공모전 -->
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/contestMain.do" class="de-non subEngTitel">공모전</a></h3>
			<p>상금이 걸린 공모전에 참가해보세요! 당신의 재능을 첨부하면 됩니다.</p>
		</div>
	</div>
	<div class="container" style="margin-top: 0;margin-bottom: 30px;">
		<div  style="margin-top: 70px;">
			<span class="subEngTitel">HOT</span> <span class="subTitel">인기 공모전</span><a href="/allContestList.do?reqPage=1&type=0" style="padding-left: 20px;text-decoration: none;font-weight: bold;">더보기</a>
		</div>
		<%-- 인기 공모전 리스트 --%>
		<div class="newContestBox" style="">
			<c:forEach var="hc" items="${conlist.hotContest }">
			<div>
				<%--공모전 이미지 --%>
				<div class="contestImgBox" >
					<div class="front item">
						<img src="/resources/img/contest/${hc.contestImg }">
					</div>
					<div class="back item">
						<div class="contestBack" style="background-image: url(/resources/img/contest/${hc.contestImg }) ">
							<div class="contestBack2" >
								<c:choose>
									<c:when test="${hc.contestType == 1}">
										<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 기획</p>
									</c:when>
									<c:when test="${hc.contestType == 2}">
										<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 개발</p>
									</c:when>
									<c:otherwise>
										<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 디자인</p>
									</c:otherwise>
								</c:choose>
								<p><i class="bi bi-trophy" style="margin-right: 5px;"></i><span>1등 시상금</span> : ${hc.contestPrize } 만원</p>
								<p style="margin-bottom: 80px;"><i class="bi bi-eye" style="margin-right: 5px;"></i><span>조회수</span> : ${hc.contestCount } 회</p>
								<a href="/contestView.do?contestNo=${hc.contestNo }">
									상세보기 <i class="bi bi-hand-index"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%--공모전 제목 --%>
				<c:choose>
					<c:when test="${fn:length(hc.contestTitle) > 15}">
						<c:set var="subTitle" value="${fn:substring(hc.contestTitle,0,15)}"/>
						<p class="newTitle">${subTitle }...</p>
					</c:when>
					<c:otherwise>
						<p class="newTitle">${hc.contestTitle }</p>
					</c:otherwise>
				</c:choose>
				
				<p class="newcontent">주최 : ${hc.contestHost }</p>
				<p class="newcontent">기간 : ${hc.contestDate } ~ ${hc.contestDeadline }</p>
			</div>
			</c:forEach>
		</div>	
	</div>
	<!-- 공모전 -->
	<!-- 고수의 노하우 -->
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/gosuMain.do" class="de-non subEngTitel">'고수'의 노하우</a></h3>
			<p>개발 고수와 매칭하여 고수의 노하우를 물어보세요!</p>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px;">
	<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<div style="margin: 30px auto;">
			<span class="subEngTitel">新</span> <span class="subTitel">고수들</span><a href="/gosuMain.do" style="padding-left: 20px;text-decoration: none;font-weight: bold;">더보기</a>
		</div>
		<div class="gosuContents mt-3">
			<c:forEach items="${gosuList }" var="g" begin="0" end="4">
			<div class="card" style="width:400px;margin: 10px;height: 600px;">
				<c:if test="${empty g.gosuImg }">
			  		<img class="card-img-top" src="/resources/img/gosu/g_img_basic.png" alt="Card image" style="width:100%">
			  	</c:if>
			  	<c:if test="${not empty g.gosuImg }">
			  		<img class="card-img-top" src="/resources/upload/member/${g.gosuImg }" alt="Card image" style="width:100%;height: 250px;">
		  		</c:if>
			  <div class="card-body">
			  	<%-- <a href="/gosuContent.do?gNo=${g.ggsouNo}" class="card-title">${g.gosuTitle }</a> --%>
			    <h4 class="card-title" style="font-weight: 900;text-align: center;height: 28px;overflow: hidden;">${g.gosuTitle }</h4>
			    <p class="card-text"><span style="color: rgb(78, 205, 196);">고수</span>&nbsp;&nbsp;${g.gosuId }</p>
			    <p class="card-text" style="height: 120px;
overflow: hidden;">${g.gosuSelf }</p>
			    <p class="card-text">
			    	<c:if test="${empty g.reviewAvg  }">
						<span style="color: gray; font-size: small;">아직 등록된 리뷰가 없습니다.</span>
					</c:if>
					<c:if test="${not empty g.reviewAvg }">
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
								<c:when test="${g.reviewAvg >= 1}">
									<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
								</c:when>
							</c:choose>
							(${g.reviewCount }) 
					</c:if>
			    </p>
			    <a href="/gosuContent.do?gNo=${g.ggsouNo}" class="btn btn-primary " style="font-weight: bold;">프로필보기</a>
			  </div>
			</div>
			</c:forEach>
		</div>
	<!-- 고수 소개 얼굴만 최신 등록 5명 출력 끝 -->
	</div>
	<!-- 구인구직 -->
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/jobSearchList.do?reqPage=1" class="de-non subEngTitel">구인구직</a></h3>
			<p>인재를 구하고, 세상을 지배하세요!</p>
		</div>
	</div>
	<div class="container" style="margin-bottom: 60px;">
		<div style="margin: 30px auto;">
			<span class="subEngTitel">새로 등록</span> <span class="subTitel">된 공고문</span><a href="/jobSearchList.do?reqPage=1" style="padding-left: 20px;text-decoration: none;font-weight: bold;">더보기</a>
		</div>
		<section class="vertical-center slider" style="width: 1200px;margin: 20px auto;">
			<c:forEach items="${joblist }" var="a" varStatus="i" begin="0" end="3">
			<div class="content" style="margin: 30px auto auto auto;border: 1px solid #ddd;width: 100%;">
			   <div class="status">모집중</div>
			   <div class="cpName"><a href="companyInfo.do?companyNo=${a.companyNo }">${a.companyName }</a></div>	
			   <div class="title-job">
			   <c:if test="${not empty sessionScope.m }">
			       <a href="/announceView.do?announceNo=${a.announceNo}&memberNo=${sessionScope.m.memberNo }&memberNo=${sessionScope.m.memberNo }">${a.announceTitle }</a>	
			   </c:if>
			   <c:if test="${empty sessionScope.m }">
			       <a href="/announceView.do?announceNo=${a.announceNo}&memberNo=0&memberNo=${sessionScope.m.memberNo }">${a.announceTitle }</a>	
			   </c:if>
			   </div>
			   <div class="info">
			       <div class="humanInfo">
			           <span>경력</span> 
			           <c:if test="${a.career eq 1}">
			           	<span>신입</span>
			           </c:if>
			           <c:if test="${a.career eq 2}">
			           	<span>경력</span>
			           </c:if>
			           <c:if test="${a.career eq 3}">
			           	<span>경력무관</span>
			           </c:if>
			           <br>
			           <span>학력</span> 
			           <c:if test="${a.school eq 1}">
			            <span>초등학교 졸업</span>
			           </c:if>
			           <c:if test="${a.school eq 2}">
			            <span>중학교 졸업</span>
			           </c:if>
			           <c:if test="${a.school eq 3}">
			            <span>고등학교 졸업</span>
			           </c:if>
			           <c:if test="${a.school eq 4}">
			            <span>대학교 졸업 이상</span>
			           </c:if>
			           <c:if test="${a.school eq 5}">
			            <span>학력무관</span>
			           </c:if>
			       </div>
			       <div class="workInfo">
			           <span>|</span>
			           <c:if test="${a.workForm eq 1}">
			           	<span>정규직</span>
			           </c:if>
			           <c:if test="${a.workForm eq 2}">
			           	<span>계약직</span>
			           </c:if>
			           <c:if test="${a.workForm eq 3}">
			           	<span>아르바이트</span>
			           </c:if>
			           <c:if test="${a.workForm eq 4}">
			           	<span>인턴</span>
			           </c:if>
			           <c:if test="${a.workForm eq 5}">
			           	<span>프리랜서</span>
			           </c:if>
			           <br>
			           <span>|</span>
			           <c:if test="${a.category eq 1}">
			           <span>IT 개발</span>	                            	
			           </c:if>
			           <c:if test="${a.category eq 2}">
			           <span>웹 디자인</span>	                            	
			           </c:if>
			           <c:if test="${a.category eq 3}">
			           <span>프로젝트 기획</span>	                            	
			           </c:if>
			       </div>
			   </div>
			   <div class="mainFooter">
			       <div class="tech">
			           <span>${a.skills }</span>
			       </div>
			       <div class="subInfo">
			           <span><c:if test="${a.workPlace eq 1 }">
			           	서울
			           </c:if>
			           <c:if test="${a.workPlace eq 2 }">
			           	경기
			           </c:if>
			           <c:if test="${a.workPlace eq 3 }">
			           	인천
			           </c:if>
			           <c:if test="${a.workPlace eq 4 }">
			           	강원
			           </c:if>
			           <c:if test="${a.workPlace eq 5 }">
			           	충남
			           </c:if>
			           <c:if test="${a.workPlace eq 6 }">
			           	충북
			           </c:if>
			           <c:if test="${a.workPlace eq 7 }">
			           	경북
			           </c:if>
			           <c:if test="${a.workPlace eq 8 }">
			           	부산
			           </c:if>
			           <c:if test="${a.workPlace eq 9 }">
			           	경남
			           </c:if>
			           <c:if test="${a.workPlace eq 10 }">
			           	전북
			           </c:if>
			           <c:if test="${a.workPlace eq 11 }">
			           	전남
			           </c:if>
			           <c:if test="${a.workPlace eq 12 }">
			           	제주
			           </c:if></span>
			       </div>
			       <div class="situation">
			           <div class="date">D - <span>${a.dDay }</span> 일 전</div>		<!-- 7 -> 마감일-현재일 이거 어캐하지 -->
			           <div class="apply">총 <span>${a.count1 }</span> 명 지원</div>		<!-- 2 -> 지원한 이력서 갯수 count  흠  -->
			        </div>
			    </div>
			</div>
			</c:forEach>
		</section>
	    <!-- 구인구직 끝-->
	</div>
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary" ><a href="/shareList.do?reqPage=1&type=1" class="de-non subEngTitel">게시판</a></h3>
			<p>각 게시판에 들어가서 게시물들을 확인하고 찾아보고 작성해 보세요!!!</p>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px;">
	<!-- 게시판 3가지 출력 -->
		<div class="cate3Box">
			<div>
				
				<div class="BoardList" >
					<div>
					<p class="title" style="background-color: #fff">공지사항</p>
					<a href="/noticeList.do?reqPage=1" class="moreTag"><p class="title" style="background-color: #fff">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach items="${noticeList }" var="n">
						<c:choose>
							<c:when test="${fn:length(n.noticeTitle) > 16}">
								<c:set var="subTitle" value="${fn:substring(n.noticeTitle,0,16)}"/>
								<a href="/noticeView.do?noticeNo=${n.noticeNo }" class="newBoard"><span>${subTitle }...</span></a>
							</c:when>
							<c:otherwise>
								<a href="/noticeView.do?noticeNo=${n.noticeNo }" class="newBoard"><span class="newTitle-2">${n.noticeTitle }</span></a>
							</c:otherwise>
						</c:choose>
						<span class="newBoardDate">${n.regDate }</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" >
					<div>
					<p class="title" style="background-color: #fff;">개발지식공유</p>
					<a href="/shareList.do?reqPage=1&type=1" class="moreTag"><p class="title" style="background-color: #fff">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach items="${shlist }" var="sh" begin="0" end="4">
						<c:choose>
							<c:when test="${fn:length(sh.boardTitle) > 16}">
								<c:set var="subTitle" value="${fn:substring(sh.boardTitle,0,16)}"/>
								<a href="/shareBoardView.do?boardNo=${sh.boardNo }" class="newBoard"><span>${subTitle }...</span></a>
							</c:when>
							<c:otherwise>
								<a href="/shareBoardView.do?boardNo=${sh.boardNo }" class="newBoard"><span class="newTitle-2">${sh.boardTitle }</span></a>
							</c:otherwise>
						</c:choose>
						<c:set var="subTitle" value="${fn:substring(sh.regDate,0,10)}"/>
						<span class="newBoardDate">${subTitle }</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" >
					<div>
					<p class="title" style="background-color: #fff">비회원 Q&A 리스트</p>
					<a href="/nonMember_CounselList.do" class="moreTag"><p class="title" style="background-color: #fff">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach items="${adlist }" var="q" begin="0" end="4">
						<c:choose>
							<c:when test="${fn:length(q.qnaTitle) > 16}">
								<c:set var="subTitle" value="${fn:substring(q.qnaTitle,0,16)}"/>
								<a href="javascript:void(0);" class="newBoard board-link"><span>${subTitle }...</span></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" class="newBoard board-link"><span class="newTitle-2">${q.qnaTitle }</span></a>
							</c:otherwise>
						</c:choose>
						<span class="newBoardDate">${q.regDate }</span><br>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 게시판 3가지 출력 끝 -->
		<a href="javascript:void(0);" id="gotop_lick" class="text-secondary"><i class="bi bi-chevron-double-up" style="font-size: 3em;"></i></a>
	</div>
	<!-- main세션 끝-->
	<script type="text/javascript">
		$(".board-link").click(function(){
			
			swal({
	 			  title: "비회원 리스트 안내",
	 			  text: "해당 비밀번호를 입력하셔야 합니다. Q&A페이지로 이동할까요??",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 location.href="/nonMember_CounselList.do";	
	 			  }
	 			});
		});
		 $(document).ready(function(){
			 $(".vertical-center").slick({
		        dots: true,
		        infinite: false,
		        vertical: true,
		        slidesToShow: 1,
		        slidesToScroll: 1,
		        centerMode: true,
		      });
			 
			 $('#gotop_lick').bind('click', function() {
				    $('html, body').animate({scrollTop: '0'}, 300);
			  });
			 
		 });
	</script>
</body>
</html>