<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recruit Crue Detail</title>
</head>
<script>

	$(function(){
		$(".return_img").click(function(){
			location.href="/recruitTeamMember_mainPage.do?reqPage=1";
		});
		
		$("#updateComment").click(function(){
			$("#updateTextBox").css("display", "block");
		});
		$("#cancelBtn1").click(function(){
			$("#updateTextBox").css("display", "none");
		});
		
		$("#insertReComment").click(function(){
			/* $("#reCommentTextBox").css("display", "block"); */
			$("#reCommentTextBox").show();
		});
		
		$("#cancelBtn2").click(function(){
			/* $("#reCommentTextBox").css("display", "none"); */
			$("#reCommentTextBox").hide();
		});
		
		$("#updateReComment").click(function(){
			$("#updateReCommentTextBox").show();
		});
		$("#cancelBtn3").click(function(){
			$("#updateReCommentTextBox").hide();
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
	                    			<a href="enterMyProject.do?projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}"><button type="button" class="btn btn-primary">내프로젝트(임시)</button></a>
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
                    					<a href="updateRecruitFrm.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"><button type="button" class="btn btn-primary" disabled="disabled">수정</button></a>
				                        <a href="deleteRecruit.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"> <button type="button" class="btn btn-primary" disabled="disabled">삭제</button></a>
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
            </div>
            <div class="commentWriteBox">
                <div class="commentTitle">
                    <p class="commentTitleText"><span>${pt.commentCount }</span>개의 댓글이 있습니다.</p>
                </div>
                <form action="/insertComment.do" method="post">
                	<div class="form-group">
	                	<c:choose>
	                		<c:when test="${memberNo == -1 }">
	                			<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="로그인 후 작성 가능합니다." disabled="disabled"></textarea>
	                		</c:when>
	                		<c:when test="${pt.projectStatus != 1 }">
	                			<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="마감된 공고에는 댓글을 다실 수 없습니다." disabled="disabled"></textarea>
	                		</c:when>
	                		<c:otherwise>
	                			<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요." name="commentContent" maxlength="49"></textarea>
	                			<input type="hidden" name="boardNo" value="${pt.projectNo }">
	                			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
	                			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	                			<input type="hidden" name="boardType" value="3">
	                		</c:otherwise>
	                	</c:choose>
	                </div>
	                <div class="commentBtnBox">
	                	<c:choose>
	                		<c:when test="${memberNo == -1 || pt.projectStatus != 1}">
	                			 <button type="button" class="btn btn-outline-primary" disabled="disabled">등록</button>
	                		</c:when>
	                		<c:otherwise>
	                			 <button type="submit" class="btn btn-outline-primary">등록</button>
	                			 <button type="reset" class="btn btn-outline-primary">초기화</button>
	                		</c:otherwise>
	                	</c:choose>
	                </div>
                </form>
            </div>
            <div class="commentBox">
            	<c:forEach items="${commentList }" var="cl">
	            	<c:if test="${cl.commentType == 1}">
	            		<div class="commmentInfoFlexBox">
		                    <div class="profileImgBox">
		                    	<c:choose>
		                    		<c:when test="${cl.writerImgPath eq null}">
		                    			<img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
		                    		</c:when>
		                    		<c:otherwise>
		                    			<img class="profileImg" src="/resources/upload/member/${cl.writerImgPath }">
		                    		</c:otherwise>
		                    	</c:choose>
		                    </div>
		                    <p class="memberIdText">${cl.memberId }</p>
		                    <p class="commentDate">${cl.regDate }</p>
		                </div>
		                <div class="commentContent">
		                    <div class="list-group">
		                        <a class="list-group-item list-group-item-action flex-column align-items-start active">
		                            <p class="mb-1">${cl.commentContent }</p>
		                        </a>
		                    </div>
		                    <div class="updateFunction">
		                    	<c:choose>
		                    		<c:when test="${sessionScope.m.memberId == cl.memberId }">
		                    			<a href="javascript:void(0);" class="updateText" id="updateComment">수정</a>
		                        		<a href="/deleteComment.do?commentNo=${cl.commentNo }&projectNo=${pt.projectNo }&memberNo=${sessionScope.m.memberNo}" class="updateText" id="deleteBtn1" >삭제</a>
		                    		</c:when>
		                    		<c:when test="${sessionScope.m.memberId != cl.memberId && memberNo != -1 }">
		                    			<a href="javascript:void(0);" class="updateText" id="insertReComment" >대댓글 달기</a>
		                    		</c:when>
		                    	</c:choose>
		                    </div>
		                    <div class="updateTextBox" id="updateTextBox">
		                    	<form action="updateComment.do" method="post">
		                    		<c:choose>
		                    			<c:when test="${pt.projectStatus != 1 }">
		                    				<div class="form-group">
					                            <textarea class="form-control" id="exampleTextarea" rows="3" value="${cl.commentContent }" name="commentContent" maxlength="49" disabled="disabled"></textarea>
					                            <input type="hidden" name="commentNo" value="${cl.commentNo }">d }">
					                        </div>
					                        <div class="commentBtnBox">
					                        	<button type="submit" class="btn btn-outline-primary" disabled="disabled">수정</button>
					                            <button type="reset" class="btn btn-outline-primary">초기화</button>
					                            <button type="button" class="btn btn-outline-primary" id="cancelBtn1">취소</button>
					                        </div>
		                    			</c:when>
		                    			<c:otherwise>
					                        <div class="form-group">
					                            <textarea class="form-control" id="exampleTextarea" rows="3" value="${cl.commentContent }" name="commentContent" maxlength="49"></textarea>
					                            <input type="hidden" name="commentNo" value="${cl.commentNo }">
					                            <input type="hidden" name="projectNo" value="${pt.projectNo }">
				                				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					                        </div>
					                        <div class="commentBtnBox">
					                        	<button type="submit" class="btn btn-outline-primary">수정</button>
					                            <button type="reset" class="btn btn-outline-primary">초기화</button>
					                            <button type="button" class="btn btn-outline-primary" id="cancelBtn1">취소</button>
					                        </div>
		                    			</c:otherwise>
		                    		</c:choose>
		                        </form>
		                    </div>
		                    <div class="reCommentTextBox" id="reCommentTextBox">
		                    	<form action="reCommentInsert.do" method="post">
		                    		<c:choose>
		                    			<c:when test="${pt.projectStatus != 1 }">
		                    				<div class="form-group">
					                            <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="마감된 공고에서는 댓글을 다실 수 없습니다." name="commentContent" maxlength="49" disabled="disabled"></textarea>
					                        </div>
					                        <div class="commentBtnBox">
					                        	<button type="submit" class="btn btn-outline-primary" disabled="disabled">등록</button>
					                            <button type="reset" class="btn btn-outline-primary">초기화</button>
					                            <button type="button" class="btn btn-outline-primary" id="cancelBtn2">취소</button>
					                        </div>
		                    			</c:when>
		                    			<c:otherwise>
					                        <div class="form-group">
					                            <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요." name="commentContent" maxlength="49"></textarea>
					                            <input type="hidden" name="boardNo" value="${pt.projectNo }">
					                            <input type="hidden" name="commentNo" value="${cl.commentNo }">
				                				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				                				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				                				<input type="hidden" name="boardType" value="3">
					                        </div>
					                        <div class="commentBtnBox">
					                        	<button type="submit" class="btn btn-outline-primary">등록</button>
					                            <button type="reset" class="btn btn-outline-primary">초기화</button>
					                            <button type="button" class="btn btn-outline-primary" id="cancelBtn2">취소</button>
					                        </div>
		                    			</c:otherwise>
		                    		</c:choose>
		                        </form>
		                    </div>
		                </div>
	            	</c:if>
	                <c:forEach items="${commentList }" var="cll">
	                	<c:if test="${cll.commentType == 2 && cl.commentNo == cll.commentRef}">
	                		<div class="nestedCommentFlexBox">
			                    <div class="nestedCommnetImgBox">
			                        <img src="/resources/img/recruitTeamProject/common/left-arrow.png" class="nestedCommnetImg">
			                    </div>
			                    <div class="nestedCommentBox">
			                        <div class="commmentInfoFlexBox">
			                            <div class="profileImgBox">
					                    	<c:choose>
					                    		<c:when test="${cll.writerImgPath eq null}">
					                    			<img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
					                    		</c:when>
					                    		<c:otherwise>
					                    			<img class="profileImg" src="/resources/upload/member/${cll.writerImgPath }">
					                    		</c:otherwise>
					                    	</c:choose>
					                    </div>
			                            <p class="memberIdText">${cll.memberId }</p>
			                            <p class="commentDate">${cll.regDate }</p>
			                        </div>
			                        <div class="commentContent">
			                            <div class="list-group">
			                                <a href="javascript:void(0);" class="list-group-item list-group-item-action flex-column align-items-start">
			                                    <p class="mb-1">${cll.commentContent }</p>
			                                </a>
			                            </div>
			                            <div class="updateFunction">
					                    	<c:choose>
					                    		<c:when test="${sessionScope.m.memberId == cll.memberId }">
					                    			<a href="javascript:void(0);" class="updateText" id="updateReComment">수정</a>
					                        		<a href="/deleteComment.do?commentNo=${cll.commentNo }&projectNo=${pt.projectNo }&memberNo=${sessionScope.m.memberNo}" id="deleteReComment"><p class="updateText">삭제</p></a> 
					                    		</c:when>
					                    	</c:choose>
					                    </div>
			                            <div class="updateReCommentTextBox" id="updateReCommentTextBox">
			                                <form action="/updateComment.do" method="post">
				                                
				                                <c:choose>
				                                	<c:when test="${pt.projectStatus != 1 }">
				                                		<div class="form-group">
						                                    <textarea class="form-control" id="exampleTextarea" rows="3" name="commentContent" maxlength="49" value="${cll.commentContent }" disabled="disabled"></textarea>
						                                </div>
						                                <div class="commentBtnBox">
						                                    <button type="submit" class="btn btn-outline-primary" disabled="disabled">수정</button>
								                            <button type="reset" class="btn btn-outline-primary">초기화</button>
								                            <button type="button" class="btn btn-outline-primary" id="cancelBtn3">취소</button>
						                                </div>
				                                	</c:when>
				                                	<c:otherwise>
						                                <div class="form-group">
						                                    <textarea class="form-control" id="exampleTextarea" rows="3" value="${cll.commentContent }" name="commentContent" maxlength="49"></textarea>
						                                    <input type="hidden" name="commentNo" value="${cll.commentNo }">
								                            <input type="hidden" name="projectNo" value="${pt.projectNo }">
							                				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
						                                </div>
						                                <div class="commentBtnBox">
						                                    <button type="submit" class="btn btn-outline-primary">수정</button>
								                            <button type="reset" class="btn btn-outline-primary">초기화</button>
								                            <button type="button" class="btn btn-outline-primary" id="cancelBtn3">취소</button>
						                                </div>
				                                	</c:otherwise>
				                                </c:choose>
			                                </form>
			                            </div>
			                        </div>
			                    </div>
			                </div>
	                	</c:if>
	                </c:forEach>
            	</c:forEach>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
