<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (Integer)request.getAttribute("start");
    	int i = 0; // 반복문 반복회차를 처리하기위한 변수
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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