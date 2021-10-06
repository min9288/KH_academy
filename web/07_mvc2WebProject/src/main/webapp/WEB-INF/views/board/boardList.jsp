<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
    int start = (Integer)request.getAttribute("start");
    int i = 0;		// 반복분 반복회차를 처리하기위한 변수
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
			<legend>게시판</legend>
			<%if(m != null) {%>
			<div>
				<a class = "btn btn-info writeBtn" href="/boardWriteFrm">글쓰기</a>
			</div>
			<%} %>
			<table class = "table-hover" style="width:100%;">
				<tr class="table-primary">
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<%for (Board b : list) {%>
				<tr class="table-light">
					<td><%=start + (i++)%></td>
					<td style="text-align:left; width:60%;">
						<a href='/boardView?boardNo=<%=b.getBoardNo()%>'>
						<%=b.getBoardTitle() %>
						</a>
					</td>
					<td><%=b.getBoardWriter() %></td>
					<td><%=b.getRegDate() %></td>
					<td><%=b.getReadCount() %></td>
				</tr>
				<%} %>
			</table>
			<div id="pageNavi"><%=pageNavi %></div>
		</fieldset>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>