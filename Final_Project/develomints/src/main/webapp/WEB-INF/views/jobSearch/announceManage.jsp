<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.grayBox{
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 20px;
	}
	.resumeHeader{
		overflow: hidden;
	}
	.ceoAnnounce>p{
		color: rgb(78, 205, 196);
		font-weight: 900;
		float: left;
	}
	.writeDate{
		color: rgb(108, 108, 108);
		float: left;
		margin-left: 20px;
		font-size: 12px;
		padding-top: 3px;
		
	}
	.announceTitle{
		margin-left: 30px;
		margin-bottom: 15px;
	}
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.announceInfo1{
		margin-bottom: 0;
	}
	.announceInfo1, .announceInfo2{
		width: 900px;
		overflow: hidden;
	}
	.announceInfo1>li, .announceInfo2>li{
		color: rgb(158, 158, 158);
		list-style: none;
		overflow: hidden;
	}
	.announceInfo1>li>div, .announceInfo2>li>div{
		float: left;
	}
	.announceInfoImg{
		width: 40px;
	}
	.announceInfoImg>img{
		width: 20px;
	}
	.announceInfoData{
		margin-left: 30px;
	}
	.money, .career{
		width: 280px;
		display: inline-block;
	}
	.workForm{
		width: 280px;
		display: inline-block;
		
	}
	.workPlace{
		width: 280px;
		display: inline-block;
	}
	.message{
		float: left;
	}
	.companyMessage{
		margin-left: 30px;
		border: none;
		width: 250px;
		height: 30px;
		border: none;
		border-radius: 20px;
		color: rgb(80, 80, 80);
		font-size: 14px;
		font-weight: 900;
		background-color: white;
		position: relative;
	}
	.requestCount{
		display: inline-block;
		padding: 5px 10px;
		background-color: rgb(78, 205, 196);
		color: white;
		border-radius: 100px;
		font-size: 12px;
		position: relative;
		left: -25px; 
		top: -10px;
	}
	.update{
		overflow: hidden;
		float: right;	
	}
	.updateAnnounce{
		border: none;
		width: 100px;
		height: 45px;
		border: 2px solid rgb(78, 205, 196);
		border-radius: 10px;
		color: rgb(78, 205, 196);
		background-color: white;
	}
	.deleteAnnounce{
		border: none;
		width: 100px;
		height: 45px;
		border: 2px solid orange;
		border-radius: 10px;
		color: orange;
		background-color: white;
	}
	.resumeBtn{
        background-color: rgb(78, 205, 196);
        border: none;
        font-size: 15px;
        font-weight: 900;
        width: 200px;
        height: 50px;
        color: white;
        cursor: pointer;
    }
    .resumeExplain{
    	margin-top: 20px;
    	margin-bottom: 80px;
    }
    .resumeExplain>p{
    	margin-bottom: 0px;
    	color: rgb(108,108,108);
    	font-size: 12px;
    }
    .resumeCount{
    	margin-left: 20px;
    }
    .myResume{
    	margin-top: 30px;
    	margin-left: 15px;
    }
    .register{
    	margin-top: 30px;
    	margin-left: 20px;
    	font-size: 13px;
    	font-weight: 900;
    }

    .register>p{
    	width: 100px;
    	margin: 0;
    }

    
