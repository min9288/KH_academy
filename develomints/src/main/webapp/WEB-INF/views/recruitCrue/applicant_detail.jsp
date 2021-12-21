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
<title>apply content detail</title>
</head>
<script>

	$(function(){
		var entryStatus = $("#entryStatus").val();
		var memberNo = $("#memberNo").val();
		var projectNo = $("#projectNo").val();
		$(".return_img").click(function(){
			if(entryStatus != 1){
				location.href="/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1";
			} else {
				location.href="/manageFinalEntryFrm.do?memberNo="+memberNo+"&projectNo="+projectNo+"&viewValue=1";
			}
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
			<input type="hidden" id="entryStatus" name="entryStatus" value="${pe.entryStatus }">
			<input type="hidden" id="projectNo" name="projectNo" value="${projectNo }">
			<input type="hidden" id="memberNo" name="memberNo" value="${memberNo }">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_wrap">
                <div class="titleBox">
                    <p class="titleText">${pe.ambition}</p>
                </div>
                <div class="noticeInfoFlexBox">
                    <div class="memberInfo">
                    	<c:choose>
                    		<c:when test="${pe.imgPath eq null}">
                    			<img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                    		</c:when>
                    		<c:otherwise>
                    			<img class="profileImg" src="/resources/upload/member/${pe.imgPath }">
                    		</c:otherwise>
                    	</c:choose>
                        <p class="memberIdText">${pe.memberId}</p>
                        <c:choose>
							<c:when test="${pe.memberGrade >=1 && pe.memberGrade <= 20 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
							</c:when>
							<c:when test="${pe.memberGrade >=21 && pe.memberGrade <= 40 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
							</c:when>
							<c:when test="${pe.memberGrade >=41 && pe.memberGrade <= 60 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
							</c:when>
							<c:when test="${pe.memberGrade >=61 && pe.memberGrade <= 80 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
							</c:when>
							<c:when test="${pe.memberGrade >=81 && pe.memberGrade <= 110 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
							</c:when>
							<c:when test="${pe.memberGrade >=111 && pe.memberGrade <= 140 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
							</c:when>
							<c:when test="${pe.memberGrade >=141 && pe.memberGrade <= 170 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
							</c:when>								
						</c:choose>
                    </div>
                    <div class="writeDate">
                        <b>${pe.applyDate}</b>
                    </div>
                </div>
                <div class="noticeInfoFlexBox2">
                    <div class="userLanguage">
                        <b class="useLang">사용 언어 : </b>
                        <c:forEach items="${udlList }" var="udl"  varStatus="i">
                        	<c:if test="${pe.projectNo eq udl.projectNo && pe.memberNo eq udl.memberNo}">
                        		<span class="badge rounded-pill bg-primary" id="languageIcon">${udl.langName }</span>
                        	</c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="line"></div>
                <div class="datailContent">
                    	 ${pe.applyContent }
                </div>
                <div class="bottomContentFlexBox">
                    <div class="bottomContentFlexBox_btnBox">
                    	<c:choose>
                    		<c:when test="${sessionScope.m.memberNo ne pe.memberNo}">
                    			<c:choose>
                    				<c:when test="${pe.entryStatus == 1}">
                    					<a href="/selectTeamMember.do?entryNo=${pe.entryNo }&memberNo=${pe.memberNo}&projectNo=${pe.projectNo}"><button type="button" class="btn btn-primary">선발</button></a>
		                        		<a href="/deleteTeamMember.do?entryNo=${pe.entryNo }&memberNo=${pe.memberNo}&projectNo=${pe.projectNo}"><button type="button" class="btn btn-primary">탈락</button></a>
                    				</c:when>
                    				<c:otherwise>
                    					<a href="/selectFinalTeamMember.do?entryNo=${pe.entryNo }&memberNo=${pe.memberNo}&projectNo=${pe.projectNo}&viewValue=1&pageTransValue=${pe.availableNum }"><button type="button" class="btn btn-primary">최종선발</button></a>
		                        		<a href="/returnTeamMember.do?entryNo=${pe.entryNo }&memberNo=${pe.memberNo}&projectNo=${pe.projectNo}&viewValue=1&pageTransValue=${pe.availableNum }"><button type="button" class="btn btn-primary">대기인원 전환</button></a>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:when>
                    		<c:otherwise>
                    			<a href="/updateProjectApplyFrm.do?entryNo=${pe.entryNo }&memberNo=${memberNo}&projectNo=${pe.projectNo}"><button type="button" class="btn btn-primary">수정</button></a>
                        		<a href="/cancelApplyProject.do?entryNo=${pe.entryNo }&memberNo=${memberNo}&projectNo=${pe.projectNo}&applicantNo=${pe.memberNo}"><button type="button" class="btn btn-primary">지원 취소</button></a>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <div class="commentWriteBox">
                <div class="commentTitle">
                    <p class="commentTitleText"><span>${pe.commentCount }</span>개의 댓글이 있습니다.</p>
                </div>
                <form action="/insertComment.do" method="post">
                	<div class="form-group">
	                	<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요." name="commentContent" maxlength="49"></textarea>
	                	<input type="hidden" name="boardNo" value="${pe.projectNo }">
	                	<input type="hidden" name="memberNo" value="${memberNo }">
	                	<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	                	<input type="hidden" name="checkMemberNo" value="${sessionScope.m.memberNo }">
	                	<input type="hidden" name="boardType" value="5">
	                </div>
	                <div class="commentBtnBox">
	                	<button type="submit" class="btn btn-outline-primary">등록</button>
	                	<button type="reset" class="btn btn-outline-primary">초기화</button>
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
		                        		<a href="/deleteComment.do?commentNo=${cl.commentNo }&projectNo=${pe.projectNo }&memberNo=${memberNo}" class="updateText" id="deleteBtn1" >삭제</a>
		                    		</c:when>
		                    		<c:when test="${sessionScope.m.memberId != cl.memberId }">
		                    			<a href="javascript:void(0);" class="updateText" id="insertReComment" >대댓글 달기</a>
		                    		</c:when>
		                    	</c:choose>
		                    </div>
		                    <div class="updateTextBox" id="updateTextBox">
		                    	<form action="updateComment.do" method="post">
					                  <div class="form-group">
					                      	<textarea class="form-control" id="exampleTextarea" rows="3" value="${cl.commentContent }" name="commentContent" maxlength="49"></textarea>
					                      	<input type="hidden" name="commentNo" value="${cl.commentNo }">
					                      	<input type="hidden" name="projectNo" value="${pe.projectNo }">
				                			<input type="hidden" name="memberNo" value="${memberNo}">
					                  </div>
					                  <div class="commentBtnBox">
					                        <button type="submit" class="btn btn-outline-primary">수정</button>
					                        <button type="reset" class="btn btn-outline-primary">초기화</button>
					                        <button type="button" class="btn btn-outline-primary" id="cancelBtn1">취소</button>
					                  </div>
		                        </form>
		                    </div>
		                    <div class="reCommentTextBox" id="reCommentTextBox">
		                    	<form action="reCommentInsert.do" method="post">
					                <div class="form-group">
					                    <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요." name="commentContent" maxlength="49"></textarea>
					                    <input type="hidden" name="boardNo" value="${pe.projectNo }">
					                    <input type="hidden" name="commentNo" value="${cl.commentNo }">
				                		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				                		<input type="hidden" name="memberNo" value="${memberNo}">
				                		<input type="hidden" name="boardType" value="5">
					                </div>
					                <div class="commentBtnBox">
					                      <button type="submit" class="btn btn-outline-primary">등록</button>
					                      <button type="reset" class="btn btn-outline-primary">초기화</button>
					                      <button type="button" class="btn btn-outline-primary" id="cancelBtn2">취소</button>
					                </div>
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
					                        		<a href="/deleteComment.do?commentNo=${cll.commentNo }&projectNo=${pe.projectNo }&memberNo=${memberNo}" id="deleteReComment"><p class="updateText">삭제</p></a> 
					                    		</c:when>
					                    	</c:choose>
					                    </div>
			                            <div class="updateReCommentTextBox" id="updateReCommentTextBox">
			                                <form action="/updateComment.do" method="post">
						                         <div class="form-group">
						                               	<textarea class="form-control" id="exampleTextarea" rows="3" value="${cll.commentContent }" name="commentContent" maxlength="49"></textarea>
						                               	<input type="hidden" name="commentNo" value="${cll.commentNo }">
								                       	<input type="hidden" name="projectNo" value="${pe.projectNo }">
							                			<input type="hidden" name="memberNo" value="${memberNo}">
						                          </div>
						                          <div class="commentBtnBox">
						                              <button type="submit" class="btn btn-outline-primary">수정</button>
								                      <button type="reset" class="btn btn-outline-primary">초기화</button>
								                      <button type="button" class="btn btn-outline-primary" id="cancelBtn3">취소</button>
						                          </div>
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