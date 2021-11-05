<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/lifestyle-main.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="main">
    <div class="main-left-box">
        <h2>라이프스타일</h2>
        <ul>
            <c:forEach items="${categoryList}" var="cl" varStatus="i">
            	<li>
            		<span>${cl.lfCategory }</span>
            			<ul class="subnavi">
            		<c:forEach items="${list }" var = "l" varStatus="i">
            			<c:if test="${cl.lfCategory eq l.lfCategory }">
            				<c:choose>
								<c:when test="${l.lfNo eq lf.lfNo }">
									<li><a href="/lifestyleInfo?lfNo=${l.lfNo }" class="select activeSelect">${l.lfTitle }<span>&gt;</span></a></li>	
								</c:when>
								<c:otherwise>
									<li><a href="/lifestyleInfo?lfNo=${l.lfNo }" class="select">${l.lfTitle }<span>&gt;</span></a></li>
								</c:otherwise>            					
            				</c:choose>
                    		
                    	</c:if>
            		</c:forEach>
               			</ul>
				</li>
            </c:forEach>
        </ul>
    </div>
    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <h3>라이프 스타일</h3>
			<div class="wrapper">
				<c:forEach items="${categoryList}" var="cl" varStatus="i">
					<div class="whole">
						<div class="category-name">
							<b><span>${cl.lfCategory }</span></b>
						</div>
						<div class="thumbnail">
							<c:forEach items="${list }" var="l" varStatus="i">
								<c:if test="${cl.lfCategory eq l.lfCategory }">
									<div class="content">
										<a href="/lifestyleInfo?lfNo=${l.lfNo }">
										<img id="preview-image" src="/upload/thumbnail/${l.filename }"></a>
										<br>
										<a id="ment" href="/lifestyleInfo?lfNo=${l.lfNo }">${l.thumbnail }</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<style>
	.subnavi a.activeSelect>span{
		display : inline;
	}
	.activeSelect{
		background-color : #d6c6a5;
	}
</style>
</body>
</html>