</style>
<script>
	$(function(){
		$(".resumeBtn").click(function(e){
			var count = $(".announceCount").val();
			console.log(count);
			if($(".announceCount").val() >= 1) {
				alert("구인공고는 1개만 작성이 가능합니다.");
				e.preventDefault();
				console.log(count);
			}
			if($(".comNo").val() == 0) {
				alert("회사인증이 완료된 회원만 구인공고 작성이 가능합니다.");
				e.preventDefault();
				console.log(count);
			}
		});
	});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>구인공고 관리</em>				<!-- if 구인글 없을 때 등록된 구인글이 없습니다. -->
		<%-- <c:if test="${empty a }">
			<div class="grayBox">
				<div class="announceHeader">
					<div class="resiterAnnounce">
						<p style="margin-bottom: 10px;">대표이력서</p>
					</div>
					<div class="announceTitle" style="margin-bottom: 30px; margin-left: 30px;">
						<em style="font-size:20px; color: #666;">등록된 구인공고가 없습니다.</em><br>
						<em style="font-size:20px; color: #666;">아래에 버튼을 눌러 구인공고를 작성해주세요.</em>
					</div>
				</div>
			</div>
		</c:if> --%>
	<c:choose>
		<c:when test="${empty a }">
			<div class="grayBox">
				<div class="announceHeader">
					<div class="resiterAnnounce">
						<p style="margin-bottom: 10px;">대표이력서</p>
					</div>
					<div class="announceTitle" style="margin-bottom: 30px; margin-left: 30px;">
						<em style="font-size:20px; color: #666;">등록된 구인공고가 없습니다.</em><br>
						<em style="font-size:20px; color: #666;">아래에 버튼을 눌러 구인공고를 작성해주세요.</em>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="grayBox">
				<div class="resumeHeader">
					<div class="ceoAnnounce">
						<p>등록된 공고</p>
					</div>
					<div class="writeDate">
						<span>${a.writeDate }</span>	
					</div>
				</div>
					<div class="announceTitle">
						<a href="/announceView.do?announceNo=${a.announceNo }&memberNo=${a.memberNo }" style="color: black; text-decoration: none;"><em>${a.announceTitle }</em></a>
					</div>
					<ul class="announceInfo1">
		            	<li class="career">
		            		<div class="announceInfoImg">
		            			<img src="resources/img/resume/career.PNG">
		            		</div>
		            		<div class="announceInfoData">
		            			<c:if test="${a.career eq 1 }">
		            				<span>신입</span>
		            			</c:if>
		            			<c:if test="${a.career eq 2 }">
		            				<span>경력</span>
		            			</c:if>
		            			<c:if test="${a.career eq 3 }">
		            				<span>경력무관</span>
		            			</c:if>
		            		</div>
		            	</li>   
		            	<li class="money">
							<div class="announceInfoImg">
								<img src="resources/img/resume/income.PNG">					
							</div>
							<div class="announceInfoData">
								<span>
								<c:choose>
									<c:when test="${a.money eq 0 }">
										회사내규에 따름
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${a.money}" pattern="#,###"/> &#8361;
									</c:otherwise>
								</c:choose>
								
								</span>	<!-- r.resumeMoney -->
							</div>
						</li>  
					</ul>
					<ul	class="announceInfo2">  
					<li class="workPlace">
							<div class="announceInfoImg">
								<img src="resources/img/resume/workPlaceGray.PNG" style="width:19px; height: 24px;">
							</div>
							<div class="announceInfoData">
								<span>위치 : 서울 금천구</span>	<!-- r.resumeworkPlace -->
							</div>
						</li>    					           
						<li class="workForm">
							<div class="announceInfoImg">
								<img src="resources/img/resume/workForm.PNG">
							</div>
							<div class="announceInfoData">
								<span>직무·직업 : 
									<c:if test="${a.category eq 1 }">
										IT개발
									</c:if> 
									<c:if test="${a.category eq 2 }">
										웹 디자인
									</c:if> 
									<c:if test="${a.category eq 3 }">
										프로젝트 기획
									</c:if> 
								</span>	<!-- r.resumeWorkForm -->
							</div>
						</li>               
					</ul>
				<div class="message">
					<a href="applicationStatus.do?announceNo=${a.announceNo }&reqPage=1"><button class="companyMessage">지원신청 회원 목록</button></a>		<!-- 일반회원이 지원신청을 했을 경우 count증가하고 이력서 열람할 수 있도록 하기 -> 서류합격? 버튼 누를 시 웹소켓으로 쪽지 보내기 -->
					<span class="requestCount">${count }</span> <!-- 지원신청 회원목록 뱃지 카운트 -->
				</div>
				<div class="update">
					<a href="/updateAnnounceFrm.do?announceNo=${a.announceNo }"><button class="updateAnnounce">수정하기</button></a>
					<a href="/deleteAnnounce.do?announceNo=${a.announceNo }"><button class="deleteAnnounce">삭제하기</button></a>
				</div>
			</div>
			
		</c:otherwise>
	</c:choose>
		<div class="resume">
			<a href="announceFrm.do?comNo=${comNo }"><button class="resumeBtn">구인공고 작성하기</button></a>
			<input type="hidden" name="announceCount" value="${announceCount }" class="announceCount">
			<input type="hidden" name="comNo" value="${comNo }" class="comNo">
		</div>
		<div class="resumeExplain">
			<p>구인공고를 등록해보세요.</p>
			<p>구인공고는 하나만 작성이 가능합니다.</p>
		</div>
	</div>
	<%-- <input type="hidden" value="${a.announceNo }" name="announceNo"> --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>