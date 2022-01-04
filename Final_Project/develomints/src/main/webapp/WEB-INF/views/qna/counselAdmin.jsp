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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;max-width: 1591px">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<div class="selectBox">
				<ol class="breadcrumb" >
					<c:choose>
						<c:when test="${type eq 1}">
							<li class="breadcrumb-item active">회원</li>
						  	<li class="breadcrumb-item"><a href="adminCounsel.do?type=2">비회원</a></li>
						</c:when>
						<c:when test="${type eq 2}">
							<li class="breadcrumb-item "><a href="adminCounsel.do?type=1">회원</a></li>
						  	<li	class="breadcrumb-item active">비회원</li>
						</c:when>
					</c:choose>
				</ol>
				<!-- <button type="button" class="btn btn-secondary">회원</button>
				<button type="button" class="btn btn-primary">비회원</button> -->
				</div>
				<div class="searchBox">
					<form action="/searhBox.do" class="searchBox-frm">
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
					  	<input type="hidden" value="${type }" name="type" id="type">
					  	<button type="submit" class="btn btn-secondary">검색</button>
					</form>
				</div>
				<div class="contents t2">
					<table class="table">
					<%-- <colgroup>
						<col style="width:10%">
						<col>
						<col style="width:25%">
						<col style="width:25%">
					</colgroup> --%>
					<thead>
					<tr>
						<th style="width: 10%">문의번호</th>
						<th style="width: 15%">문의 유형</th>
						<th style="text-align: center;">내용</th>
						<c:choose>
							<c:when test="${type eq 1}">
								<th style="width: 10%">아이디</th>
							</c:when>
							<c:otherwise>
								<th style="width: 15%">이메일</th>
							</c:otherwise>
						</c:choose>
						<th style="width: 10%">작성일</th>
						<th style="width: 8%;">처리 상태</th>
					</tr>
					</thead>
					<tbody >
						<c:forEach items="${adlist }" var="q" varStatus="i">
							<tr>
								<c:choose>
									<c:when test="${type eq 1}">
										<td >${q.qnaNo }</td>
									</c:when>
									<c:otherwise>
										<td >${q.nonQnaNo }</td>
									</c:otherwise>
								</c:choose>
								<td >${q.type }</td>
								<td >
									<c:choose>
										<c:when test="${type eq 1}">
											<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#qna_Modal${i.index }" onclick="clickList('${q.qnaNo}','${i.index }');" class="clickA">${q.qnaTitle }</a>
											<div class="modal" id="qna_Modal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog " role="document" style="top: 30%;min-width: 1000px;">
											    <div class="modal-content " >
											      <div class="modal-header">
											        <h5 class="modal-title">문의 확인하기</h5>
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
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#qna_Modal${i.index }" <%-- onclick="clickList('${q.qnaNo}','${i.index }');" --%> class="clickA">${q.qnaTitle }</a>
											<div class="modal" id="qna_Modal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog " role="document" style="top: 30%;min-width: 1000px;">
											    <div class="modal-content " >
											      <div class="modal-header">
											        <h5 class="modal-title">문의 확인하기</h5>
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
										</c:otherwise>
									</c:choose>
								</td>
								<c:choose>
									<c:when test="${type eq 1}">
										<td >${q.memberId }</td>
									</c:when>
									<c:otherwise>
										<td >${q.email }</td>
									</c:otherwise>
								</c:choose>
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
												<a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#writeModal${i.index }">답변하기</a>
												<div class="modal" id="writeModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog" role="document" style="min-width: 1000px;">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title">AnswerWrite</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true"></span>
												        </button>
												      </div>
												    	<form action="/updateCounsel.do" method="post" id="updateCounsel">
											      		<div class="modal-body">
															<p style="font-size: 25px; font-weight: bold">답변보내기</p>
															<p style="font-size: 22px;">${q.type } > ${q.qnaTitle }</p>
															<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;border-radius: 5px;">
																<p><span style="font-weight: bold">답변</span> : re)${q.qnaTitle }</p>
																<div class="form-group">
															      <label for="qnaAnswer" class="form-label mt-4" style="font-weight: bold">내용</label>
															      <textarea class="form-control" id="qnaAnswer" name="qnaAnswer" cols="20" rows="20" placeholder="내용을 입력해주세요." required style="resize: none;" ></textarea>
															    </div>
															</div>
															<c:choose>
																<c:when test="${type eq 1}">
																	글번호 : <input type="text" value="${q.qnaNo}" name="num">
																</c:when>
																<c:otherwise>
																	글번호 : <input type="text" value="${q.nonQnaNo}" name="num">
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${type eq 1}">
																	<input type="hidden" value="1" name="type">회원
																</c:when>
																<c:otherwise>
																	<input type="hidden" value="2" name="type">비회원
																</c:otherwise>
															</c:choose>
												      	</div>
												      	<div class="modal-footer">
												       		<button type="button" class="btn btn-primary btn_yes">작성하기</button>
												        	<button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">취소하기</button>
												     	</div>
												     	<c:if test="${type eq 1}">
													     	<div style="display: none">
																<input type="hidden" class="receiver" value="${q.memberId }">
																<input type="hidden" class="sender" value="admin">
																<input type="hidden" class="dmContent" value="[알림] 문의하신 1:1 Q&A에 대한 답변이 되었습니다. 답변을 확인하세요.">
															</div>
												     	</c:if>
														</form>
												    </div>
												  </div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
						</c:forEach>
						<!-- 모달 -->
						<%-- <div class="modal" id="viewModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document" style="top: 30%">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">AnswerView</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true"></span>
						        </button>
						      </div>
						      <div class="modal-body">
								<p style="font-size: 25px; font-weight: bold">보낸 답변보기</p>
								<p style="font-size: 22px;">타입>타이틀</p>
								<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;border-radius: 5px;">
									<p><span style="font-weight: bold">답변 제목</span> : re)타이틀</p>
									<p><span style="font-weight: bold">내용</span> : ${q.qnaAnswerBr }</p>
									<p><span style="font-weight: bold">답변 날짜</span> : ${q.answerDate}</p>
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div> --%>
						<%-- <div class="modal" id="writeModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document" >
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">AnswerWrite</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true"></span>
						        </button>
						      </div>
						    	<form action="/updateCounsel.do" method="post">
					      		<div class="modal-body">
									<p style="font-size: 25px; font-weight: bold">답변보내기</p>
									<p style="font-size: 22px;">${q.type } > ${q.qnaTitle }</p>
									<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;border-radius: 5px;">
										<p><span style="font-weight: bold">답변</span> : re)${q.qnaTitle }</p>
										<div class="form-group">
									      <label for="qnaAnswer" class="form-label mt-4" style="font-weight: bold">내용</label>
									      <textarea class="form-control" id="qnaAnswer" name="qnaAnswer" cols="20" rows="20" placeholder="내용을 입력해주세요." required style="resize: none;" ></textarea>
									    </div>
									</div>
									<c:choose>
										<c:when test="${type eq 1}">
											<input type="text" value="${q.qnaNo}" name="qnaNo">
										</c:when>
										<c:otherwise>
											<input type="text" value="${q.nonQnaNo}" name="nonQnaNo">
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${type eq 1}">
											<input type="text" value="1" name="type">
										</c:when>
										<c:otherwise>
											<input type="text" value="2" name="type">
										</c:otherwise>
									</c:choose>
						      	</div>
							      <div class="modal-footer">
							        <button type="submit" class="btn btn-primary btn_yes">작성하기</button>
							        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">취소하기</button>
							      </div>
								</form>
						    </div>
						  </div>
						</div> --%>
						<!-- 모달 -->
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		function clickList(num, index){
			$(".qnafile").empty();
			console.log(num);
			console.log(index);
			//var index = index;
			$.ajax({
				url : "/selectOnefileList.do",
				type : 'post',
				data : {qnaNo : num},
				success : function(data){
					var aTag = '<p style="font-weight: bold;">첨부파일 조회<small id="emailHelp" class="form-text text-danger">(용량이 많을수록, 시간이 소요됩니다. )</small></span><p>';
					if(data.length != 0){
						for(var i =0;i<data.length;i++){
							aTag += '<a href="/boardFileDownload.do?fileNo='+data[i].fileNo+'">'+data[i].fileName+'</a><br>';
						}
						$(".qnafile").eq(index).append(aTag);
					};
				}
			}); 
		}
		
		$(".btn_yes").click(function(){
			if(${type eq 1}){
				var index = $(".reportBtn").index(this);
				var receiver = $(".receiver").eq(index).val();
				var dmContent = $(".dmContent").eq(index).val();
				var sender = $(".sender").eq(index).val();
				
				console.log(receiver);
				console.log(dmContent);
				console.log(sender);
				
				
				 $.ajax({
						url : "/sendDm.do",
						data : {receiver:receiver,dmContent:dmContent,sender:sender},
						success : function(data) {
							if(data == 1){
								dmCount(receiver);
							}
						}
				}); 
			}
			$("#updateCounsel").submit();
		})
	</script>
</body>
</html>