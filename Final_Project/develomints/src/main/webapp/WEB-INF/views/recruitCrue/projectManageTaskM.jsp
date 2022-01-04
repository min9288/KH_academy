<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Project Task Manager_Meeting</title>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageDefault.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageOutline.css">
    <link rel="stylesheet" href="/resources/css/projectTeam/projectManageTask.css">
	
<script>
	var result = false
	$(function(){
		$(".flexCLi").click(function(){
            $(".s-sub-menu").slideToggle("slow")
        });
		
		var viewValue = $(".clickCssKeeper").val();
	    var checkValue = $(".checkCssKeeper").val();
	    var pageProjectNo = $(".pageProjectNo").val();
	    var pageTeamMemberNo = $(".pageTeamMemberNo").val();
	    
	    $(".rBox_Leftnavi_left").click(function(){
	    	if($(".navi_checkbox").is(":checked")){
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=1&checkValue=2&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			} else {
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=1&checkValue=1&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			}
	    });
	    
		$(".rBox_Leftnavi_middle").click(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=2&checkValue=2&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			} else {
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=2&checkValue=1&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			}
		 });
		
		$(".rBox_Leftnavi_right").click(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=3&checkValue=2&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			} else {
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=3&checkValue=1&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			}
		 });
		$(".rBox_Leftnavi_first").click(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=4&checkValue=2&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			} else {
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=4&checkValue=1&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			}
		 });
		
		
		$(".navi_checkbox").change(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=4&checkValue=2&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			} else {
				location.href="/enterTaskMSelect.do?reqPage=1&viewValue=4&checkValue=1&projectNo="+pageProjectNo+"&teamMemberNo="+pageTeamMemberNo;
			}
		});
		
		if(checkValue == 1){
	    	$(".navi_checkbox").prop("checked", false);
	    	if(viewValue == 1){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "1"); 
		        $(".rBox_Leftnavi_first").css("opacity", "0.5"); 
	    	}else if(viewValue == 2){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "1");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
		        $(".rBox_Leftnavi_first").css("opacity", "0.5"); 
	    	}else if(viewValue == 3){
	    		$(".rBox_Leftnavi_right").css("opacity", "1");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
		        $(".rBox_Leftnavi_first").css("opacity", "0.5"); 
	    	}
	    	else if(viewValue == 4){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
		        $(".rBox_Leftnavi_first").css("opacity", "1"); 
	    	}
	    } else if(checkValue == 2){
	    	$(".navi_checkbox").prop("checked", true);
	    	if(viewValue == 1){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "1"); 
		        $(".rBox_Leftnavi_first").css("opacity", "0.5");
	    	}else if(viewValue == 2){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "1");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
		        $(".rBox_Leftnavi_first").css("opacity", "0.5");
	    	}else if(viewValue == 3){
	    		$(".rBox_Leftnavi_right").css("opacity", "1");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5");
		        $(".rBox_Leftnavi_first").css("opacity", "0.5");
	    	}else if(viewValue == 4){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
	    		$(".rBox_Leftnavi_middle").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
		        $(".rBox_Leftnavi_first").css("opacity", "1"); 
	    	}
	    }
		
		$("#taskStartDate").change(function(){
            var startReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
            var startValue = $("#taskStartDate").val();
            if(startReg.test(startValue)){
                $("#dateChk").text("정상입니다.");
                $("#dateChk").css("color", "blue");
                result = true;
            }else {
                $("#dateChk").text("일자는 하이픈(-) 포함 10자리로 기입해주시기 바랍니다.(YYYY-MM-DD)");
                $("#dateChk").css("color", "red");
                result = false;
            }
        });
		
		$(".addClick").click(function(){
			$("input[name=issueTitle]").val('');
			$("#taskStartDate").val('');
		});
		
		$(".modalIssueText").click(function(){
			$(this).next().slideToggle("slow");
		});
		
		$("button[name=cancelBtn1]").click(function(){
			$(this).parent().parent().parent().hide();
		});
		
		$(".modalLinkText").click(function(){
			$(this).next().slideToggle("slow");
		});
		
		$("button[name=cancelBtn2]").click(function(){
			$(this).parent().parent().parent().hide();
		});
		
		$("button[name=modalUpdateBtn]").click(function(){
			$(this).parent().hide();
			$(this).parent().prev().show();
			$(this).parent().prev().prev().find("div.viewContent").hide();
			$(this).parent().prev().prev().find("div.modalcontentBox").show();
		});
		$("button[name=cancelBtn3]").click(function(){
			$(this).parent().hide();
			$(this).parent().next().show();
			$(this).parent().prev().find("div.viewContent").show();
			$(this).parent().prev().find("div.modalcontentBox").hide();
		});
		
		var clickValue;
		$(".modalInModal").click(function(){
			clickValue = 1;
		});
		
		$(".modal").on("hidden.bs.modal", function(){
			if( clickValue != 1){
				location.reload();
			} else {
				clickValue = 0;
			}
	    });
		
		
		$("button[name=connectIssueBtn]").click(function(){
			var connectIssue = $(this).parent().prev().find("select.form-select").val();
			var taskNo = $(this).prev().val();
			var projectNo = $(".ajaxProjectNo").val();
			$.ajax({
				url : "/connectIssue.do",
				type : "post",
				data : {connectIssue : connectIssue, taskNo : taskNo},
				success : function(data){
					if(data =='-1'){
						swal({
		          			   title: "이슈연결에 실패 했습니다.",
		          			   icon: "warning", //"info,success,warning,error" 중 택1
		          			   button: "돌아가기"
		          		});
					}else{
						swal({
		          			   title: "이슈연결에 성공 했습니다.",
		          			   icon: "success", //"info,success,warning,error" 중 택1
		          			   button: "확인"
		          		});
						/* location.href="/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1"; */
						$('#'+data).modal('hide');
					}
				}
			});
		});
		
		
    });
	
	function checkValue(){
        if(!(result)){
             alert("입력값을 확인하세요!");
             return false;
         }
    }
	
