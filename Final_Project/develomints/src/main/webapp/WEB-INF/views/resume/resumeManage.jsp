<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
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
	.ceoResume>p{
		color: rgb(78, 205, 196);
		float: left;
	}
	.writeDate{
		color: rgb(108, 108, 108);
		float: left;
		margin-left: 20px;
		font-size: 12px;
		padding-top: 3px;
		
	}
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.resumeInfo1{
		margin-bottom: 0;
	}
	.resumeInfo1, .resumeInfo2{
		width: 900px;
		overflow: hidden;
	}
	.resumeInfo2{
		margin-bottom: 30px;
	}
	.resumeInfo1>li, .resumeInfo2>li{
		color: rgb(158, 158, 158);
		list-style: none;
		overflow: hidden;
	}
	.resumeInfo1>li>div, .resumeInfo2>li>div{
		float: left;
	}
	.resumeInfoImg{
		width: 40px;
	}
	.resumeInfoImg>img{
		width: 20px;
	}
	.resumeInfoData{
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
	.updateResume, .ceoResumeView{
		border: none;
		width: 100px;
		height: 45px;
		border: 2px solid rgb(78, 205, 196);
		border-radius: 10px;
		color: rgb(78, 205, 196);
		background-color: white;
		margin-right: 10px;
		transition: background-color 1s;
	}
	.updateResume:hover{
		background-color: rgb(78, 205, 196);
		color: white;
	}
	.ceoResumeView:hover{
		background-color: rgb(78, 205, 196);
		color: white;
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
    	overflow: hidden;
    	margin-left: 15px;
    	margin-bottom: 50px;
    }
    .register{
    	margin-left: 20px;
    	font-size: 13px;
    	font-weight: 900;
    	float: right;
    	position: relative;
    	top: -40px;
    	left: -50px;
    }
    
    input[type="checkbox"] { 
    	display: none; 
    } 
    .label__on-off {
    	overflow: hidden; 
    	position: relative; 
    	display: inline-block; 
    	width: 50px; height: 20px; 
    	-webkit-border-radius: 13px; 
    	-moz-border-radius: 13px; 
    	border-radius: 13px; 
    	background-color: #ed4956; 
    	color: #fff; 
    	font-weight: bold; 
    	cursor: pointer; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    } 
    .label__on-off > * {
    	vertical-align: middle; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    	font-size: 13px; 
    } 
    .label__on-off .marble { 
    	position: absolute; 
    	left: -1.5px; 
    	display: block;
    	width: 20px; 
    	height: 20px; 
    	background-color: #fff; 
    	-webkit-border-radius: 50%; 
    	-moz-border-radius: 50%; 
    	border-radius: 50%; 
    	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    } 
    .label__on-off .on { 
    	display: none; 
    	padding-left: 12px; 
    } 
    .label__on-off .off { 
    	padding-left: 25px; line-height: 10px; 
    }
    .on, .off{
    	position: relative;
    	top: -3px;
    }
    .input__on-off:checked + .label__on-off { 
    	background-color: #0bba82; 
    } 
    .input__on-off:checked + .label__on-off .on { 
    	display: inline-block; 
    } 
    .input__on-off{
    	display: none;
    }
    .input__on-off:checked + .label__on-off .off { 
    	display: none;
    } 
    .input__on-off:checked + .label__on-off .marble { 
    	left: 33px; 
    }
    .register>p{
    	width: 100px;
    	margin: 0;
    	/* display: inline-block; */
    }
    /* .ceoResumeChk{
    	display: inline-block;
    } */
	.noResume{
		width: 800px;
		height: 200px;
		margin: 0 auto;
		margin-top: 100px;
		text-align: center;
	}
    .wd{
    	margin-top: 20px;
    	margin-left: 30px;
    }
    .resumeTitle{
    	margin-left: 30px;    	
    }
    .wrap{
    	margin: 50px 0px;
    	height: 230px;
    	border: 1px solid #dfdfdf;
    	overflow: hidden;
    }
    .resumeTitle>a{
    	color: black;
    	text-decoration: none;
    }
    .deleteBtn{
    	float: right;
    }
    .deleteBtn>a{
    	color: #888;
    	font-size: 12px;
    	text-decoration: none;
    	position: relative;
    	top: -30px;
    	margin-right: 20px;
    }
    #pageNavi{
    	display: flex;
    	justify-content: center;
    	margin: 30px 0px;
    }
