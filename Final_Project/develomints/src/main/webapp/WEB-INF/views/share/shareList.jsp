<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Develomints</title>
<style>
	.cateImg{
		width: 50px;
		height: 50px;
		margin-left: 30px; 
	}
	.details:hover{
		font-weight: bold;
	}
	.page-sorting{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-top: 50px;
	}
	.page-sorting a{
		margin-right: 10px;
	}
	#searcher{
		width: 30%;
	}
	.pageCategory{
		display: flex;
		justify-content: space-between;
		margin-top: 50px;
	}
	.cateBadge{
		margin-left: 10px;
	}
	.tbcol{
		width: 100px;
	}
	#pageNavi{
		display: flex;
		justify-content: center;
		margin-top: 50px;
	}
	.page-table{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.page-table a{
		text-decoration: none;
		font-weight: bold;
		font-size: 17px;
		color: #343a40;
	}
	.page-table table{
		vertical-align: middle;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="page-top">
				<div class="pageCategory">
					<div>
						<span style="font-size: 25px; font-family: NotoBold;">개발지식 공유 게시판</span><img class="cateImg" src="/resources/img/shareBoard/board.png">									
					</div>
					<c:if test="${not empty sessionScope.m }">
						<div>
	 				    	<a href="/shareWriteFrm.do" class="btn btn-info writeBtn">글쓰기</a>				
						</div>					
					</c:if>
				</div>
				<!-- 페이지 카테고리 종료 -->
				<div class="page-sorting">
					<div>
						<a href="/shareList.do?reqPage=1&type=1" class="btn btn-outline-dark sorting">최신순</a>
						<a href="/shareList.do?reqPage=1&type=2" class="btn btn-outline-dark sorting">추천순</a>
						<a href="/shareList.do?reqPage=1&type=3" class="btn btn-outline-dark sorting">조회순</a>
						<a href="/shareList.do?reqPage=1&type=4" class="btn btn-outline-dark sorting">댓글순</a>				
					</div>
		            <!-- 게시글 검색창 , 작성자 or 글 제목 -->
				    <div class="input-group mb-3 " id="searcher">
				      <select class="form-select" id="searchCategory" name="searchCategory">
				        <option value="1">제목</option>
				        <option value="2">작성자</option>
				      </select>
				      <input type="text" class="form-control" placeholder="검색할 내용" aria-label="Recipient's username" aria-describedby="searchBtn" name="searchContent" id="searchContent" style="width:150px;">
				      <button class="btn btn-primary" type="button" id="searchBtn">검색하기</button>
				    </div>
				</div>
				<!-- 페이지 소팅div 끝 -->
			</div>
			<div class="page-table">
				<table class="table table-hover">
					<tr class="table-primary">
						<th style="padding-left: 30px;">제목</th><th class="tbcol">댓글</th><th class="tbcol">좋아요</th><th class="tbcol">조회수</th><th style="width: 250px; padding-left: 50px;">작성자</th><th style="width: 200px; padding-left: 50px;">작성시간</th>
					</tr>
					<c:forEach items="${list }" var="sv" varStatus="i">
						<tr>
							<td style="padding-left: 30px;">
								<div>
									<span class="text-muted"># ${sv.boardNo }</span><span class="badge bg-info cateBadge">${sv.type }</span>
								</div>
								<!-- 로그인으로 if문 돌리고 처리-->
								<a href="/shareBoardView.do?boardNo=${sv.boardNo }">${sv.boardTitle }</a>
							</td>
							<td><i class="bi bi-chat" style="color: #4ecdc4"></i>${sv.comments }</td>
							<td><i class="bi bi-suit-heart-fill" style="color: #4ecdc4"></i>${sv.likes }</td>
							<td><i class="bi bi-eyeglasses" style="color: #4ecdc4"></i>${sv.readCount }</td>
							<td>
								<c:choose>
									<c:when test="${sv.profiles ne null}">
										<img src="/resources/upload/member/${sv.profiles }" style="width: 30px; height: 30px; border-radius: 30px;">									
									</c:when>
									<c:otherwise>
										<img src="/resources/img/member/user.png" style="width: 30px; height: 30px; border-radius: 30px;">
									</c:otherwise>
								</c:choose>
								<span>${sv.memberId }</span>
								<c:choose>
									<c:when test="${sv.memberGrade >=1 && sv.memberGrade <= 20 }">
										<span><img src="/resources/img/member/rank/bronze.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=21 && sv.memberGrade <= 40 }">
										<span><img src="/resources/img/member/rank/silver.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=41 && sv.memberGrade <= 60 }">
										<span><img src="/resources/img/member/rank/gold.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=61 && sv.memberGrade <= 80 }">
										<span><img src="/resources/img/member/rank/platinum.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=81 && sv.memberGrade <= 110 }">
										<span><img src="/resources/img/member/rank/diamond.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=111 && sv.memberGrade <= 140 }">
										<span><img src="/resources/img/member/rank/master.png" style="width: 35px; height:35px;"></span>
									</c:when>
									<c:when test="${sv.memberGrade >=141 && sv.memberGrade <= 170 }">
										<span><img src="/resources/img/member/rank/challenger.png" style="width: 35px; height:35px;"></span>
									</c:when>								
								</c:choose>								
							</td>
							<td>${sv.regDate }</td>
						</tr>
					</c:forEach>
				</table><!-- 출력 테이블 종료 -->
				<div id="pageNavi">
					${pageNavi }
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		
	 //카테고리 색
	 $(function(){
		 var type = '${type}';
		 
		 if(type == 1){
			 $(".sorting").eq(0).removeClass("btn-outline-dark");
			 $(".sorting").eq(0).addClass("btn-dark");
		 }else if(type == 2){
			 $(".sorting").eq(1).removeClass("btn-outline-dark");
			 $(".sorting").eq(1).addClass("btn-dark");
		 }else if(type == 3){
			 $(".sorting").eq(2).removeClass("btn-outline-dark");
			 $(".sorting").eq(2).addClass("btn-dark");
		 }else if(type == 4){
			 $(".sorting").eq(3).removeClass("btn-outline-dark");
			 $(".sorting").eq(3).addClass("btn-dark");
		 }
	 });
	 //검색
	 $("#searchBtn").click(function(){
		var searchVal = $("#searchContent").val();
		var cateVal = $("#searchCategory").val();
		var category = Number(cateVal);

		location.href="/shareSearch.do?reqPage=1&type=1&search="+searchVal+"&category="+category;

	 });
	</script>	
</body>
</html>