<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitDetail.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recruit Crue Detail</title>
</head>
<script>

	$(function(){
		$(".return_img").click(function(){
			location.href="/recruitTeamMember_mainPage.do?reqPage=1";
		});
		
		$(".updateText").click(function(){
			$(this).parent().next(".updateTextBox").show();
		});
		
		$("button[name=cancelBtn1]").click(function(){
			$(this).parent().parent().parent().parent(".updateTextBox").hide();
		});
		
		$(".insertReText").click(function(){
			$(this).parent().next().next(".reCommentTextBox").show();
		});
		
		$("button[name=cancelBtn2]").click(function(){
			$(this).parent().parent().parent().parent(".reCommentTextBox").hide();
		});
		
		$("a[name=updateReComment]").click(function(){
			$(this).parent().next(".updateReCommentTextBox").show();
		});
		$("button[name=cancelBtn3]").click(function(){
			$(this).parent().parent().parent(".updateReCommentTextBox").hide();
		});
		
	});
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_wrap">
                <div class="titleBox">
                    <p class="titleText">${pt.RTitle }</p>
                </div>
                <div class="noticeInfoFlexBox">
                    <div class="memberInfo">
                    	<c:choose>
                    		<c:when test="${pt.writerImgPath eq null}">
                    			<img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                    		</c:when>
                    		<c:otherwise>
                    			<img class="profileImg" src="/resources/upload/member/${pt.writerImgPath }">
                    		</c:otherwise>
                    	</c:choose>
                        <p class="memberIdText">${pt.projectWriterId}</p>
                        <c:choose>
							<c:when test="${pt.projectWriterGrade >=1 && pt.projectWriterGrade <= 20 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=21 && pt.projectWriterGrade <= 40 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=41 && pt.projectWriterGrade <= 60 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=61 && pt.projectWriterGrade <= 80 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=81 && pt.projectWriterGrade <= 110 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=111 && pt.projectWriterGrade <= 140 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=141 && pt.projectWriterGrade <= 170 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
							</c:when>								
						</c:choose>
                    </div>
                    <div class="writeDate">
                        <b>${pt.RStartDate }</b>
                    </div>
                </div>
                <div class="noticeInfoFlexBox2">
                    <div class="userLanguage">
                        <b class="useLang">사용 언어 : </b>
                        <c:forEach items="${pdLangList }" var="li"  varStatus="i">
                        	<c:if test="${pt.projectNo eq li.projectNo }">
                        		<span class="badge rounded-pill bg-primary" id="languageIcon">${li.langName }</span>
                        	</c:if>
                        </c:forEach>
                    </div>
                    <div class="deadBtnBox">
	                    <c:if test="${sessionScope.m.memberNo eq pt.projectWriterMemberNo}">
	                    	<c:choose>
	                    		<c:when test="${pt.projectStatus == 1}">
	                    			<c:choose>
	                    				<c:when test="${pt.finalApplyValue != 0 }">
	                    					<a href="closeRecruitTeam.do?projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}"><button type="button" class="btn btn-primary">모집 마감</button></a>
	                    				</c:when>
	                    				<c:otherwise>
	                    					<button type="button" class="btn btn-primary" disabled="disabled">모집 마감</button>
	                    				</c:otherwise>
	                    			</c:choose>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<button type="button" class="btn btn-primary" disabled="disabled">모집 마감</button>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </c:if>
                    </div>
                </div>
                <div class="line"></div>
                <div class="datailContent">
                    ${pt.RContent }
                </div>
                <div class="bottomContentFlexBox">
                    <div class="bottomContentFlexBox_btnBox">
                    	<c:choose>
                    		<c:when test="${sessionScope.m.memberNo eq pt.projectWriterMemberNo}">
                    			<c:choose>
                    				<c:when test="${pt.projectStatus == 1 }">
                    					<a href="updateRecruitFrm.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"><button type="button" class="btn btn-primary">수정</button></a>
				                        <a href="deleteRecruit.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"> <button type="button" class="btn btn-primary">삭제</button></a>
				                        <c:choose>
				                        	<c:when test="${pt.applyValue != 0}">
						                        <a href="manageEntry.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}&viewValue=1&reqPage=1"><button type="button" class="btn btn-primary">지원자 관리</button></a>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<button type="button" class="btn btn-primary" disabled="disabled">지원자 관리</button>
				                        	</c:otherwise>
				                        </c:choose>
                    				</c:when>
                    				<c:otherwise>
                    					<button type="button" class="btn btn-primary" disabled="disabled">수정</button>
				                        <button type="button" class="btn btn-primary" disabled="disabled">삭제</button>
				                        <button type="button" class="btn btn-primary" disabled="disabled">지원자 관리</button>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:when>
                    		<c:otherwise>
                    			<c:choose>
                    				<c:when test="${memberNo == -1 || pt.projectStatus != 1 }">
                    					<button type="button" class="btn btn-primary" disabled="disabled">프로젝트 지원</button>
                    				</c:when>
                    				<c:when test="${applyCheckValue > 0}">
                    					<a href="/selectOneApplicant.do?projectNo=${pt.projectNo}&memberNo=${pt.projectWriterMemberNo}&entryNo=${entryNo}"><button type="button" class="btn btn-primary">작성한 지원글 확인</button></a>
                    				</c:when>
                    				<c:otherwise>
                    					<a href="/insertApplyProjectFrm.do?memberNo=${sessionScope.m.memberNo }&projectNo=${pt.projectNo}&writeReviewCheck=${pt.writeReviewCheck}"><button type="button" class="btn btn-primary">프로젝트 지원</button></a>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="bottomContentFlexBox_iconBox">
                        <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
                        <span class="countText" style="position: relative; top: 13px; margin-right: 20px;">${pt.viewCount }</span>
                        <c:choose>
                        	<c:when test="${memberNo == -1 }">
                        		<c:choose>
		                        	<c:when test="${pt.dibCountClickValue ne 0 }">
		                        		<img class="countImg" src="/resources/img/recruitTeamProject/common/full_hart.png" style="position: relative; top: 3px;">
		                        	</c:when>
		                        	<c:otherwise>
		                        		<img class="countImg" src="/resources/img/recruitTeamProject/common/empty_hart.png" style="position: relative; top: 3px;">
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:when>
                        	<c:otherwise>
                        		<c:choose>
		                        	<c:when test="${pt.dibCountClickValue ne 0 }">
		                        		<a href="/deleteDibCount.do?memberNo=${sessionScope.m.memberNo }&projectNo=${pt.projectNo}"><img class="countImg" src="/resources/img/recruitTeamProject/common/full_hart.png" style="position: relative; top: 3px;"></a>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<a href="/insertDibCount.do?memberNo=${sessionScope.m.memberNo }&projectNo=${pt.projectNo}"><img class="countImg" src="/resources/img/recruitTeamProject/common/empty_hart.png" style="position: relative; top: 3px;"></a>
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:otherwise>
                        </c:choose>
                        <span class="countText" style="position: relative; top: 13px;">${pt.dibCount }</span>
                    </div>
                </div>
                
                <%--댓글창 --%>
		
					<%--댓글 입력 창(로그인했을 때 띄우기) 댓글 등록할 때 SQL에서 등록일 to_char(SYSDATE,'MM-DD HH24:MI') 이걸로 넣어주세용--%>
					<c:if test="${not empty sessionScope.m.memberId }">
						<form action="/insertComment.do" method="post">
							<div class="commentBox">
								<div class="userInfoBox">
									<c:choose>
										<c:when test="${sessionScope.m.filepath eq null }">
											<img src="/resources/img/member/user.png" style="width: 60px; height:60px; margin-left:10px;">				
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 60px; height:60px; margin-left:10px; border-radius: 50%">
										</c:otherwise>
									</c:choose>
									<p>${sessionScope.m.memberId }</p>
								</div>
								<div class="textBox" >
									<textarea class="form-control textareaBox txbox" name="commentContent"></textarea>
								</div>
								<input type="submit" value="등록" class="btn btn-outline-primary commentBtn" style="font-weight: bold; height: 100px;" >
							</div>
							<input type="hidden" name="checkMemberNo" value="${pt.projectWriterMemberNo}">
							<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
							<input type="hidden" name="commentType" value="1">
							<input type="hidden" name="boardNo" value="${pt.projectNo }">
							<input type="hidden" name="boardType" value=3>
						</form>
					</c:if>
					
					<%---------------------------------------------------------------------------- --%>
					
					<%--댓글리스트 --%>
					<c:choose>
						<%--댓글이 있는경우 --%>
						
						<c:when test="${not empty commentList }">
						<div style="margin-bottom: 20px; margin-top: 20px;">
							<span style="font-weight: 900;">댓글을 작성할 때는 타인을 존중하고 
							<a id="community-guide">커뮤니티 가이드</a>
							를 준수해야 합니다.
							</span>
						</div>
							<c:forEach items="${commentList}" var="cl" varStatus="i">
								<c:if test="${cl.commentType eq 1 }">
									<div class=comentListBox>
										<div class="comentView">
											<div class="commentImgBox">
													<c:choose>
														<c:when test="${cl.writerImgPath eq null }">
															<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
														</c:when>
														<c:otherwise>
															<img src="/resources/upload/member/${cl.writerImgPath }" style="width: 60px; height:60px; border-radius: 50%">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="iddate">
													<c:choose>
														<c:when test="${cl.memberId eq pt.projectWriterId }">
															<p class="text-info">${cl.memberId }</p>
														</c:when>
														<c:otherwise>
															<p>${cl.memberId }</p>
														</c:otherwise>
													</c:choose>
													<p>${cl.regDate }</p>
													<%-- 내가 쓴 댓글일때만 수정,삭제 보여주기 --%>
													<c:if test="${not empty sessionScope.m and cl.memberId eq sessionScope.m.memberId}">
								
														<%--댓글 수정  --%>
														<a href="#" data-bs-toggle="modal" data-bs-target="#updateComment${i.index }">수정</a>
								
														<%--댓글 수정  Modal --%>
														<div class="modal fade" id="updateComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog  modal-dialog-centered">
																<div class="modal-content">
																	<div class="modal-body">
																		<textarea class="form-control reText" name="commentContent">${cl.commentContent }</textarea>
																		<input type="hidden" value="${cl.commentNo }" name="commentNo"> 
																		<div style="text-align: right;">
																			<button type="button" class="btn btn-primary updateCm">수정</button>
																			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
				
														<%--댓글 삭제 --%>
														<a href="javascript:void(0);" class="delComment">삭제</a>
														<input type="hidden" value="${cl.commentNo }" name="commentNo">
													</c:if>
												</div>
												<span>
													${cl.commentContent }
													<c:if test="${not empty sessionScope.m }">
													<a href="javascript:void(0)" class="reComentBtn"><i class="bi bi-chat-dots-fill" style="font-size: 20px"></i></a>
													</c:if>
												</span>
												
												<%--로그인했을 때만 신고버튼 보여주기 --%>
												<c:if test="${not empty sessionScope.m }">
													<%--댓글 신고 --%>
													<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${i.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
													
													<%--댓글 신고  Modal --%>
													<div class="modal fade" id="reportComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog  modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-body">
													      	<form action="/reportProjectNoticeComment.do" method="post" class="reportBox">
														      	<p class="Modaltitle">신고 하기</p>
														      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 30px; padding-bottom: 10px;">
														      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
														      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
														      	</div>
														      	<div style="padding:5px; margin-bottom: 20px;">
															      	<p style="margin-bottom: 5px;"><span>댓글 작성자</span> : ${cl.memberId }</p>
															      	<p><span>댓글</span> : ${cl.commentContent }</p>
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
														      		<textarea class="form-control etc" style="resize: none;" name="reportEtc"></textarea>
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
																<input type="hidden" name="commentNo" value="${cl.commentNo }">
																<input type="hidden" name="reportStatus" value="1">
																<input type="hidden" name="commentContent" value="${cl.commentContent }">
																<input type="hidden" name="contestNo" value="${cl.boardNo }">
																<input type="hidden" name="commentId" value="${cl.memberId }">
																<input type="hidden" name="projectNo" value="${pt.projectNo }">
																<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
																<input type="hidden" name="boardType" value=1>
																<input type="hidden" name="applicantMemberNo" value=0>
													        </form>
													      </div>
														  </div>
													  </div>
													</div>	
												</c:if>
											</div>
											
										
					<%---------------------------------------------------------------------------- --%>
					
											<%--대댓글 작성 창 --%>
											<c:if test="${not empty sessionScope.m and cl.commentType eq 1 }">
											<form action="/reCommentInsert.do" method="post">
												<div class="recomentBox">
													<textarea class="form-control reText textareaBox txbox2" name="commentContent"></textarea>
													<c:choose>
														<c:when test="${not empty sessionScope.m }">
															<input type="submit" value="등록" class="btn btn-outline-primary commentBtn2" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
														</c:when>
														<c:otherwise>
															<input type="button" value="등록" class="btn btn-outline-primary noMember" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
														</c:otherwise>
													</c:choose>
													<input type="reset" value="취소" class="btn btn-outline-secondary cancelBtn" style="height: 100px; width: 80px; font-weight: bold">
													<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
													<input type="hidden" name="boardNo" value="${pt.projectNo }">
													<input type="hidden" name="boardType" value=3>
													<input type="hidden" name="commentType" value="2">
													<input type="hidden" name="commentNo" value="${cl.commentNo }">
													<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
												</div>
											</form>
										</c:if>
										
					<%---------------------------------------------------------------------------- --%>
										<%--대댓글 리스트 --%>
										<c:forEach items="${commentList }" var="rl" varStatus="j">
											<c:if test="${rl.commentType eq 2 && cl.commentNo eq rl.commentRef}">
												<div class="reComentView" style="margin-top: 10px;">
												<i class="bi bi-arrow-return-right" style="margin-left:50px; color:#4ECDC4;"></i>
													<div class="recommentImgBox">
														<c:choose>
															<c:when test="${rl.writerImgPath eq null }">
																<img src="/resources/img/member/user.png" style="width: 35px; height:35px;">				
															</c:when>
															<c:otherwise>
																<img src="/resources/upload/member/${rl.writerImgPath }" style="width: 35px; height:35px; border-radius: 50%">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="iddate">
														<c:choose>
														<c:when test="${rl.memberId eq pt.projectWriterId }">
															<p class="text-info" style="font-size: 15px;">${rl.memberId }</p>
														</c:when>
														<c:otherwise>
															<p style="font-size: 15px;">${rl.memberId }</p>
														</c:otherwise>
													</c:choose>
														<p style="font-size: 13px;">${rl.regDate }</p>
														<%--로그인했을 때만 보여주기 --%>
														<c:if test="${not empty sessionScope.m }">
															<%--내가 쓴 댓글일 경우만 보여주기 --%>
															<c:if test="${rl.memberId eq sessionScope.m.memberId }">
															<%--댓글 수정  --%>
																<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#updateReComment${j.index }" class="updateBtn">수정</a>
																
																<%--댓글 수정  Modal --%>
																<div class="modal fade" id="updateReComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
																  <div class="modal-dialog  modal-dialog-centered">
																    <div class="modal-content">
																      <div class="modal-body">
																      	<textarea class="form-control reText textareaBox" name="commentContent">${rl.commentContent }</textarea>
																      	<input type="hidden" value="${rl.commentNo }" name="commentNo">
																      	<div style="text-align: right; ">
																	      	<button type="submit" class="btn btn-primary updateCm">수정</button>
																	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
																        </div>
																        <input type="hidden" value="${sessionScope.m.memberNo }" name="memberNo">
																        <input type="hidden" value="${pt.projectNo }" name="projectNo">
																      </div>
																    </div>
																  </div>
																</div>
																
																<%--댓글 삭제 --%>
																<a href="javascript:void(0);" class="delComment">삭제</a>
																<input type="hidden" value="${rl.commentNo }" name="commentNo">
															</c:if>
														</c:if>
													</div>
													<span>
													${rl.commentContent }
													</span>
													<c:if test="${not empty sessionScope.m }">
														<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${j.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
														
														<%--댓글 신고  Modal --%>
														<div class="modal fade" id="reportComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														  <div class="modal-dialog  modal-dialog-centered">
														    <div class="modal-content">
														      <div class="modal-body">
															      <form action="/reportProjectNoticeComment.do" method="post" class="reportBox">
																      	<p class="Modaltitle">신고 하기</p>
																      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 10px; padding-bottom: 10px;">
																      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
																      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
																      	</div>
																      	<div style="padding:5px; margin-bottom: 10px;">
																	      	<p><span>댓글 작성자</span> : ${rl.memberId }</p>
																	      	<p><span>댓글</span> : ${rl.commentContent }</p>
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
																		<input type="hidden" name="commentNo" value="${cl.commentNo }">
																		<input type="hidden" name="reportStatus" value="1">
																		<input type="hidden" name="commentContent" value="${cl.commentContent }">
																		<input type="hidden" name="contestNo" value="${cl.boardNo }">
																		<input type="hidden" name="commentId" value="${cl.memberId }">
																		<input type="hidden" name="projectNo" value="${pt.projectNo }">
																		<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
																		<input type="hidden" name="boardType" value=1>
																		<input type="hidden" name="applicantMemberNo" value=0>
														        	</form>
														      	</div>
															  </div>
														  </div>
														</div>
													</c:if>
												</div>
											</c:if>
										</c:forEach>
									</div>	<!-- commentListBox 닫히는 태그 -->
								</c:if>
							</c:forEach>	
						</c:when>
						<%--댓글이 없는경우 --%>
							<c:otherwise>
								<div style="margin-bottom: 20px; margin-top: 20px;">
									<span style="font-weight: 900;">댓글을 작성할 때는 타인을 존중하고 
									<a id="community-guide">커뮤니티 가이드</a>
									를 준수해야 합니다.
									</span>
								</div>
								<div style="padding: 20px; text-align: center; border: 1px solid #d9d9d9; margin-top: 20px;">
									<img src="/resources/img/member/user.png" style="border-radius: 50%; width: 70px; margin-top: 70px;">
									<h2 style="color: gray; font-size: 20px; font-weight: 900; line-height: 100px;">작성된 댓글이 없습니다.</h2>
								</div>
							</c:otherwise>
					</c:choose>
					
					<!-- 커뮤니티 가이드 모달 -->
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
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	
		//댓글 글자수 제한
   		 $('.textareaBox').keydown(function(){
   			 var length = $(".textareaBox").val().length;
  			 if($(this).val().length > 64) {
  				swal({
  	 			  title: "글자수 초과",
  	 			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
  	 			  icon: "warning",
  	 			  buttons: true,
  	 			})
                 $(this).val($(this).val().substring(0, 64));
  			 }
   		 })
   		 
   		 //댓글 입력 안하면 전송 안되게
   		 $(".commentBtn").click(function(){
   			 if($('.txbox').val() == ""){
   				swal({
    	 			  title: "댓글 미입력",
    	 			  text: "댓글을 입력해주세요",
    	 			  icon: "warning",
    	 			  buttons: true,
    	 			})
   				return false;
   			}
   		 })
   		 //대댓글 입력 안하면 전송 안되게
   		 $(".commentBtn2").click(function(){
   			var index = $(".commentBtn2").index(this);
   			 if($('.txbox2').eq(index).val() == ""){
   				swal({
    	 			  title: "댓글 미입력",
    	 			  text: "댓글을 입력해주세요",
    	 			  icon: "warning",
    	 			  buttons: true,
    	 			})
   				return false;
   			}
   		 })
   		
	
		//대댓글 창 토글
		$(".reComentBtn").click(function(){
			var index = $(".reComentBtn").index(this);
			$(".recomentBox").eq(index).toggle();
		});
		$(".reComentBtn").trigger('click');
		
		//대댓글창 취소 클릭시 닫히기
		$(".cancelBtn").click(function(){
			var index = $(".cancelBtn").index(this);
			$(".recomentBox").eq(index).css("display","none");
		});
		
		//댓글 수정
		$(".updateCm").click(function(){
			var index = $(".updateCm").index(this);
			var commentNo = $(this).parent().prev().val();
			var commentContent = $(this).parent().prev().prev().val();
			 $.ajax({
				url : "/updateComment.do",
				data : {commentNo : commentNo, commentContent:commentContent},
				success : function(data) {
					location.reload();
				}
			});
	 			
		});
		
		//댓글삭제 
		$(".delComment").click(function(){
			var index = $(".delComment").index(this);
			var commentNo = $(this).next().val();
			swal({
	 			  title: "댓글 삭제",
	 			  text: "댓글을 삭제하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $.ajax({
	 					url : "/deleteComment.do",
	 					data : {commentNo : commentNo},
	 					success : function(data) {
	 						location.reload();
	 					}
	 				});
	 			  }
	 			});
	 			
		});
		
		//신고 기타버튼 선택 시 textarea 작성가능
		$("input[name=reportReason]").change(function(){
			var radioValue = $(this).val();
			if(radioValue == 7){
				$(".etc" ).attr('readonly', false);
			}else{
				$(".etc" ).attr('readonly', true);
			}	
		});
		
		//신고 기타칸 글자수 제한
		$('.etc').keydown(function(){
		var index = $(".etc").index(this);
		var length = $(".etc").eq(index).val().length;
		 if(length > 64) {
 				swal({
 	 			  title: "글자수 초과",
 	 			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
 	 			  icon: "warning",
 	 			  buttons: true,
 	 			})
                $(this).val($(this).val().substring(0, 64));
 			 }
		});
		
		//신고버튼 누르면 confirm창 띄우고 ok하면 submit
		$(".reportBtn").click(function(){
			var index = $(".reportBtn").index(this);
			var radioCheck = $('input[name=reportReason]').is(":checked");
			if(!radioCheck){
				alert("신고사유를 체크해주세요.");
				return;
			}
			
  			
			swal({
	 			  title: "댓글 신고",
	 			  text: "허위신고일 경우 신고자가 불이익을 받을 수 있습니다. 신고하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $(".reportBox").eq(index).submit();
	 			  }
	 		});
		})
		
		//로그인 안하면 댓글 작성 안됨
		$(".noMember").click(function(){
			alert("로그인 후 작성이 가능합니다.");
			location.href="/loginFrm.do";
		})
		
		//커뮤니티 가이드
		$("#community-guide").click(function() {

			$(".community-wrap").css("display", "flex");

		});
		$("#community-close").click(function() {

			$(".community-wrap").css("display", "none");

		});
		
		

	</script>
	
</body>
</html>