</style>
<script>
	$(function(){
		
		
		
		
		$(".resumeBtn").click(function(e){
			var count = $(".count").html();
			if($(".count").html() > 10) {
				alert("이력서는 10개까지만 등록이 가능합니다.");
				e.preventDefault();
				console.log(count);
			}
		});
		
		$(".input__on-off").click(function(){
			var resumeNo = $(this).siblings(".resumeNo").val();
			var memberNo = $(this).siblings(".memberNo").val();
			console.log("resumeNo : " + resumeNo);
			console.log("memberNo : " + memberNo);
			$.ajax({
				url : "/ceoResume.do",
				data : {
					resumeNo : resumeNo,
					memberNo : memberNo
				},
				success : function(data) {		/* 대표이력서로 등록 시 아작스로 대표이력서 정보 화면이동 없이 바꾸어주기 */
					$(".writeDate").eq(0).find("span").html(data.writeDate);
					$(".resumeTitle").eq(0).find("em").html(data.resumeTitle);
					if(data.career == 1) {
						$(".car").eq(0).find("span").html("신입");						
					} else if(data.career == 2) {
						$(".car").eq(0).find("span").html("경력");												
					}
					if(data.money == 1) {
					$(".mon").eq(0).find("span").html("회사내규에 따름");
					} else if (data.money == 2) {
					$(".mon").eq(0).find("span").html("2000만 ~ 2400만");
					} else if (data.money == 3) {
					$(".mon").eq(0).find("span").html("2400만 ~ 2800만");
					} else if (data.money == 4) {
					$(".mon").eq(0).find("span").html("2800만 ~ 3200만");
					} else if (data.money == 5) {
					$(".mon").eq(0).find("span").html("3200만 ~ 3600만");	
					} else if (data.money == 6) {
					$(".mon").eq(0).find("span").html("3600만 ~ 4000만");
					} else if (data.money == 7) {
					$(".mon").eq(0).find("span").html("4000만 이상");
					}
					$(".wp").eq(0).find("span").html(data.workPlace);
					if(data.workForm == 1) {
						$(".wf").eq(0).find("span").html("정규직");						
					}
					else if(data.workForm == 2) {
						$(".wf").eq(0).find("span").html("계약직");						
					}
					else if(data.workForm == 3) {
						$(".wf").eq(0).find("span").html("아르바이트");						
					}
					else if(data.workForm == 4) {
						$(".wf").eq(0).find("span").html("인턴");						
					}
					else if(data.workForm == 5) {
						$(".wf").eq(0).find("span").html("프리랜서");						
					}
					
					/* 1. 대표이력서로 선택되면 일반에서 사라지고 원래 등록되어있던 대표이력서가 일반이력서에 나와야함 */
					/* or 2. 대표이력서 체크되어있는거는 switch css on으로 켜져있도록 */
				}
			});
		});
		
		
	});
