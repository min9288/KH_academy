<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Project Outline</title>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageDefault.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageOutline.css">
<script>
	$(function(){
		$("#updateLabel1").click(function(){
            $(".checkboxFlexList").css("display","flex");
            $("#updateLabel1").css("display","none");
            $("#updateLabel2").css("display","block");
        });
        $("#updateLabel2").click(function(){
            $(".checkboxFlexList").css("display","none");
            $("#updateLabel1").css("display","block");
            $("#updateLabel2").css("display","none");
        });

        $("#updateLeaderLabel1").click(function(){
            $("#selectLeaderBox").css("display","block");
            $("#updateLeaderLabel1").css("display","none");
            $("#updateLeaderLabel2").css("display","block");
        });
        $("#updateLeaderLabel2").click(function(){
            $("#selectLeaderBox").css("display","none");
            $("#updateLeaderLabel1").css("display","block");
            $("#updateLeaderLabel2").css("display","none");
        });
        
        $(".radioChk").click(function(){
        	if($(this).is(":checked")){
        		var radioValue = $(this).val();
        		$(this).parent().parent().next().val(radioValue);
        	}
        });
        
        $(".flexCLi").click(function(){
            $(".s-sub-menu").slideToggle("slow")
        });
        
    });
	
</script>
</head>
<body>
	<div class="container" id="projectContainer">
        <div class="main">
            <div class="main-left-box">
                <h2>${pt.projectName}</h2>
                <ul>
                    <li class="flexLi" style="border-bottom: 3px dashed #90d1b4;">
                        <a href="/enterMyProject.do?projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}" class="subNaviAtag" ><img src="/resources/img/recruitTeamProject/recruitPage/powerOn.png" class="subNaviImg"><span style="cursor: pointer; font-weight: 900">프로젝트 개요</span></a>
                    </li>
                    <li class="flexCLi" style="cursor: pointer;">
	                    <div class="flexSuperSubBox">
	                          <img src="/resources/img/recruitTeamProject/common/makefg (8).png" class="subNaviImg" style="margin-left: 5px;"><span>과업 관리</span>
	                    </div>
	                    <ul class="s-sub-menu">
                            <li><a href="/enterProjectTaskM.do?projectNo=${pt.projectNo}&reqPage=1"><span style="cursor: pointer;">Meeting</span></a></li>
                            <li><a href="/enterProjectTaskT.do?projectNo=${pt.projectNo}&reqPage=1"><span style="cursor: pointer;">Task</span></a></li>
                            <li><a href="/enterProjectTaskB.do?projectNo=${pt.projectNo}&reqPage=1"><span style="cursor: pointer;">Bug</span></a></li>
                            <li><a href="/enterProjectTaskH.do?projectNo=${pt.projectNo}&reqPage=1"><span style="cursor: pointer;">Hold</span></a></li>
                        </ul>
                    </li>
                    <c:forEach items="${scList}" var="sl">
                    	<li class="flexLi">
                    		<c:choose>
                    			<c:when test="${sl.linkName ne null}">
                    				<div style="display: flex; justify-content: space-between">
                    					<div>
						                    <a href="${sl.linkAddr}" class="subNaviAtag" target="_blank"><img src="/resources/img/recruitTeamProject/common/link.png" class="subNaviImg" style="width: 25px; position: relative; bottom: 3px; margin-right: 10px; margin-left: 5px;"><span style="cursor: pointer; font-size: 13px;">${sl.linkName}</span></a>
                    					</div>
                    					<div>
						                    <a href="/deleteShortcut.do?shortcutNo=${sl.shortcutNo}&projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}" style="text-decoration: none; margin-left: 30px;">X</a>
                    					</div>
                    				</div>
                    			</c:when>
                    			<c:otherwise>
                    				<div style="display: flex; justify-content: space-between">
                    					<div>
			                    			<a href="${sl.linkAddr}" class="subNaviAtag" target="_blank"><img src="/resources/img/recruitTeamProject/common/link.png" class="subNaviImg" style="width: 25px; position: relative; bottom: 3px; margin-right: 10px; margin-left: 5px;"><span style="cursor: pointer; font-size: 13px;">${sl.linkAddr}</span></a>
                    					</div>
                    					<div>
			                    			<a href="/deleteShortcut.do?shortcutNo=${sl.shortcutNo}&projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}" style="text-decoration: none; margin-left: 30px;">X</a>
                    					</div>
                    				</div>
                    			</c:otherwise>
                    		</c:choose>
	                    </li>
                    </c:forEach>
                    <li class="flexLi">
                        <a data-bs-toggle="modal" href="#shortcutModal" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/shortcuts.png" class="subNaviImg"><span style="cursor: pointer;">바로가기 추가</span></a>
                    </li>
                </ul>
            </div>
            <div class="main_wrap">
                <div class="titleFlexBox">
                    <p class="titleText">프로젝트 개요</p>
                    <c:choose>
                    	<c:when test="${sessionScope.m.memberId eq pt.projectReader && pt.projectStatus ne 3}">
                    		<a data-bs-toggle="modal" href="#projectEnd"><button type="button" class="btn btn-primary" id="closeProjectBtn">프로젝트 종료</button></a>
                    	</c:when>
                    	<c:when test="${sessionScope.m.memberId ne pt.projectReader && pt.projectStatus eq 3 && pt.writeReviewCheck eq 0}">
                    		<a data-bs-toggle="modal" href="#writeReview"><button type="button" class="btn btn-primary" id="closeProjectBtn">후기 작성</button></a>
                    	</c:when>
                    	<c:when test="${pt.projectStatus eq 3 && pt.writeReviewCheck ne 0}">
                    		<button type="button" class="btn btn-primary" id="closeProjectBtn" disabled="disabled">프로젝트 종료</button>
                    	</c:when>
                    </c:choose>
                </div>
                <div class="titleLine"></div>
                <div class="projectInfoFlexBox">
                    <div class="projectInfoLine1">
                        <form action="/updateProjectOutline.do" method="post">
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 이름</label>
                                <c:choose>
                                	<c:when test="${sessionScope.m.memberId eq pt.projectReader}">
                                		<input class="form-control form-control-lg" type="text" value="${pt.projectName}" id="inputLarge" name="projectName">
                                	</c:when>
                                	<c:otherwise>
                                		<input class="form-control form-control-lg" type="text" value="${pt.projectName}" id="inputLarge" readonly="readonly">
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 목표</label>
                                <c:choose>
                                	<c:when test="${sessionScope.m.memberId eq pt.projectReader}">
                                		<input class="form-control form-control-lg" type="text" value="${pt.projectGoal}" id="inputLarge" name="projectGoal">
                                	</c:when>
                                	<c:otherwise>
                                		<input class="form-control form-control-lg" type="text" value="${pt.projectGoal}" id="inputLarge" readonly="readonly">
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="projectLanguageBox">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">사용 언어</p>
                                    <c:if test="${sessionScope.m.memberId eq pt.projectReader && pt.projectStatus ne 3}">
                                    	<button type="button" class="btn btn-primary btn-sm" id="updateLabel1">수정</button>
                                    	<button type="button" class="btn btn-primary btn-sm" id="updateLabel2">취소</button>
                                    </c:if>
                                </div>
                                <div class="languageBox">
                                	<c:forEach items="${pdLangList}" var="li" varStatus="i">
                                		<c:if test="${pt.projectNo eq li.projectNo}">
                                			<img src="${li.langImg}" style="width: 50px; margin-right: 10px;">
                                		</c:if>
                                	</c:forEach>
                                </div>
                                <div class="checkboxFlexList">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                        <c:forEach items="${dlList }" var="dll" begin="0" end="7" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="8" end="15" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="16" end="23" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="projectLeader">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">프로젝트 리더</p>
                                    <c:if test="${sessionScope.m.memberId eq pt.projectReader && pt.projectStatus ne 3}">
                                    	<button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel1">수정</button>
                                    	<button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel2">취소</button>
                                    </c:if>
                                </div>
                                <div class="leaderInfoBox">
                                	<c:choose>
                                		<c:when test="${pt.writerImgPath eq null}">
                                			<img src="/resources/img/recruitTeamProject/common/user.png" class="leaderImg">
                                		</c:when>
                                		<c:otherwise>
                                			<img src="/resources/upload/member/${pt.writerImgPath }" class="leaderImg">
                                		</c:otherwise>
                                	</c:choose>
                                    <p class="leaderIdText">${pt.projectReader}</p>
                                    <c:choose>
										<c:when test="${pt.projectWriterGrade >=1 && pt.projectWriterGrade <= 20 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=21 && pt.projectWriterGrade <= 40 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=41 && pt.projectWriterGrade <= 60 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=61 && pt.projectWriterGrade <= 80 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=81 && pt.projectWriterGrade <= 110 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=111 && pt.projectWriterGrade <= 140 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
										</c:when>
										<c:when test="${pt.projectWriterGrade >=141 && pt.projectWriterGrade <= 170 }">
											<img class="leaderGradeImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
										</c:when>								
									</c:choose>
                                </div>
                                <div id="selectLeaderBox">
                                    <div class="form-group">
                                        <label for="exampleSelect1" class="form-label mt-4">프로젝트 리더 선택</label>
                                        <select class="form-select" id="exampleSelect1" style="width: 400px;" name="projectReader">
                                            <option><p>${pt.projectReader}</p></option>
                                            <c:forEach items="${memberList}" var="ml">
                                            	<c:if test="${ml.memberId ne pt.projectReader}">
	                                            	<option><p>${ml.memberId}</p></option>
                                            	</c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="crueBox">
                                    <p class="infoLineText1">프로젝트 크루 및 역할</p>
                                    	<div class="crueTwoFlexBox">
		                                    <c:forEach items="${memberList}" var="ml" begin="0" end="1">
	                                        <div class="crueAllInfoBox">
	                                            <div class="crueProfile"> 
	                                            	<c:choose>
				                                		<c:when test="${ml.memberImg eq null}">
				                                			<img src="/resources/img/recruitTeamProject/common/user.png" class="crueImg">
				                                		</c:when>
				                                		<c:otherwise>
				                                			<img src="/resources/upload/member/${ml.memberImg}" class="crueImg">
				                                		</c:otherwise>
				                                	</c:choose>
	                                                <p class="crueIdText">${ml.memberId}</p>
	                                                <c:choose>
														<c:when test="${ml.memberGrade >=1 && ml.memberGrade <= 20 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
														</c:when>
														<c:when test="${ml.memberGrade >=21 && ml.memberGrade <= 40 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
														</c:when>
														<c:when test="${ml.memberGrade >=41 && ml.memberGrade <= 60 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
														</c:when>
														<c:when test="${ml.memberGrade >=61 && ml.memberGrade <= 80 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
														</c:when>
														<c:when test="${ml.memberGrade >=81 && ml.memberGrade <= 110 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
														</c:when>
														<c:when test="${ml.memberGrade >=111 && ml.memberGrade <= 140 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
														</c:when>
														<c:when test="${ml.memberGrade >=141 && ml.memberGrade <= 170 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
														</c:when>								
													</c:choose>
	                                            </div>
	                                            <div class="rollBox">
	                                                <div class="form-group">
	                                                	<c:choose>
	                                                		<c:when test="${ml.memberId eq sessionScope.m.memberId && pt.projectStatus ne 3}">
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll" value="${ml.memberRole }">
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" value="${ml.memberRole }" readonly="readonly">
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </div>
	                                            </div>
	                                        </div>
                                   			</c:forEach>
	                                     </div>
	                                     <div class="crueTwoFlexBox">
		                                    <c:forEach items="${memberList}" var="ml" begin="2" end="3">
	                                        <div class="crueAllInfoBox">
	                                            <div class="crueProfile"> 
	                                            	<c:choose>
				                                		<c:when test="${ml.memberImg eq null}">
				                                			<img src="/resources/img/recruitTeamProject/common/user.png" class="crueImg">
				                                		</c:when>
				                                		<c:otherwise>
				                                			<img src="/resources/upload/member/${ml.memberImg}" class="crueImg">
				                                		</c:otherwise>
				                                	</c:choose>
	                                                <p class="crueIdText">${ml.memberId}</p>
	                                                <c:choose>
														<c:when test="${ml.memberGrade >=1 && ml.memberGrade <= 20 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
														</c:when>
														<c:when test="${ml.memberGrade >=21 && ml.memberGrade <= 40 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
														</c:when>
														<c:when test="${ml.memberGrade >=41 && ml.memberGrade <= 60 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
														</c:when>
														<c:when test="${ml.memberGrade >=61 && ml.memberGrade <= 80 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
														</c:when>
														<c:when test="${ml.memberGrade >=81 && ml.memberGrade <= 110 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
														</c:when>
														<c:when test="${ml.memberGrade >=111 && ml.memberGrade <= 140 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
														</c:when>
														<c:when test="${ml.memberGrade >=141 && ml.memberGrade <= 170 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
														</c:when>								
													</c:choose>
	                                            </div>
	                                            <div class="rollBox">
	                                                <div class="form-group">
	                                                	<c:choose>
	                                                		<c:when test="${ml.memberId eq sessionScope.m.memberId}">
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll" value="${ml.memberRole }">
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" value="${ml.memberRole }" readonly="readonly">
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </div>
	                                            </div>
	                                        </div>
                                   			</c:forEach>
	                                     </div>
	                                     <div class="crueTwoFlexBox">
		                                    <c:forEach items="${memberList}" var="ml" begin="4" end="5">
	                                        <div class="crueAllInfoBox">
	                                            <div class="crueProfile"> 
	                                            	<c:choose>
				                                		<c:when test="${ml.memberImg eq null}">
				                                			<img src="/resources/img/recruitTeamProject/common/user.png" class="crueImg">
				                                		</c:when>
				                                		<c:otherwise>
				                                			<img src="/resources/upload/member/${ml.memberImg}" class="crueImg">
				                                		</c:otherwise>
				                                	</c:choose>
	                                                <p class="crueIdText">${ml.memberId}</p>
	                                                <c:choose>
														<c:when test="${ml.memberGrade >=1 && ml.memberGrade <= 20 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
														</c:when>
														<c:when test="${ml.memberGrade >=21 && ml.memberGrade <= 40 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
														</c:when>
														<c:when test="${ml.memberGrade >=41 && ml.memberGrade <= 60 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
														</c:when>
														<c:when test="${ml.memberGrade >=61 && ml.memberGrade <= 80 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
														</c:when>
														<c:when test="${ml.memberGrade >=81 && ml.memberGrade <= 110 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
														</c:when>
														<c:when test="${ml.memberGrade >=111 && ml.memberGrade <= 140 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
														</c:when>
														<c:when test="${ml.memberGrade >=141 && ml.memberGrade <= 170 }">
															<img class="crueGradeImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
														</c:when>								
													</c:choose>
	                                            </div>
	                                            <div class="rollBox">
	                                                <div class="form-group">
	                                                	<c:choose>
	                                                		<c:when test="${ml.memberId eq sessionScope.m.memberId}">
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll" value="${ml.memberRole }">
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<input class="form-control form-control-sm" type="text" id="inputSmall" value="${ml.memberRole }" readonly="readonly">
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </div>
	                                            </div>
	                                        </div>
                                   			</c:forEach>
	                                     </div>
                                <div class="taskMainFlexBox">
                                    <div class="taskInfoBox">
                                        <p class="infoLineText2">최근에 완료된 일</p>
                                        <div class="taskSubFlexBox">
	                                        <c:if test="${recentTask.taskTitle ne null}">
	                                            <p class="taskText">${recentTask.taskTitle}</p>
	                                            <span class="badge rounded-pill bg-primary">완료</span>
	                                        </c:if>
                                        </div>
                                    </div>
                                    <div class="taskInfoBox" style="margin-right: 150px;">
                                        <p class="infoLineText2">앞으로 해야 할 일</p>
                                        <div class="taskSubFlexBox">
                                        	<c:if test="${toDoTask.taskTitle ne null}">
	                                            <p class="taskText">${toDoTask.taskTitle}</p>
	                                            <span class="badge rounded-pill bg-primary">해야 할 일</span>
	                                        </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="areaLine"></div>
                            <div class="submitBtnArea">
                            	<input type="hidden" name="sessionMemberNo" value="${sessionScope.m.memberNo}">
                            	<input type="hidden" name="projectNo" value="${pt.projectNo}">
                            	<c:choose>
                            		<c:when test="${pt.projectStatus eq 3}">
		                                <button type="submit" class="btn btn-primary" disabled="disabled">수정</button>
                            		</c:when>
                            		<c:otherwise>
                            			<button type="submit" class="btn btn-primary">수정</button>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="shortcutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addShortcut.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">바로가기 추가</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">웹 주소</label>
                            <input type="text" class="form-control" placeholder="웹 주소를 넣어주세요" id="inputDefault" name="shortcutAddr" >
                            <span style="color: red; font-size: 14px;">주의! 직접 입력하는 경우, 주소앞에 <b>http://</b> 또는 <b>https://</b> 를 붙여주세요!</span>
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">바로가기 이름</label>
                            <input type="text" class="form-control" placeholder="바로가기 이름을 입력해주세요" id="inputDefault" name="shortcutName" maxlength="10">
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                        	<input type="hidden" name="projectNo" value="${pt.projectNo}">
                        	<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">추가</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="projectEnd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p style="font-size: 35px; font-weight: bold; color: rgb(78, 205, 196); margin-bottom: 10px; text-align: center;">프로젝트 종료</p>
                    <div class="card-body">
                        <h4 class="card-title" style="text-align: center; margin-bottom: 30px; color: #90d1b4; font-weight: 900;">프로젝트 종료 관련 안내 및 주의사항</h4>
                        <p class="card-text" style="text-align: left; margin-bottom: 20px; font-weight: 900;">
                            1. 프로젝트를 프로젝트를 종료하면 지금까지 작업한 정보는 저장되며 추후에도 마이페이지에서 확인이 가능합니다.
                            <br>
                            <br>
                            2. 종료 이후 수정이나 삭제는 불가능하오니 이 점 <br> 주의해주시기 바랍니다.
                        </p>
                        <p class="card-text" style="text-align: center; margin-bottom: 30px; margin-top: 30px; font-weight: 900; color: #FF5677;">
                            종료버튼을 누르고 모든 팀원들에 대해 후기를 작성해야  <br> 최종적으로 프로젝트가 종료되니 명심해주세요!
                        </p>
                    </div>
                    <div style="text-align: center; padding-top: 10px;">
                        <a data-bs-toggle="modal" href="#writeReview"><button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 15px;">종료</button></a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="writeReview" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/endProject.do" method="post">
                        <p style="font-size: 35px; font-weight: bold; color: rgb(78, 205, 196); margin-bottom: 10px; text-align: left;">팀원에게 후기를 남겨주세요</p>
                        <p style="font-weight: 900;"> &#10004; 후기는 익명으로 등록됩니다.</p>
                        <div style="border-bottom: 1px solid #90d1b4; margin-bottom: 60px;"></div>
						<c:forEach items="${memberList}" var="ml" varStatus="i">
							<c:if test="${ml.memberNo ne sessionScope.m.memberNo}">
								<div style="display: flex; margin-left: 50px; margin-top: 50px;">
		                            <div style="display: flex; flex-direction: column; margin-right: 30px; margin-top: 10px;">
		                            <c:choose>
		                            	<c:when test="${ml.memberImg eq null}">
		                            		<img src="/resources/img/recruitTeamProject/common/user.png" style="width: 100px; height: 100px; margin-left: 10px;">
		                            	</c:when>
		                            	<c:otherwise>
		                            		<img src="/resources/upload/member/${ml.memberImg}" style="width: 100px; height: 100px; margin-left: 10px;">
		                            	</c:otherwise>
		                            </c:choose>
		                                <p style="font-size: 26px; font-weight: 900;">${ml.memberId}</p>
		                            </div>
		                            <div style="display: flex; flex-direction: column;">
		                                <div style="display: flex;">
		                                    <div class="modalReviewSub1">
		                                        <img src="/resources/img/recruitTeamProject/review/bigHappy.png" style="width: 40px; height: 40px; display: block; margin: 0px auto;">
		                                        <label for="r5" style="text-align: center;">매우좋았어요</label>
		                                        <input type="radio" id="r5" name="rePoint${i.index}" class="radioChk" value="5" style="display: block; margin: 0px auto;">
		                                    </div>
		                                    <div class="modalReviewSub1">
		                                        <img src="/resources/img/recruitTeamProject/review/happy.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
		                                        <label for="r4">좋았어요</label>
		                                        <input type="radio" id="r4" name="rePoint${i.index}" value="4" class="radioChk" style="display: block; margin: 0px auto;">
		                                    </div>
		                                    <div class="modalReviewSub1">
		                                        <img src="/resources/img/recruitTeamProject/review/common.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
		                                        <label for="r3">친절해요</label>
		                                        <input type="radio" id="r3" name="rePoint${i.index}" value="3" class="radioChk" style="display: block; margin: 0px auto;">
		                                    </div>
		                                    <div class="modalReviewSub1">
		                                        <img src="/resources/img/recruitTeamProject/review/bad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
		                                        <label for="r2">나빠요</label>
		                                        <input type="radio" id="r2" name="rePoint${i.index}" value="2" class="radioChk" style="display: block; margin: 0px auto;">
		                                    </div>
		                                    <div class="modalReviewSub1">
		                                        <img src="/resources/img/recruitTeamProject/review/superBad.png" style="width: 40px; height: 40px; block; margin: 0px auto;">
		                                        <label for="r1">매우나빠요</label>
		                                        <input type="radio" id="r1" name="rePoint${i.index}" value="1" class="radioChk" style="display: block; margin: 0px auto;">
		                                        
		                                    </div>
		                                </div>
		                                <input type="hidden" name="reviewPoint">
		                                <div class="form-group" style="margin-top: 20px;">
		                                    <textarea class="form-control" id="exampleTextarea" rows="3" maxlength="250" name="reviewContent"></textarea>
		                                </div>
		                            </div>
		                            <input type="hidden" name="projectNo" value="${ml.projectNo}">
		                            <input type="hidden" name="teamMemberNo" value="${ml.teamMemberNo}">
		                            <input type="hidden" name="memberNo" value="${ml.memberNo}">
		                            
		                        </div>
							</c:if>
						</c:forEach>
                        <div style="border-bottom: 1px solid #90d1b4; margin-bottom: 10px; margin-top: 40px;"></div>
                        <div style="text-align: center; padding-top: 10px; margin-top: 40px; margin-bottom: 40px;">
                        	<input type="hidden" name="backMemberNo" value="${sessionScope.m.memberNo}">
                        	<input type="hidden" name="backProjectNo" value="${pt.projectNo}">
                        	<input type="hidden" name="sessionMemberId" value="${sessionScope.m.memberId}">
                        	<input type="hidden" name="projectReader" value="${pt.projectReader}">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 150px; margin-right: 15px;">후기작성 완료</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>