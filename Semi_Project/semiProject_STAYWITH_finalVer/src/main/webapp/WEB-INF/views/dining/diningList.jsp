<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이닝 관리</title>
<link rel="stylesheet" href="/css/diningList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main">
	    <div class="main-left-box">
	        <h2>관리자 페이지</h2>
	        <ul>
	            <li>
	                <span>메인 페이지</span>
	                <ul class="subnavi">
	                    <li><a href="/adminMain">관리자 개요<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	            <li>
	                <span>시설 예약 내역</span>
	                <ul class="subnavi">
	                    <li><a href="/adminRoomResList?reqPage=1">객실 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminDiningList?reqPage=1">다이닝 예약 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminLfList?reqPage=1">라이프스타일 예약 내역<span>&gt;</span></a></li>
	                </ul>
	            </li>
	            <li>
	                <span>고객문의 및 회원</span>
	                <ul class="subnavi">
	                    <li><a href="/adminQuestionList?reqPage=1">고객 문의 내역<span>&gt;</span></a></li>
	                    <li><a href="/adminMemberList?reqPage=1&dataType=List&data=''">회원 정보<span>&gt;</span></a></li>	                   
	                </ul>
	            </li>
	            <li>
	                <span>시설 관리</span>
	                <ul class="subnavi">
	                    <li><a href="/roomManage">객실 관리<span>&gt;</span></a></li>
	                    <li><a href="/diningList">다이닝 관리<span>&gt;</span></a></li>	
	                    <li><a href="/lifestyleList?reqPage=1" id="lf-click">라이프스타일 관리<span>&gt;</span></a></li>	                    
	                </ul>
	            </li>
	        </ul>
	    </div>
	    <!-- 메인 콘텐츠 -->
	    <div class="main-content">
	        <h2>다이닝 관리</h2>
	        <table class="table">
	            <tr class="table-active">
	                <th style="width:5%;">No</th><th style="width:10%;">타입</th><th>이름</th><th>간단설명</th><th>위치</th><th>소개</th>
	                <th style="width:8%;">수정</th><th style="width:8%;">삭제</th>
	            </tr>
	            <c:forEach items="${list }" var="d" varStatus="i">
	            	<tr>
	            		<td>${start+i.index }</td>
	            		<c:choose>
		            		<c:when test="${d.diningType eq 1}">
		            			<td>레스토랑</td>
		            		</c:when>
		            		<c:when test="${d.diningType eq 2}">
		            			<td>라운지&amp;바</td>
		            		</c:when>
		            		<c:otherwise>
		            			<td>베이커리</td>
		            		</c:otherwise>
	            		</c:choose>
	            		<td>${d.diningName }</td>
	            		<td>${d.diningInfoBr }</td><td>${d.diningLoc }</td><td>${d.diningIntroBr }</td>
	            		<td class="nTd"><button type="button" class="btn btn-outline-secondary diningUpdate">수정</button></td>
	                	<td class="nTd"><button type="button" class="btn btn-outline-secondary diningDelete">삭제</button></td>	
	            	</tr>
	            	<input type="hidden" value="${d.diningNo }">
	            </c:forEach>
	        </table>
	        <div class="writeBtnBox">
	            <a class="btn btn-secondary" href="/diningWriteFrm">다이닝 등록</a>
	        </div>
	        <div id="pageNaviBox">
	        	${pageNavi }
	        </div>
	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	$(function(){
		$(".subnavi").eq(3).find("a").eq(1).css("background-color","#d6c6a5")
   		$(".subnavi").eq(3).find("a").eq(1).children().show();
		$(".table td").each(function(index, item){
			$(item).not(".nTd").attr("title", $(item).html());
		});
	});
	$(".diningUpdate").click(function(){
		var diningNo = $(this).parents("tr").next().val();
		location.href="/diningUpdateFrm?diningNo="+diningNo;
	});
	$(".diningDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			var diningNo = $(this).parents("tr").next().val();
			location.href="/diningDelete?diningNo="+diningNo;			
		}
	});
</script>
</html>