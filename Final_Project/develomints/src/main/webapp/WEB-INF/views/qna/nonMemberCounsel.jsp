<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/qnalist.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;max-width: 1591px">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>비회원 전용 Q&A 게시판</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<div class="searchBox">
					<form action="/nonSearhBox.do" class="searchBox-frm">
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
							  <label class="col-form-label mt-1 text-white" for="keyword">이메일 입력</label>
							  <input type="text" class="form-control" placeholder="ex) emailEx@gmail.com" id="keyword" name="keyword">
					  	</div>
					  	<button type="submit" class="btn btn-secondary">검색</button>
					</form>
				</div>
			</div>
			<div class="contents">
				<table class="table">
					<%-- <colgroup>
						<col style="width:10%">
						<col>
						<col style="width:25%">
						<col style="width:25%">
					</colgroup> --%>
					<thead>
					<tr>
						<th style="width: 8%">문의번호</th>
						<th style="width: 10%">문의 유형</th>
						<th style="text-align: center;">제목</th>
						<th style="width: 10%">문의 작성일</th>
						<th style="width: 18%;">이메일</th>
						<th style="width: 10%;">처리 상태</th>
						<th style="width: 10%">버튼</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${adlist }" var="nq"  varStatus="i">
							<tr>
								<td>${nq.nonQnaNo }</td>
								<td>${nq.type }</td>
								<td>${nq.qnaTitle }
									<c:choose>
										<c:when test="${fn:length(nq.qnaTitle) > 16}">
											<c:set var="subTitle" value="${fn:substring(nq.qnaTitle,0,16)}"/>
											<p style="padding: 0;margin: 0;">${subTitle }...</p>
										</c:when>
										<c:otherwise>
											<p style="padding: 0;margin: 0;">${nc.contestTitle }</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${nq.regDate }</td>
								<td>
								    <!-- 아이디의 앞 3자리까지 보여 주고  @뒤에 3자리 뒤부터 *를 찍어줌-->
								  	<p style="display: inline-block;margin: 0;">
								  		<c:set var="startTitle" value="${fn:substringBefore(nq.email, '@')}"/>
								  		<c:set var="endTitle" value="${fn:substringAfter(nq.email, '@')}"/>
								  		${fn:substring(startTitle,0,fn:length(startTitle)-4)}⁎⁎⁎⁎@${fn:substring(endTitle,0,fn:length(endTitle)-6)}⁎⁎⁎⁎⁎⁎
								  	</p>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty nq.qnaAnswer }">
											<a href="#" class="btn btn-success disabled">${nq.state }</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="btn btn-secondary disabled">${nq.state }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<form action="/searchPw.do" method="post" class="searchPw" id="searchPw" >
										<a href="javascript:void(0);" class="btn btn-outline-dark pwChk" id="pwChk" onclick="pwChkList('${nq.nonQnaNo}','${i.index }');return false;">비밀번호 입력</a>
										<input value="${nq.nonQnaNo}" type="hidden" name="nonQnaNo" class="nonQnaNo"> 
										<input type="hidden" name="qnaPw" class="qnaPw">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
			var SwalColors = {
			  blue: "rgba(43, 165, 137, 0.45)"
			};

			function SwalOverlayColor(color){
			  setTimeout(function(){
			    $(".swal-overlay").css({"background-color":SwalColors[color]});
			  },200);
			}
	
			/* $(".pwChk").click(function (){
			var index = $(".reportBtn").index(this);
			SwalOverlayColor("blue");
			swal({
					text : '비밀번호를 입력해주세요.',
				 	content: {
				    element: "input",
				    attributes: {
				      placeholder: "Type your password",
				      type: "password",
				    },
				  },
				  button : {
					 	text: "Search!",
					 	value : true,
				    	closeModal: false,
				  },
				  //closeOnClickOutside : false,
				})
				.then(pw => {
				  if (!pw) throw null;
				  var memebrPw = ${pw}
				  $("#qnaPw").val(memberPw);
				  console.log(memebrPw);
				  //$(".searchPw").eq(index).submit();
				  return location.href="/searchPw?"
				})
				.catch(err => {
				  if (err) {
				    swal("Oh noes!", "The AJAX request failed!", "error");
				  } else {
				    swal.stopLoading();
				    swal.close();
				  }
				});
			}); */
			
			function pwChkList(no, index){
				SwalOverlayColor("blue");
				swal({
						text : '비밀번호를 입력해주세요.',
						closeOnClickOutside : false,
					 	content: {
					    element: "input",
					    attributes: {
					      placeholder: "Type your password",
					      type: "password",
					    },
					  },
					  button : {
						  text: "Search!",
						  value : true,
						  closeModal: false,
					  }
					})
					.then(function(qnaPw) {
						if (!qnaPw) {
							swal("Oh noes!", "비밀번호를 입력해주세요!", "error");
							return false;
						}
						console.log(qnaPw);
						console.log(no);
						$(".qnaPw").eq(index).val(qnaPw);
						console.log($(".qnaPw").eq(index).val());
						$(".searchPw").eq(index).submit(); 
					});
			}
	</script>
</body>
</html>