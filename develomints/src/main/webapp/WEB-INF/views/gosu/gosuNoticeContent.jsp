<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	color: black;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.g-img img {
	max-width: 952px;
}

.g-img {
	width: 100%;
	padding: 20px;
	margin-top: 100px;
	display: flex;
	justify-content: center;
}

.g-center {
	display: flex;
	justify-content: center;
}

.gosu td>img {
	border-radius: 50%;
	width: 50px;
	height: 50px;
	margin-right: 30px;
}

.gosu p {
	margin-top: 80px;
}

.gosu {
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu {
	padding: 100px;
}

.gosu dt {
	font-size: 25px;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#hrm-modal {
	width: 800px;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.community-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#community-modal {
	background-color: rgb(235, 242, 235);
	width: 800px;
}

.community-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.community-btn-wrap2 {
	background-color: rgb(70, 147, 127);
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: right;
}

.community-content>h2 {
	font-weight: 900;
	text-align: center;
	margin: 30px;
	line-height: 60px;
	font-size: 35px;
	color: rgb(70, 147, 127);
}

.community-content h4 {
	font-weight: 900;
	font-size: 25px;
	margin-top: 10px;
	margin-bottom: 20px;
}

.community-content h4>img {
	width: 25px;
	margin-right: 10px;
}

.community-btn-wrap a {
	margin: 20px;
	padding: 10px;
	width: 100px;
}

.g-style {
	text-align: center;
	margin: 10px;
	padding: 30px;
	display: flex;
	justify-content: center;
}

.c-style {
	padding: 30px;
	border-radius: 30px;
	border: 3px solid rgb(70, 147, 127);
	background-color: white;
	margin: 20px;
}

#community-guide {
	color: blue;
}

#community-guide:hover {
	cursor: pointer;
	color: rgb(70, 147, 127);
}

.summerContentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do?reqPage=1">요청서</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do?reqPage=1">견적서</a>
			</div>
		</c:if>
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
		</h4>
		<div style="text-align: right; margin-top: 50px;">
			<span>${gNotice.gnoticeDate}</span>
		</div>
		<div class="g-center">
			<div class="g-img">
				<img src="${gNotice.gnoticePhoto}">
			</div>

		</div>
		<div>
			<div class="gosu">
				<dl>
					<dt style="font-size: 40px; margin-bottom: 30px;">${gNotice.gnoticeTitle}</dt>
					<dt>
						<table>
							<tr>
								<c:if test="${empty gNotice.writeImg }">
									<td rowspan="2"><img
										src="/resources/img/gosu/g_img_basic.png"></td>
								</c:if>
								<c:if test="${not empty gNotice.writeImg }">
									<td rowspan="2"><img
										src="/resources/upload/member/${gNotice.writeImg }"></td>
								</c:if>

								<th>${gNotice.writeId }</th>
								<input type="hidden" value="${gNotice.writeId }" id="gosuId">
							</tr>
							<tr>
								<td style="font-size: large; color: gray;">${gNotice.gnoticeDate}</td>
							</tr>

						</table>
					</dt>
					<dd>
						<p style="overflow: auto;">${gNotice.gnoticeContentBr}</p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="g-center">
			<c:if test="${sessionScope.m.memberId ne gNotice.writeId}">
				<c:if test="${not empty sessionScope.m }">
					<a id="feedbackListAjax" class="btn btn-info"
						style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">피드백
						신청하기</a>
				</c:if>
				<c:if test="${empty sessionScope.m }">
					<a id="feedbackListAjax" class="btn btn-info"
						style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">고수 보러가기</a>
				</c:if>
				
				<a class="btn btn-primary"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;"
					onclick="history.back();">뒤로가기</a>
			</c:if>
			<c:if test="${sessionScope.m.memberId eq gNotice.writeId}">
				<a href="/noticeContentUpdateFrm.do?gnn=${gNotice.gnoticeNo }"
					class="btn btn-info"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;"
					id="commentUpdate">수정하기</a>
				<a href="/noticeContentdelete.do?gnn=${gNotice.gnoticeNo }"
					class="btn btn-primary"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;"
					id="commentDelete">삭제하기</a>
			</c:if>

		</div>
		<hr>
		<div style="margin-bottom: 50px;">
			<span style="font-weight: 900;">댓글을 작성할 때는 타인을 존중하고 <a
				id="community-guide">커뮤니티 가이드</a>를 준수해야 합니다.
			</span>
		</div>
		<div style="display: flex; justify-content: center;">

			<div>
				<c:choose>
					<c:when test="${empty commentList }">
			</div>
			<div style="padding: 20px; text-align: center;">
				<img src="/resources/img/member/user.png"
					style="border-radius: 50%; width: 70px; margin-top: 70px;">
				<h2
					style="color: gray; font-size: 20px; font-weight: 900; line-height: 100px;">작성된
					댓글이 없습니다.</h2>
			</div>

			</c:when>
			<c:otherwise>
				<c:forEach items="${commentList }" var="cl" varStatus="i">
					<c:choose>
						<c:when test="${cl.commentType eq 1}">
							<table style="margin: 30px;">
								<tr style="text-align: right;">
									<td style="font-size: small; color: gray;" colspan="3">${cl.regDate }</td>
								</tr>
								<tr style="text-align: center;">
									<td style="width: 100px;"><c:if
											test="${not empty cl.memberImg  }">
											<img src="/resources/upload/member/${cl.memberImg }"
												style="border-radius: 50%; width: 70px;height: 70px; ">
										</c:if> <c:if test="${empty cl.memberImg  }">
											<img src="/resources/img/member/user.png"
												style="border-radius: 50%; width: 70px;height: 70px; ">
										</c:if></td>
									<td rowspan="2" style="text-align: left"><input
										id="updateContent"
										style="width: 800px; border: 1px solid #e1e1e1; padding: 10px; margin: 0;"
										type="text" value="${cl.commentContent }" disabled></td>
								</tr>
								<tr style="text-align: center;">
									<td rowspan="2">${cl.memberId }</td>
								</tr>
								<tr>

									<td><c:if test="${not empty sessionScope.m }">
											<a style="font-size: small; color: gray;" class="g-commentRe">댓글달기</a>
										</c:if> <c:if test="${cl.memberId eq sessionScope.m.memberId }">

											<input type="hidden" value="${cl.commentNo}" id="commentNo">
						&nbsp;&nbsp;&nbsp;<a style="font-size: small; color: gray;"
												class="commentUpdate">수정하기</a>
											<button class="commentDelete btn btn-primary"
												style="font-size: x-small; margin-left: 10px;">삭제하기</button>
											<button class="ginsertBtn btn btn-info"
												style="display: none; font-size: x-small; margin-left: 10px;">확인</button>
										</c:if></td>
								</tr>
							</table>
							<table class="g-commentReBox"
								style="margin: 30px; display: none;">
								<tr>
									<td rowspan="3"
										style="width: 100px; text-align: right; padding: 10px;"><img
										src="/resources/img/gosu/g-dada2.png" style="width: 50px;"></td>
								</tr>

								<tr style="text-align: center;">

									<td colspan="2"><textarea class="commentReContent"
											style="width: 800px; border: 1px solid #e1e1e1; padding: 10px; margin: 0;"
											placeholder="댓글을 입력하세요"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: right;"><button
											type="button" class="g-commentReAjax btn btn-primary"
											style="font-size: x-small; margin-left: 10px;">확인</button></td>
									<input type="hidden" class="g-commentRef"
										value="${cl.commentNo }">
								</tr>
							</table>
							<c:forEach items="${commentList }" var="clre" varStatus="i">
								<c:if
									test="${(clre.commentType eq 2) && (clre.commentRef eq cl.commentNo)}">
									<table style="margin: 30px;">
										<tr>
											<td rowspan="3"
												style="width: 100px; text-align: right; padding: 10px;">
												<img src="/resources/img/gosu/g-dada.png"
												style="width: 20px;">
											</td>
										</tr>
										<tr style="text-align: center;">
											<td style="width: 200px; text-align: left;"><c:if
													test="${not empty clre.memberImg  }">
													<img src="/resources/upload/member/${clre.memberImg }"
														style="border-radius: 50%; width: 30px;">
												</c:if> <c:if test="${empty clre.memberImg  }">
													<img src="/resources/img/member/user.png"
														style="border-radius: 50%; width: 30px;">
												</c:if> &nbsp;&nbsp;${clre.memberId }</td>
											<td style="text-align: right; font-size: small; color: gray;">${clre.regDate }</td>

										</tr>
										<tr style="text-align: center;">

											<td colspan="2"><input id="updateContent"
												style="width: 800px; border: 1px solid #e1e1e1; padding: 10px; margin: 0;"
												type="text" value="${clre.commentContent }" disabled>
											</td>
										</tr>
										<c:if test="${clre.memberId eq sessionScope.m.memberId }">
											<tr style="text-align: right;">

												<td colspan="3" style="color: gray; font-size: small;"><input
													type="hidden" value="${clre.commentNo}" id="commentNo">
													<a class="commentUpdate">수정하기</a>&nbsp;&nbsp;<a
													class="commentDelete">삭제하기</a>
													<button class="ginsertBtn btn btn-info"
														style="display: none; font-size: x-small; margin-left: 10px;">확인</button>
												</td>
											</tr>
										</c:if>
									</table>
								</c:if>
							</c:forEach>

						</c:when>


					</c:choose>
				</c:forEach>
			</c:otherwise>
			</c:choose>



		</div>
	</div>
	<c:if test="${not empty sessionScope.m }">
		<div style="display: flex; justify-content: center; margin-top: 80px;margin-bottom: 200px;">
			<div class="card bg-light mb-3"
				style="padding: 20px; width: 1200px; min-width: 1200px;">
				<table>
					<tr style="text-align: center;">
						<td style="width: 200px;"><c:if
								test="${empty sessionScope.m.filepath }">

								<img src="/resources/img/member/user.png"
									style="border-radius: 50%; width: 70px;">
							</c:if> <c:if test="${not empty sessionScope.m.filepath }">
								<img src="/resources/upload/member/${sessionScope.m.filepath }"
									style="border-radius: 50%; width: 70px; height: 70px; ">
							</c:if></td>

						<td rowspan="2" style="padding-right: 40px;"><textarea
								rows="5" style="width: 100%;" placeholder="  댓글을 입력해주세요."
								id="commentContent"></textarea></td>
						<input type="hidden" value="${sessionScope.m.memberId }"
							id="g-memberId">
						<input type="hidden" value="${gNotice.gnoticeNo }" id="boardNo">
					</tr>
					<tr style="text-align: center;">
						<td>${sessionScope.m.memberId }</td>
					</tr>
					<tr style="text-align: right;">
						<td colspan="2">
							<button type="button" id="g-commentAjax" class="btn btn-primary"
								style="width: 100px; margin-top: 10px; font-weight: 900;">작성</button>
						</td>
					</tr>
				</table>

			</div>
		</div>
	</c:if>

	<div class="hrm-wrap" style="display: none; margin: 0;">
		<div id="hrm-modal">
			<div class="hrm-content">
				<br>
				<div class="g-style">

					<c:if test="${not empty gosuWriteList}">
						<a class="btn btn-success" style="font-size: 30px;"
							href="/gosuContent.do?gNo=${gosuWriteList.ggsouNo}">${gosuWriteList.gosuTitle }</a>
					</c:if>
					<c:if test="${empty gosuWriteList}">
						<span style="font-size: 30px;">아직 고수님께서 소개글을 등록하지 않았네요!</span>
					</c:if>
				</div>
			</div>
			<div class="hrm-btn-wrap">
				<a id="hrm-close" class="btn btn-outline-success">취소</a>
			</div>
		</div>
	</div>

	<div class="community-wrap" style="display: none; margin: 0;">
		<div id="community-modal">
			<div class="community-content">
				<br>

				<h2>
					디벨로민트를 이용하는 <br> <span style="color: black;">회원을 위한 </span>
					커뮤니티 가이드
				</h2>
				<div class="g-style c-style">

					<div style="text-align: left;">
						<h4>
							<img src="/resources/img/gosu/cum_chk.png">스팸 및 현혹 행위
						</h4>
						디벨로민트 커뮤니티는 신뢰를 바탕으로 구축된 커뮤니티입니다. 다른 사용자를 상대로 사기, 현혹, 스팸, 사취하려는
						의도가 있는 댓글은 디벨로민트에서 허용되지 않습니다.<br> <br>
						<h4>
							<img src="/resources/img/gosu/cum_chk.png">잘못된 정보
						</h4>
						오해의 소지가 있거나 사기성 정보로 큰 피해를 입힐 심각한 위험이 있는 특정 유형의 게시글 혹은 댓글은 디벨로민트에서
						허용되지 않습니다. 여기에는 유해한 치료제나 치료법을 홍보하는 게시글 혹은 댓글, 기술적으로 조작된 특정 유형의
						게시글, 민주적 절차를 방해하는 댓글 등 실제적인 위험을 초래할 수 있는 특정 유형의 잘못된 정보가 포함됩니다.<br>
						<br>
						<hr>
						다음 규칙을 반드시 준수해 주시기 바랍니다. 디벨로민트 플랫폼 안팎에서 회원의 행위가 디벨로민트 사용자, 커뮤니티,
						직원이나 생태계에 해를 끼치는 경우 디벨로민트는 회원 행위의 과실이 얼마나 심각한지, 유해한 행위에 패턴이 존재하는지
						여부를 포함하나 이에 국한되지 않는 다양한 요소를 고려하여 대처할 수 있습니다. 디벨로민트는 회원의 권한 정지부터 계정
						해지에 이르기까지 다양한 조치를 취합니다.

					</div>
				</div>
			</div>
			<div class="community-btn-wrap">
				<a id="community-close" class="btn btn-outline-success">확인</a>
			</div>
			<div class="community-btn-wrap2">
				<span style="color: white; margin: 20px;">2021.12.19</span>
			</div>
		</div>
	</div>

	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(".commentUpdate").click(
				function() {
					var tabs = $(".commentUpdate");
					var idx = tabs.index(this);
					var commentNo = $(this).prev().val();
					var commentBox = $(this).parent().parent().parent().find(
							'#updateContent').attr('disabled', false);
					$(".ginsertBtn").eq(idx).css("display", "inline-block");

					$(".ginsertBtn").click(
							function() {

								var commentContent = $(this).parent().parent()
										.parent().find('#updateContent').val();
								$.ajax({
									url : "/gNoticeCommentUpdateAjax.do",
									data : {
										"commentContent" : commentContent,
										"commentNo" : commentNo
									},
									success : function(data) {
										if (data > 0) {
											swal({
												title : '성공',
												text : '수정 완료.',
												icon : 'success'
											});
										} else {
											swal({
												title : '실패',
												text : '관리자에게 문의해주세요.',
												icon : 'error'
											});
										}
										location.reload();
									}
								});
							});

				});
		$(".commentDelete").click(function() {
			var commentNo = $(this).prev().prev().val();
			console.log(commentNo);

			$.ajax({
				url : "/gNoticeCommentDeleteAjax.do",
				data : {
					"commentNo" : commentNo
				},
				success : function(data) {
					if (data > 0) {
						swal({
							title : '성공',
							text : '댓글이 삭제됐습니다.',
							icon : 'success'
						});
					} else {
						swal({
							title : '실패',
							text : '관리자에게 문의해주세요.',
							icon : 'error'
						});
					}
					location.reload();
				}
			});

		});

		$(".g-commentRe").click(function() {
			var contents = $(".g-commentReBox");
			var tabs = $(".g-commentRe");
			var idx = tabs.index(this);
			if (contents.eq(idx).is(":visible")) {
				contents.eq(idx).hide();
			} else {
				contents.eq(idx).show();
			}

			$(".g-commentReAjax").click(function() {
				var memberId = $("#g-memberId").val();
				var boardNo = $("#boardNo").val();
				var commentContent = $(".commentReContent").eq(idx).val();
				var boardType = 6;
				var commentType = 2;
				var commentRef = $(".g-commentRef").eq(idx).val();
				if (commentContent == "") {
					swal({
						title : '실패',
						text : '내용을 입력해주세요',
						icon : 'error'
					});
					return false;
				}
				$.ajax({
					url : "/gNoticeCommentReAjax.do",
					data : {
						"memberId" : memberId,
						"boardNo" : boardNo,
						"commentContent" : commentContent,
						"boardType" : boardType,
						"commentType" : commentType,
						"commentRef" : commentRef
					},
					success : function(data) {
						if (data > 0) {
							swal({
								title : '성공',
								text : '댓글이 등록됐습니다.',
								icon : 'success'
							});
						} else {
							swal({
								title : '실패',
								text : '관리자에게 문의해주세요.',
								icon : 'error'
							});
						}
						location.reload();
					}
				});

			});

		});

		$("#g-commentAjax").click(function() {
			var memberId = $("#g-memberId").val();
			var boardNo = $("#boardNo").val();
			var commentContent = $("#commentContent").val();
			var boardType = 6;
			var commentType = 1;
			$.ajax({
				url : "/gNoticeCommentAjax.do",
				data : {
					"memberId" : memberId,
					"boardNo" : boardNo,
					"commentContent" : commentContent,
					"boardType" : boardType,
					"commentType" : commentType
				},
				success : function(data) {
					if (data > 0) {
						swal({
							title : '성공',
							text : '댓글이 등록됐습니다.',
							icon : 'success'
						});
					} else {
						swal({
							title : '실패',
							text : '관리자에게 문의해주세요.',
							icon : 'error'
						});
					}
					location.reload();
				}
			});

		});

		$("#feedbackListAjax").click(function() {

			$(".hrm-wrap").css("display", "flex");
		});

		$("#hrm-close").click(function() {

			$(".hrm-wrap").css("display", "none");

		});
		$("#community-guide").click(function() {

			$(".community-wrap").css("display", "flex");

		});
		$("#community-close").click(function() {

			$(".community-wrap").css("display", "none");

		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>