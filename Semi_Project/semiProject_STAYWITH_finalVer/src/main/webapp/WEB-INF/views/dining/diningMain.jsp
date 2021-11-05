<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝</title>
<link rel="stylesheet" href="/css/diningMain.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main">
		<div class="main-left-box">
	        <h2>다이닝</h2>
	        <ul>
	            <li>
	                <span>레스토랑</span>
	                <ul class="subnavi">
	                	<c:forEach items="${list }" var="d">
                			<c:if test="${d.diningType eq 1 }">
			                    <li><a href="/diningView?diningNo=${d.diningNo }">${d.diningName }<span>&gt;</span></a></li>                			
                			</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	            <li>
	                <span>라운지 &amp; 바</span>
	                <ul class="subnavi">
	                    <c:forEach items="${list }" var="d">
                			<c:if test="${d.diningType eq 2 }">
			                    <li><a href="/diningView?diningNo=${d.diningNo }">${d.diningName }<span>&gt;</span></a></li>                			
                			</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	            <li>
	                <span>베이커리</span>
	                <ul class="subnavi">
	                    <c:forEach items="${list }" var="d">
                			<c:if test="${d.diningType eq 3 }">
			                    <li><a href="/diningView?diningNo=${d.diningNo }">${d.diningName }<span>&gt;</span></a></li>                			
                			</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	        </ul>
	    </div>
	    <div class="main-content">
	    	<div class="info">
		    	<h2>참 미식으로의 초대</h2>
		    	<p>정통을 뛰어넘는 하이엔드 스타일의 다이닝, 라운지에서 맛보는 스위트 트리트, 눈을 행복하게 하는 감각적인 패스트리까지</p>	    	
	    	</div>
	    	<div class="banner-box">
                    <a href="/diningResvFrm"><img src="img/diningBanner.jpg"></a>
            </div>
            <div class="list-box">
                <h2>레스토랑</h2>
                <ul class="res-list">
                    <c:forEach items="${list }" var="d">
               			<c:if test="${d.diningType eq 1 }">
		                    <li>
		                        <a href="/diningView?diningNo=${d.diningNo }" class="res-a">
		                            <img src="upload/dining/${d.thumbnailImg }">
		                        </a>
		                        <div class="res-info">
		                            <h3>${d.diningName }</h3>
		                            <p>${d.diningInfo }</p>
		                            <span>위치 : ${d.diningLoc }</span>
		                            <span>예약 및 문의 : ${d.tel }</span>
		                        </div>
		                        <div class="btn-box">
		                            <a href="/question" class="btn btn-light btn-sm">문의하기</a>
		                            <a href="/diningResvFrm?diningNo=${d.diningNo }" class="btn btn-secondary btn-sm">예약하기</a>
		                        </div>
                    		</li>                			
               			</c:if>
	                </c:forEach>
                </ul>
                <h2>라운지 &amp; 바</h2>
                <ul class="align lou-list">
                	<c:forEach items="${list }" var="d">
               			<c:if test="${d.diningType eq 2 }">
		                    <li>
		                        <a href="/diningView?diningNo=${d.diningNo }" class="lou-bake-a">
		                            <img src="upload/dining/${d.thumbnailImg }">
		                        </a>
		                        <div class="lou-bake-info">
		                            <h3>${d.diningName }</h3>
		                            <p>${d.diningInfo }</p>
		                            <span>위치 : ${d.diningLoc }</span>
		                            <span>예약 및 문의 : ${d.tel }</span>
		                        </div>
                    		</li>
               			</c:if>
	                </c:forEach>
                </ul>
                <h2>베이커리</h2>
                <ul class="align bake-list">
                    <c:forEach items="${list }" var="d">
               			<c:if test="${d.diningType eq 3 }">
		                    <li>
		                        <a href="/diningView?diningNo=${d.diningNo }" class="lou-bake-a">
		                            <img src="upload/dining/${d.thumbnailImg }">
		                        </a>
		                        <div class="lou-bake-info">
		                            <h3>${d.diningName }</h3>
		                            <p>${d.diningInfo }</p>
		                            <span>위치 : ${d.diningLoc }</span>
		                            <span>예약 및 문의 : ${d.tel }</span>
		                        </div>
                    		</li>
               			</c:if>
	                </c:forEach>
                </ul>
            </div>
	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>