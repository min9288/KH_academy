<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint DashBoard</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
.mainCate{
	display:flex;
}
#dashboard{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.todayInfo{
	display: flex;
	justify-content: space-around;
	border-radius : 3px;
	padding-top: 30px;
	padding-bottom: 30px;
}
.todayInfo>div{
	
	width: 250px;
	padding-left : 20px;
	border-radius: 3px;
	background-color: #fff;
	
}
.iconBox{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: right;
	margin-top: 20px;
	margin-right: 20px;
	text-align: center
}
.todayInfo>div:first-child{
	border-left: 7px solid #fc766a;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
}
.todayInfo>div:nth-child(2){
	border-left: 7px solid #f4a100 ;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
}
.todayInfo>div:nth-child(3){
	border-left: 7px solid #5b84b1;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
}
.todayInfo>div:nth-child(4){

	border-left: 7px solid #00cfd5;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
}

.todayInfo>div>p:first-of-type{
	font-size: 23px;
	font-weight: bold;
	margin-top:15px;
	margin-bottom: 0px;
}
.todayInfo>div>span:first-of-type {
	font-size: 15px;
	margin-top: 0px;
	margin-bottom: 15px;
	display: inline-block;
	color: #727272;
}
.title{
	font-weight: bold;
	margin-bottom : 30px;
	background-color: #f8f9fc;
	height: 40px;
	padding-left: 10px;
	line-height: 40px;
	color:#1A1B3D;
}
.cate2Box{
	display: flex;
	padding-bottom: 40px;
}
#chartBox{
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	height: 450px;
	width: 860px;
	border-radius : 5px;
}
#myChart{
	width: 300px;
}
#cateChartBox{
	margin-left:70px;
	width: 350px;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	height: 450px;
	border-radius : 5px;
	padding-top: 10px;
}
.btns{
	display: flex;
	justify-content: space-evenly;
	margin-top: 15px;
	margin-bottom: 15px;
}
.btns>button{
	border: 2px solid #4ECDC4;
	font-weight: bold;
}
.cate3Box>div{
	display: flex;
	justify-content: space-evenly;
}
.BoardList{
	width: 400px;
	border-radius : 5px;
	padding: 25px;
	box-shadow: 0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);

}
.BoardList>div{
	display: flex;
}
.moreTag{
	margin-left: auto;
	color : black;
	text-decoration: none;
}
.newBoard{
	color : #565656;
	text-decoration: none;
}
.newBoardDate{
	color : #565656;
	float:right;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
	
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="dashboard" style="font-weight:bold">대시보드</span>
		</div>
		<br><br><br>
		
		<%-- TODAY 사이트 현황 --%>
		<p class="title">TODAY ${today }</p>
		<div class="todayInfo">
			<div>
				<%--총회원 / 어제 기준 증감률 표시--%>
				<div class="iconBox" style="background-color: #fc766a"><i class="bi bi-people-fill" style="color:#fff"></i></div>
				<p>${todayTotalMember }</p>
				<span>총 회원</span>
				<c:choose>
					<c:when test="${todayTotalMember == yesterDayTotalMember}">
						<p><span style="font-weight: bold">0 member</span><span style="font-size: 13px;"> from yesterday</span></p>
					</c:when>
					<c:when test="${todayTotalMember > yesterDayTotalMember}">
						<p>
							<span style="color:blue; font-weight: bold">
								${todayTotalMember - yesterDayTotalMember} member
							</span>
							<span style="color:blue; font-weight: bold">↑</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
					<c:when test="${todayTotalMember < yesterDayTotalMember}">
						<p>
							<span style="color:red; font-weight: bold">
								${todayTotalMember - yesterDayTotalMember} member
							</span>
							<span style="color:red; font-weight: bold">↓</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
				</c:choose>
			</div>
			<div>
				<%--가입회원 / 어제 기준 증감률 표시--%>
				<div class="iconBox" style="background-color: #f4a100"><i class="bi bi-person-plus-fill" style="color:#fff"></i></div>
				<p>${todayJoinMember }</p>
				<span>가입 회원</span>
				<c:choose>
					<c:when test="${todayJoinMember == joinList[4]}">
						<p><span style="font-weight: bold">0 member</span><span style="font-size: 13px;"> from yesterday</span></p>
					</c:when>
					<c:when test="${todayJoinMember > joinList[4]}">
						<p>
							<span style="color:blue; font-weight: bold">
								${todayJoinMember - joinList[4]} member
							</span>
							<span style="color:blue; font-weight: bold">↑</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
					<c:when test="${todayJoinMember < joinList[4]}">
						<p>
							<span style="color:red; font-weight: bold">
								${todayJoinMember - joinList[4]} member
							</span>
							<span style="color:red; font-weight: bold">↓</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
				</c:choose>
			</div>
			<div>
				<%--탈퇴회원 / 어제 기준 증감률 표시--%>
				<div class="iconBox" style="background-color: #5b84b1"><i class="bi bi-person-dash-fill" style="color:#fff"></i></div>
				<p>${todayOutMember }</p>
				<span>탈퇴 회원</span>
				<c:choose>
					<c:when test="${todayOutMember == outList[4]}">
						<p><span style="font-weight: bold">0 member</span><span style="font-size: 13px;"> from yesterday</span></p>
					</c:when>
					<c:when test="${todayOutMember > outList[4]}">
						<p>
							<span style="color:blue; font-weight: bold">
								${todayOutMember - outList[4]} member
							</span>
							<span style="color:blue; font-weight: bold">↑</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
					<c:when test="${todayOutMember < outList[4]}">
						<p>
							<span style="color:red; font-weight: bold">
								${todayOutMember - outList[4]} member
							</span>
							<span style="color:red; font-weight: bold">↓</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
				</c:choose>
			</div>
			<div>
				<%--새로운 게시물 / 어제 기준 증감률 표시--%>
				<div class="iconBox" style="background-color: #00cfd5"><i class="bi bi-list-ul" style="color:#fff"></i></div>
				<p>${todayTotalContent }</p>
				<span>New 게시물</span>
				<c:choose>
					<c:when test="${todayTotalContent == yesterDayTotalBoard}">
						<p><span style="font-weight: bold">0 post</span><span style="font-size: 13px;"> from yesterday</span></p>
					</c:when>
					<c:when test="${todayTotalContent > yesterDayTotalBoard}">
						<p>
							<span style="color:blue; font-weight: bold">
								${todayTotalContent - yesterDayTotalBoard} post
							</span>
							<span style="color:blue; font-weight: bold">↑</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
					<c:when test="${todayTotalContent < yesterDayTotalBoard}">
						<p>
							<span style="color:red; font-weight: bold">
								${todayTotalContent - yesterDayTotalBoard} post
							</span>
							<span style="color:red; font-weight: bold">↓</span>
							<span style="font-size: 13px;"> from yesterday</span>
						</p>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<%--회원 가입/탈퇴현황 + 사이트 통계 --%>
		<div class="cate2Box">
			<div class="joinDelete">
				<p class="title" style="margin-top:50px;">회원 가입/탈회 현황</p>
				<div id="chartBox" >
					<canvas id="myChart1" ></canvas>
				</div>
			</div>
			<div id="cateChart">
				<p class="title" style="margin-top:50px; margin-left:70px;">사이트 통계</p>
				<div id="cateChartBox" >
					<div class="btns">
						<button class="btn btn-outline-primary btn2">등급별</button>
						<button class="btn btn-outline-primary btn3">카테고리별</button>
					</div>
					<div class="clearChart">
						<canvas id="myChart2" ></canvas>
					</div>
				</div>
			</div>
		</div>
		
		<%--게시판 별 최신글 --%>	
		<div class="cate3Box">
		<p class="title" style="margin-top:50px;">관리자 게시판</p>	
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
								<span class="newTitle">${n.noticeTitle }</span>
							</c:otherwise>
						</c:choose>
						<span class="newBoardDate">${n.regDate }</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" >
					<div>
					<p class="title" style="background-color: #fff">회원 QNA</p>
					<a href="/adminCounsel.do?type=1" class="moreTag"><p class="title" style="background-color: #fff">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach items="${qnaList }" var="q">
						<c:choose>
							<c:when test="${fn:length(q.qnaTitle) > 16}">
								<c:set var="subTitle" value="${fn:substring(q.qnaTitle,0,16)}"/>
								<a href="javascript:void(0);" onclick="qnaAtag()" class="newBoard"><span>${subTitle }...</span></a>
							</c:when>
							<c:otherwise>
								<span class="newTitle"><a href="javascript:void(0);" onclick="qnaAtag()" class="newBoard">${q.qnaTitle }</a></span>
							</c:otherwise>
						</c:choose>
						<span class="newBoardDate">${q.regDate }</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" >
					<div>
					<p class="title" style="background-color: #fff;">비회원 QNA</p>
					<a href="/adminCounsel.do?type=2" class="moreTag"><p class="title" style="background-color: #fff">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach items="${nonQnaList }" var="nq">
						<c:choose>
							<c:when test="${fn:length(nq.qnaTitle) > 16}">
								<c:set var="subTitle" value="${fn:substring(nq.qnaTitle,0,16)}"/>
								<a href="javascript:void(0);" onclick="nqnaAtag()" class="newBoard"><span>${subTitle }...</span></a>
							</c:when>
							<c:otherwise>
								<span class="newTitle"><a href="javascript:void(0);" onclick="nqnaAtag()" class="newBoard">${nq.qnaTitle }</a></span>
							</c:otherwise>
						</c:choose>
						<span class="newBoardDate">${nq.regDate }</span><br>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div> 
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 $(function(){
		 var dateList = '${dateList}';
		 var stringDate = dateList.toString();
		 <%-- 가입/탈퇴 차트(line타입)--%>
		 new Chart(document.getElementById("myChart1"), {
			  type: 'line',
			  data: {
			    labels: ${dateList},
			    datasets: [{ 
			        data: ${joinList},
			        label: "가입",
			        borderColor: "#4ECDC4",
			        fill: false
			      }, { 
			        data: ${outList},
			        label: "탈퇴",
			        borderColor: "#f3969a",
			        fill: false
			      }
			    ]
			  },
			  options: {
			    title: {
			      display: true,
			      text: 'DeveloMint 회원 가입 / 탈퇴 현황'
			    }
			  }
			});

		 
		 <%-- 등급별버튼 클릭시 나오는 파이차트--%>
		 $(".btn2").click(function(){
			 $("#myChart2").remove();
			 var canvasHtml = '<canvas id="myChart2" ></canvas>';
			 $(".clearChart").append(canvasHtml);
			 $(".btn3").css("background-color","#fff");
			 $(".btn3").css("color","#4ECDC4");
			 $(".btn3").css("border-color","#4ECDC4");
			 $(".btn2").css("background-color","#4ECDC4");
			 $(".btn2").css("color","#fff");
			 var myChart = new Chart(document.getElementById("myChart2"), {
				    type: 'pie',
				    data: {
				      labels: ["브론즈","실버","골드","플레티넘","다이아","마스터","챌린저"],
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#4ECDC4","#269489","#5b84b1","#f67148","#fc766a","#f4a100","#e6d412"],
				        data: ${gradeList}
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: 'DeveloMint 회원 등급 통계'
				      }
				    }
				});
		 });
		 $(".btn2").trigger("click");
		 
		 <%-- 카테고리별버튼 클릭시 나오는 파이차트--%>
		 $(".btn3").click(function(){
			 $("#myChart2").remove();
			 var canvasHtml = '<canvas id="myChart2" ></canvas>';
			 $(".clearChart").append(canvasHtml);
			 $(".btn2").css("background-color","#fff");
			 $(".btn2").css("color","#4ECDC4");
			 $(".btn2").css("border-color","#4ECDC4");
			 $(".btn3").css("background-color","#4ECDC4");
			 $(".btn3").css("color","#fff");
			 var myChart = new Chart(document.getElementById("myChart2"), {
				    type: 'pie',
				    data: {
				      labels: ["프로젝트 팀원모집","개발지식 공유","구인구직","고수의 노하우","공모전"],
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#4ECDC4","#269489","#f67148","#f4a100","#e6d412"],
				        data: ${cateList}
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: 'DeveloMint 카테고리별 게시물 통계'
				      }
				    }
				});
		 });
		
	 })
	 
	 function qnaAtag(){
		 swal({
			  title: "회원 QNA 게시판 이동",
			  text: "해당 내용은 회원 QNA게시판에서 확인 가능합니다. 이동하시겠습니까?",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href="/adminCounsel.do?type=1";	
			  }
			});
	 }
	 
	 function nqnaAtag(){
		 swal({
			  title: "비회원 QNA 게시판 이동",
			  text: "해당 내용은 비회원 QNA게시판에서 확인 가능합니다. 이동하시겠습니까?",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href="/adminCounsel.do?type=2";	
			  }
			});
	 }
	
	 </script>
</body>
</html>