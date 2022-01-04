<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판 조회</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
.cateBox{
	display:flex;
	justify-content: space-around;
	border: 1px solid #d9d9d9;
	padding: 25px;
}
.chartBox{
	width: 320px;
	height: 320px;
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	padding:20px;
}
.cate_1{
	padding: 5px;
	
}
.listTag{
	color : black;
	text-decoration: none;
	font-size: 20px;
	margin-left: 5px;
	
}
.chartTableBox{
	margin-top: 50px;
	display: flex;	
	justify-content: space-around;
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
.boardTable{
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	width: 900px;
	height: 650px;
	padding: 20px;
}
.box1{
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	width: 320px;
	height: 210px;
	padding: 20px;
}
.aTag{
	text-decoration: none;
	color: #888888;
}
	
</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
	
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="dashboard" style="font-weight:bold">전체 게시판 조회</span>
		</div>
		<br><br><br>
		
		<%--조회 카테고리 --%>
		<div class="cateBox">
			<div class="cate_1">
				<i class="bi bi-people-fill" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=1" class="listTag"> 팀원모집</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-chat-square-text" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=2" class="listTag">개발지식공유</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-briefcase" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=3" class="listTag">구인구직</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-lightbulb" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=4" class="listTag">고수의 게시판</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-trophy" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=5" class="listTag">공모전</a>
			</div>
		</div>
		
		<div class="chartTableBox">
			<div class="flexBox">
				<p class="title" style="margin-top:20px; width: 320px;">총 게시물 수</p>	
				<div class="chartBox">
					<canvas id="bar-chart-grouped" width="100%" height="100%"></canvas>
				</div>
				
				<p class="title" style="margin-top:50px; width: 320px;">최근 5일 게시물 수</p>	
				<div class="box1">
					<canvas id="line-chart" style="margin-top:15px;"></canvas>
				</div>
			</div>
			<div class="flexBox">
				<p class="title" style="margin-top:20px; width: 900px;">전체 게시물</p>	
				<div class="boardTable" style="position: relative;">
					<c:choose>
						<%--팀원모집 --%>
						<c:when test="${type == 1 }">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>회원ID</th>
									<th>진행상태</th>
									<th>작성일</th>
									<th>게시물삭제</th>
								</tr>
								<c:forEach items="${projectList }" var="p" varStatus="i">
									<tr>
										<td>${start + i.index}</td>
										<td>
											<a href="/selectOneNotice.do?projectNo=${p.projectNo }&memberNo=${sessionScope.m.memberNo}" class="aTag">
												${p.RTitle }
											</a>
										</td>
										<td>${p.projectWriterId}</td>
										<c:choose>
											<c:when test="${p.projectStatus == 1 }">
												<td>모집중</td>
											</c:when>
											<c:when test="${p.projectStatus == 2 }">
												<td>진행중</td>
											</c:when>
											<c:when test="${p.projectStatus == 3 }">
												<td>종료</td>
											</c:when>
										</c:choose>
										<td>${p.RStartDate }</td>
										<td><button class="btn btn btn-info btn-sm delBtn" value="${p.projectNo }">삭제하기</button></td>
									</tr>
								</c:forEach>
							</table>
							<div id="pageNavi" style="margin-top:50px; margin-bottom : 10px; position: absolute; bottom: 0; left:50%"  >${pageNavi }</div>
						</c:when>
						
						<%--개발지식공유 --%>
						<c:when test="${type == 2 }">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>회원ID</th>
									<th>조회수</th>
									<th>작성일</th>
									<th>게시물삭제</th>
								</tr>
								<c:forEach items="${shareList }" var="s" varStatus="i">
									<tr>
									<td>${start + i.index}</td>
									<td>
										<a href="/shareBoardView.do?boardNo=${s.boardNo }" class="aTag">
											<c:choose>
												<c:when test="${fn:length(s.boardTitle) > 25}">
													<c:set var="subTitle" value="${fn:substring(s.boardTitle,0,25)}"/>
													${subTitle }...
												</c:when>
												<c:otherwise>
													${s.boardTitle }
												</c:otherwise>
											</c:choose>
										</a>
									</td>
									<td>${s.memberId }</td>
									<td>${s.readCount }</td>
									<c:set var="subTitle" value="${fn:substring(s.regDate,0,10)}"/>
									<td>${subTitle }</td>
									<td><button class="btn btn btn-info btn-sm delBtn" value="${s.boardNo }">삭제하기</button></td>
									<tr>
								</c:forEach>
							</table>
							<div id="pageNavi" style="margin-top:50px; margin-bottom : 10px; position: absolute; bottom: 0; left:50%"  >${pageNavi }</div>
						</c:when>
						
						<%--구인구직 --%>
						<c:when test="${type == 3 }">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>공고 제목</th>
									<th>회원ID</th>
									<th>기업이름</th>
									<th>작성일</th>
									<th>게시물삭제</th>
								</tr>
								<c:forEach items="${announceList }" var="a" varStatus="i">
									<tr>
									<td>${start + i.index}</td>
									<td>
										<a href="announceView.do?announceNo=${a.announceNo}" class="aTag">
											<c:choose>
												<c:when test="${fn:length(a.announceTitle) > 30}">
													<c:set var="subTitle" value="${fn:substring(a.announceTitle,0,30)}"/>
													${subTitle }...
												</c:when>
												<c:otherwise>
													${a.announceTitle }
												</c:otherwise>
											</c:choose>	
										</a>
									</td>
									<td>${a.school }</td>
									<td>${a.companyName }</td>
									<td>${a.writeDate }</td>
									<td><button class="btn btn btn-info btn-sm delBtn" value="${a.announceNo }">삭제하기</button></td>
									<tr>
								</c:forEach>
							</table>
							<div id="pageNavi" style="margin-top:50px; margin-bottom : 10px; position: absolute; bottom: 0; left:50%"  >${pageNavi }</div>
						</c:when>
						
						<%-- 고수의 게시판 --%>
						<c:when test="${type == 4 }">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>고수ID</th>
									<th>작성일</th>
									<th>게시물삭제</th>
								</tr>
								<c:forEach items="${gosuList }" var="g" varStatus="i">
									<tr>
									<td>${start + i.index}</td>
									<td>
										<a href="/gosuNoticeContent.do?gnn=${g.gnoticeNo }" class="aTag">
											<c:choose>
												<c:when test="${fn:length(g.gnoticeTitle) > 35}">
													<c:set var="subTitle" value="${fn:substring(g.gnoticeTitle,0,35)}"/>
													${subTitle }...
												</c:when>
												<c:otherwise>
													${g.gnoticeTitle }
												</c:otherwise>
											</c:choose>	
										</a>
									</td>
									<td>${g.writeId }</td>
									<td>${g.gnoticeDate }</td>
									<td><button class="btn btn btn-info btn-sm delBtn" value="${g.gnoticeNo }">삭제하기</button></td>
									<tr>
								</c:forEach>
							</table>
							<div id="pageNavi" style="margin-top:50px; margin-bottom : 10px; position: absolute; bottom: 0; left:50%"  >${pageNavi }</div>
						</c:when>
						
						<%-- 공모전 게시판 --%>
						<c:when test="${type == 5 }">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성ID</th>
									<th>주최</th>
									<th>작성일</th>
									<th>게시물삭제</th>
								</tr>
								<c:forEach items="${contestList }" var="c" varStatus="i">
									<tr>
									<td>${start + i.index}</td>
									<td>
										<a href="/contestView.do?contestNo=${c.contestNo }" class="aTag">
											<c:choose>
												<c:when test="${fn:length(c.contestTitle) > 25}">
													<c:set var="subTitle" value="${fn:substring(c.contestTitle,0,25)}"/>
													${subTitle }...
												</c:when>
												<c:otherwise>
													${c.contestTitle }
												</c:otherwise>
											</c:choose>	
										</a>
									</td>
									<td>${c.memberId }</td>
									<td>${c.contestHost }</td>
									<td>${c.contestDate }</td>
									<td><button class="btn btn btn-info btn-sm delBtn" value="${c.contestNo }">삭제하기</button></td>
									<tr>
								</c:forEach>
							</table>
							<div id="pageNavi" style="margin-top:50px; margin-bottom : 10px; position: absolute; bottom: 0; left:50%"  >${pageNavi }</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		
		
		
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script>
	$(function(){
		var type = '${type}';
		var boardType = $(".listTag").eq(type-1).html()
		
		//차트
		new Chart(document.getElementById("bar-chart-grouped"), {
		    type: 'bar',
		    data: {
		      labels: ["게시물 수"],
		      datasets: [
		        {
		          label: boardType,
		          backgroundColor: "#f3969a",
		          data: [${totalCount}]
		        }, {
		          label: "전체게시물",
		          backgroundColor: "#4ECDC4",
		          data: [${allBoardCount}]
		        }
		      ]
		    },
		    options: {
		      title: {
		        display: true,
		        text: boardType+' 게시판 게시물 수'
		      }
		    }
		});
		
		new Chart(document.getElementById("line-chart"), {
			  type: 'line',
			  data: {
			    labels: ${weekList},
			    datasets: [{ 
			        data: ${countList5},
			        label: boardType,
			        borderColor: "#3e95cd",
			        fill: false
			      }
			    ]
			  }
			});
		
		//카테고리 색
		if(type == 1){
			$(".listTag").eq(0).css("color","#4ECDC4");
			$(".cate_1").eq(0).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 2){
		 	$(".listTag").eq(1).css("color","#4ECDC4");
		 	$(".cate_1").eq(1).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 3){
			$(".listTag").eq(2).css("color","#4ECDC4");
			$(".cate_1").eq(2).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 4){
			$(".listTag").eq(3).css("color","#4ECDC4");
			$(".cate_1").eq(3).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 5){
			$(".listTag").eq(4).css("color","#4ECDC4");
			$(".cate_1").eq(4).css("border-bottom","3px solid #4ECDC4");
		}
	});
	
	$(".delBtn").click(function(){
		var index = $(".delBtn").index(this);
		var boardNo = $(".delBtn").eq(index).val();
		
		var checkConfirm = confirm("이곳에서 삭제하면 회원에게 통보없이 게시물이 삭제됩니다. 삭제하시겠습니까?");
		if(checkConfirm){
			location.href="/postSeleteDelete.do?type="+${type}+"&boardNo="+boardNo;
		}
	});
	
	
	
</script>
</body>
</html>