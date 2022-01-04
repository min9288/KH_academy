<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 게시판</title>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
.container {
   min-width: 1200px; 
   
}

.titleBox{
overflow: hidden;
}
.mainTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	float: left;
}
.subTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	margin-top:50px;
}
.subEngTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	color:#4ECDC4;
	margin-top:50px;
}
.titleBox>a{
	float: right;
	width: 150px;
	height: 50px;
	background-color: #4ECDC4;
	font-size: 19px;
	font-weight: bold;
	line-height: 40px;
	margin-right: 30px;
}
.newContestBox{
	margin-top:30px;
	margin-left: 55px;
	overflow: hidden;
	
	
}
.newContestBox>div{
	float: left;
	margin-bottom: 30px;
	
}
.newTitle{
	font-size: 20px;
	font-weight: bold;
	margin-top: 8px;
}
.newcontent{
	margin: 0;
	    

}
.contestCate{
	text-align: right;
	margin-bottom: 20px;
}
.contestCate>a{
	text-decoration: none;
	margin-right: 20px;
	font-size: 20px;
	color: #595959;
}
.contestImgBox{
	perspective: 300px;
	width: 280px;
	height: 400px;
	overflow: hidden;
	margin-right: 30px;   
	
}
.contestImgBox img{
   height:100%;
   width: 100%;
   border-radius: 5px;
   box-shadow: 0px 1px 1px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
 	
}
  .contestImgBox .item {
	  width: 280px;
	  height: 400px;
      backface-visibility: hidden;
      transition: 1s;
      
    }
    .contestImgBox .item.front {
      position: absolute;
      transform: rotateY(0deg);
    }

    .contestImgBox:hover .item.front {
      transform: rotateY(180deg);
    }
    .contestImgBox .item.back {
      transform: rotateY(-180deg);
    }
    .contestImgBox:hover .item.back {
      transform: rotateY(0deg);
    }
    .contestBack{
    	width: 280px;
	  	height: 400px;
	  	background-size : contain;
	  	border-radius: 5px;
    }
	.contestBack2{
		width: 280px;
	  	height: 400px;
	  	background-size : contain;
		border-radius: 5px;
		background: rgba(0, 0, 0, 0.7);
		padding-top: 75px;
	}
	.contestBack2>a{
		font-weight: bold;
		text-decoration: none;
		color: #fff;
		padding: 7px;
		font-size: 23px;
		border: 2px solid #fff;
		border-radius : 7px;;
		margin-left: 70px;
	}
	.contestBack2>a:hover{
		text-decoration: underline;
		color: #fff;
		
	}
	.contestBack2>p{
		color:#fff;
		font-size: 20px;
		text-align: center;

	}
	.contestBack2>p>span{
		font-weight: bold
		
	}
   

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom:100px;" >
	
	<div class="titleBox">
		<p class="mainTitel">공모전 게시판</p>
		<c:if test="${not empty sessionScope.m }">
			<a class="btn btn-primary" href="/insertContestFrm.do">공모등록</a>
		</c:if>
	</div>
	
	<%-- 메인 포스터 3개 슬라이드 --%>
	<div class="slideContest" style="margin-top: 50px; margin-left:65px; margin-bottom: 100px;">
		  <div><a href="/contestView.do?contestNo=23"><img src="/resources/img/contest/contestMainImg1.png"></a></div>
		  <div><a href="/contestView.do?contestNo=21"><img src="/resources/img/contest/contestMainImg2.png"></a></div>
		  <div><a href="/contestView.do?contestNo=22"><img src="/resources/img/contest/contestMainImg3.png"></a></div>
	</div>
	
	<%-- 카테고리 --%>
	<div class="contestCate">
		<a href="/allContestList.do?reqPage=1&type=0"><i class="bi bi-list-ul"></i> 전체보기</a>
		<a href="/contestCalendar.do"><i class="bi bi-calendar-check"></i> 공모전 캘린더</a>
	</div>
	
	
	<div>
		<span class="subEngTitel">NEW</span> <span class="subTitel">최신 공모전</span>
	</div>
	<%-- 최신 공모전 리스트 --%>
	<div class="newContestBox">
		<c:forEach var="nc" items="${list.newContest }">
		<div>
			<%--공모전 이미지 --%>
			<div class="contestImgBox">
				<div class="front item">
					<img src="/resources/img/contest/${nc.contestImg }">
				</div>
				<div class="back item">
					<div class="contestBack" style="background-image: url(/resources/img/contest/${nc.contestImg }) ">
						<div class="contestBack2" >
							<c:choose>
								<c:when test="${nc.contestType == 1}">
									<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 기획</p>
								</c:when>
								<c:when test="${nc.contestType == 2}">
									<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 개발</p>
								</c:when>
								<c:otherwise>
									<p><i class="bi bi-award" style="margin-right: 5px;"></i><span>공모유형</span> : 디자인</p>
								</c:otherwise>
							</c:choose>
							<p><i class="bi bi-trophy" style="margin-right: 5px;"></i><span>1등 시상금</span> : ${nc.contestPrize } 만원</p>
							<p style="margin-bottom: 80px;"><i class="bi bi-eye" style="margin-right: 5px;"></i><span>조회수</span> : ${nc.contestCount } 회</p>
							<a href="/contestView.do?contestNo=${nc.contestNo }">
								상세보기 <i class="bi bi-hand-index"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%--공모전 제목(제목이 16글자가 넘어가면 뒤에는 ...으로 표시 --%>
			<c:choose>
				<c:when test="${fn:length(nc.contestTitle) > 15}">
					<c:set var="subTitle" value="${fn:substring(nc.contestTitle,0,15)}"/>
					<p class="newTitle">${subTitle }...</p>
				</c:when>
				<c:otherwise>
					<p class="newTitle">${nc.contestTitle }</p>
				</c:otherwise>
			</c:choose>
			
			<p class="newcontent">주최 : ${nc.contestHost }</p>
			<p class="newcontent">기간 : ${nc.contestDate } ~ ${nc.contestDeadline }</p>
		</div>
		</c:forEach>
	</div>
		
	<div  style="margin-top: 100px;">
		<span class="subEngTitel">HOT</span> <span class="subTitel">인기 공모전</span>
	</div>
	<%-- 인기 공모전 리스트 --%>
	<div class="newContestBox">
		<c:forEach var="hc" items="${list.hotContest }">
		<div>
			<%--공모전 이미지 --%>
			<div class="contestImgBox">
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
			<%--공모전 제목(제목이 16글자가 넘어가면 뒤에는 ...으로 표시 --%>
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
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	
	
	
	
	
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
	//슬릭슬라이드
	$('.slideContest').slick({
		dots : true,				//점 표시
		autoplay : true,			//자동슬라이드
		autoplaySpeed : 4500, 		//자동슬라이드 시간
		pauseOnHover : true,		//자동슬라이스 시 마우스 호버하면 멈춤
		dotsClass : "slick-dots",	//점 css
		draggable : true,			//밀어서 넘기기
	});

	
	
	
	</script>
</body>
</html>