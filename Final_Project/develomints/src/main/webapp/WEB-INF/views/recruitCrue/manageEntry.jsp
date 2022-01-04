<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/manageEntry.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Manage Entry</title>
</head>
<script>
    $(function(){
    	var memberNo = $(".urlMemberNo").val();
    	var projectNo = $(".urlProjectNo").val();
    	var viewValue = $(".viewValue").val();
    	$(".return_img").click(function(){
    		location.href ="/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo;
		});
    	
        $(".rBox_Leftnavi_left").click(function(){
            /* $(".rBox_Leftnavi_right").css("opacity", "0.5");
            $(".rBox_Leftnavi_left").css("opacity", "1"); */
            var url = "/manageEntry.do?reqPage=1&viewValue=1&memberNo="+memberNo+"&projectNo="+projectNo;
            location.href = url;
        });
        $(".rBox_Leftnavi_right").click(function(){
            /* $(".rBox_Leftnavi_right").css("opacity", "1");
            $(".rBox_Leftnavi_left").css("opacity", "0.5"); */
            var url = "/manageEntry.do?reqPage=1&viewValue=2&memberNo="+memberNo+"&projectNo="+projectNo;
            location.href = url;
        });
        
        if(viewValue == 1){
        	$(".rBox_Leftnavi_right").css("opacity", "0.5");
            $(".rBox_Leftnavi_left").css("opacity", "1");
        }else {
        	$(".rBox_Leftnavi_right").css("opacity", "1");
            $(".rBox_Leftnavi_left").css("opacity", "0.5");
        }
        
    });
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
		<input type="hidden" class="urlMemberNo" value="${memberNo }">
		<input type="hidden" class="urlProjectNo" value="${projectNo }">
		<input type="hidden" class="viewValue" value="${viewValue }">
		<div class="main">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_wrap">
                <div class="titleFlexBox">
                    <img class="iconImg" src="/resources/img/recruitTeamProject/common/recruitment.png">
                    <p class="titleText">지원자 관리</p>
                </div>
                <div class="Line"></div>
                <div class="recruitBox">
                    <div class="rBox_navi">
                        <div id="left_site">
                            <div class="rBox_Leftnavi_left">
                                <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/newList.png">
                                <span class="navi_left_font">최신</span>
                            </div>
                            <div class="rBox_Leftnavi_right">
                                <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/top-three.png">
                                <span class="navi_left_font">랭크 순으로</span>
                            </div>
                        </div>
                        <div id="right_site">
                        <c:choose>
                        	<c:when test="${availableNum > 0}">
                        		<a href="/manageFinalEntryFrm.do?memberNo=${memberNo}&projectNo=${projectNo}&viewValue=1"><button type="button" class="btn btn-primary" id="rightSiteBtn">최종선발 대기인원 관리</button></a>
                        	</c:when>
                        	<c:otherwise>
	                            <button type="button" class="btn btn-primary" id="rightSiteBtn" disabled="disabled">최종선발 대기인원 관리</button>
                        	</c:otherwise>
                        </c:choose>
                            <b id="rightFont">선발 가능 인원 : </b><span class="navi_right_font">${availableNum } / 6</span>
                        </div>
                    </div>
                    <div class="rListBox">
                    <c:forEach items="${entryList }" var="el" varStatus="mi">
                    	<c:if test="${el.entryStatus == 1}">
                    		<div class="contentFlexBox">
	                            <div class="imgBox">
	                                <c:choose>
		                                <c:when test="${el.imgPath eq null}">
		                               		<img class="myInfoImg" src="/resources/img/member/user.png">
		                              	</c:when>
		                              	<c:otherwise>
		                               		<img class="myInfoImg" src="/resources/upload/member/${el.imgPath }">
		                               	</c:otherwise>
		                            </c:choose> 
	                            </div>
	                            <a href="/selectOneApplicant.do?projectNo=${projectNo}&memberNo=${memberNo}&entryNo=${el.entryNo}" class="clickRecruitTeamTag">
		                            <div class="contentBox">
		                                <div class="textFlexBox1">
		                                    <div class="textContent">
		                                        <p class="contentText">${el.ambition}</p>
		                                    </div>
		                                    <div class="dateType">
		                                        <b>지원일 : </b><span><b>${el.applyDate}</b></span>
		                                    </div>
		                                </div>
		                                 <div class="textFlexBox2">
				                              <div></div>
				                              <div class="dateType">
				                                   <b>지원자 아이디 : </b><span><b>${el.memberId }</b></span>
				                              </div>
				                        </div>
		                                <div class="bottomFlexBox">
		                                    <div class="mSubImgBox">
		                                    	<c:forEach items="${udLangList }" var="udl"  varStatus="i">
					                                 <c:if test="${el.memberNo eq udl.memberNo && el.projectNo eq udl.projectNo}">
					                                     <img class="langImg" src="${udl.langImg }">
					                                 </c:if>
					                             </c:forEach>
		                                    </div>
		                                    <div class="rankImg">
		                                        <c:choose>
													<c:when test="${el.memberGrade >=1 && el.memberGrade <= 20 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
													</c:when>
													<c:when test="${el.memberGrade >=21 && el.memberGrade <= 40 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
													</c:when>
													<c:when test="${el.memberGrade >=41 && el.memberGrade <= 60 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
													</c:when>
													<c:when test="${el.memberGrade >=61 && el.memberGrade <= 80 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
													</c:when>
													<c:when test="${el.memberGrade >=81 && el.memberGrade <= 110 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
													</c:when>
													<c:when test="${el.memberGrade >=111 && el.memberGrade <= 140 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
													</c:when>
													<c:when test="${el.memberGrade >=141 && el.memberGrade <= 170 }">
														<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
													</c:when>								
												</c:choose>
		                                    </div>
		                                </div>
		                            </div>
	                            </a>
	                        </div>
	                        <div class="btnBox">
	                        	<c:choose>
	                        		<c:when test="${availableNum == 6}">
	                            		<button type="button" class="btn btn-primary" disabled="disabled">선발</button>
	                        			<a href="/deleteTeamMember.do?entryNo=${el.entryNo }&memberNo=${el.memberNo}&projectNo=${el.projectNo}"><button type="button" class="btn btn-secondary">탈락</button></a>
	                        		</c:when>
	                        		<c:otherwise>
	                            		<a href="/selectTeamMember.do?entryNo=${el.entryNo }&memberNo=${el.memberNo}&projectNo=${el.projectNo}"><button type="button" class="btn btn-primary">선발</button></a>
	                        			<a href="/deleteTeamMember.do?entryNo=${el.entryNo }&memberNo=${el.memberNo}&projectNo=${el.projectNo}"><button type="button" class="btn btn-secondary">탈락</button></a>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
                    	</c:if>
                    </c:forEach>
                    <div id = "pageNavi">${pageNavi }</div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>