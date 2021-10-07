<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (Integer)request.getAttribute("start");
    	String type = (String)request.getAttribute("type");
    	String keyword = (String)request.getAttribute("keyword");
    	int i = 0; // 반복문 반복회차를 처리하기위한 변수
    %>
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
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class = "container">
		<fieldset>
			<legend>공지사항</legend>
			<%if(m != null && m.getMemberLevel() == 1) {%>
			<div>
				<a class = "btn btn-info writeBtn" href="/noticeWriteFrm">글쓰기</a>
			</div>
			<%} %>
			<div id="searchBox">
				<form action="/searchNotice" method="post">
					<!-- <input type="hidden" name="reqPage" value="1"> -->
					<%if(type != null) {%>
						<select class="form-control" name="type">
							<%if(type.equals("title")) {%>
							<option value="title" selected>제목</option>
							<option value="writer">작성자</option>
						<%} else {%>
							<option value="title">제목</option>
							<option value="writer" selected>작성자</option>
						<%} %>
						</select>
						<input type="text" name="keyword" class="form-control" value="<%=keyword %>">
						<button type="submit" class="btn btn-primary">검색</button>
					<%} else { %>
						<select class="form-control" name="type">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
						<input type="text" name="keyword" class="form-control">
						<button type="submit" class="btn btn-primary">검색</button>
					<%} %>
				</form>
			</div>
			<table class = "table-hover" style="width:100%;">
				<tr class="table-primary">
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<%for (Notice n : list) {%>
				<tr class="table-light">
					<td><%=start + (i++)%></td>
					<td style="text-align:left; width:60%;">
						<a href='/noticeView?noticeNo=<%=n.getNoticeNo()%>'>
						<%=n.getNoticeTitle() %>
						</a>
					</td>
					<td><%=n.getNoticeWriter() %></td>
					<td><%=n.getRegDate() %></td>
					<td><%=n.getReadCount() %></td>
				</tr>
				<%} %>
			</table>
			<div id = "pageNavi"><%=pageNavi %></div>
		</fieldset>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>