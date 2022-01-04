<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints 지원현황</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 30px;
		margin-bottom: 15px;
		color: #373f57;
	}
	.tabWrap {
		padding-left: 0px;
	    display: inline-block;
	    font-size: 20px;
	    font-weight: bold;
	    letter-spacing: -1px;
	    line-height: 27px;
		list-style: none;
	}
	.tab{
		text-decoration: none;
		color: #888;
	}
	.tabWrap li {
	    float: left;
	    padding-right: 20px;
	}
	
	.tabWrap .tab .badge {
	    display: inline-block;
	    margin: 0 0 0 8px;
	    padding: 0 12px 0 13px;
	    min-width: 36px;
	    height: 28px;
	    line-height: 25px;
	    border-radius: 14px;
	    box-sizing: border-box;
	    color: #fff;
	    font-size: 16px;
	    letter-spacing: 0;
	    vertical-align: top;
	    background: rgb(78, 205, 196);
	}
	.status{
		overflow: hidden;
		display: inline-block;
	}
	.stbtn{
		float: left;
		padding-top: 30px;
	}
	.listStatus{
	}
	.info{
		display: flex;
		padding: 32px;
		justify-content: center;
		align-items: center;
	}
	.left{
		flex-grow: 1;
		text-align: center;
	}
	.appStatus{
		font-size: 20px;
	}
	.announceTitle{
		text-overflow:ellipsis;
	}
	#pageNavi{
    	display: flex;
    	justify-content: center;
    	margin: 80px 0px;
    }
    .corp>a{
    	text-decoration: none;
    }
    .announceTitle>a{
    	text-decoration: none;
    	color: #444444;
    	font-size: 20px;
    }
    .accordion-body>a{
    	padding: 5px 20px;
    	text-decoration: none;
		color: #444444;    	
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div><em>입사지원 현황</em></div>
			
    		
    		<div class="status">
	            <div class="stbtn">
	            	<button type="button" class="btn"><em>지원완료</em><span class="num">1</span></button>
	            </div>
<!-- 	            <div class="stbtn">
	            	<button type="button" class="btn"><em>최종발표</em><span class="num">0</span></button>
	            </div> -->        	
	        </div>
	        <ul class="tabWrap">
        		<li class="select"><a href="#" class="tab">전체<span class="badge">${count }</span></a></li>
    		</ul>
        	
        	<hr>
        	
        	<c:choose>
        		<c:when test="${empty list }">
        			<!-- 지원내역 없음 -->
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${list }" var="a" varStatus="i">
        				<form name="listForm" id="listForm">
			        		<div class="listStatus">
			                	<div class="info">
						            <div class="date left">${a.applyDate }</div>
						            <div class="summary left">
						                <strong class="corp">
			                            	<a href="/companyInfo.do?companyNo=${a.companyNo }">${a.companyName }</a>
			                            </strong>
			                			<div class="recruit">
			                            	<span class="category">
			                            		<c:if test="${a.category eq 1 }">
			                            			IT 개발
			                            		</c:if>
			                            		<c:if test="${a.category eq 2 }">
			                            			웹 디자인
			                            		</c:if>
			                            		<c:if test="${a.category eq 3 }">
			                            			프로젝트 기획
			                            		</c:if>
			                            	</span>
			                			</div>
			            			</div>
			            			<div class="announceTitle left">
			            				<a href="/announceView.do?announceNo=${a.announceNo }&memberNo=${a.memberNo }"><span>${a.announceTitle }</span></a>
			            			</div>
			                        <div class="status left">
			                    		
			                    			<c:if test="${a.status eq 1 }">
			                    				<em class="appStatus">지원완료	</em>
			                    			</c:if>
			                    			<c:if test="${a.status eq 2 }">
			                    				<em class="appStatus" style="color: #4876ef;">서류합격</em>
			                    			</c:if>
			                    			<c:if test="${a.status eq 3 }">
			                    				<em class="appStatus" style="color: red;">탈락</em>
			                    			</c:if>
			                    		
			                        </div>
						            <div class="btn" style="width: 180px;">
				      					<div class="accordion" id="accordionExample" style="width: 180px; justify-content: center;">
										 	<div class="accord" style="width: 180px;">
										    	<h2 class="accordion-header" style="width: 180px;">
										      		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i.index }" aria-expanded="true" aria-controls="collapse${i.index }">
										       			<span>지원내역</span>
										      		</button>
										    	</h2>
										  	</div>
										</div>
						            </div>
			        			</div>
												<!-- 토글나오는애 -->
										    	<div id="collapse${i.index }" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" 
										    	style="background-color: rgb(250, 250, 250);">
											      	<div class="accordion-body" style="padding: 20px 200px;">
											        	<span>지원한 이력서 : </span><a href="/resumeView.do?resumeNo=${a.resumeNo }" style="width: 300px; text-overflow: ellipsis; display: inline-block;"><strong >${a.resumeTitle }</strong></a>
											        	<span style="margin-left: 50px;">경력 : 
											        	<c:if test="${a.career eq 1 }">
											        		신입
											        	</c:if> 
											        	<c:if test="${a.career eq 2 }">
											        		경력
											        	</c:if> 
											        	</span>
											        	<span style="margin-left: 150px;">희망연봉 : 
											        		<c:if test="${a.money eq 1 }">
											        			회사내규에 따름
											        		</c:if>
											        		<c:if test="${a.money eq 2 }">
											        			2000만 ~ 2400만
											        		</c:if>
											        		<c:if test="${a.money eq 3 }">
											        			2400만 ~ 2800만
											        		</c:if>
											        		<c:if test="${a.money eq 4 }">
											        			2800만 ~ 3200만
											        		</c:if>
											        		<c:if test="${a.money eq 5 }">
											        			3200만 ~ 3600만
											        		</c:if>
											        		<c:if test="${a.money eq 6 }">
											        			3600만 ~ 4000만
											        		</c:if>
											        		<c:if test="${a.money eq 7 }">
											        			4000만 이상
											        		</c:if>
											        	</span>
											      	</div>
										    	</div>
										    	<br>
						        <hr>
			            	</div>
    					</form>
        			</c:forEach>
        			<div id="pageNavi">${pageNavi }</div>
        		</c:otherwise>
        	</c:choose>
        	
    	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>