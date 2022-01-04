<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
	.contain{
		width: 1100px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.header{
		padding-left: 50px;
		padding-bottom: 40px;
		overflow: hidden;
		margin-top: 50px;
	}
	em{
		font-style: normal;
		font-weight: bold;
		font-size: 22px;
	}
	.logo{
		display: inline-block;
		margin-right: 30px;
	}
	.logo>img{
		width: 130px;
	}
	.announceTitle{
		margin-bottom: 0px;
		display: inline-block;
	}
	.announceTitle>p{
		margin-bottom: 0px;
		font-size: 25px;
		font-weight: bold;
		display: inline-block;
	}
	.companyName{
		color: #57595b;
		margin-left: 165px;
	}
	.applicationBtn{
		display: inline-block;
		float: right;
		margin-right: 50px;
	}
	.applicationBtn>button, .loginBtn{
		background-color: rgb(78, 205, 196);
		color: white;
		font-weight: bold;
		border-radius: 5px;
		width: 100px;
		text-align: center;
		padding: 15px 0px;
		border: none;
		outline: none;
	}
	.info{
		width: 1000px;
		margin: 0 auto;
		border: 1px solid #d9d9d9;
		padding: 50px;
	}
	.infoContent{
		margin-top: 20px;
	}
	.infoUl{
		list-style: none;
		margin-top: 25px;
		padding-left: 0px;
	}
	.infoUl>li{
		height: 30px;
	}
	.announceInfo{
		display: inline-block;
		width: 120px;
	}
	.infoDiv{
		margin-bottom: 80px;
	}
	.img>img{
		width: 18px;
		height: 21px;
	}
	.img{
		width: 25px;
		margin-right: 10px;
	}
	.comInfo{
		width: 800px;
		overflow: hidden;
		border: 1px solid #888;
		padding: 20px 10px;
		margin:0 auto;
	}
	.infoLogo{
		width: 260px;
		float: left;
		text-align: center;
		line-height: 100px;
	}
	.infoData{
		float: left;
		overflow: hidden;
	}
	.left{
		float: left;
		overflow: hidden;
		margin-right: 80px;
	}
	.left>div, .right>div{
		margin-bottom: 10px;
	}
	.right{
		float: left;
		overflow: hidden;
	}
	.text{
		float: left;
		margin-right: 18px;
		font-size: 14px;
	}
	.data{
		float: left;
		font-size: 14px;
	}
	.title{
		margin-bottom: 15px;
	}
	.title>a{
		font-size: 18px;
		text-decoration: none;
		color: #222222;
	}
	.announcement{
		margin-left: 60px;
		font-size: 20px;
		font-weight: bold;
		margin-top: 50px;
		margin-bottom: 10px;
	}
</style>
<body>
<script>
	$(function(){
		$("#noNormalMember").click(function(){
			alert("일반회원만 지원이 가능합니다.");
		});
		
	});
	
		$(".companyEnrollBtn").click(function(){
			/* 쪽지 */
			var receiver = $(".receiver").eq(index).val();
			var dmContent = $(".dmContent").eq(index).val();
			var sender = $(".sender").eq(index).val();
			console.log(receiver);
			console.log(dmContent);
			console.log(sender);
			$.ajax({
				url : "/sendDm.do",
				data : {receiver:receiver,dmContent:dmContent,sender:sender},
				success : function(data) {
					if(data == 1){
						dmCount(receiver);
					}
				}
			});
			
		});
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="contain">
		<div class="header">
			<div class="logo">
				<img alt="" src="/resources/upload/company/${a.filepath }">
			</div>
			<div class="announceTitle">
				<p>${a.announceTitle }</p>
			</div>
			<div class="applicationBtn">
				<c:choose>
					<c:when test="${empty sessionScope.m }">
						<a href="/loginFrm.do"><button class="loginBtn">지원하기</button></a>
					</c:when>
					<c:when test="${sessionScope.m.memberType eq 3 or sessionScope.m.memberType eq 9 }">
						<button class="loginBtn" id="noNormalMember">지원하기</button>
					</c:when>
					<c:otherwise>
						
						<c:if test="${ap eq 0 }">
							<button data-bs-toggle="modal" data-bs-target="#contestMember">지원하기</button>						
						</c:if>
						<c:if test="${ap eq 1 }">
							<button class="btn btn-outline-info">지원완료</button>
						</c:if>
						<!-- modal내용 등록 -->
						<div class="modal fade" id="contestMember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog  modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-body">
											<form action="/insertApplication.do" method="post">
												<p style="font-size: 15px; color: #444444; margin-bottom:5px;">${a.companyName } 입사지원</p>
												<p style="font-size: 22px; font-weight: bold; text-overflow:ellipsis; margin-bottom: 0px;">${a.announceTitle }</p>
												<p style="font-size: 12px; color: #999999;">
													<c:if test="${a.career eq 1 }">
														신입
													</c:if> 
													<c:if test="${a.career eq 2 }">
														경력
													</c:if> 
													<c:if test="${a.career eq 3 }">
														신입/경력
													</c:if> 
													| 
													<c:if test="${a.school eq 1 }">
														초졸이상
													</c:if>
													<c:if test="${a.school eq 2 }">
														중졸이상
													</c:if>
													<c:if test="${a.school eq 3 }">
														고졸이상
													</c:if>
													<c:if test="${a.school eq 4 }">
														대졸이상
													</c:if>
													<c:if test="${a.school eq 5 }">
														학력무관
													</c:if>
													|
													<c:if test="${a.workPlace eq 1 }">
														서울
													</c:if>
													<c:if test="${a.workPlace eq 2 }">		
								            			경기
									            	</c:if>
													<c:if test="${a.workPlace eq 3 }">		
									            		인천
									            	</c:if>
													<c:if test="${a.workPlace eq 4 }">		
														강원
									            	</c:if>
													<c:if test="${a.workPlace eq 5 }">		
									            		충남
									            	</c:if>
													<c:if test="${a.workPlace eq 6 }">		
									            		충북
									            	</c:if>
													<c:if test="${a.workPlace eq 7 }">		
														경북
									            	</c:if>
													<c:if test="${a.workPlace eq 8 }">		
														부산
									            	</c:if>
													<c:if test="${a.workPlace eq 9 }">		
														경남
									            	</c:if>
													<c:if test="${a.workPlace eq 10 }">		
									            		전북
									            	</c:if>
													<c:if test="${a.workPlace eq 11 }">		
									            		전남
									            	</c:if>
													<c:if test="${a.workPlace eq 12 }">		
									            		제주
									            	</c:if>	
												</p>
												<div class="selectResume" style="width: 466px; background-color: #f8f9fa; height: 60px; line-height: 60px; padding: 0px 30px; overflow: hidden; border-radius: 10px; position: relative; top: 20px; border: 1px solid #ebebeb;">
													<span style="font-size: 14px; color: #444;">선택된 이력서</span>
													<a href="/resumeManage.do?memberNo=${sessionScope.m.memberNo }&reqPage=1"><button data-v-6259d225="" fragment="103966058a9" type="button" class="btn" style="color: #444; float:right; font-size: 14px; width: 120px; height:40px; margin-top: 10px; background-color: white; border-radius: 10px;">이력서 변경 <svg data-v-6259d225="" viewBox="0 0 16 16" class="ic" style="height: 14px; margin-top: -3px;"><path d="M6 13.657L11.657 8 6 2.343" stroke="#444" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg></button></a>
												</div>
												<div style="border: 1px solid #d9d9d9; padding: 20px; padding-left: 25px; margin-bottom: 20px; border-top: none; border-radius: 10px; border: 1px solid #eaf0fa; padding-top: 35px; box-shadow: 0 2px 14px 0 rgb(0 0 0 / 10%);">
													<span style="font-size: 12px; color: #999999;">${r.writeDate }</span>
													<p><a href="/rView.do?resumeNo=${r.resumeNo }" target="_blank" style="font-weight: bold; text-decoration: none; color: black; text-overflow: ellipsis;">${r.resumeTitle }</a></p>
												</div>
												<p class="desc" style="font-size:12px; color: #999999;"> 제출서류는 90일까지 지원기업에게 제공됩니다.<br>제출에 동의할 경우에만 [입사지원] 버튼을 클릭해 주세요.<br> 동의하지 않을 경우 입사지원이 불가능합니다.</p>
												<p class="desc" style="font-size:12px; color: #999999;"> 만료(응시 시작일로부터 3년)된 인 ∙ 적성검사 포함 시 입사지원이 불가능하며, 입사지원 후 제출된 인 ∙ 적성검사는 만료 여부와 관계없이 입사지원서 열람 기준 내 인사담당자가 확인할 수 있습니다.</p>
												<div style="text-align: right; ">
													<button type="submit" class="btn btn-primary companyEnrollBtn" style="width: 100px;">지원하기</button>
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
												</div>
												<input type="hidden" name="announceNo" value="${a.announceNo }">
												<input type="hidden" name="resumeNo" value="${r.resumeNo }">
												<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
												<input type="hidden" name="status" value="1">
												
												 <!-- 쪽지 -->
												 <input type="hidden" class="receiver" value="${a.memberId }">
												 <input type="hidden" class="sender" value="admin">
												 <input type="hidden" class="dmContent" value="[구인구직] 기업에 입사지원한 이력서가 있습니다. 지원신청 회원목록에서 입사신청 내역을 확인하세요.">
											</form>
										</div>
									</div>
								</div>
							</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="companyName">
				<small>${a.companyName }</small>
			</div>
		</div>
		<hr>
		<div class="announcement">모집요강</div>
		<div class="info">
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 요약</em>
				<ul class="infoUl">
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/endDate.PNG">
							</i>
							마감일
						</span>
						<span>${a.endDate }</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/category.PNG">
							</i>
							 직무
						</span>
						<span>
							<c:if test="${a.category eq 1}">
								IT 개발
							</c:if>
							<c:if test="${a.category eq 2}">
								웹 디자인
							</c:if>
							<c:if test="${a.category eq 3}">
								프로젝트 기획
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/career.PNG">
							</i> 
							경력
						</span>
						<span>
							<c:if test="${a.career eq 1 }">
								신입
							</c:if>
							<c:if test="${a.career eq 2 }">
								경력
							</c:if>
							<c:if test="${a.career eq 3 }">
								경력무관
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/workForm.PNG">
							</i> 
						 	고용형태
						</span>
						<span>
							<c:if test="${a.workForm eq 1 }">
								정규직
							</c:if>
							<c:if test="${a.workForm eq 2 }">
								계약직
							</c:if>
							<c:if test="${a.workForm eq 3 }">
								아르바이트
							</c:if>
							<c:if test="${a.workForm eq 4 }">
								인턴
							</c:if>
							<c:if test="${a.workForm eq 5 }">
								프리랜서
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/money.PNG">
							</i>
							 급여
						</span>
						<span>
							<c:choose>
								<c:when test="${a.money eq 0 }">
									회사내규에 따름
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${a.money}" pattern="#,###"/> &#8361;
								</c:otherwise>
							</c:choose>
						</span>
					</li>
				</ul>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 기업소개</em>	
				<div class="infoContent">
					<p>${a.content }</p>
				</div>
			
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 주요업무</em>	
				<div class="infoContent">
					<p>${a.announceContentBr }</p>
				</div>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 우대사항</em>	
				<div class="infoContent">
					<c:if test="${a.veterans eq 2 }">
						<p>보훈대상 우대</p>
					</c:if>
					<c:if test="${a.military eq 1 }">
						<p>군필우대</p>
					</c:if>
					<c:if test="${a.military eq 2 }">
						<p>병역무관</p>
					</c:if>
				</div>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 채용절차</em>		
				<div class="infoContent">
					<!-- <img src="/resources/img/company/saram.png"> -->
					<style>
						.reNum{
							list-style: none;
							overflow: hidden;
							text-align: center;
							margin-left: 20px; 
						}
						.reNum>li{
							float: left;
							text-align: center;
						}
						.r{
							padding: 0px 15px;
						}
						.reNum>li>p{
							margin-top: 10px;
							color: #3698c1;
							width: 136px;
						}
					</style>
					<ul class="reNum">
                            <li>
                                <img src="/resources/img/company/re_num01.png" alt=""> <img src="/resources/img/company/right.PNG" class="r">
                                <p>서류전형</p>
                            </li>
                            <li>
                                <img src="/resources/img/company/re_num02.png" alt=""> <img src="/resources/img/company/right.PNG" class="r">
                                <p>1차 실무면접</p>
                            </li>
                            <li>
                                <img src="/resources/img/company/re_num03.png" alt=""> <img src="/resources/img/company/right.PNG" class="r">
                                <p>2차 임원면접</p>
                            </li>
                            <li>
                                <img src="/resources/img/company/re_num04.png" alt="">
                                <p>최종합격</p>
                            </li>
                        </ul>
					
				</div>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 접수기간 및 방법</em>	
				<div class="infoContent">
					<p style="margin-bottom: 13px;">ㆍ 접수기간 : <strong>${a.endDate }</strong> 까지</p>
					<p style="margin-bottom: 13px;">ㆍ 접수방법	: 디벨로민트 입사지원</p>
					<p style="margin-bottom: 13px;">ㆍ 이력서양식	:	디벨로민트 온라인 이력서</p>
					
				</div>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 유의사항</em>	
				<div class="infoContent">
					<p>ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.</p>
				</div>
			</div>
			
			<div class="infoDiv">
				<em><span style="color: rgb(78, 205, 196); font-size: 18px;">●</span> 기업정보</em>	
				<div class="infoContent">
					<div class="comInfo">
						<div class="infoLogo">
							<img alt="" src="/resources/upload/company/${a.filepath }" style="width: 200px;">
						</div>
						<div class="infoData">
								<div class="title">
									<a href="/companyInfo.do?companyNo=${a.companyNo }">${a.companyName }</a>
									<a href="/companyInfo.do?companyNo=${a.companyNo }" class="aa" style="margin-left: 5px;"><strong style="font-size: 12px; color: #666666;">기업정보 ></strong></a>
								</div>
							<div class="left">
								<div class="text">
									<p style="color: #888888; margin-bottom: 10px;">사원수</p>
									<p style="color: #888888; margin-bottom: 0px;">대표자명</p>
								</div>
								<div class="data">
									<p style="color: #444444; margin-bottom: 10px;">${a.employee }명</p>
									<p style="color: #444444; margin-bottom: 0px;">${a.ceo }</p>
								</div>
							</div>
							<div class="right">
								<div class="text">
									<p style="color: #888888; margin-bottom: 10px;">주소</p>
									<p style="color: #888888; margin-bottom: 0px;">설립일</p>
								</div>
								<div class="data">
									<p style="color: #444444; margin-bottom: 10px;">${a.address }</p>
									<p style="color: #444444; margin-bottom: 0px;">${a.openDate }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>