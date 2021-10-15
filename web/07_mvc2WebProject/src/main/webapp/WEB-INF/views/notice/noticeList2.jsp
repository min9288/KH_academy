<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchBox{
		width:400px
	}
	select[name=type]{
		display: inline-block;
		width: 30%;
	}
	input[name=keyword]{
		display: inline-block;
		width: 50%;
	}
</style>
</head>
<body>
	<%--@include file="/WEB-INF/views/common/header.jsp" --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class = "container">
		<fieldset>
			<legend>공지사항</legend>
			<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel == 1}">
				<div>
					<a class = "btn btn-info writeBtn" href="/noticeWriteFrm">글쓰기</a>
				</div>				
			</c:if>
			<div id="searchBox">
				<form action="/searchNotice" method="post">
					<!-- <input type="hidden" name="reqPage" value="1"> -->
					<c:choose>
						<c:when test="${not empty type }">
							<c:choose>
								<c:when test="${type == 'title' }">
									<option value="title" selected>제목</option>
									<option value="writer">작성자</option>
								</c:when>
								<c:otherwise>
									<option value="title" >제목</option>
									<option value="writer" selected>작성자</option>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<select class="form-control" name="type">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
						</c:otherwise>
					</c:choose>
					<input type="text" name="keyword" class="form-control" value="${keyword }">
					<button type="submit" class="btn btn-primary">검색</button>
			 </form>
			</div>
			<table class = "table-hover" style="width:100%;">
				<tr class="table-primary">
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<c:forEach items="${list }" var="n" varStatus="i">
					<tr class="table-light">
						<td>${start + i.index }</td>
						<td style="text-align:left; width:60%;">
							<a href='/noticeView?noticeNo=${n.noticeNo }'>
								${n.noticeTitle }
							</a>
							[${n.ncCount }]
						</td>
						<td>${n.noticeWriter }</td>
						<td>${n.regDate }</td>
						<td>${n.readCount }</td>
					</tr>
				</c:forEach>
			</table>
			<div id = "pageNavi">${pageNavi }</div>
		</fieldset>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>