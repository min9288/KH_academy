<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<fieldset>
			<legend>공지사항</legend>
			<table class="table" id="noticeView" style="width:100%;">
				<tr class="table-info">
					<th colspan="4">${n.noticeTitle }</th>
				</tr>
				<tr class="table-light">
					<th>작성자</th>
					<th>${n.noticeWriter }</th>
					<th>작성일</th>
					<th>${n.regDate }</th>
				</tr>
				<tr class="table-light">
					<th>첨부파일</th>
					<th>
						<c:if test="${not empty n.filename }">
							<img src="/img/file.png" width="16px">
							<a href="/fileDown?noticeNo=${n.noticeNo }">${n.filename }</a>	
						</c:if>						
					</th>
					<th>조회수</th>
					<th>${n.readCount }</th>
				</tr>
				<tr class="table-light">
					<th>내용</th>
					<th colspan="3">
						${n.noticeContent }
					</th>
				</tr>
				<tr class="table-light">
					<th colspan="4" style="text-align:center;">
						<button class="btn btn-info" onclick="history.go(-1);">이전화면</button>
						<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq n.noticeWriter }">
							<a href="/noticeUpdateFrm?noticeNo=${n.noticeNo }" class="btn btn-info">수정하기</a>
							<a href="/noticeDelete?noticeNo=${n.noticeNo }" class="btn btn-info">삭제하기</a>
						</c:if>						
					</th>
				</tr>
			</table>
		</fieldset>
		<%--댓글작성 --%>
		<c:if test="${not empty sessionScope.m }">
			<div class="inputCommentBox">
				<form action="/insertComment" method="post">
					<ul>
						<li>
							<i class="far fa-user fa-5x"></i>
						</li>
						<li>
							<input type="hidden" name="ncLevel" value="1">
							<input type="hidden" name="ncWriter" value="${sessionScope.m.memberId }">
							<input type="hidden" name="noticeRef" value="${n.noticeNo }">
							<input type="hidden" name="ncRef" value="0">
							<textarea name="ncContent" class="form-control"></textarea>
						</li>
						<li>
							<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
						</li>
					</ul>
				</form>
			</div>
		</c:if>		
		<%--댓글 출력 --%>
		<div class="commentBox">
			<c:forEach items="${list }" var="nc">
				<c:if test="${nc.ncLevel == 1}">
					<ul class="comments">
						<li>
							<i class="far fa-user fa-3x"></i>
							<p>${nc.ncWriter }</p>
							<p>${nc.ncDate }</p>
						</li>
						<li>
							<p>${nc.ncContentBr}</p>
							<textarea name="ncContent" class="form-control" style="display:none;">${nc.ncContent }</textarea>
							<p class="commentsBtn">
							<c:if test="${not empty sessionScope.m }">
								<c:if test="${sessionScope.memberId eq nc.ncWriter }">
									<a href="javascript:void(0)" 
									onclick="modifyComment(this,'${nc.ncNo }','${n.noticeNo }');">수정</a>
									<a href="javascript:void(0)"
									onclick="deleteComment(this,'${nc.ncNo }','${n.noticeNo }');">삭제</a>
								</c:if>
								<a href="javascript:void(0)" class="recShow">답글달기</a>
							</c:if>
							</p>
							<c:if test="${not empty sessionScope.m }">
								<form action="/insertComment" class="recoment">
									<input type="hidden" name="ncLevel" value="2">
									<input type="hidden" name="ncWriter" value="${sessionScope.m.memberId }">
									<input type="hidden" name="noticeRef" value="${n.noticeNo }">
									<input type="hidden" name="ncRef" value="${nc.ncNo }">
									<textarea name="ncContent" class="form-control"></textarea>
									<div>
										<button type="submit" class="btn btn-outline-primary">등록</button>
										<button type="reset" class="btn btn-outline-primary recCancel">취소</button>
									</div>
								</form>
							</c:if>							
						</li>
					</ul>
				</c:if>	
				<c:forEach items="${list }" var="ncc">
					<c:if test="${ncc.ncLevel==2 && nc.ncNo == ncc.ncRef }">
						<ul class="recomments">
							<li>
								<i class="fas fa-angle-double-right fa-3x"></i>
							</li>
							<li>
								<i class="far fa-user fa-3x"></i>
								<p>${ncc.ncWriter }</p>
								<p>${ncc.ncDate }</p>
							</li>
							<li>
								<p>${ncc.ncContentBr }</p>
								<textarea name="ncContent" class="form-control" style="display:none;">${ncc.ncContent }</textarea>
								<p class="commentsBtn">
									<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq ncc.ncWriter}">
										<a href="javascript:void(0)"
										onclick="modifyComment(this,'${ncc.ncNo }','${n.noticeNo }');">수정</a>
										<a href="javascript:void(0)"
										onclick="deleteComment(this,'${ncc.ncNo }','${n.noticeNo }');">삭제</a>
									</c:if>									
								</p>
							</li>
						</ul>
					</c:if>
				</c:forEach>			
			</c:forEach>			
		</div>
	</div>
	<script>
		$(".recShow").click(function(){
			//몇번째 답글달기 버튼을 클릭했는지
			var idx = $(".recShow").index(this);
			$(this).hide();
			$(".recoment").eq(idx).css("display","flex");
		});
		$(".recCancel").click(function(){
			var idx = $(".recCancel").index(this);
			$(".recoment").eq(idx).css("display","none");
			$(".recShow").eq(idx).show();
		});
		function modifyComment(obj,ncNo,noticeNo){
			//textarea를 화면에 표현
			$(obj).parent().prev().show();
			//기존 본문 내용을 숨김
			$(obj).parent().prev().prev().hide();
			//수정 -> 수정완료
			$(obj).html('수정완료');
			$(obj).attr("onclick","modifyComplete(this,'"+ncNo+"','"+noticeNo+"');");
			//삭제 -> 취소
			$(obj).next().html('취소');
			$(obj).next().attr("onclick","modifyCancel(this,'"+ncNo+"','"+noticeNo+"');");
			//답글달기버튼 숨기기
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,ncNo,noticeNo){
			//textarea 숨김
			$(obj).parent().prev().hide();
			//기존 본문내용을 화면에 다시 표현
			$(obj).parent().prev().prev().show();
			//수정완료 -> 수정
			$(obj).prev().html("수정");
			$(obj).prev().attr("onclick","modifyComment(this,'"+ncNo+"','"+noticeNo+"');");
			//취소 -> 삭제
			$(obj).html("삭제");
			$(obj).attr("onclick","deleteComment(this,'"+ncNo+"','"+noticeNo+"');");
			//답글달기버튼 화면에 표현
			$(obj).next().show();
		}
		function modifyComplete(obj,ncNo,noticeNo){
			//새로운 form태그를 생성
			var form = $("<form action='/updateComment' method='post'></form>");
			//form안에 수정댓글번호 설정
			form.append($("<input type='text' name='ncNo' value='"+ncNo+"'>"));
			//form안에 공지사항번호 설정
			form.append($("<input type='text' name='noticeNo' value='"+noticeNo+"'>"));
			//수정한 댓글 내용을 설정
			form.append($(obj).parent().prev());
			//전송할 form태그를 현재 페이지에 추가
			$("body").append(form);
			//form태그 전송
			form.submit();
			
		}
		function deleteComment(obj,ncNo,noticeNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteComment?ncNo="+ncNo+"&noticeNo="+noticeNo;
			}
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>