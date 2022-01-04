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
<link rel="stylesheet" href="/resources/css/notice/qnalist.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
	.tit:hover {
	cursor: pointer;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;max-width: 1591px">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span><a href="/n_counsel.do">1:1 Q&A</a></span><span> > </span><span>내 질문보기</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<header class="n-section-title">
					<span class="tit" style="font-size: 2em;margin: 0 0 30px 0;" onclick="cancel(); return false;"><i class="bi bi-arrow-up-right-square" ></i> 내 질문 보기</span>
				</header>
				<div class="searchBox">
					<form action="/searhBoxUser.do" class="searchBox-frm">
						<div class="form-group searchBox-1">
					     	<label for="category" class="form-label mt-1 text-white">문의유형</label>
					    	<select class="form-select" id="category" name="category" >
						      	<option value="0">문의유형 선택</option>
								<option value="7">로그인관련</option>
								<option value="8">계정관련</option>
								<option value="9">결제관련</option>
								<option value="10">환불관련</option>
								<option value="11">공모전관련</option>
								<option value="12">구인잡관련</option>
								<option value="13">커뮤니티관련</option>
								<option value="40">기타 문의</option>
								<option value="21">신고</option>
								<option value="22">기능/작동 오류</option>
								<option value="20">이벤트</option>
				     		</select>
					  	</div>
					  	<div class="form-group searchBox-2">
					     	<label for="qnaAnswer" class="form-label mt-1 text-white">답변상태</label>
					    	<select class="form-select" id="state" name="state" >
						      	<option value="0">전체</option>
						      	<option value="1">미답변</option>
								<option value="2">답변</option>
				     		</select>
					  	</div>
					  	<input type="hidden" value="${sessionScope.m.memberId }" name="memberId" id="memberId">
					  	<button type="submit" class="btn btn-secondary">검색</button>
					</form>
				</div>
				<table class="table">
					<%-- <colgroup>
						<col style="width:12.6%">
						<col style="width:*">
						<col style="width:12.6%">
						<col style="width:12.6%">
					</colgroup> --%>
					<thead>
					<tr>
						<th style="width: 15%">문의 유형</th>
						<th style="text-align: center;">내용</th>
						<th style="width: 10%">작성일</th>
						<th style="width: 8%;">처리 상태</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="q" varStatus="i">
							<tr>
								<td >${q.type }</td>
								<td >
									<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#qna_Modal${i.index }">${q.qnaTitle }</a>
									<div class="modal" id="qna_Modal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog " role="document" style="top: 30%;min-width: 1000px;">
									    <div class="modal-content " >
									      <div class="modal-header">
									        <h5 class="modal-title">내 문의</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true"></span>
									        </button>
									      </div>
									      <div class="modal-body">
											<p style="font-size: 25px; font-weight: bold" id="qnaCheck">${q.type } : ${q.qnaTitle }</p>
											<%-- <p style="font-size: 15px;">파일명 : <a href="/fileDown.do?noticeNo=${n.noticeNo }">${n.filename }</a></p> --%>
											<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;border-radius: 5px;">
												<p class="qnaContent">${q.qnaContent }</p>
											</div>
											<div>
												<p class="qnafile">
													<%-- <c:forEach items="${b.list }" var="f">
														<a href="/boardFileDownload?fileNo=${f.fileNo }">${f.filename }</a><br>
													</c:forEach> --%>
												</p>
											</div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
								</td>
								<td>${q.regDate }</td>
								<td>
									<span>${q.state }</span>
									<div>
										<c:choose>
											<c:when test="${not empty q.qnaAnswer}">
												<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewModal${i.index }">내역보기</button> --%>
												<a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#viewModal${i.index }">내역보기</a>
												<div class="modal" id="viewModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog" role="document" style="top: 20%;min-width: 1000px;">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title">AnswerView</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true"></span>
												        </button>
												      </div>
												      <div class="modal-body" >
														<p style="font-size: 25px; font-weight: bold">보낸 답변보기</p>
														<p style="font-size: 22px;">${q.type }>${q.qnaTitle }</p>
														<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;border-radius: 5px;">
															<p><span style="font-weight: bold">답변 제목</span> : re)${q.qnaTitle }</p>
															<p><span style="font-weight: bold">내용</span> : ${q.qnaAnswerBr }</p>
															<p><span style="font-weight: bold">답변 날짜</span> : ${q.answerDate}</p>
														</div>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">닫기</button>
												      </div>
												    </div>
												  </div>
												</div>
											</c:when>
											<c:otherwise>
												<%-- <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#writeModal${i.index }" data-whatever="${adlist }">답변하기</button> --%>
												<a href="#" class="btn btn-secondary" onclick="deleteMyQna(this,'${q.qnaNo}');">삭제하기</a>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="n-paging"></div>
				<div class="n-btn-group">
					<a href="/n_counsel.do" class="btn btn-dark">1:1 문의하기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		function cancel() {
			if(confirm('공지사항으로 돌아가시겠습니까?')){
				location.href="/noticehome.do";
			}
		}
		function deleteMyQna(obj,qnaNo){
			console.log(qnaNo);
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.href="/deleteMyQna.do?qnaNo="+qnaNo;
			}
		}
	</script>
</body>
</html>