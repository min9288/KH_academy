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
    <link rel="stylesheet" href="/resources/css/projectTeam/projectManageTask.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script>

	$(function(){
		
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
                        <a href="/enterMyProject.do?projectNo=${projectNo}&memberNo=${sessionScope.m.memberNo}" class="subNaviAtag" ><img src="/resources/img/recruitTeamProject/recruitPage/powerOn.png" class="subNaviImg"><span style="cursor: pointer;">프로젝트 개요</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/calendar.png" class="subNaviImg"><span style="cursor: pointer;">캘린더</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="/enterProjectTask.do?projectNo=${projectNo}" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/makefg (8).png" class="subNaviImg"><span style="cursor: pointer; font-weight: 900">과업 관리</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/board.png" class="subNaviImg"><span style="cursor: pointer;">보드</span></a>
                    </li>
                    <c:forEach items="${scList}" var="sl">
                    	<li class="flexLi">
                    		<c:choose>
                    			<c:when test="${sl.linkName ne null}">
				                    <a href="${sl.linkAddr}" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/foreign.png" class="subNaviImg"><span style="cursor: pointer;">${sl.linkName}</span></a>
				                    <a href="/deleteShortcut.do?shortcutNo=${sl.shortcutNo}&projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}" style="position: relative; top: 10px; text-decoration: none; margin-left: 30px;">X</a>
                    			</c:when>
                    			<c:otherwise>
	                    			<a href="${sl.linkAddr}" class="subNaviAtag"><img src="/resources/img/recruitTeamProject/common/foreign.png" class="subNaviImg"><span style="cursor: pointer;">${sl.linkAddr}</span></a>
	                    			<a href="/deleteShortcut.do?shortcutNo=${sl.shortcutNo}&projectNo=${pt.projectNo}&memberNo=${sessionScope.m.memberNo}" style="position: relative; top: 8px; text-decoration: none; margin-left: 30px;">X</a>
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
                    <p class="titleText">과업 관리</p>
                </div>
                <div class="titleLine"></div>
                <div class="taskBox">
                    <div class="taskWrap">
                        <p class="taskContentTitle">Meeting</p>
                        <a data-bs-toggle="modal" href="#M-1" style="text-decoration: none;">
                            <div class="taskMeeting" >
                                <div class="leftTaskSite">
                                    <p class="taskNo">M-1</p>
                                    <p class="taskTitle">주간 회의</p>
                                </div>
                                <div class="rightTaskSite">
                                    <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
                                    <span class="badge rounded-pill bg-primary" id="mediumLabel">medium</span>
                                    <span class="badge rounded-pill bg-primary" id="urgencyLabel">urgency</span>
                                    <span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
                                    <span class="badge rounded-pill bg-primary" id="ongoingLabel">진행 중</span>
                                    <span class="badge rounded-pill bg-primary" id="todoLabel">해야 할 일</span>
                                    <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
                                    <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                                </div>
                            </div>
                        </a>
                        <div>
                            <a data-bs-toggle="modal" href="#addMIssue" style="text-decoration: none;"><p class="addIssue">+ 이슈 만들기</p></a>
                        </div>
                    </div>
                </div>
                <div class="taskBox">
                    <div class="taskWrap">
                        <p class="taskContentTitle">Task</p>
                        <div class="taskMeeting" >
                            <div class="leftTaskSite">
                                <p class="taskNo">T-1</p>
                                <p class="taskTitle">데이터베이스 설계</p>
                            </div>
                            <div class="rightTaskSite">
                                <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
                                <span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
                                <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
                                <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                            </div>
                        </div>
                        <div>
                            <a data-bs-toggle="modal" href="#addTIssue" style="text-decoration: none;"><p class="addIssue">+ 이슈 만들기</p></a>
                        </div>
                    </div>
                </div>
                <div class="taskBox">
                    <div class="taskWrap">
                        <p class="taskContentTitle">Bug</p>
                        <div class="taskMeeting" >
                            <div class="leftTaskSite">
                                <p class="taskNo">B-1</p>
                                <p class="taskTitle">주간 회의</p>
                            </div>
                            <div class="rightTaskSite">
                                <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
                                <span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
                                <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
                                <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                            </div>
                        </div>
                        <div>
                            <a data-bs-toggle="modal" href="#addBIssue" style="text-decoration: none;"><p class="addIssue">+ 이슈 만들기</p></a>
                        </div>
                    </div>
                </div>
                <div class="taskBox">
                    <div class="taskWrap">
                        <p class="taskContentTitle">Hold</p>
                        <div class="taskMeeting" >
                            <div class="leftTaskSite">
                                <p class="taskNo">M-1</p>
                                <p class="taskTitle">주간 회의</p>
                            </div>
                            <div class="rightTaskSite">
                                <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
                                <span class="badge rounded-pill bg-primary" id="holdLabel">보류</span>
                                <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
                                <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                            </div>
                        </div>
                        <div>
                            <a data-bs-toggle="modal" href="#addHIssue" style="text-decoration: none;"><p class="addIssue">+ 이슈 만들기</p></a>
                        </div>
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
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">바로가기 이름</label>
                            <input type="text" class="form-control" placeholder="바로가기 이름을 입력해주세요" id="inputDefault" name="shortcutName">
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
    
    <div class="modal fade" id="M-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/updateIssue.do" method="post">
                        <div class="modalTitleFlexBox">
                            <div class="modalLeftSite" style="margin-top: 10px;">
                                <p class="taskSubTitle">과업관리 / T-1</p>
                                <p style="font-size: 25px; font-weight: bold; color: #90d1b4; ">데이터베이스 설계</p>
                            </div>
                            <div class="modalRightSite" style="margin-right: 20px;">
                                <a href="Javascript Void:(0);" data-bs-dismiss="modal" style="text-decoration: none;"><p style="font-size: 25px;">X</p></a>
                            </div>
                        </div>
                        
                        <div class="modalFlexBox">
                            <div class="form-group" style="margin-bottom: 15px;">
                                <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4; width: 600px;">설명</label>
                                <textarea class="form-control" id="summernote" rows="10" name="modalcontent"></textarea>
                            </div>
                            <div class="taskInfoBox">
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">담당자</p>
                                    </div>
                                    <div style="display: flex;">
                                        <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 10px; margin-right: 15px;">
                                        <p class="taskInfoText">MemberId</p>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">우선 순위</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1">
                                            <option>medium</option>
                                            <option>urgency</option>
                                            <option>low</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">진행분류</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1">
                                            <option>해야 할 일</option>
                                            <option>진행 중</option>
                                            <option>완료</option>
                                            <option>보류</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: left; padding-top: 5px; margin-left: 20px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px">저장</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                    <div class="titleLine" style="width: 100%; margin-top: 20px;"></div>
                    <div class="bottomLinkBox" style="margin-top: 45px;">
                        <p class="modalBottomTitle">참고 이슈(최대 3개)</p>
                        <div class="issueForm">
                            <a data-bs-toggle="modal" href="#" style="text-decoration: none;">
                                <div class="taskMeeting" style="border: 1px solid #90d1b4; width: 800px;">
                                    <div class="leftTaskSite">
                                        <p class="taskNo">M-1</p>
                                        <p class="taskTitle">주간 회의</p>
                                    </div>
                                    <div class="rightTaskSite">
                                        <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
                                        <span class="badge rounded-pill bg-primary" id="mediumLabel">medium</span>
                                        <span class="badge rounded-pill bg-primary" id="urgencyLabel">urgency</span>
                                        <span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
                                        <span class="badge rounded-pill bg-primary" id="ongoingLabel">진행 중</span>
                                        <span class="badge rounded-pill bg-primary" id="todoLabel">해야 할 일</span>
                                        <img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
                                        <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                                    </div>
                                </div>
                                <a data-bs-toggle="modal" href="#linkIssue" style="text-decoration: none;"><p>+ 이슈 등록하기</p></a>
                            </a>
                        </div>
                    </div>
                    <div class="bottomLinkBox" style="margin-bottom: 50px;">
                        <p class="modalBottomTitle">참고 링크(최대 3개)</p>
                        <div class="issueForm">
                            <div class="taskMeeting" style="border: 1px solid #90d1b4; width: 800px;">
                                <div class="leftTaskSite">
                                    <p class="taskNo">네이버</p>
                                    <p class="taskTitle" style="margin-left: 35px;">www.naver.com</p>
                                </div>
                                <div class="rightTaskSite">
                                    <a href="#" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
                                </div>
                            </div>
                            <a data-bs-toggle="modal" href="#refLink" style="text-decoration: none;"><p>+ 링크 등록하기</p></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="linkIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">이슈 연결하기</p>
                        <div class="form-group">
                            <label for="exampleSelect1" class="form-label mt-4" style="font-weight: bold; color: #90d1b4;">등록 이슈(최신순)</label>
                            <select class="form-select" id="exampleSelect1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">연결</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="refLink" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">참고링크 만들기(최대 3개)</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="shortcutAddr" >
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="addMIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">Meeting 이슈 만들기</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="shortcutAddr" >
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addTIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">Task 이슈 만들기</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="shortcutAddr" >
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addBIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">Bug 이슈 만들기</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="shortcutAddr" >
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addHIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;">Hold 이슈 만들기</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="shortcutAddr" >
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
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