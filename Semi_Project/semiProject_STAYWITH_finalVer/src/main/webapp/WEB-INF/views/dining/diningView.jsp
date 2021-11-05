<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝 보기</title>
<link rel="stylesheet" href="/css/diningView.css">
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
	                	<c:forEach items="${list }" var="allD">
	                		<c:if test="${allD.diningType eq 1 }">
			                	<c:choose>
			                		<c:when test="${allD.diningNo eq d.diningNo }">
					                    <li><a href="/diningView?diningNo=${allD.diningNo }" class="active">${allD.diningName }<span>&gt;</span></a></li>                				                					                			
			                		</c:when>
			                		<c:otherwise>
			                		    <li><a href="/diningView?diningNo=${allD.diningNo }">${allD.diningName }<span>&gt;</span></a></li>
			                		</c:otherwise>
	    		            	</c:choose>
	                		</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	            <li>
	                <span>라운지 &amp; 바</span>
	                <ul class="subnavi">
	                    <c:forEach items="${list }" var="allD">
                			<c:if test="${allD.diningType eq 2 }">
			                    <c:choose>
			                		<c:when test="${allD.diningNo eq d.diningNo }">
					                    <li><a href="/diningView?diningNo=${allD.diningNo }" class="active">${allD.diningName }<span>&gt;</span></a></li>                				                					                			
			                		</c:when>
			                		<c:otherwise>
			                		    <li><a href="/diningView?diningNo=${allD.diningNo }">${allD.diningName }<span>&gt;</span></a></li>
			                		</c:otherwise>
	    		            	</c:choose>                			
                			</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	            <li>
	                <span>베이커리</span>
	                <ul class="subnavi">
	                    <c:forEach items="${list }" var="allD">
                			<c:if test="${allD.diningType eq 3 }">
			                    <c:choose>
			                		<c:when test="${d.diningNo eq allD.diningNo }">
					                    <li><a href="/diningView?diningNo=${allD.diningNo }" class="active">${allD.diningName }<span>&gt;</span></a></li>                				                					                			
			                		</c:when>
			                		<c:otherwise>
			                		    <li><a href="/diningView?diningNo=${allD.diningNo }">${allD.diningName }<span>&gt;</span></a></li>
			                		</c:otherwise>
	    		            	</c:choose>                			
                			</c:if>
	                	</c:forEach>
	                </ul>
	            </li>
	        </ul>
	    </div>
	    <div class="main-content">
		    <h2>${d.diningName }</h2>
            <div class="img-box">
                <img src="upload/dining/${d.detailedImg }">
            </div>
            <div class="dining-info">
                <div class="info1">
                    <div class="title">
                        <h2 class="name">${d.diningName }</h2>
                        <span class="info">${d.diningInfo }</span>
                    </div>
                    <div class="intro">
                        <p>${d.diningIntro }</p>
                    </div>
                </div>
                <div class="info2">
                    <p><span>위치</span>${d.diningLoc }</p>
                    <div class="time-box">
                        <span>운영시간</span><c:forEach items="${d.timeList }" var="dt"><p class="dining-time">
                        	<c:choose>
                        		<c:when test="${dt.timeType eq 1 }">Lunch</c:when>
                        		<c:when test="${dt.timeType eq 2 }">Dinner</c:when>
                        		<c:when test="${dt.timeType eq 3 }">Brunch</c:when>
                        		<c:when test="${dt.timeType eq 4 }">Afternoon Tea</c:when>
                        		<c:when test="${dt.timeType eq 5 }">All Day</c:when>
                        	</c:choose>
                        		: ${dt.open } ~ ${dt.close }
                        	</p><br>
                        </c:forEach>
                    </div>
                    <p><span>예약 및 문의</span>${d.tel }</p>
                    <c:if test="${d.diningType ne 3 }">
	                    <p><span>좌석 수</span>총 ${d.seatCnt }석</p>
	                    <p class="room">룸 ${d.roomCnt }실 (성인과 소인 동반 시 최대 12명 수용 가능하며, 이용 시 별도 요금이 부과됩니다.)</p>                    
                    </c:if>
                    <c:if test="${d.diningType eq 1 }">
	                    <div class="btn-box">
	                        <a href="/question" class="btn btn-success btn-lg">문의하기</a>
	                        <a href="/diningResvFrm?diningNo=${d.diningNo }" class="btn btn-secondary btn-lg">예약하기</a>
	                    </div>                    
                    </c:if>
                </div>
            </div>
            <c:if test="${d.diningType eq 1 && not empty d.reviewList}">
	            <div class="review-btn-box">
	                <button type="button" class="btn btn-secondary btn-lg reviewBtn">리뷰 보기</button>
	            </div>
	            <div class="review-box">
	            	<c:forEach items="${d.reviewList }" var="dr">
		                <div class="review">
		                    <div>
		                        <img src="/img/iconmonstr-user-19-240.png">
		                    </div>
		                    <div class="review-content">
		                        <div class="review-header">
		                            <p class="star">
		                                <c:forEach begin="0" end="4" step="1" varStatus="i">
		                                	<c:choose>
		                                		<c:when test="${i.index < dr.star }">
				                                	<img src="/img/star-on.png">		                                		
		                                		</c:when>
		                                		<c:otherwise>
		                                			<img src="/img/star-off.png">
		                                		</c:otherwise>
		                                	</c:choose>
		                                </c:forEach>
		                            </p>
		                            <p>${dr.reviewWriter }</p>
		                            <span>${dr.reviewDate }</span>
		                        </div>
		                        <div class="review-text">
		                            <p>${dr.reviewContentBr }</p>
		                        </div>
		                    </div>
		                </div>	            	
	            	</c:forEach>
	            </div>
            </c:if>
	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	$(function(){
		$(".active").css("background-color","#d6c6a5");
		$(".active>span").show();
		$(".review-box").addClass("show-review");
	});
	$(".reviewBtn").click(function(){
		if($(".review-box").hasClass("show-review")){
			$(this).html("리뷰 닫기");
		}else{
			$(this).html("리뷰 보기");
		}
		$(".review-box").toggleClass("show-review");
	});
</script>
</html>