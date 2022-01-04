<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/manageEntry.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    		location.href ="/manageEntry.do?reqPage=1&viewValue=1&memberNo="+memberNo+"&projectNo="+projectNo;
		});
    	
        $(".rBox_Leftnavi_left").click(function(){
            /* $(".rBox_Leftnavi_right").css("opacity", "0.5");
            $(".rBox_Leftnavi_left").css("opacity", "1"); */
            var url = "/manageFinalEntryFrm.do?viewValue=1&memberNo="+memberNo+"&projectNo="+projectNo;
            location.href = url;
        });
        $(".rBox_Leftnavi_right").click(function(){
            /* $(".rBox_Leftnavi_right").css("opacity", "1");
            $(".rBox_Leftnavi_left").css("opacity", "0.5"); */
            var url = "/manageFinalEntryFrm.do?viewValue=2&memberNo="+memberNo+"&projectNo="+projectNo;
            location.href = url;
        });
        
        if(viewValue == 1){
        	$(".rBox_Leftnavi_right").css("opacity", "0.5");
            $(".rBox_Leftnavi_left").css("opacity", "1");
        }else {
        	$(".rBox_Leftnavi_right").css("opacity", "1");
            $(".rBox_Leftnavi_left").css("opacity", "0.5");
        }
        
        $(".return_img").click(function(){
			history.back();
		});
        
        $(".send").click(function () {
			var sender = $(this).next().val();
			var receiver = $(this).next().next().val();
			var dmContent = $(this).next().next().next().val();
			var loc = $(this).prev().val();

			$.ajax({
				url : "/sendDm.do",
				data : {receiver:receiver,dmContent:dmContent,sender:sender},
				success : function(data) {
					if(data == 1){
						dmCount(receiver);
						swal({
							  title: "지원자 합격 전송완료",
							  icon: "success",
							  button: "닫기",
							}).then(function(){
								window.location = loc;						
							});
					}else{
						console.log("실패");
					}
				}
			});

		});
        
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
                    <p class="titleText">최종 선발 대기자 관리</p>
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
                            <b id="rightFont">선발 가능 인원 : </b><span class="navi_right_font">${availableNum } / 6</span>
                        </div>
                    </div>
                    <div class="rListBox">
                    <c:forEach items="${entryList }" var="el" varStatus="mi">
                    	<c:if test="${el.entryStatus == 3}">
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
								<input type="hidden" value="/selectFinalTeamMember.do?entryNo=${el.entryNo }&memberNo=${el.memberNo}&projectNo=${el.projectNo}&viewValue=${viewValue}&pageTransValue=${availableNum }"><button type="button" class="btn btn-primary send" >최종선발</button>
	                            <input type="hidden" id="sender" value="${sessionScope.m.memberId }">
	                            <input type="hidden" id="receiver" value="${el.memberId }">
	                            <input type="hidden" id="dmContent" value="지원타이틀 : ${el.ambition} - 최종선발 되셨습니다, 지원하신 프로젝트가 모집마감되면 프로젝트가 시작되오니 참고해주시기 바랍니다.">
	                        	<a href="/returnTeamMember.do?entryNo=${el.entryNo }&memberNo=${el.memberNo}&projectNo=${el.projectNo}&viewValue=${viewValue}&pageTransValue=${availableNum }"><button type="button" class="btn btn-secondary" style="margin-right: 40px;">대기인원 전환</button></a>
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