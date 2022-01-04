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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:20~18:30(점심 12:20~13:30)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents" style="padding: 20px;">
				<div class="title" style="border-bottom: none;padding: 0;"><h2 style="display: inline-block;">Notice</h2>
				<c:if test="${not empty sessionScope.m && sessionScope.m.memberType eq 9}">
					<a class="btn btn-primary" href="javascript:void(0)" onclick="deleteNoticeNo(this,'${n.noticeNo}');" style="float: right;">삭제</a>
					<a class="btn btn-outline-primary" href="/updateNoticeFrm.do?noticeNo=${n.noticeNo }" style="float: right;margin-right: 10px;">수정</a>
				</c:if>
				</div>
				<div class="notice-contents" style="padding: 20px 0 0 0;border-bottom: none;">
					<!-- 불러온 글제목 -->
					<h4 style="font-weight: bold;border-bottom: 1px solid #ddd;">${n.noticeTitle }</h4>
					<!-- 작성일, 읽은 수(테이블 컬럼 추가 해야함) -->
					<span>${n.regDate } / View : ${n.readCount } </span>
					<p>
						<!-- 첨부파일테이블로 넣어서 사용 -->
						<c:if test="${not empty n.filename }">
							<!-- <img src="/resources/img/notice/file.png" style="color:white;"> -->
							File : 
							<a href="/fileDown.do?noticeNo=${n.noticeNo }">${n.filename }</a>
							<%-- <a href="javascript:void(0)" onclick="downFile(this);">${n.filename }</a> --%>
						</c:if>
					</p>
					<div class="contents-box">
						<!-- 이미지 있으면 이미지 출력, 내용잇으면 내용 출력 -->
						${n.noticeContent }
					</div>
				<a href="/noticeList.do?reqPage=1" class="btn btn-outline-primary">목록보기</a>
				</div>
			</div>
			<div>
				<!-- 이전공지, 다음공지로 넘어가게 내용이 있으면 출력 , 없으면  나타내기 않게하기 -->
				<ul class="a-link"><span style="font-size: x-large;">CS center/Notice <span style="font-size: small;color: #999;">카테고리의 다른글</span></span>
					<c:forEach var="rlist" items="${rlist }">
						<c:choose>
							<c:when test="${rnum eq rlist.rnum}">
								<li><a href="/noticeView.do?noticeNo=${rlist.noticeNo }" class="a-active">${rlist.rnum} ${rlist.noticeTitle } <span style="font-size: small;color: #999;">${rlist.regDate }</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/noticeView.do?noticeNo=${rlist.noticeNo }">${rlist.rnum} ${rlist.noticeTitle } <span style="font-size: small;color: #999;">${rlist.regDate }</span></a></li>
							</c:otherwise>						
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/* function downFile(obj){
			$(obj).attr('href' , '/resources/upload/notice/'+${n.filepath});
		    $(obj).attr('download' , ${n.filename});
		} */
	
		function deleteNoticeNo(obj,noticeNo){
			/* if(confirm("게시글을 삭제하시겠습니까?")){
				location.href="/deleteNoticeNo.do?noticeNo="+${n.noticeNo };
			} */
			swal({
	 			  title: "게시글 삭제",
	 			  text: "게시글을 삭제하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 location.href="/deleteNoticeNo.do?noticeNo="+${n.noticeNo };
	 			  }
	 			});
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>