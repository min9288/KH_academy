<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    display: block;
	    padding: 50px 20px 10px 0;
	    font-size: 20px;
	    font-weight: bold;
	    letter-spacing: -1px;
	    line-height: 27px;
	    margin-bottom: 30px;
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
	}
	.stbtn{
		float: left;
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
	
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<em>입사지원 현황</em>
			<ul class="tabWrap">
        		<li class="select"><a href="#" class="tab">전체<span class="badge">${count }</span></a></li>
    		</ul>
    		
    		<div class="status">
	            <div class="stbtn">
	            	<button type="button" class="btn"><em>지원완료</em><span class="num">1</span></button>
	            </div>
	            <div class="stbtn">
	            	<button type="button" class="btn"><em>최종발표</em><span class="num">0</span></button>
	            </div>
        	</div>
        	
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
			                            	<a href="#">${a.companyName }</a>
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
			            				<span>${a.announceTitle }</span>
			            			</div>
			                        <div class="status left">
			                    		<em class="appStatus">지원완료</em>
			                        </div>
						            <div class="btns left">
						                <div class="action">
						                	<span class="dateEnd"></span>
						                </div>
				      					<div class="accordion" id="accordionExample">
										 	<div class="accordion-item">
										    	<h2 class="accordion-header" id="heading0">
										      		<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse0" aria-expanded="true" aria-controls="collapse${i.index }">
										       			<span>지원내역</span>
										      		</button>
										    		</h2>
										    		<div id="collapse${i.index }" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
										      		<div class="accordion-body">
										        		<strong>테스트답변용21</strong>
										      		</div>
										    	</div>
										  	</div>
										</div>
						            </div>
			        			</div>
						        <hr>
			            	</div>
            	
			            	<!-- <div class="listStatus">
			                	<div class="info">
						            <div class="date left">2021.12.12 22:13</div>
						            <div class="summary left">
						                <strong class="corp">
			                            	<a href="#">㈜한국비즈넷</a>
			                            </strong>
			                			<div class="recruit">
			                            	<a href="#"><span class="">소프트웨어 개발자</span></a>
			                			</div>
			            			</div>
			                            <div class="status left">
			                    			<em class="appStatus">지원완료</em>
			                            </div>
						            <div class="btns left">
						                <div class="action">
						                	<span class="dateEnd"></span>
						                </div>
						                <button type="button" class="history">지원내역</button>
						            </div>
			        			</div>
						        <hr>
			            	</div> -->
    					</form>
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>
        	
    	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>