</script>

</head>
<body>
	<div class="container" id="projectContainer">
	
		<c:choose>
           	<c:when test="${empty viewValue }">
           		<input type="hidden" class="checkCssKeeper" value="4">
           		<input type="hidden" class="clickCssKeeper" value="4">
           	</c:when>
           	<c:otherwise>
           		<input type="hidden" class="checkCssKeeper" value="${checkValue }">
           		<input type="hidden" class="clickCssKeeper" value="${viewValue }">
           	</c:otherwise>
        </c:choose>
        
        <input type="hidden" class="pageProjectNo" value="${projectNo}">
        <c:forEach items="${ptm}" var="ptm">
        	<c:if test="${ptm.memberNo eq sessionScope.m.memberNo}">
        		<input type="hidden" class="pageTeamMemberNo" value="${ptm.teamMemberNo}">
        	</c:if>
        </c:forEach>
        <input type="hidden" class="pageMemberNo" value="${sessionScope.m.memberNo}">
		
        <div class="main">
        <div class="main-left-box">
                <h2>${ptmGet0.projectName}</h2>
                <ul>
                    <li class="flexLi">
                        <a href="/enterMyProject.do?projectNo=${projectNo}&memberNo=${sessionScope.m.memberNo}" class="subNaviAtag" ><img src="/resources/img/recruitTeamProject/recruitPage/powerOn.png" class="subNaviImg"><span style="cursor: pointer;">프로젝트 개요</span></a>
                    </li>
                    <li class="flexCLi" style="border-bottom: 3px dashed #90d1b4; cursor: pointer;">
	                    <div class="flexSuperSubBox">
	                            <img src="/resources/img/recruitTeamProject/common/makefg (8).png" class="subNaviImg" style="margin-left: 5px;"><span style="font-weight: 900;">과업 관리</span>
	                    </div>
	                    <ul class="s-sub-menu">
                            <li><a href="/enterProjectTaskM.do?projectNo=${projectNo}&reqPage=1"><span style="cursor: pointer; color: #90d1b4; font-weight: 900;">Meeting</span></a></li>
                            <li><a href="/enterProjectTaskT.do?projectNo=${projectNo}&reqPage=1"><span style="cursor: pointer;">Task</span></a></li>
                            <li><a href="/enterProjectTaskB.do?projectNo=${projectNo}&reqPage=1"><span style="cursor: pointer;">Bug</span></a></li>
                            <li><a href="/enterProjectTaskH.do?projectNo=${projectNo}&reqPage=1"><span style="cursor: pointer;">Hold</span></a></li>
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
                    <p class="titleText">과업 관리</p>
                </div>
                <div class="titleLine"></div>
                <div class="rBox_navi">
                    <div id="left_site">
                    	<div class="rBox_Leftnavi_first">
                    		<img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/all.png">
                            <span class="navi_left_font">전체보기</span>
                        </div>
                    	<div class="rBox_Leftnavi_left">
                    		<img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/to-do-list.png">
                            <span class="navi_left_font">할 일</span>
                        </div>
                        <div class="rBox_Leftnavi_middle">
                        	<img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/finish-line.png">
                            <span class="navi_left_font">완료</span>
                        </div>
                        <div class="rBox_Leftnavi_right">
                        	<img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/process.png">
                            <span class="navi_left_font">진행 중</span>
                        </div>
                    </div>
                    <div id="right_site">
                        <input type="checkbox" class="navi_checkbox">
                        <span class="navi_right_font">나의 담당 과업</span>
                    </div>
                </div>
                <div class="taskBox">
                    <div class="taskWrap">
                        <p class="taskContentTitle">Meeting</p>
                        <div class="titleLine" style="width: 100%; margin-top: 10px;"></div>
                        <c:forEach items="${ptk}" var="ptk">
                        <div class="taskMeeting">
	                        <a data-bs-toggle="modal" href="#${ptk.taskNo}" style="text-decoration: none;display: block;width:100%;" class="modalClassBtn">
	                                <div class="leftTaskSite">
	                                    <p class="taskNo">${ptk.taskNo}</p>
	                                    <p class="taskTitle">${ptk.taskTitle}</p>
	                                </div>
	                                <div class="rightTaskSite" style="width:330px; display: flex;">
	                                	<c:choose>
	                                		<c:when test="${ptk.priority eq 1}">
			                                    <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
	                                		</c:when>
	                                		<c:when test="${ptk.priority eq 2}">
			                                    <span class="badge rounded-pill bg-primary" id="mediumLabel">medium</span>
	                                		</c:when>
	                                		<c:when test="${ptk.priority eq 3}">
			                                    <span class="badge rounded-pill bg-primary" id="urgencyLabel">urgency</span>
	                                		</c:when>
	                                	</c:choose>
	                                	<c:choose>
	                                		<c:when test="${ptk.processSort eq 1}">
	                                			<span class="badge rounded-pill bg-primary" id="todoLabel">해야 할 일</span>
	                                		</c:when>
	                                		<c:when test="${ptk.processSort eq 2}">
	                                			<span class="badge rounded-pill bg-primary" id="ongoingLabel">진행 중</span>
	                                		</c:when>
	                                		<c:when test="${ptk.processSort eq 3}">
	                                			<span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
	                                		</c:when>
	                                	</c:choose>
	                                	<c:forEach items="${ptm }" var="ptm">
		                                	<c:if test="${ptm.memberNo eq ptk.memberNo}">
		                                		<c:choose>
			                                		<c:when test="${ptm.memberImg eq null}">
			                                			<img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 9px; margin-left: 5px;">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="/resources/upload/member/${ptm.memberImg }" style="width: 40px; height: 40px; position: relative; bottom: 9px; margin-left: 5px;">
			                                		</c:otherwise>
			                                	</c:choose>
		                                	</c:if> 
	                                	</c:forEach>
	                                    <a href="/deleteTask.do?taskNo=${ptk.taskNo}&projectNo=${projectNo}&taskType=1" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 3px;"></a>
	                                </div>
	                        	</a>
	                        </div>
                        </c:forEach>
                        <div>
                            <a data-bs-toggle="modal" href="#addTaskIssue" style="text-decoration: none;" class="addClick"><p class="addIssue" style="margin-left: 35px;">+ 이슈 만들기</p></a>
                        </div>
                        <div id = "pageNavi">${pageNavi }</div>
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
                        	<input type="hidden" name="projectNo" value="${projectNo}">
                        	<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">추가</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <c:forEach items="${ptk}" var="ptk">
    	<div class="modal fade" id="${ptk.taskNo }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="max-width: 1200px; width: 1200px; display: table;">
            <div class="modal-content">
                <div class="modal-body" >
                    <form action="/updateIssue.do" method="post">
                    	<input type="hidden" name="taskType" value=1>
                    	<input type="hidden" name="taskNo" value="${ptk.taskNo }">
                    	<input type="hidden" name="projectNo" value=${ptk.projectNo }>
                        <div class="modalTitleFlexBox">
                            <div class="modalLeftSite" style="margin-top: 30px; margin-left: 20px;">
                                <p class="taskSubTitle">과업관리 / ${ptk.taskNo}</p>
                                <p style="font-size: 25px; font-weight: bold; color: #90d1b4; ">${ptk.taskTitle}</p>
                            </div>
                            <div class="modalRightSite" style="margin-right: 30px; margin-top: 20px;">
                                <a href="Javascript Void:(0);" data-bs-dismiss="modal" style="text-decoration: none;"><p style="font-size: 30px;">X</p></a>
                            </div>
                        </div>
                        
                        <div class="modalFlexBox">
                            <div class="form-group" style="margin-bottom: 15px; width: 700px;">
                                <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4; ">설명</label>
                                <div class="viewContent">
                                	<c:choose>
										<c:when test="${ptk.taskContent ne null}">
											<div class="card border-success mb-3">
											  <div class="card-body">
											    <p class="card-text">${ptk.taskContent}</p>
											  </div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="card border-success mb-3" style="height: 400px;">
											  <div class="card-body">
											    <p class="card-text"><p class="text-info">아래 글 입력 버튼을 눌러 글을 작성해주세요.</p></p>
											  </div>
											</div>
										</c:otherwise>                                	
                                	</c:choose>
                                </div>
                                <div class="modalcontentBox" style="display: none;">
                                	<textarea class="form-control" id="summernote" rows="8" name="modalcontent" >${ptk.taskContent}</textarea>
                                </div>
                            </div>
                            <div class="taskInfoBox">
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">담당자</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectCharUser" >
                                        		<option>${ptk.memberId}</option>
                                        	<c:forEach items="${ptm}" var="ptm">
                                        		<c:if test="${ptk.memberId ne ptm.memberId}">
                                        			<option>${ptm.memberId}</option>
                                        		</c:if>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">우선 순위</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectPriority">
                                        	<c:choose>
                                        		<c:when test="${ptk.priority eq 1}">
                                        			<option value=1>low</option>
		                                            <option value=3>urgency</option>
		                                            <option value=2>medium</option>
                                        		</c:when>
                                        		<c:when test="${ptk.priority eq 2}">
                                        			<option value=2>medium</option>
		                                            <option value=1>low</option>
		                                            <option value=3>urgency</option>
                                        		</c:when>
                                        		<c:when test="${ptk.priority eq 3}">
                                        			<option value=3>urgency</option>
		                                            <option value=2>medium</option>
		                                            <option value=1>low</option>
                                        		</c:when>
                                        	</c:choose>
                                        </select>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">진행분류</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectProcessSort">
                                        	<c:choose>
                                        		<c:when test="${ptk.processSort eq 1}">
                                        			<option value=1>해야 할 일</option>
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
		                                            <option value=4>보류</option>
                                        		</c:when>
                                        		<c:when test="${ptk.processSort eq 2}">
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
		                                            <option value=4>보류</option>
                                        		</c:when>
                                        		<c:when test="${ptk.processSort eq 3}">
		                                            <option value=3>완료</option>
                                        		</c:when>
                                        		<c:when test="${ptk.processSort eq 4}">
		                                            <option value=4>보류</option>
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
                                        		</c:when>
                                        	</c:choose>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: left; padding-top: 5px; margin-left: 20px; display: none;" >
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px">저장</button>
                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn3">취소</button>
                        </div>
                        <div style="text-align: left; padding-top: 5px; margin-left: 20px;">
                        	<c:choose>
                        		<c:when test="${ptk.taskContent ne null}">
                        			<button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px" name="modalUpdateBtn">수정</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px" name="modalUpdateBtn">글 입력</button>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </form>
                    <div class="titleLine" style="width: 100%; margin-top: 20px;"></div>
                    <div class="bottomLinkBox" style="margin-top: 45px;">
                        <p class="modalBottomTitle">참고 이슈</p>
                        <div class="issueForm">
                        <c:forEach items="${allPtk}" var="allP">
                            <c:if test="${allP.taskNo eq ptk.connectIssue}">
                            	<a data-bs-toggle="modal" href="#${allP.taskNo}connect" class="modalInModal" style="text-decoration: none;">
	                                <div class="taskMeeting" style="border: 1px solid #90d1b4; width: 800px;">
			                                   <div class="leftTaskSite">
			                              			<p class="taskNo">${allP.taskNo}</p>
			                                      	<p class="taskTitle">${allP.taskTitle}</p>
			                                   </div>
			                                    <div class="rightTaskSite">
			                                    	<c:choose>
				                                		<c:when test="${allP.priority eq 1}">
						                                    <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
				                                		</c:when>
				                                		<c:when test="${allP.priority eq 2}">
						                                    <span class="badge rounded-pill bg-primary" id="mediumLabel">medium</span>
				                                		</c:when>
				                                		<c:when test="${allP.priority eq 3}">
						                                    <span class="badge rounded-pill bg-primary" id="urgencyLabel">urgency</span>
				                                		</c:when>
				                                	</c:choose>
				                                	<c:choose>
				                                		<c:when test="${allP.processSort eq 1}">
				                                			<span class="badge rounded-pill bg-primary" id="todoLabel">해야 할 일</span>
				                                		</c:when>
				                                		<c:when test="${allP.processSort eq 2}">
				                                			<span class="badge rounded-pill bg-primary" id="ongoingLabel">진행 중</span>
				                                		</c:when>
				                                		<c:when test="${allP.processSort eq 3}">
				                                			<span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
				                                		</c:when>
				                                	</c:choose>
				                                	<c:forEach items="${ptm}" var="ptm">
					                                	<c:if test="${ptm.memberNo eq allP.memberNo}">
					                                		<c:choose>
						                                		<c:when test="${ptm.memberImg eq null}">
						                                			<img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
						                                		</c:when>
						                                		<c:otherwise>
						                                			<img src="/resources/upload/member/${ptm.memberImg }" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
						                                		</c:otherwise>
						                                	</c:choose>
					                                	</c:if> 
				                                	</c:forEach>
			                                        <a href="/deleteConnectIssue.do?taskNo=${ptk.taskNo}&projectNo=${projectNo}&taskType=1" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
			                                    </div>
		                                	</div>
	                                	</a>
                               		</c:if>
                               	</c:forEach>
                       		 </div>
                    	</div>
                    <c:if test="${ptk.connectIssue eq null}">
	                    <p class="modalIssueText">+ 이슈 등록하기</p>
	                    <div class="refIssueForm">
	                    <div class="modalLine"></div>
		                    <form action="/connectIssue.do" method="post">
		                        <div class="form-group">
		                            <label for="exampleSelect1" class="form-label mt-4" style="font-weight: bold; color: #90d1b4;">등록할 이슈(최근 15개)</label>
		                            <select class="form-select" id="exampleSelect1" name="connectIssue" style="width: 300px;">
			                            <c:forEach items="${allPtk}" var="allP" end="15">
			                            	<c:if test="${ptk.taskNo ne allP.taskNo }">
			                            		<option value="${allP.taskNo}">${allP.taskNo}<span>&nbsp;&nbsp;${allP.taskTitle}</span></option>
			                            	</c:if>
			                            </c:forEach>
		                            </select>
		                        </div>
		                        <div style="text-align: left; padding-top: 10px;">
		                        	<input type="hidden" name="taskNo" value="${ptk.taskNo}">
		                            <button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px;" name="connectIssueBtn">연결</button>
		                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn1">취소</button>
		                        </div>
		                    </form>
	                    </div>
                    </c:if>
                    <div class="bottomLinkBox" style="margin-bottom: 50px; margin-top: 30px;">
                        <p class="modalBottomTitle">참고 링크</p>
                        <div class="issueForm">
                        <c:forEach items="${tscList}" var="tsc">
                        	<c:if test="${tsc.taskNo eq ptk.taskNo}">
                        		<a href="${tsc.tsLinkAddr}" style="display: block; text-decoration: none;" target="_blank">
		                            <div class="taskMeeting" style="border: 1px solid #90d1b4;">
		                                <div class="leftTaskSite">
		                                	<c:choose>
				                    			<c:when test="${tsc.tsLinkName ne null}">
								                    	<p class="taskNo">${tsc.tsLinkName}</p>
								                    	<p class="taskTitle" style="margin-left: 35px;">${tsc.tsLinkAddr}</p>
				                    			</c:when>
				                    			<c:otherwise>
					                    				<p class="taskNo">참고링크</p>
					                    				<p class="taskTitle" style="margin-left: 35px;">${tsc.tsLinkAddr}</p>
				                    			</c:otherwise>
				                    		</c:choose>
		                                </div>
	                                </a>
	                                <div class="rightTaskSite">
	                                    <a href="/deleteConnectLink.do?taskShortcutNo=${tsc.taskShortcutNo}&projectNo=${projectNo}&taskType=1" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
	                                </div>
	                            </div>
                        	</c:if>
                        </c:forEach>
                        </div>
                        <c:if test="${fn:length(tscList) ne 3}">
	                      	<p class="modalLinkText">+ 링크 등록하기</p>
	                      	<div class="refLinkForm">
	                      		<div class="modalLine"></div>
	                      		<form action="/connectLink.do" method="post">
			                        <div class="form-group" style="margin-bottom: 15px;">
			                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">바로가기 이름</label>
			                            <input type="text" class="form-control" placeholder="바로가기 이름을 입력해주세요" id="inputDefault" name="shortcutName" maxlength="10">
			                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">웹 주소</label>
			                            <input type="text" class="form-control" placeholder="웹 주소를 넣어주세요" id="inputDefault" name="shortcutAddr" required="required">
			                            <span style="color: red; font-size: 14px;">주의! 직접 입력하는 경우, 주소앞에 <b>http://</b> 또는 <b>https://</b> 를 붙여주세요!</span>
			                        </div>
			                        <div style="text-align: left; padding-top: 10px;">
			                        	<input type="hidden" name="taskNo" value="${ptk.taskNo}">
			                        	<input type="hidden" name="projectNo" value="${projectNo}">
			                        	<input type="hidden" name="taskType" value=1>
			                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
			                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn2">취소</button>
			                        </div>
			                    </form>
	                      	</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>

    <div class="modal fade" id="addTaskIssue" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/addIssue.do" method="post" onsubmit="return checkValue();">
                        <p style="font-size: 25px; font-weight: bold; color: #90d1b4; margin-bottom: 10px;" name="">이슈 만들기</p>
                        <div class="form-group" style="margin-bottom: 15px;">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">제목 입력</label>
                            <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault" name="issueTitle"  maxlength="30" required="required">
                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">과업 시작 일자</label>
                            <input type="text" class="form-control" placeholder="시작일을 입력해주세요(YYYY-MM-DD)" id="taskStartDate" name="taskStartDate" maxlength="10" required="required">
                            <span id="dateChk" style="font-size: 15px;"></span>
                        </div>
                        <div style="text-align: right; padding-top: 10px;">
                        	<input type="hidden" name="taskType" value=1> 
                        	<input type="hidden" name="projectNo" value="${projectNo}"> 
                        	<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}"> 
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;" onclick="return checkValue();">생성</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <c:forEach items="${allPtk}" var="allPtk">
    	<div class="modal fade" id="${allPtk.taskNo}connect" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="max-width: 1200px; width: 1200px; display: table;">
            <div class="modal-content">
                <div class="modal-body" >
                    <form action="/updateIssue.do" method="post">
                   		<c:if test="${fn:contains(allPtk.taskNo, 'M')}">
                   			<input type="hidden" name="taskType" value=1>
                   		</c:if>
                   		<c:if test="${fn:contains(allPtk.taskNo, 'T')}">
                   			<input type="hidden" name="taskType" value=2>
                   		</c:if>
                   		<c:if test="${fn:contains(allPtk.taskNo, 'B')}">
                   			<input type="hidden" name="taskType" value=3>
                   		</c:if>
                    	<input type="hidden" name="taskNo" value="${allPtk.taskNo }">
                    	<input type="hidden" name="projectNo" value=${allPtk.projectNo }>
                        <div class="modalTitleFlexBox">
                            <div class="modalLeftSite" style="margin-top: 30px; margin-left: 20px;">
                                <p class="taskSubTitle">과업관리 / ${allPtk.taskNo}</p>
                                <p style="font-size: 25px; font-weight: bold; color: #90d1b4; ">${allPtk.taskTitle}</p>
                            </div>
                            <div class="modalRightSite" style="margin-right: 30px; margin-top: 20px;">
                                <a href="Javascript Void:(0);" data-bs-dismiss="modal" style="text-decoration: none;"><p style="font-size: 30px;">X</p></a>
                            </div>
                        </div>
                        
                        <div class="modalFlexBox">
                            <div class="form-group" style="margin-bottom: 15px; width: 700px;">
                                <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4; ">설명</label>
                                <div class="viewContent">
                                	<c:choose>
										<c:when test="${allPtk.taskContent ne null}">
											<div class="card border-success mb-3">
											  <div class="card-body">
											    <p class="card-text">${allPtk.taskContent}</p>
											  </div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="card border-success mb-3" style="height: 400px;">
											  <div class="card-body">
											    <p class="card-text"><p class="text-info">아래 글 입력 버튼을 눌러 글을 작성해주세요.</p></p>
											  </div>
											</div>
										</c:otherwise>                                	
                                	</c:choose>
                                </div>
                                <div class="modalcontentBox" style="display: none;">
                                	<textarea class="form-control" id="summernote" rows="8" name="modalcontent" >${allPtk.taskContent}</textarea>
                                </div>
                            </div>
                            <div class="taskInfoBox">
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">담당자</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectCharUser" >
                                        		<option>${allPtk.memberId}</option>
                                        	<c:forEach items="${ptm}" var="ptm">
                                        		<c:if test="${allPtk.memberId ne ptm.memberId}">
                                        			<option>${ptm.memberId}</option>
                                        		</c:if>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">우선 순위</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectPriority">
                                        	<c:choose>
                                        		<c:when test="${allPtk.priority eq 1}">
                                        			<option value=1>low</option>
		                                            <option value=3>urgency</option>
		                                            <option value=2>medium</option>
                                        		</c:when>
                                        		<c:when test="${allPtk.priority eq 2}">
                                        			<option value=2>medium</option>
		                                            <option value=1>low</option>
		                                            <option value=3>urgency</option>
                                        		</c:when>
                                        		<c:when test="${allPtk.priority eq 3}">
                                        			<option value=3>urgency</option>
		                                            <option value=2>medium</option>
		                                            <option value=1>low</option>
                                        		</c:when>
                                        	</c:choose>
                                        </select>
                                    </div>
                                </div>
                                <div class="infoFlexArea">
                                    <div>
                                        <p class="taskInfoText">진행분류</p>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-select" id="exampleSelect1" name="selectProcessSort">
                                        	<c:choose>
                                        		<c:when test="${allPtk.processSort eq 1}">
                                        			<option value=1>해야 할 일</option>
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
		                                            <option value=4>보류</option>
                                        		</c:when>
                                        		<c:when test="${allPtk.processSort eq 2}">
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
		                                            <option value=4>보류</option>
                                        		</c:when>
                                        		<c:when test="${allPtk.processSort eq 3}">
		                                            <option value=3>완료</option>
                                        		</c:when>
                                        		<c:when test="${allPtk.processSort eq 4}">
		                                            <option value=4>보류</option>
		                                            <option value=2>진행 중</option>
		                                            <option value=3>완료</option>
                                        		</c:when>
                                        	</c:choose>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: left; padding-top: 5px; margin-left: 20px; display: none;" >
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px">저장</button>
                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn3">취소</button>
                        </div>
                        <div style="text-align: left; padding-top: 5px; margin-left: 20px;">
                        	<c:choose>
                        		<c:when test="${allPtk.taskContent ne null}">
                        			<button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px" name="modalUpdateBtn">수정</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px; margin-right: 10px" name="modalUpdateBtn">글 입력</button>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </form>
                    <div class="titleLine" style="width: 100%; margin-top: 20px;"></div>
                    <div class="bottomLinkBox" style="margin-top: 45px;">
                        <p class="modalBottomTitle">참고 이슈</p>
                        <div class="issueForm">
                        <c:forEach items="${allPtkk}" var="allP">
                            <c:if test="${allP.taskNo eq allPtk.connectIssue}">
                            	<a data-bs-toggle="modal" href="#${allP.taskNo}connect" class="modalInModal" style="text-decoration: none;">
	                                <div class="taskMeeting" style="border: 1px solid #90d1b4; width: 800px;">
			                                   <div class="leftTaskSite">
			                              			<p class="taskNo">${allP.taskNo}</p>
			                                      	<p class="taskTitle">${allP.taskTitle}</p>
			                                   </div>
			                                    <div class="rightTaskSite">
			                                    	<c:choose>
				                                		<c:when test="${allP.priority eq 1}">
						                                    <span class="badge rounded-pill bg-primary" id="lowLabel">low</span>
				                                		</c:when>
				                                		<c:when test="${allP.priority eq 2}">
						                                    <span class="badge rounded-pill bg-primary" id="mediumLabel">medium</span>
				                                		</c:when>
				                                		<c:when test="${allP.priority eq 3}">
						                                    <span class="badge rounded-pill bg-primary" id="urgencyLabel">urgency</span>
				                                		</c:when>
				                                	</c:choose>
				                                	<c:choose>
				                                		<c:when test="${allP.processSort eq 1}">
				                                			<span class="badge rounded-pill bg-primary" id="todoLabel">해야 할 일</span>
				                                		</c:when>
				                                		<c:when test="${allP.processSort eq 2}">
				                                			<span class="badge rounded-pill bg-primary" id="ongoingLabel">진행 중</span>
				                                		</c:when>
				                                		<c:when test="${allP.processSort eq 3}">
				                                			<span class="badge rounded-pill bg-primary" id="completeLabel">완료</span>
				                                		</c:when>
				                                	</c:choose>
				                                	<c:forEach items="${ptm}" var="ptm">
					                                	<c:if test="${ptm.memberNo eq allP.memberNo}">
					                                		<c:choose>
						                                		<c:when test="${ptm.memberImg eq null}">
						                                			<img src="/resources/img/recruitTeamProject/common/user.png" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
						                                		</c:when>
						                                		<c:otherwise>
						                                			<img src="/resources/upload/member/${ptm.memberImg }" style="width: 40px; height: 40px; position: relative; bottom: 7px;">
						                                		</c:otherwise>
						                                	</c:choose>
					                                	</c:if> 
				                                	</c:forEach>
						                    		<c:if test="${fn:contains(allPtk.taskNo, 'M')}">
		                                        		<a href="/deleteConnectIssue.do?taskNo=${allPtk.taskNo}&projectNo=${projectNo}&taskType=1" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
						                    		</c:if>
						                    		<c:if test="${fn:contains(allPtk.taskNo, 'T')}">
						                    			<a href="/deleteConnectIssue.do?taskNo=${allPtk.taskNo}&projectNo=${projectNo}&taskType=2" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
						                    		</c:if>
						                    		<c:if test="${fn:contains(allPtk.taskNo, 'B')}">
						                    			<a href="/deleteConnectIssue.do?taskNo=${allPtk.taskNo}&projectNo=${projectNo}&taskType=3" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
						                    		</c:if>
			                                    </div>
		                                	</div>
	                                	</a>
                               		</c:if>
                               	</c:forEach>
                       		 </div>
                    	</div>
                    <c:if test="${allPtk.connectIssue eq null}">
	                    <p class="modalIssueText">+ 이슈 등록하기</p>
	                    <div class="refIssueForm">
	                    <div class="modalLine"></div>
		                    <form action="/connectIssue.do" method="post">
		                        <div class="form-group">
		                            <label for="exampleSelect1" class="form-label mt-4" style="font-weight: bold; color: #90d1b4;">등록할 이슈(최근 15개)</label>
		                            <select class="form-select" id="exampleSelect1" name="connectIssue" style="width: 300px;">
			                            <c:forEach items="${allPtkk}" var="allP" end="15">
			                            	<c:if test="${allPtk.taskNo ne allP.taskNo }">
			                            		<option value="${allP.taskNo}">${allP.taskNo}<span>&nbsp;&nbsp;${allP.taskTitle}</span></option>
			                            	</c:if>
			                            </c:forEach>
		                            </select>
		                        </div>
		                        <div style="text-align: left; padding-top: 10px;">
		                        	<input type="hidden" name="taskNo" value="${allPtk.taskNo}">
		                            <button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px;" name="connectIssueBtn">연결</button>
		                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn1">취소</button>
		                        </div>
		                    </form>
	                    </div>
                    </c:if>
                    <div class="bottomLinkBox" style="margin-bottom: 50px; margin-top: 30px;">
                        <p class="modalBottomTitle">참고 링크</p>
                        <div class="issueForm">
                        <c:forEach items="${tscList}" var="tsc">
                        	<c:if test="${tsc.taskNo eq allPtk.taskNo}">
                        		<a href="${tsc.tsLinkAddr}" style="display: block; text-decoration: none;" target="_blank">
		                            <div class="taskMeeting" style="border: 1px solid #90d1b4;">
		                                <div class="leftTaskSite">
		                                	<c:choose>
				                    			<c:when test="${tsc.tsLinkName ne null}">
								                    	<p class="taskNo">${tsc.tsLinkName}</p> 
								                    	<p class="taskTitle" style="margin-left: 35px;">${tsc.tsLinkAddr}</p>
				                    			</c:when>
				                    			<c:otherwise>
					                    				<p class="taskNo">참고링크</p>
					                    				<p class="taskTitle" style="margin-left: 35px;">${tsc.tsLinkAddr}</p>
				                    			</c:otherwise>
				                    		</c:choose>
		                                </div>
	                                </a>
	                                <div class="rightTaskSite">
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'M')}">
			                    			<a href="/deleteConnectLink.do?taskShortcutNo=${tsc.taskShortcutNo}&projectNo=${projectNo}&taskType=1" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
			                    		</c:if>
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'T')}">
			                    			<a href="/deleteConnectLink.do?taskShortcutNo=${tsc.taskShortcutNo}&projectNo=${projectNo}&taskType=2" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
			                    		</c:if>
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'B')}">
			                    			<a href="/deleteConnectLink.do?taskShortcutNo=${tsc.taskShortcutNo}&projectNo=${projectNo}&taskType=3" class="hoverImg"><img src="/resources/img/recruitTeamProject/common/delete.png" style="width: 30px; height: 30px; position: relative; bottom: 7px;"></a>
			                    		</c:if>
	                                </div>
	                            </div>
                        	</c:if>
                        </c:forEach>
                        </div>
                        <c:if test="${fn:length(tscList) ne 3}">
	                      	<p class="modalLinkText">+ 링크 등록하기</p>
	                      	<div class="refLinkForm">
	                      		<div class="modalLine"></div>
	                      		<form action="/connectLink.do" method="post">
			                        <div class="form-group" style="margin-bottom: 15px;">
			                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">바로가기 이름</label>
			                            <input type="text" class="form-control" placeholder="바로가기 이름을 입력해주세요" id="inputDefault" name="shortcutName" maxlength="10">
			                            <label class="col-form-label mt-4" for="inputDefault" style="font-weight: bold; color: #90d1b4;">웹 주소</label>
			                            <input type="text" class="form-control" placeholder="웹 주소를 넣어주세요" id="inputDefault" name="shortcutAddr" required="required">
			                            <span style="color: red; font-size: 14px;">주의! 직접 입력하는 경우, 주소앞에 <b>http://</b> 또는 <b>https://</b> 를 붙여주세요!</span>
			                        </div>
			                        <div style="text-align: left; padding-top: 10px;">
			                        	<input type="hidden" name="taskNo" value="${allPtk.taskNo}">
			                        	<input type="hidden" name="projectNo" value="${projectNo}">
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'M')}">
			                    			<input type="hidden" name="taskType" value=1>
			                    		</c:if>
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'T')}">
			                    			<input type="hidden" name="taskType" value=2>
			                    		</c:if>
			                    		<c:if test="${fn:contains(allPtk.taskNo, 'B')}">
			                    			<input type="hidden" name="taskType" value=3>
			                    		</c:if>
			                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">생성</button>
			                            <button type="button" class="btn btn-secondary" style="width: 100px;" name="cancelBtn2">취소</button>
			                        </div>
			                    </form>
	                      	</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    
    
    
    <script>
	$(function(){
		 
		$("#summernote").summernote({
			height: 300,
			minHeight: 300,
			maxHeight: 300,
			lang : "ko-KR",
			focus: false,
			placeholder: '자세한 설명을 입력해주세요.',
			toolbar:[ 
						['fontname', ['fontname']],
						['fontsize', ['fontsize']], 
						['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], 
						['color', ['forecolor','color']], 
						['table', ['table']], 
						['para', ['ul', 'ol', 'paragraph']], 
						['height', ['height']], 
						['insert',['picture','link']], 
						['view', ['fullscreen', 'codeview', 'help']] 
					], 
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'], 
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks:{
				onImageUpload : function(files){
 					uploadImage(files[0], this);
 				}
			}
		});
	});
	
	function uploadImage(file, editor){
		data = new FormData();
		data.append("file",file);
		var fileData = $("input[name=files]").val();
		$.ajax({
			url : "/rUploadImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){
				$(editor).summernote("insertImage",data);
				
			}
		});
	}
	
	
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
</body>
</html>