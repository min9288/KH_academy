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
	.pageCategory{
		margin-top: 50px;
	}
	.pageWrap{
		padding: 40px;
   		border-radius: 10px;
   		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	.viewHead,.viewMember{
		padding-top: 30px;
		padding-bottom: 30px;
		border-bottom: 1px solid #aeaeae;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.viewHead span{
		font-size: 16px;
	}
	.viewMember>div>*{
		margin-right: 20px;
	}
	.viewHead>div:last-child>*{
		margin-right: 20px;
	}
	.comments{
		margin-top:50px;
		margin-bottom: 50px;
	}
	.commentWrap,.recommentWrap{
		border: 2px solid #4ecdc4;
		border-radius: 10px;
		width: 1100px;
		margin: 20px auto;
		padding: 20px;
	}
	.recommentWrap{
		margin-top: 0;
	}
	.inputCommentBox{
		width: 800px;
		margin: 30px auto;	
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.inputCommentBox>textarea{
		width: 500px;
	}
	.viewContent{
		padding: 20px;
	}
	.likeBtn{
		text-align: center;
	}
	.commentWrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
		/*border: 1px solid #aeaeae; */
	}
	.recommentWrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-left: 60px;
	}
	.commentContent{
		width: 400px;
	}
	.commentData{
		margin-left: -50px;
	}
	.commentData>*{
		margin-bottom: 5px;
	}
	.recommentForm{
		display: none;
	}
	.modal-btns{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="pageCategory">
			<span style="font-size: 25px; font-family: NotoBold;">${sv.type }</span><img class="cateImg" src="/resources/img/shareBoard/search.png">				
		</div>
		<div class="pageWrap" style="margin-top: 50px;">
			<div class="viewHead">
				<div>
					<span style="font-weight: Bold; margin-right: 15px; font-size: 22px;">${sv.boardTitle }</span><span class="badge bg-info cateBadge">${sv.type }</span>				
				</div>
				<div>
					<i class="bi bi-chat" style="color: #4ecdc4; font-size: 1.3rem;">${sv.comments }</i>
					<i class="bi bi-suit-heart likeIcon" style="color: #4ecdc4; font-size: 1.3rem;">${sv.likes }</i>
					<i class="bi bi-eyeglasses" style="color: #4ecdc4; font-size: 1.3rem;">${sv.readCount }</i>
					<span class="text-muted">${sv.regDate }</span>					
				</div>
			</div>
			<div class="viewMember">
				<div>
					<c:if test="${not empty sv.profiles }">
						<img src="/resources/upload/member/${sv.profiles }" style="width: 50px; height: 50px; border-radius: 30px;">					
					</c:if>
					<c:if test="${empty sv.profiles }">
						<img src="/resources/img/member/user.png" style="width: 50px; height: 50px; border-radius: 30px;">						
					</c:if>
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
				</div>
				<div>
					<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment" class="reply">쪽지보내기</a><img style="width: 35px; height: 35px;" src="/resources/img/shareBoard/paper-plane.png">
					<!-- 쪽지보내기 modal -->
					<div class="modal fade" id="reportComment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog  modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-body">
						      	<p class="Modaltitle">쪽지보내기</p>
						      	<div style="padding:5px; margin-bottom: 10px;">
							      	<p><span>수신자</span> : ${sv.memberId }</p>
							      	<textarea rows="3" style="width:100%" class="form-control" id="dmContent"></textarea>
						      	</div>
						      	<div class="modal-btns">
							      	<div>
							      		<span class="text-danger text_cnt" >(0 / 100)</span>
							      	</div>						      	
							      	<div>
							      		<button type="button" class="btn btn-secondary send" style="width: 100px;">전송</button>
							        	<button type="button" class="btn btn-primary " id="cancel" style="width: 100px;" data-bs-dismiss="modal">취소</button>					        	
									</div>
						      	</div>
								<input type="hidden" id="receiver" value="${sv.memberId }">
								<input type="hidden" id="sender" value="${sessionScope.m.memberId }">
					      </div>
						  </div>
					  </div>
					</div><!-- 쪽지 modal 끝 -->						
				</div>
			</div>
			<div class="viewContent">
				${sv.boardContent }
			</div>
			<div class="likeBtn">
			  <c:if test="${sessionScope.m.memberId ne sv.memberId }">
				  <button type="button" class="btn btn-primary likesBtn"><i class="bi bi-hand-thumbs-up-fill"></i>좋아요</button>			  
			  </c:if>
			  <c:if test="${sessionScope.m.memberId eq sv.memberId}">
			  	<!-- 수정 삭제 구현해야함-->
			  	<a href="/updateBoardFrm.do?boardNo=${sv.boardNo }" class="btn btn-info">수정</a>
			  	<button type="button" class="btn btn-info deleteBoard">삭제</button>
			  </c:if>
			</div>
			<c:if test="${not empty sv.filename }">
				<div>
					첨부파일 : <a href="/sharefileDown.do?boardNo=${sv.boardNo }">${sv.filename }</a>			
				</div>
			</c:if>
		</div><!-- 작성글 출력문 종료 -->
		<!-- 회원만 댓글 달 수 있게 제약조건 -->
		<c:if test="${not empty sessionScope.m }">
		<form action="/shareInsertComment.do" method="post">
			<div class="inputCommentBox">
				<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>
				<input type="hidden" name="memberId" id="memberId"value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${sv.boardNo }">
				<input type="hidden" name="commentType" value="1">
				<textarea name="commentContent" class="form-control" rows="3"></textarea>
				<div style="width:150px;">
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>					
				</div>
			</div>
		</form>			
		</c:if>
			<div class="comments">
			<c:forEach items="${list }" var="sc" varStatus="i">
				<c:if test="${sc.commentType eq 1 }">
					<!-- 댓글중 타입 1인것들 전체 출력하기 -->
					<div class="commentWrap">
						<div>
							<c:choose>
								<c:when test="${not empty sc.memberImg }">
									<img src="/resources/upload/member/${sc.memberImg }" style="width: 50px; height: 50px; border-radius: 30px;">
								</c:when>
								<c:otherwise>
									<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>								
								</c:otherwise>
							</c:choose>
						</div>
						<div class="commentData">
							<div><span class="text-info">${sc.memberId }</span></div>
							<div>
								<span>${sc.regDate }</span>
								<!-- 로그인 시에만 대댓글 달 수 있음 -->
								<c:if test="${not empty sessionScope.m }">
								<a href="javascript:void(0)" class="recShow btn btn-secondary btn-sm">답글달기</a>
								</c:if>
							</div>
						</div>
						<div class="commentContent">
							<p>${sc.commentContent }</p>
					   		<textarea rows="2" name="commentContent" style="display: none; width: 100%">${sc.commentContent }</textarea>
						</div>
						<div>
							<c:if test="${not empty sessionScope.m }">
								<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${i.index }" class="btn btn-danger"><i class="bi bi-cone"></i>신고하기</a>
									<!-- 댓글신고 modal -->
									<div class="modal fade" id="reportComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog  modal-dialog-centered">
									    <div class="modal-content">
									      <div class="modal-body">
									      	<form action="/reportShare.do" method="post" class="reportBox">
										      	<p class="Modaltitle">신고 하기</p>
										      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 10px; padding-bottom: 10px;">
										      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
										      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
										      	</div>
										      	<div style="padding:5px; margin-bottom: 10px;">
											      	<p><span>댓글 작성자</span> : ${sc.memberId }</p>
											      	<p><span>댓글</span> : ${sc.commentContent }</p>
										      	</div>
										      	<div style="margin-bottom: 20px; padding:5px;">
										      		<p style="margin-bottom: 10px;"><span>신고사유</span></p>
											      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">영리목적/홍보성</label>
											      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">음란성/선정성</label>
											      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">불법정보</label><br>					      	
											      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">같은 내용 반복 게시(도배)</label>
											      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">욕설/인성공격</label>
											      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">개인정보누출</label><br>
											      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">기타</label><br>
										      		<textarea class="form-control etc" style="resize: none;" name="reportEtc" ></textarea>
										      	</div>
										      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
										      		<p>◈ 이용규칙에 위배되는 댓글을  5회 이상 작성한 회원은 사이트 제한 조치가 취해집니다.</p>
										      		<p>◈ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의하시어 신중하게 신고해 주세요.</p>
										      	</div>
										      	<div style="text-align: right;">
										      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">신고</button>
										        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">취소</button>
												</div>
												<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
												<input type="hidden" name="commentNo" value="${sc.commentNo }">
												<input type="hidden" name="reportStatus" value="1">
												<input type="hidden" name="commentContent" value="${sc.commentContent }">
												<input type="hidden" name="boardNo" value="${sv.boardNo }">
												<input type="hidden" name="commentId" value="${sc.memberId }">
									        </form>
									      </div>
										  </div>
									  </div>
									</div>					  														
							</c:if>					  							
							<c:if test="${sessionScope.m.memberId eq sc.memberId }">
								<a class="btn btn-info" href="javascript:void(0)" onclick="modifyComment(this,'${sc.commentNo }','${sv.boardNo }')">수정</a>
								<a class="btn btn-info" href="javascript:void(0)" onclick="deleteComment(this,'${sc.commentNo }','${sv.boardNo }')">삭제</a>	
							</c:if>
						</div>
					</div>
					<c:if test="${not empty sessionScope.m }">
						<div class="commentWrap recommentForm">
							<form action="/insertReComment.do" method="post" style="width: 100%; display: flex">						
								<input type="hidden" name="commentType" value="2">
								<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
								<input type="hidden" name="boardNo" value="${sv.boardNo }">
								<input type="hidden" name="commentRef" value="${sc.commentNo }">
								<textarea name="commentContent" class="form-control" style="width: 70%; margin: 0 auto;"></textarea>
								<button type="submit" class="btn btn-outline-primary">등록</button>
								<button type="reset" class="btn btn-outline-danger recCancel">취소</button>
							</form>						
						</div>
					</c:if>
				<!-- 로그인이 되어있는 경우 대댓글 작성용 form태그 미리 생성 -->		
				</c:if>
				<c:forEach items="${list }" var="scc" varStatus="j">
					<c:if test="${scc.commentType eq 2 && sc.commentNo eq scc.commentRef}">
						<div class="recommentWrap">
							<div>
								<i class="bi bi-arrow-return-right" style="font-size: 3rem; color: #4ecdc4; "></i>
							</div>
							<div class="commentData">
								<div><span class="text-info">${scc.memberId }</span></div>
								<div>${scc.regDate }</div>
							</div>
							<div class="commentContent">
								<p>${scc.commentContent }</p>
						   		<textarea rows="2" name="commentContent" style="display: none; width: 100%">${scc.commentContent }</textarea>
							</div>
							<div>	
								<c:if test="${not empty sessionScope.m }">
									<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${j.index }" class="btn btn-danger"><i class="bi bi-cone"></i>신고하기</a>
										<!-- 댓글신고 modal -->
										<div class="modal fade" id="reportComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog  modal-dialog-centered">
										    <div class="modal-content">
										      <div class="modal-body">
										      	<form action="/reportShare.do" method="post" class="reportBox">
											      	<p class="Modaltitle">신고 하기</p>
											      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 10px; padding-bottom: 10px;">
											      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
											      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
											      	</div>
											      	<div style="padding:5px; margin-bottom: 10px;">
												      	<p><span>댓글 작성자</span> : ${scc.memberId }</p>
												      	<p><span>댓글</span> : ${scc.commentContent }</p>
											      	</div>
											      	<div style="margin-bottom: 20px; padding:5px;">
											      		<p style="margin-bottom: 10px;"><span>신고사유</span></p>
												      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">영리목적/홍보성</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">음란성/선정성</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">불법정보</label><br>					      	
												      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">같은 내용 반복 게시(도배)</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">욕설/인성공격</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">개인정보누출</label><br>
												      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">기타</label><br>
											      		<textarea class="form-control etc" style="resize: none;" name="reportEtc" ></textarea>
											      	</div>
											      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
											      		<p>◈ 이용규칙에 위배되는 댓글을  5회 이상 작성한 회원은 사이트 제한 조치가 취해집니다.</p>
											      		<p>◈ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의하시어 신중하게 신고해 주세요.</p>
											      	</div>
											      	<div style="text-align: right;">
											      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">신고</button>
											        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">취소</button>
													</div>
													<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
													<input type="hidden" name="commentNo" value="${scc.commentNo }">
													<input type="hidden" name="reportStatus" value="1">
													<input type="hidden" name="commentContent" value="${scc.commentContent }">
													<input type="hidden" name="boardNo" value="${sv.boardNo }">
													<input type="hidden" name="commentId" value="${scc.memberId }">
										        </form>
										      </div>
											  </div>
										  </div>
										</div>						  														
								</c:if>
								<c:if test="${sessionScope.m.memberId eq scc.memberId }">
									<a class="btn btn-info" href="javascript:void(0)" onclick="modifyComment(this,'${scc.commentNo }','${sv.boardNo }')">수정</a>
									<a class="btn btn-info" href="javascript:void(0)" onclick="deleteComment(this,'${scc.commentNo }','${sv.boardNo }')">삭제</a>							  	
								</c:if>
							</div>
						</div>						
					</c:if>
				</c:forEach><!-- 대댓글 반복문 끝 -->
		</c:forEach><!-- 전체댓글 반복문 끝 -->
		</div><!-- 전체 댓글 출력 -->
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	//삭제 onclick 이벤트로 보내주기 swalMsg 이용!
	//게시글 삭제 버튼 클릭
	$(".deleteBoard").click(function(){
		swal({
		    title: "글을 삭제하시겠습니까?",
		    icon: "warning",
		    buttons: ["돌아가기", "삭제하기"],
		    dangerMode: true
		}).then((willDelete) => {
		    if (willDelete) {
		    	location.href="/deleteBoard.do?boardNo="+'${sv.boardNo}';
		    }
		});
	});
	//답글달기  취소
	$(".recShow").click(function(){
		//몇번째 답글달기 버튼을 클릭했는지
		var idx = $(".recShow").index(this);
		$(this).hide();
		$(".recommentForm").eq(idx).css("display","flex");
	});
	
	$(".recCancel").click(function(){
		var idx = $(".recCancel").index(this);
		$(".recommentForm").eq(idx).css("display","none");
		$(".recShow").eq(idx).show();
	});
	//댓글 수정 삭제구문
	function modifyComment(obj,commentNo,boardNo){
		//textarea를 화면에 표현
		$(obj).parent().prev().children(":last").show();
		//기존 본문 내용을 숨김
		$(obj).parent().prev().children(":first").hide();
		//수정 -> 수정완료
		$(obj).html('수정완료');
		$(obj).attr("onclick","modifyComplete(this,'"+commentNo+"','"+boardNo+"');");
		//삭제 -> 취소
		$(obj).next().html('취소');
		$(obj).next().attr("onclick","modifyCancel(this,'"+commentNo+"','"+boardNo+"');");
		//답글달기버튼 숨기기
		$(obj).next().next().hide();
	}
	
	function modifyCancel(obj,commentNo,boardNo){
		//textarea 숨김 (this) 가 지금은 취소버튼임 위치 잘 생각하기!
		$(obj).parent().prev().children(":last").hide();
		//기존 본문내용을 화면에 다시 표현
		$(obj).parent().prev().children(":first").show();
		//수정완료 -> 수정
		$(obj).prev().html("수정");
		$(obj).prev().attr("onclick","modifyComment(this,'"+commentNo+"','"+boardNo+"');");
		//취소 -> 삭제
		$(obj).html("삭제");
		$(obj).attr("onclick","deleteComment(this,'"+commentNo+"','"+boardNo+"');");
		//답글달기버튼 화면에 표현
		$(obj).next().show();
	}
	function modifyComplete(obj,commentNo,boardNo){
		//새로운 form태그를 생성
		var form = $("<form action='/updateShareComment.do' method='post'></form>");
		//form안에 수정댓글번호 설정
		form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
		//form안에 공지사항번호 설정
		form.append($("<input type='text' name='boardNo' value='"+boardNo+"'>"));
		//수정한 댓글 내용을 설정
		form.append($(obj).parent().prev().children(":last"));
		//전송할form태그를 현재 페이지에 추거
		$("body").append(form);
		form.submit();
	}
	function deleteComment(obj,commentNo,boardNo){
		swal({
		    title: "댓글을 삭제하시겠습니까?",
		    icon: "warning",
		    buttons: ["돌아가기", "삭제하기"],
		    dangerMode: true
		}).then((willDelete) => {
		    if (willDelete) {
		    	location.href="/deleteShareComment.do?commentNo="+commentNo+"&boardNo="+boardNo;
		    }
		});
	}
	//신고버튼 누르면 confirm창 띄우고 ok하면 submit
	$(".reportBtn").click(function(){
		var radioCheck = $('input[name=reportReason]').is(":checked");
		if(!radioCheck){
			swal({
				title: "신고 사유를 체크해주세요",
				icon : "warning"
			});
			return;
		}
		swal({
		    title: "허위 신고일 경우 신고자가 불이익을 받을 수 있습니다.",
		    icon: "warning",
		    buttons: ["돌아가기", "신고하기"],
		    dangerMode: true
		}).then((willDelete) => {
		    if (willDelete) {
		    	var index = $(".reportBtn").index(this);
		    	$(".reportBox").eq(index).submit();
		    }
		});

	});
	$(".likesBtn").click(function(){
		var memberNo = '${sessionScope.m.memberNo}';
		var boardNo = '${sv.boardNo }';
		var likeVal = Number($(".likeIcon").html());
		var boardWriter = '${sv.memberId}';
		$.ajax({
			type: "POST",
			url : "/shareLike.do",
			data : {memberNo:memberNo , boardNo:boardNo ,boardWriter:boardWriter },
			success : function(data){
				if(data==2){
					//하트 채운하트
					$(".likeIcon").removeClass("bi-suit-heart");
					$(".likeIcon").addClass("bi-suit-heart-fill");
					$(".likeIcon").html(likeVal+1);
				}else if(data==1){
					//하트 텅빈하트
					$(".likeIcon").removeClass("bi-suit-heart-fill");
					$(".likeIcon").addClass("bi-suit-heart");
					$(".likeIcon").html(likeVal-1);
				}
			}
		});
	});
	
	$(function(){
		var memberNo = '${sessionScope.m.memberNo}';
		var boardNo = '${sv.boardNo }';
		if(memberNo != ''){
			$.ajax({
				type: "POST",
				url : "/isLike.do",
				data : {memberNo:memberNo , boardNo:boardNo},
				success : function(data){
					if(data ==1 ){
						$(".likeIcon").removeClass("bi-suit-heart");
						$(".likeIcon").addClass("bi-suit-heart-fill");					
					}else{
						$(".likeIcon").removeClass("bi-suit-heart-fill");
						$(".likeIcon").addClass("bi-suit-heart");					
					}
				}
			});			
		}
		//쪽지 글자수 check
		$("#dmContent").on('keyup change paste', function() {
			var dmContent = $("#dmContent").val();
	        $('.text_cnt').html("("+$(this).val().length+" / 100)");
	        
	        if($(this).val().length > 100) {
	        	swal({
	                title: '글자수는 100자 제한입니다!',
	                icon: 'error',
	                button: '돌아가기'
	              })
		        $(this).val($(this).val().substring(0, 100));
	            $('.text_cnt').html("(100 / 100)");	
	        }
	    });
	});
	$("#send").click(function () {
		
		var receiver = $("#receiver").val();
		var dmContent = $("#dmContent").val();
		var sender = $("#sender").val();
		
		$.ajax({
			url : "/sendDm.do",
			data : {receiver:receiver,dmContent:dmContent,sender:sender},
			success : function(data) {
				if(data == 1){
					dmCount(receiver);
					swal({
						  title: "전송완료",
						  icon: "success",
						  button: "닫기",
						}).then(function(){
							location.reload();							
						});
				}else{
					console.log("실패");
				}
			}
		});
	});
</script>
</body>
</html>