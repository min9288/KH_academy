<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 등록 내역</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
.container {
   min-width: 1200px; 
}
.mainCate{
	display:flex;
}
#allMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
#unprocessed{
	font-size: 21px;
	font-weight:bold
}
#unprocessed>span{
	color:#4ECDC4;
}
.contestImgBox{
		box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 4px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
		width: 280px;
		height: 400px;
		overflow: hidden; 
	}
.contestImgBox img{
	   height:100%;
	   width: 100%;
	   object-fit:cover;   
	   transform:scale(1.0);        
	   transition: transform .5s; 
	}
.contestImgBox img:hover{ 
	   transform:scale(1.1);
	   transition: transform .5s;
	}
.infoBox{
	margin-right: 30px;
	margin-bottom: 30px;
	margin-top: 30px;
	
}
.contestBox{
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}
.contestTitle{
	font-size:20px;
	font-weight: bold;
	margin-top: 15px;
	margin-bottom: 5px;
}
#noList{
	margin-top : 40px;
	width: 100%;
	height: 500px;
	border: 2px solid #d9d9d9;
	text-align: center;
	padding-top: 175px;
	
}
#noList>p:first-child>i{
	font-size: 40px;
	color:#4ECDC4
}
#noList>p:last-child{
	font-size: 30px;
	font-weight: bold;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="allMember" style="font-weight:bold">공모전 등록 내역</span>
		</div>
		<br><br><br>
	
		<%--미처리 공모 수 --%>
		<p id="unprocessed">미처리 공모 수 : <span>${totalCount }</span> 건</p>
		
		<%--미처리 공모 리스트 --%>
		<c:choose>
		<c:when test="${ totalCount != 0}">
		<div class="contestBox">
			<c:forEach items="${list }" var="c">
			<div class="infoBox">
				<div class="contestImgBox">
					<a href="/enrollContestView.do?contestNo=${c.contestNo }"><img src="/resources/img/contest/${c.contestImg }"></a>
				</div>
				<c:choose>
					<c:when test="${fn:length(c.contestTitle) > 16}">
						<c:set var="subTitle" value="${fn:substring(c.contestTitle,0,16)}"/>
						<p class="contestTitle">${subTitle }...</p>
					</c:when>
					<c:otherwise>
						<p class="contestTitle">${c.contestTitle }</p>
					</c:otherwise>
				</c:choose>
				<p style="margin-bottom: 0px">주최 : ${c.contestHost }</p>
				<p style="margin-bottom: 0px">공모등록일 : ${c.contestDate }</p>
			</div>
			</c:forEach>
		</div>
		<div id="pageNavi" style="text-align: center" >${pageNavi }</div>
		</c:when>
		<c:when test="${totalCount == 0}">
			<div id="noList">
				<p><i class="bi bi-trophy"></i></p>
				<p>등록 대기중인 공모전이 없습니다.</p>
			</div>
		</c:when>
		</c:choose>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>