</script>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>이력서 관리</em>				<!-- if 이력서 없으면 등록된 이력서가 없습니다. -->
		<!-- 대표이력서 ceoResume == 1 -->
		<c:if test="${empty list }">
			<div class="grayBox">
						<div class="resumeHeader">
							<div class="ceoResume">
								<p style="margin-bottom: 10px;">대표이력서</p>
							</div><br><br>
							<div class="resumeTitle" style="margin-bottom: 30px;">
								<em style="font-size:20px; color: #666;">대표 이력서가 없습니다.</em><br>
								<em style="font-size:20px; color: #666;">이력서를 작성하시고 대표 이력서 버튼을 on으로 설정하시면 대표 이력서로 등록됩니다.</em>
							</div>
						</div>
					</div>
		</c:if>
		<c:forEach items="${list }" var="r" varStatus="i">
			<c:choose>
				<c:when test="${r.ceoResume eq 0 }">
					
				</c:when>
				<c:otherwise>
					
					<div class="grayBox">
						<div class="resumeHeader">
							<div class="ceoResume">
								<p>대표이력서</p>
							</div>
							<div class="writeDate">
								<span>${r.writeDate }</span>	
							</div>
						</div>
							<div class="resumeTitle" style="margin-bottom: 30px;">
								<a href="/resumeView.do?resumeNo=${r.resumeNo }"><em>${r.resumeTitle }</em></a>	<!-- r.resumeTitle -->
							</div>
							<ul class="resumeInfo1">
				            	<li class="career">
				            		<div class="resumeInfoImg">
				            			<img src="resources/img/resume/career.PNG">
				            		</div>
				            		<div class="resumeInfoData car">
				            			<em style="font-size: 16px;">경력 : </em>
				            			<c:if test="${r.career eq 1 }">
											<span>신입</span>
										</c:if>
										<c:if test="${r.career eq 2 }">
											<span>경력</span>
										</c:if>
				            		</div>
				            	</li>   
				            	<li class="money">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/income.PNG">					
									</div>
									<div class="resumeInfoData mon">
										<em style="font-size: 16px;">연봉 : </em>
										<c:if test="${r.money eq 1 }">		<!-- 1 -> 회사내규에 따름 -->
				            				<span>회사내규에 따름</span>
						            	</c:if>
						            	<c:if test="${r.money eq 2 }">		<!-- 2 -> 2000만 ~ 2400만 -->
						            		<span>2000만 ~ 2400만</span>
						            	</c:if>
						            	<c:if test="${r.money eq 3 }">		<!-- 3 -> 2400만 ~ 2800만 -->
						            		<span>2400만 ~ 2800만</span>
						            	</c:if>
						            	<c:if test="${r.money eq 4 }">		<!-- 4 -> 2800만 ~ 3200만 -->
						            		<span>2800만 ~ 3200만</span>
						            	</c:if>
						            	<c:if test="${r.money eq 5 }">		<!-- 5 -> 3200만 ~ 3600만 -->
						            		<span>3200만 ~ 3600만</span>
						            	</c:if>
						            	<c:if test="${r.money eq 6 }">		<!-- 6 -> 3600만 ~ 4000만 -->
						            		<span>3600만 ~ 4000만</span>
						            	</c:if>
						            	<c:if test="${r.money eq 7 }">		<!-- 7 -> 4000만 이상 -->
						            		<span>4000만 이상</span>
						            	</c:if>
									</div>
								</li>  
							</ul>
							<ul	class="resumeInfo2">  
							<li class="workPlace">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workPlace.png">
									</div>
									<div class="resumeInfoData wp">
										<em style="font-size: 16px;">희망지역 :</em>
										<span>${r.workPlace }</span>	<!-- r.workPlace -->
									</div>
								</li>    					           
								<li class="workForm">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workForm.PNG">
									</div>
									<div class="resumeInfoData wf">
										<em style="font-size: 16px;">희망 근무형태 : </em>
										<c:if test="${r.workForm eq 1 }">			
				            			<span>정규직</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 2 }">			
					            			<span>계약직</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 3 }">			
					            			<span>아르바이트</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 4 }">			
					            			<span>인턴</span>
					            		</c:if>
					            		<c:if test="${r.workForm eq 5 }">			
					            			<span>프리랜서</span>
					            		</c:if>
									</div>
								</li>               
							</ul>
						<div class="message">
							<a href="applicationCompany.do?memberNo=${sessionScope.m.memberNo }&reqPage=1"><button class="companyMessage">지원한 회사 목록</button></a>		<!-- 웹소켓으로 기업이 이력서 확인 후 합격이면 쪽지 날라가게 만들기 -->
							<span class="requestCount">${appCount }</span>
						</div>
						<div class="update">
							
							<a href="/resumeView.do?resumeNo=${r.resumeNo }"><button class="ceoResumeView">이력서 보기</button></a>
							<a href="updateResumeFrm.do?memberNo=${sessionScope.m.memberNo}&ceoResume=${r.ceoResume }"><button class="updateResume">수정하기</button></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<div class="resume">
			<a href="resumeFrm.do"><button class="resumeBtn">이력서 작성하기</button></a>
		</div>
		<div class="resumeExplain">
			<p>이력서는 최대 10개까지 등록 가능합니다.</p>
			<p>대표이력서 설정은 1개의 이력서만 가능합니다.</p>
		</div>
		<div class="allResume">
		<div class="resumeCount">
		<c:choose>
			<c:when test="${count eq null }">
			총 0건
			</c:when>
			<c:otherwise>
			총 <p class="count" style="margin: 0; display: inline; color: rgb(78, 205, 196)">${count }</p>건		
			</c:otherwise>
		</c:choose>
		</div>
		<hr>
		<c:choose>
			<c:when test="${empty list }">
				<div class="noResume">
					<img src="/resources/img/resume/no.JPG" style="width: 50px; height: 50px;"><br><br>
				저장된 이력서가 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div class="myResume">
						<div class="smallBox" style="width: 800px; margin: 0 auto;">
				<c:forEach items="${list }" var="rs" varStatus="i">
					<%-- <c:if test="${rs.ceoResume eq 0 }"> --%>		<!-- 대표이력서는 일반이력서 목록에 안나오도록 설정 -->
					<div class="wrap">
							<div class="wd">
								<span style="font-size: 13px; color: gray;">${rs.writeDate }</span>	
							</div>
							<div class="resumeTitle">
								<a href="resumeView.do?resumeNo=${rs.resumeNo }"><em>${rs.resumeTitle }</em></a>	
							</div>
							<div class="register">
								<p>대표이력서 등록</p>
								<div class="ceoResumeChk">
									<input type="hidden" class="ceoResume" id="ceoResume" value="${rs.ceoResume }" name="ceoResume">
									<input type="hidden" name="memberNo" class="memberNo" value="${sessionScope.m.memberNo }">
									<input type="hidden" value="${rs.resumeNo }" class="resumeNo" name="resumeNo">
									<c:choose>
										<c:when test="${rs.ceoResume eq 1 }">
											<input type="radio" id="switch${i.count }" name="switch1" class="input__on-off" checked="">
										</c:when>
										<c:otherwise>
											<input type="radio" id="switch${i.count }" name="switch1" class="input__on-off">
										</c:otherwise>
									</c:choose>
									<label for="switch${i.count }" class="label__on-off"> 
										<span class="marble"></span> 
										<span class="on">on</span> 
										<span class="off">off</span> 
									</label>
								</div>
							</div>	
							<ul class="resumeInfo1">
					           	<li class="career">
					            	<div class="resumeInfoImg">
					            		<img src="resources/img/resume/career.PNG">
					            	</div>
					            	<div class="resumeInfoData">
					            	<em style="font-size: 16px; font-weight: normal;">경력 : </em>
					            	<c:if test="${rs.career eq 1 }">		<!-- 1 -> 신입 -->
					            		<span>신입</span>
					            	</c:if>
					            	<c:if test="${rs.career eq 2 }">		<!-- 2 -> 경력 -->
					            		<span>경력</span>
					            	</c:if>
					            		
					            	</div>
					            </li>
					            <li class="money">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/money.PNG" style="width:16px; height: 23px; margin-left: 2px;">					
									</div>
									<div class="resumeInfoData">
										<em style="font-size: 16px; font-weight: normal;">연봉 : </em>			<!-- r.money -->
										<c:if test="${rs.money eq 1 }">		<!-- 1 -> 회사내규에 따름 -->
					            			<span>회사내규에 따름</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 2 }">		<!-- 2 -> 2000만 ~ 2400만 -->
						            		<span>2000만 ~ 2400만</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 3 }">		<!-- 3 -> 2400만 ~ 2800만 -->
						            		<span>2400만 ~ 2800만</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 4 }">		<!-- 4 -> 2800만 ~ 3200만 -->
						            		<span>2800만 ~ 3200만</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 5 }">		<!-- 5 -> 3200만 ~ 3600만 -->
						            		<span>3200만 ~ 3600만</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 6 }">		<!-- 5 -> 3600만 ~ 4000만 -->
						            		<span>3600만 ~ 4000만</span>
						            	</c:if>
						            	<c:if test="${rs.money eq 7 }">		<!-- 5 -> 4000만 이상 -->
						            		<span>4000만 이상</span>
						            	</c:if>
									</div>
								</li>
							</ul>
							<ul class="resumeInfo2">
								<li class="workPlace">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workPlace.png">
									</div>
									<div class="resumeInfoData">
										<em style="font-size: 16px; font-weight: normal;">희망지역 : </em>
										<span>${rs.workPlace }</span>	<!-- r.resumeworkPlace -->
									</div>
								</li>       					           
								<li class="workForm">
									<div class="resumeInfoImg">
										<img src="resources/img/resume/workFromWhite.PNG">
									</div>
									<div class="resumeInfoData">
										<!-- r.resumeWorkForm -->
										<em style="font-size: 16px; font-weight: normal;">희망 근무형태 : </em>
										<c:if test="${rs.workForm eq 1 }">		<!-- 1 -> 정규직 -->
						            		<span>정규직</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 2 }">		<!-- 2 -> 계약직 -->
						            		<span>계약직</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 3 }">		<!-- 3 -> 아르바이트 -->
						            		<span>아르바이트</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 4 }">		<!-- 4 -> 인턴 -->
						            		<span>인턴</span>
						            	</c:if>
						            	<c:if test="${rs.workForm eq 5 }">		<!-- 5 -> 프리랜서 -->
						            		<span>프리랜서</span>
						            	</c:if>
									</div>
								</li>                       
							</ul>
							<div class="deleteBtn">
								<a href="/deleteResume.do?resumeNo=${rs.resumeNo }&memberNo=${rs.memberNo }">삭제하기</a>
							</div>
						</div>
					<%-- </c:if> --%>
				</c:forEach>
					</div>			
				</div>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${not empty list }">
			<div id="pageNavi">${pageNavi }</div>
		</c:if>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>